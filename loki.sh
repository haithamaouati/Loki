#!/bin/bash

# Author: Haitham Aouati
# GitHub: github.com/haithamaouati
# Loki is a Bash script that creates masked phishing URLs by combining shortened links with legitimate-looking domains and optional keywords.

# Text format and colors
BOLD="\e[1m"
UNDERLINE="\e[4m"
CLEAR="\e[0m"
NEW_LINE="\n"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
WHITE="\e[97m"

RED_BOLD="\e[1;31m"
GREEN_BOLD="\e[1;32m"
YELLOW_BOLD="\e[1;33m"
WHITE_BOLD="\e[1;97m"

RED_BG="\e[41m"
GREEN_BG="\e[42m"
YELLOW_BG="\e[43m"

clear

echo -e "${WHITE_BOLD}
 @@@        @@@@@@   @@@  @@@  @@@
 @@@       @@@@@@@@  @@@  @@@  @@@
 @@!       @@!  @@@  @@!  !@@  @@!
 !@!       !@!  @!@  !@!  @!!  !@!
 @!!       @!@  !@!  @!@@!@!   !!@${GREEN_BOLD}
 !!!       !@!  !!!  !!@!!!    !!!
 !!:       !!:  !!!  !!: :!!   !!:
  :!:      :!:  !:!  :!:  !:!  :!:
  :: ::::  ::::: ::   ::  :::   ::
 : :: : :   : :  :    :   :::  :
${CLEAR}"

echo -e "${GREEN_BOLD}      Loki ${CLEAR}by Haitham Aouati"
echo -e " GitHub: ${UNDERLINE}github.com/haithamaouati${CLEAR}\n"

# Function to validate URL
url_checker() {
    [[ "$1" =~ ^https?:// ]] || { echo "[!] Invalid URL. Please use http or https."; exit 1; }
}

# Input: Phishing URL
read -p "Paste Phishing URL (with http or https): " phish
url_checker "$phish"

# Shorten URL
short=$(curl -s "https://is.gd/create.php?format=simple&url=${phish}")
shorter=${short#https://}

# Input: Masking domain
read -p "Domain to mask the Phishing URL (with http or https): " mask
url_checker "$mask"

# Input: Social engineering words
read -p "Type social engineering words (e.g., earn-money, no spaces): " words

# Validate and generate final URL
[[ "$words" =~ " " ]] && { echo "[!] Invalid words. Please avoid spaces."; words=""; }
final="${mask}${words:+-$words}@$shorter"
echo -e "\nMasked URL:${GREEN_BOLD} $final\n${CLEAR}"
