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

# Install all required tools at once
sudo apt update && sudo apt install -y nmap seclists golang gobuster ffuf dirsearch nikto whatweb curl wget

# Install Go tools quickly

go install github.com/projectdiscovery/httpx/cmd/httpx@latest

go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest

go install github.com/tomnomnom/httprobe@latest

go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest

# Add Go bin to PATH (if not already there)
echo 'export PATH=$PATH:~/go/bin' >> ~/.bashrc
source ~/.bashrc

# Quick Start

    Clone the Repository
    bash

git clone [https://github.com/Ahmed4Shawky/CIPHER---Automated-Reconnaissance-Framework-.git][Download CIPHER Framework](https://github.com/Ahmed4Shawky/CIPHER---Automated-Reconnaissance-Framework-/archive/refs/heads/main.zip)


Make the Script Executable
bash

chmod +x recon.sh

Run CIPHER
bash

    ./recon.sh

    Follow the Interactive Menu
        Press numbers to navigate menus
        Type 'RUN' exactly to execute commands
        Results saved in organized directories

🎮 Usage Example

    Run the script:
    bash

./recon.sh

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
