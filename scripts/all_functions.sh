#!/bin/bash

function change_to_root_dir {
  # Always change to root directory while pubspec.yaml is not in the current directory but don't go
  # past the project root directory
  echo "🔎 Jumping into root directory..."
  while [ ! -f "pubspec.yaml" ] && [ "$PWD" != "/" ]; do
    cd ..
  done
  echo "🤺 Wallah! $PWD"
}

function brb {
  flutter clean
  dart pub get
  dart run build_runner build --delete-conflicting-outputs
  dart format --line-length 80 .
}

function sort_intl_file_content {
  targetDir="lib/translations"
  patchBranch="patch-translations"

  # If GITHUB_HEAD_REF exists, we are in a PR, so use the source branch.
  if [ -n "$GITHUB_HEAD_REF" ]; then
    currentBranch="$GITHUB_HEAD_REF"
  else
    currentBranch=$(git branch --show-current)
  fi

  # Fallback to main/master if still empty
  if [ -z "$currentBranch" ]; then
    currentBranch=${GITHUB_REF_NAME:-"main"}
    echo "🤖 Detected current branch from GITHUB_REF_NAME: $currentBranch"
  fi

  # Remove the 'refs/heads/' prefix if present
  currentBranch=${currentBranch#refs/heads/}

  if [ ! -d "$targetDir" ]; then
    echo "🤷‍ DIRECTORY NOT FOUND: $targetDir"
    exit 1
  fi

  # Find all .arb files safely (compatible with all Bash versions)
  arbFiles=()
  while IFS= read -r line; do
    arbFiles+=("$line")
  done < <(find "$targetDir" -name "*.arb")

  # Check if .arb files are available
  if [ ${#arbFiles[@]} -eq 0 ]; then
    echo "😑 No .arb FILES FOUND IN $targetDir"
    exit 1
  fi

  for file in "${arbFiles[@]}"; do
    jq -S . "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
    if [ $? -ne 0 ]; then
      echo "🙂 ERROR: Sorting failed for $file"
      exit 1
    else
      echo "🙂 SORTED: $file"
    fi
  done

  # Check if there is any modification in target directory
  if [ -n "$(git status --porcelain "$targetDir")" ]; then
    # Wipe other accidental changes to prevent rebase conflicts
    git checkout -- .

    # Re-sort (since checkout cleared the tmp files/changes)
    for file in "${arbFiles[@]}"; do
      jq -S . "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
    done

    git add "$targetDir"
    git commit -m "chore[🤖]: sort translation files"
    echo "🤖 Created a commit for sorted translation files."

    # IMPORTANT: Ensure we are on the actual branch, not a detached HEAD
    git checkout "$currentBranch" || git checkout -b "$currentBranch"

    echo "🤖 Attempting to push to $currentBranch..."

    if git push origin "$currentBranch"; then
       echo "🤖 DONE DONE!!"
       exit 0
    else
      echo "🤖 Push failed, opening a PR for you..."

      git checkout -B "$patchBranch"
      git push origin "$patchBranch" --force

      # Attempt to create PR and capture output/error
      pr_url=$(gh pr create \
        --base "$currentBranch" \
        --head "$patchBranch" \
        --title "chore[🤖]: sort translation files" \
        --body "Just doing what you're too lazy to do. 🧹" \
        --assignee "Juliotati" 2>&1)

      # Check if PR creation failed because it already exists
      if [[ "$pr_url" == *"already exists"* ]]; then
        echo "🤖 PR already exists. Fetching existing PR info..."
        pr_url=$(gh pr list --head "$patchBranch" --base "$currentBranch" --json url --jq '.[0].url')
      fi

      # Validate if we have a valid URL or if a real error occurred
      if [[ -z "$pr_url" || "$pr_url" == *"error"* ]]; then
        echo "👻 FAILED to create PR. Missing actions permissions."
        exit 1
      fi

      echo "🤖 PR opened successfully: $pr_url"

      echo "🤖 Approving and merging PR..."
      # Suppress error on review in case it was already approved
      gh pr review "$pr_url" --approve 2>/dev/null
      gh pr merge "$pr_url" --merge --admin --delete-branch

      # Return to original branch and clean up local patchBranch
      git checkout "$currentBranch"
      git branch -D "$patchBranch" 2>/dev/null
      echo "🤖 PR approved, merged, and local branch cleaned up."
    fi

    echo "🤖 DONE DONE!!"
    exit 0
  fi

  echo "🙂 No changes detected"
  exit 0
}

function verify_config_content {
  # Check if config.json file exists
  if [ ! -f config.json ]; then
    echo "😹 You're missing config.json file!!"
    exit 1
  fi

  # Check if config_template file exists
  if [ ! -f config_template.json ]; then
    echo "😹 You're missing config_template.json file!!"
    exit 1
  fi

  # Check if config.json file is valid JSON
  if ! jq . config.json > /dev/null 2>&1; then
    echo "💔 config.json file is not a valid JSON file!"
    exit 1
  fi

  # Check if config_template.json file is valid JSON
  if ! jq . config_template.json > /dev/null 2>&1; then
    echo "💔 config_template.json file is not a valid JSON file!"
    exit 1
  fi

  # Verifies if json keys in "config.json" match "config_template.json". To prevent building and
  # deploying with missing or empty keys in "config.json" file.
  configKeys=$(jq -r 'keys[]' config.json)
  templateKeys=$(jq -r 'keys[]' config_template.json)

  if [ "$configKeys" == "$templateKeys" ]; then
      echo "🤝 Configuration keys match!"
  else
      echo "🤔 Misconfiguration in config.json ‼️Please fix that first ‼️"
      echo "Differences:"
      diff <(echo "$configKeys") <(echo "$templateKeys") | while IFS= read -r line; do
        echo "  $line"
      done
      exit 1
  fi

  empty_keys=()
  for key in $configKeys; do
    value=$(jq -r ".$key" config.json)
    if [ -z "$value" ]; then
      empty_keys+=("$key")
    fi
  done

  # echo those empty keys if any and exit with error to prevent deployment
  if [ ${#empty_keys[@]} -ne 0 ]; then
    echo "🫙BUT ‼️found empty keys in config.json:"
    for empty_key in "${empty_keys[@]}"; do
      echo " $empty_key is empty"
    done
    exit 1
  fi

  echo "🤝 config.json file is valid!"
}

function verify_pubspec_version() {
  # 1. grab the semantic "version" value from pubspec.yaml source branch as a string
  # 2. grab the semantic "version" value from pubspec.yaml source branch as a string
  # 3. The version have a "+" for that shows the build number, on the right side of the "+"
  # 4. verify that the build number is greater in the source branch than the stable branch
  # 5. also verify that the version is greater that in the base branch
  # e.g.
  #    0.1.0+1 > 1.1.0+0 // false
  #    1.1.0+1 > 1.0.0+1 // false
  #    1.1.1+1 > 1.1.1+0 // false
  #    1.1.1+1 > 1.1.2+1 // false
  #    1.1.1+1 > 1.1.1+2 // false (todo looks like this case in not being handled)
  #    1.1.1+1 > 1.1.2+2 // true
  #    1.1.1+1 > 1.2.0+2 // true

  source_version=$(grep -E '^version:' pubspec.yaml | awk '{print $2}')
  base_version=$(git show $GITHUB_BASE_REF:pubspec.yaml | grep -E '^version:' | awk '{print $2}')
  source_version_number=$(echo $source_version | cut -d '+' -f 1)
  base_version_number=$(echo $base_version | cut -d '+' -f 1)
  source_build_number=$(echo $source_version | cut -d '+' -f 2)
  base_build_number=$(echo $base_version | cut -d '+' -f 2)
  if [[ -z "$source_version" || -z "$base_version" ]]; then
      echo "❗️ Error: version not found in pubspec.yaml"
      exit 1
  fi
  if [[ "$source_version_number" == "$base_version_number" && "$source_build_number" -le "$base_build_number" ]]; then
      echo "✋️ Hold on, source v($source_version) MUST be greater than base v($base_version)"
      exit 1
  fi
    echo "Source version: $source_version"
    echo "Base version: $base_version"
    echo "Source version number: $source_version_number"
    echo "Base version number: $base_version_number"
    echo "Source build number: $source_build_number"
    echo "Base build number: $base_build_number"
  if [[ "$source_version_number" < "$base_version_number" ]]; then
      echo "✋️ source v($source_version_number) MUST be greater than base v($base_version_number)"
      exit 1
  elif [[ "$source_version_number" == "$base_version_number" && "$source_build_number" -le "$base_build_number" ]]; then
      echo "🛑️ source build ($source_build_number) MUST be greater than base build ($base_build_number)"
      exit 1
  else
      echo "✅ pubspec version looks valid"
  fi
  echo "🫡 You're good to go, source v$source_version is greater than base v$base_version"
}
