#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/fastfetch"

printf '\n'
printf '========================================\n'
printf '      FASTFETCH OVERDOSE - REMOVE\n'
printf '========================================\n\n'

if [[ ! -d "$CONFIG_DIR" ]]; then
    printf '[!] Fastfetch configuration directory does not exist.\n'
    exit 0
fi

rm -f "$CONFIG_DIR/config.jsonc"
rm -f "$CONFIG_DIR/ame.jpg"

printf '[+] Fastfetch Overdose configuration removed.\n'
printf '[+] Existing backup directories were NOT deleted.\n\n'
printf 'Backups can be found in:\n'
printf '    %s/backup-*\n\n' "$CONFIG_DIR"
