# Loki
Loki is a Bash scrip that creates masked phishing URLs by combining shortened links with legitimate-looking domains and optional keywords.

```
 ██▓     ▒█████   ██ ▄█▀ ██▓
▓██▒    ▒██▒  ██▒ ██▄█▒ ▓██▒
▒██░    ▒██░  ██▒▓███▄░ ▒██▒
▒██░    ▒██   ██░▓██ █▄ ░██░
░██████▒░ ████▓▒░▒██▒ █▄░██░
░ ▒░▓  ░░ ▒░▒░▒░ ▒ ▒▒ ▓▒░▓
░ ░ ▒  ░  ░ ▒ ▒░ ░ ░▒ ▒░ ▒ ░
  ░ ░   ░ ░ ░ ▒  ░ ░░ ░  ▒ ░
    ░  ░    ░ ░  ░  ░    ░  
```

# Screenshot

![screenshot]()

## Usage

To use the Loki script, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/haithamaouati/Loki.git
    ```

2. Change to the Loki directory:

    ```bash
    cd Loki
    ```
    
3. Change the file modes
    ```bash
    chmod +x loki.sh
    ```
    
5. Run the script:

    ```bash
    ./loki.sh
    ```

#### Input Prompts:

1. Phishing URL:
_Paste Phishing URL (with http or https):_ `http://example.com/phish`


2. Masking Domain:
_Domain to mask the Phishing URL (with http or https):_ `https://google.com`


3. Social Engineering Words:
_Type social engineering words (e.g., free-money, no spaces):_ `free-money`

Final Output:
_Generated MaskPhish URL:_ `https://google.com-free-money@is.gd/abcd`

## Author

Made with :coffee: by **Haitham Aouati**
  - GitHub: [github.com/haithamaouati](https://github.com/haithamaouati)

## License

Loki is licensed under [Unlicense license](LICENSE).
