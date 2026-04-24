#!/bin/bash
set -e

if [ ! -d ".cursor" ]; then
  echo "Error: Run this from your notes directory (where .cursor exists)"
  exit 1
fi

echo "Downloading latest version..."
curl -fsSL https://github.com/ma-cohen/notes-ninja/archive/main.tar.gz -o /tmp/nn-update.tar.gz
tar -xzf /tmp/nn-update.tar.gz -C /tmp

echo "Updating .cursor folder..."
rm -rf .cursor
cp -r /tmp/notes-ninja-main/.cursor .

rm -rf /tmp/notes-ninja-main /tmp/nn-update.tar.gz

echo "Done! Updated to latest version."
