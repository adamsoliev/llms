#!/bin/bash
# Install Claude Code configuration from this repo to ~/.claude
# Usage: ./install-claude.sh [--copy]
#   --copy: Copy files instead of symlinking (useful if repo won't persist)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/.claude"
TARGET_DIR="$HOME/.claude"

USE_SYMLINK=true
if [[ "$1" == "--copy" ]]; then
    USE_SYMLINK=false
fi

# Check source exists
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Error: Source .claude directory not found at $SOURCE_DIR"
    exit 1
fi

# Create target directory if needed
mkdir -p "$TARGET_DIR"

install_item() {
    local src="$1"
    local dst="$2"
    local name="$3"

    # Backup existing
    if [[ -e "$dst" && ! -L "$dst" ]]; then
        echo "Backing up existing $name to ${dst}.bak"
        mv "$dst" "${dst}.bak"
    elif [[ -L "$dst" ]]; then
        rm "$dst"
    fi

    if $USE_SYMLINK; then
        ln -s "$src" "$dst"
        echo "Linked $name"
    else
        if [[ -d "$src" ]]; then
            cp -r "$src" "$dst"
        else
            cp "$src" "$dst"
        fi
        echo "Copied $name"
    fi
}

# Install commands directory
install_item "$SOURCE_DIR/commands" "$TARGET_DIR/commands" "commands"

# Install scripts directory
install_item "$SOURCE_DIR/scripts" "$TARGET_DIR/scripts" "scripts"
chmod +x "$TARGET_DIR/scripts/"*.sh 2>/dev/null || true

# Install settings.json (merge if exists, otherwise install)
if [[ -f "$TARGET_DIR/settings.json" ]]; then
    echo "settings.json exists - merging hooks and preserving existing settings..."
    if command -v jq &> /dev/null; then
        # Merge: take existing settings but overlay our hooks
        jq -s '.[0] * .[1]' "$TARGET_DIR/settings.json" "$SOURCE_DIR/settings.json" > "$TARGET_DIR/settings.json.tmp"
        mv "$TARGET_DIR/settings.json.tmp" "$TARGET_DIR/settings.json"
        echo "Merged settings.json"
    else
        echo "Warning: jq not installed, skipping settings merge. Install jq or manually merge."
    fi
else
    install_item "$SOURCE_DIR/settings.json" "$TARGET_DIR/settings.json" "settings.json"
fi

echo ""
echo "Claude Code configuration installed!"
echo "Commands available: $(ls "$TARGET_DIR/commands" 2>/dev/null | sed 's/.md$//' | tr '\n' ' ')"
