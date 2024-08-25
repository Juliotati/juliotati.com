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

function sort_translations_file_content {
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

  echo "🙂 Sorted all .arb files."

  # Check if there is any modification in lib/l10n directory, if so create a commit including that
  # directory only. This should work on github actions too
  if [ -n "$(git status --porcelain $targetDir)" ]; then
    git add $targetDir
    git commit -m "chore: sort translation files"
    echo "🤖 Created a commit for sorted translation files."
  fi
}