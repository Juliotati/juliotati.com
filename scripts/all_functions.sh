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

  # Check if the targetDir exists
  if [ ! -d "$targetDir" ]; then
    echo "🤷‍ DIRECTORY NOT FOUND: $targetDir"
    exit 1
  fi

  # Find all .arb files in the directory
  arbFiles=($(find "$targetDir" -name "*.arb"))

  # Check if .arb files are available
  if [ ${#arbFiles[@]} -eq 0 ]; then
    echo "😑 No .arb FILES FOUND IN $targetDir"
    exit 1
  fi

  # Loop through .arb files and sort the JSON keys
  for file in "${arbFiles[@]}"; do
    # Use jq to sort the file by keys (output to a temp file to avoid clobbering)
    jq -S . "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"

    # Check for jq error
    if [ $? -ne 0 ]; then
      echo "🙂 ERROR: Sorting failed for $file"
      exit 1
    else
      echo "🙂 SORTED: $file"
    fi
  done

  # Check if there is any modification in target directory, if so create a commit including that
  # directory only.
  if [ -n "$(git status --porcelain $targetDir)" ]; then
    git add $targetDir
    git commit -m "chore[🤖]: sort translation files"
    echo "🤖 Created a commit for sorted translation files."

    # Push the change/commit from github workflow to the current branch
    if [ -n "$GITHUB_ACTIONS" ]; then
      git push origin $GITHUB_REF
      echo "🚀 Pushed commit to $GITHUB_REF"
    fi
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
