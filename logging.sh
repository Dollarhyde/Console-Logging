#!/bin/bash

# Author: Dollarhyde

# Get the current username
USER=$(whoami)

# Define the directories and files
LOG_DIR="/home/$USER/logs"
BASHRC_FILE="/home/$USER/.bashrc"
SCRIPTRC_FILE="/home/$USER/.scriptrc"
BASH_ALIASES_FILE="/home/$USER/.bash_aliases"
###LOG_FILE="$LOG_DIR/bash_$(date '+%Y%m%d%H%M%S').log"

# Create the logs directory if it doesn't exist
if [ ! -d "$LOG_DIR" ]; then
    echo "[*] Creating directory: $LOG_DIR"
    mkdir -p "$LOG_DIR"
fi

# Copy .bashrc to .scriptrc if it exists and .scriptrc doesn't exist. This would perserve original .bashrc settings within the logged session
if [ -f "$BASHRC_FILE" ] && [ ! -f "$SCRIPTRC_FILE" ]; then
    echo "[*] Copying $BASHRC_FILE to $SCRIPTRC_FILE"
    cp "$BASHRC_FILE" "$SCRIPTRC_FILE"
fi

# Add command to .bashrc to log the session
echo "[*] Adding command to $BASHRC_FILE"
echo "script -c 'bash --rcfile $SCRIPTRC_FILE' -f $LOG_DIR/bash_\$(date '+%Y%m%d%H%M%S').log" >> "$BASHRC_FILE"

# Create .bash_aliases if it doesn't exist
if [ ! -f "$BASH_ALIASES_FILE" ]; then
    echo "[*] Creating file: $BASH_ALIASES_FILE"
    touch "$BASH_ALIASES_FILE"
fi

# Add alias to .bash_aliases to maintain color of the console
echo "[*] Adding alias to $BASH_ALIASES_FILE"
echo 'alias ls="ls --color=auto"' >> "$BASH_ALIASES_FILE"

echo "[*] Done"
