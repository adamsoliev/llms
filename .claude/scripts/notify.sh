#!/bin/bash

# Read hook input data
INPUT=$(cat)
SESSION_DIR=$(basename "$(pwd)")

# Extract message from transcript if available
TRANSCRIPT_PATH=$(echo "$INPUT" | jq -r '.transcript_path')
if [ -f "$TRANSCRIPT_PATH" ]; then
    MSG=$(tail -10 "$TRANSCRIPT_PATH" | \
        jq -r 'select(.message.role == "assistant") | .message.content[0].text' | \
        tail -1 | tr '\n' ' ' | cut -c1-60)
    MSG=${MSG:-"Task completed"}
else
    MSG="Task completed"
fi

# Platform-specific notification
case "$(uname -s)" in
    Darwin)
        # macOS
        MSG=${MSG//\\/\\\\}
        MSG=${MSG//\"/\\\"}
        osascript -e "display notification \"$MSG\" with title \"Claude Code ($SESSION_DIR) Done\" sound name \"Glass\""
        ;;
    Linux)
        # Linux with notify-send
        if command -v notify-send &> /dev/null; then
            notify-send "Claude Code ($SESSION_DIR) Done" "$MSG"
        fi
        ;;
esac
