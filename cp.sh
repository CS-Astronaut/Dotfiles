#!/bin/bash

# Define the source directories and the target backup directory
SOURCE_FILES=(
  "$HOME/.bashrc"
  "$HOME/.config/neofetch"
  "$HOME/.config/nvim"
  "$HOME/.config/ranger"
  "$HOME/.config/tmux"
)

TARGET_DIR="$HOME/dotfiles"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Loop through each source file/directory
for FILE in "${SOURCE_FILES[@]}"; do
  # Check if the source exists
  if [ -e "$FILE" ]; then
    # Determine the target path (relative to dotfiles directory)
    RELATIVE_PATH="${FILE/#$HOME/}"
    TARGET_PATH="$TARGET_DIR$RELATIVE_PATH"
    
    # Create any required parent directories in the target path
    mkdir -p "$(dirname "$TARGET_PATH")"
    
    # Copy (or replace) the file/directory
    cp -r "$FILE" "$TARGET_PATH"
    echo "Copied: $FILE to $TARGET_PATH"
  else
    echo "Warning: $FILE does not exist, skipping."
  fi
done

echo "Backup complete."

