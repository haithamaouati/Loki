#!/bin/bash

# Loki - Masked Phishing URL Generator
# Author: Haitham Aouati
# GitHub: github.com/haithamaouati

# Style & colors
normal="\e[0m"
bold="\e[1m"
underline="\e[4m"

# Banner
banner() {
clear
echo -e "${bold}
  ⢀⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡄
  ⢸⣿⠻⣆⠀⠀⠀⠀⠀⠀⢠⠟⣻⡟
  ⠘⣿⡆⠈⠂⠀⠀⠀⠀⠀⠃⢀⣿⠇
  ⠀⢻⣿⡀⠀⠀⠀⠀⠀⠀⠀⣾⡿⠀
  ⠀⠈⢿⣷⣤⣶⣶⣶⣶⣤⣼⣿⠃⠀
  ⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀ Loki${normal} — Masking phishing URLs${bold}
  ⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀ ${normal}Author: Haitham Aouati${bold}
  ⠀⠀⠀⣟⠛⠿⢿⡿⠿⠛⢹⠁⠀⠀ ${normal}GitHub: ${underline}github.com/haithamaouati${normal}${bold}
  ⠀⠀⠀⢿⣄⠀⠀⠀⠀⣠⣾⠀⠀⠀
  ⠀⠀⠀⠈⢿⡷⠀⠀⢸⡿⠃⠀⠀⠀
  ⠀⠀⠀⠀⠀⠁⠀⠀⠘⠁⠀⠀⠀⠀
${normal}"
}

# Help message
show_help() {
    banner
    cat << EOF
Usage:
  $0 -p <phishing_url> -m <masking_domain> [-w <words>]
  $0 --phish <phishing_url> --mask <masking_domain> [--words <words>]

Options:
  -p, --phish     Phishing URL (must start with http/https)
  -m, --mask      Legit-looking domain to mask with
  -w, --words     Social engineering words (no spaces, optional)
  -h, --help      Show this help message and exit

Example:
  $0 --phish https://phishing.com --mask https://example.com --words login-update
EOF
    echo
    exit 0
}

# Validate URL
url_checker() {
    [[ "$1" =~ ^https?:// ]] || { echo "[!] Invalid URL: $1"; exit 1; }
}

# No args? Show help.
[[ $# -eq 0 ]] && show_help

# Show banner
banner

# Parse args
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -p|--phish) phish="$2"; shift 2 ;;
        -m|--mask) mask="$2"; shift 2 ;;
        -w|--words) words="$2"; shift 2 ;;
        -h|--help) show_help ;;
        *) echo "[!] Unknown option: $1"; show_help ;;
    esac
done

# Validate input
[[ -z "$phish" || -z "$mask" ]] && { echo "[!] Missing required arguments."; show_help; }
[[ "$words" =~ " " ]] && { echo "[!] Invalid words: avoid spaces."; words=""; }

url_checker "$phish"
url_checker "$mask"

# Shorten phishing URL
short=$(curl -s "https://is.gd/create.php?format=simple&url=${phish}")
shorter=${short#https://}

# Final masked link
final="${mask}${words:+-$words}@$shorter"

# Output
echo -e "${bold}Masked URL:${normal} $final\n"
