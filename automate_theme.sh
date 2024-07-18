#!/bin/zsh

# Define the repository URL and the local directory
REPO_URL="https://github.com/mjswensen/themer.git"
LOCAL_DIR="$HOME/themer"

# Clone the repository if it doesn't exist
if [ ! -d "$LOCAL_DIR" ]; then
  git clone "$REPO_URL" "$LOCAL_DIR"
else
  echo "Repository already cloned."
fi

# Navigate to the color-set directory
COLOR_SET_DIR="$LOCAL_DIR/dist/color-set"
if [ -d "$COLOR_SET_DIR" ]; then
  cd "$COLOR_SET_DIR"
else
  echo "$COLOR_SET_DIR: No such file or directory"
  exit 1
fi

# Resolve color set(s)
COLOR_SET_PATH="$HOME/Tokight-Dark.js"
if [ -f "$COLOR_SET_PATH" ]; then
  echo "loading color set Tokyonight-Dark.js (path: $COLOR_SET_PATH)..."
  if ! grep -q "const colors =" "$COLOR_SET_PATH"; then
    echo "color set $COLOR_SET_PATH does not appear to be a themer color set JavaScript file    echo "Implicit keys need to be on a single line at line 1, column 1:"
    echo ""
    echo "const colors = {"
    echo "^"
    exit 1
  fi
else
  echo "color set $COLOR_SET_PATH does not exist."
  exit 1
fi

# Generate themes
echo "Generating themes..."
# Add your theme generation commands here

echo "Themes generated successfully!"
