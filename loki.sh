#!/bin/bash

# Author: Haitham Aouati
# GitHub: github.com/haithamaouati
# Loki is a Bash script that creates masked phishing URLs by combining shortened links with legitimate-looking domains and optional keywords.

# Foreground Color
red="\e[31m"
green="\e[32m"
yellow="\e[33m"

# Text Format
normal="\e[0m"
bold="\e[1m"
faint="\e[2m"
italics="\e[3m"
underlined="\e[4m"

clear

echo -e "${white}
 @@@        @@@@@@   @@@  @@@  @@@
 @@@       @@@@@@@@  @@@  @@@  @@@
 @@!       @@!  @@@  @@!  !@@  @@!
 !@!       !@!  @!@  !@!  @!!  !@!
 @!!       @!@  !@!  @!@@!@!   !!@${green}
 !!!       !@!  !!!  !!@!!!    !!!
 !!:       !!:  !!!  !!: :!!   !!:
  :!:      :!:  !:!  :!:  !:!  :!:
  :: ::::  ::::: ::   ::  :::   ::
 : :: : :   : :  :    :   :::  :
${normal}"

echo -e "${green}${bold}      Loki ${normal}by Haitham Aouati"
echo -e " GitHub: ${underlined}github.com/haithamaouati${normal}\n"

# Function to validate URL
url_checker() {
    [[ "$1" =~ ^https?:// ]] || { echo "[!] Invalid URL. Please use http or https."; exit 1; }
}

# Input: Phishing URL
read -p "Phishing URL: " phish
url_checker "$phish"

# Shorten URL
short=$(curl -s "https://is.gd/create.php?format=simple&url=${phish}")
shorter=${short#https://}

# Input: Masking domain
read -p "Masking domain: " mask
url_checker "$mask"

# Input: Social engineering words
read -p "Social engineering words: " words

# Validate and generate final URL
[[ "$words" =~ " " ]] && { echo "[!] Invalid words. Please avoid spaces."; words=""; }
final="${mask}${words:+-$words}@$shorter"
echo -e "\nMasked URL:${green} $final\n${CLEAR}"
