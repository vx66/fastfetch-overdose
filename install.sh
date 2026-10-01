#!/usr/bin/env bash

set -euo pipefail

REPO="https://raw.githubusercontent.com/vx66/fastfetch-overdose/main"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/fastfetch"
BACKUP_DIR="$CONFIG_DIR/backup-$(date +%Y%m%d-%H%M%S)"

printf '\n'
printf '========================================\n'
printf '         FASTFETCH OVERDOSE\n'
printf '========================================\n\n'

if ! command -v fastfetch >/dev/null 2>&1; then
    printf '[!] Fastfetch is not installed.\n'
    printf '    Install it before running this script.\n'
    exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
    printf '[!] curl is not installed.\n'
    exit 1
fi

printf '[+] Fastfetch found\n'
printf '[+] Creating configuration directory\n'

mkdir -p "$CONFIG_DIR"

if [[ -f "$CONFIG_DIR/config.jsonc" || -f "$CONFIG_DIR/ame.jpg" ]]; then
    printf '[+] Existing configuration found\n'
    printf '[+] Creating backup: %s\n' "$BACKUP_DIR"

    mkdir -p "$BACKUP_DIR"

    if [[ -f "$CONFIG_DIR/config.jsonc" ]]; then
        cp "$CONFIG_DIR/config.jsonc" "$BACKUP_DIR/config.jsonc"
    fi

    if [[ -f "$CONFIG_DIR/ame.jpg" ]]; then
        cp "$CONFIG_DIR/ame.jpg" "$BACKUP_DIR/ame.jpg"
    fi
fi

printf '[+] Installing config.jsonc\n'

curl -fsSL \
    "$REPO/config.jsonc" \
    -o "$CONFIG_DIR/config.jsonc"

printf '[+] Installing Ame image\n'

curl -fsSL \
    "$REPO/assets/ame.jpg" \
    -o "$CONFIG_DIR/ame.jpg"

printf '\n'
printf '========================================\n'
printf '       INTERNET OVERDOSE COMPLETE\n'
printf '========================================\n\n'

fastfetch
