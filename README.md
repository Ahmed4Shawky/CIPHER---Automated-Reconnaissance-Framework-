# CIPHER---Automated-Reconnaissance-Framework-
CIPHER is a comprehensive reconnaissance framework designed for ethical hackers and penetration testers. This interactive bash script streamlines the information gathering phase of security assessments by automating common reconnaissance tasks with an intuitive menu-driven interface.

CIPHER is a comprehensive reconnaissance framework designed for ethical hackers and penetration testers. This interactive bash script streamlines the information gathering phase of security assessments by automating common reconnaissance tasks with an intuitive menu-driven interface.

# Features

    Intuitive Menu System: Easy-to-navigate interface with colored output
    Target Management: Simple target setup and persistent configuration
    Multi-Phase Recon: Organized reconnaissance phases for systematic approach
    Safety Mechanisms: Manual confirmation before command execution
    Structured Output: Organized results with clear directory structure
    Modular Design: Separated functions for maintainability

## Reconnaissance Capabilities
# Information Gathering

    Port scanning with Nmap
    Service and version detection
    Operating system fingerprinting
    Aggressive scanning techniques

# Subdomain Enumeration

    Amass enumeration
    Subfinder discovery
    DNS resolution validation

# Web Probing

    HTTP/S validation with httpx
    Technology stack identification
    Web application screenshotting

# Directory Enumeration

    Gobuster directory brute-forcing
    FFUF content discovery
    Dirsearch scanning

# Prerequisites

Before using CIPHER, ensure you have the required tools installed:
Core Tools
bash

# Install Nmap for port scanning
sudo apt install nmap

# Install wordlists for directory scanning
sudo apt install seclists

Additional Tools
bash

# Install Go if not already installed
sudo apt install golang

# Install reconnaissance tools
GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
GO111MODULE=on go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
GO111MODULE=on go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
GO111MODULE=on go install -v github.com/tomnomnom/httprobe@latest
sudo apt install gobuster ffuf dirsearch

# Quick Start

    Clone the Repository
    bash

git clone https://github.com/Ahmed4Shawky/CIPHER---Automated-Reconnaissance-Framework-.git
cd cipher

Make the Script Executable
bash

chmod +x cipher.sh

Run CIPHER
bash

    ./cipher.sh

    Follow the Interactive Menu
        Press numbers to navigate menus
        Type 'RUN' exactly to execute commands
        Results saved in organized directories

# Output Structure

CIPHER organizes all output in a structured directory:

recon_results/
├── raw/           # Raw tool output
│   ├── nmap_*.txt # Nmap scan results
│   ├── amass.txt  # Subdomain enumeration
│   ├── httpx.txt  # Web probing results
│   └── *.txt      # Other tool outputs
└── screenshots/   # Web application screenshots

🎮 Usage Example

    Run the script:
    bash

./cipher.sh

Set your target:

Enter target domain/IP: example.com
Output directory [recon_results]: 

Navigate through menus:

    Select Port Scanning → Quick Scan
    Confirm execution by typing 'RUN'

View results:

    cat recon_results/raw/nmap_quick.nmap

# Legal Notice

This tool is designed for educational purposes and authorized security testing only. Always obtain proper written permission before conducting any reconnaissance activities. Unauthorized scanning of networks and systems is illegal.

# Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
📄 License

This project is licensed under the MIT License - see the LICENSE [blocked] file for details.
👤 Author

Ahmed Shawky

    GitHub: https://github.com/Ahmed4Shawky

# Acknowledgments

    All open-source security tools integrated in this framework
    The ethical hacking community for continuous contributions

⚠️ Ethical Use Only ⚠️

This tool is for authorized security testing and educational purposes only. Always obtain written permission before testing any systems or networks.
