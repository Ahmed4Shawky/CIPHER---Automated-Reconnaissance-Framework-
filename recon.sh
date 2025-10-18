#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# colors
RED="\e[31m"; GREEN="\e[32m"; YELLOW="\e[33m"; BLUE="\e[34m"; MAG="\e[35m"; CYAN="\e[36m"; RESET="\e[0m"

TARGET=""
DOMAIN=""
OUTPUT_DIR="recon_results"

show_banner() {
    clear
    echo -e "${CYAN}"
    echo "  ____ ___ ____  _____ ____  "
    echo " / ___|_ _|  _ \| ____|  _ \ "
    echo "| |    | || |_) |  _| | |_) |"
    echo "| |___ | ||  __/| |___|  _ < "
    echo " \____|___|_|   |_____|_| \_\\"
    echo -e "${RESET}"
    echo -e "${RED}========================================${RESET}"
    echo -e "${RED}              CIPHER                  ${RESET}"
    echo -e "${RED}========================================${RESET}"
    echo -e "${MAG}           by Ahmed Shawky${RESET}"
    echo ""
}

pause(){ read -rp "Press Enter to continue..."; }

setup_target() {
    show_banner
    echo -e "${BLUE}TARGET SETUP${RESET}"
    echo "Configure your target for reconnaissance"
    echo
    
    read -rp "Enter target domain/IP: " DOMAIN
    TARGET="$DOMAIN"
    
    read -rp "Output directory [$OUTPUT_DIR]: " input_output
    OUTPUT_DIR=${input_output:-$OUTPUT_DIR}
    
    mkdir -p "$OUTPUT_DIR"/{raw,json}
    
    echo -e "${GREEN}Target:$RESET $TARGET"
    echo -e "${GREEN}Output:$RESET $OUTPUT_DIR"
    pause
}

confirm_and_run() {
    local cmd="$1"
    
    echo
    echo -e "${MAG}Command:${RESET}"
    echo -e "${BLUE}$cmd${RESET}"
    echo
    
    read -rp "Type 'RUN' (exactly) to execute, or press Enter to skip: " runflag
    if [[ "$runflag" == "RUN" ]]; then
        echo -e "${RED}--- Executing ---${RESET}"
        eval "$cmd"
        echo -e "${GREEN}--- Command finished ---${RESET}"
    else
        echo "Skipped execution."
    fi
    pause
}

port_scan_menu() {
    while true; do
        if [[ -z "${TARGET:-}" ]]; then
            echo -e "${RED}Error: No target set!${RESET}"
            echo "Please run Target Setup first."
            pause
            return
        fi
        
        show_banner
        echo -e "${BLUE}PORT SCANNING${RESET}"
        echo "Target: $TARGET"
        echo
        echo "1) Quick scan (Top 1000 ports)"
        echo "2) Full port scan"
        echo "3) Service detection"
        echo "4) OS detection"
        echo "5) Aggressive scan"
        echo "9) Back"
        read -rp "Choose: " choice
        case "$choice" in
            1)
                echo "Quick Nmap Scan"
                confirm_and_run "nmap -Pn -F $TARGET -oA $OUTPUT_DIR/raw/nmap_quick"
                ;;
            2)
                echo "Full Port Scan"
                confirm_and_run "nmap -Pn -p- $TARGET -oA $OUTPUT_DIR/raw/nmap_full"
                ;;
            3)
                echo "Service Detection"
                confirm_and_run "nmap -Pn -sV $TARGET -oA $OUTPUT_DIR/raw/nmap_service"
                ;;
            4)
                echo "OS Detection"
                confirm_and_run "nmap -Pn -O $TARGET -oA $OUTPUT_DIR/raw/nmap_os"
                ;;
            5)
                echo "Aggressive Scan"
                confirm_and_run "nmap -Pn -A $TARGET -oA $OUTPUT_DIR/raw/nmap_aggressive"
                ;;
            9) return ;;
            *) echo "Invalid"; sleep 1 ;;
        esac
    done
}

subdomain_menu() {
    while true; do
        if [[ -z "${DOMAIN:-}" ]]; then
            echo -e "${RED}Error: No domain set!${RESET}"
            echo "Please run Target Setup first."
            pause
            return
        fi
        
        show_banner
        echo -e "${BLUE}SUBDOMAIN ENUMERATION${RESET}"
        echo "Domain: $DOMAIN"
        echo
        echo "1) Amass enumeration"
        echo "2) Subfinder enumeration"
        echo "3) DNS resolution"
        echo "9) Back"
        read -rp "Choose: " choice
        case "$choice" in
            1)
                echo "Amass Enumeration"
                confirm_and_run "amass enum -d $DOMAIN -o $OUTPUT_DIR/raw/amass.txt"
                ;;
            2)
                echo "Subfinder Enumeration"
                confirm_and_run "subfinder -d $DOMAIN -o $OUTPUT_DIR/raw/subfinder.txt"
                ;;
            3)
                echo "DNS Resolution"
                confirm_and_run "echo $DOMAIN | dnsx -resp -o $OUTPUT_DIR/raw/dnsx.txt"
                ;;
            9) return ;;
            *) echo "Invalid"; sleep 1 ;;
        esac
    done
}

web_probe_menu() {
    while true; do
        if [[ -z "${DOMAIN:-}" ]]; then
            echo -e "${RED}Error: No domain set!${RESET}"
            echo "Please run Target Setup first."
            pause
            return
        fi
        
        show_banner
        echo -e "${BLUE}WEB PROBING${RESET}"
        echo "Target: $DOMAIN"
        echo
        echo "1) HTTP probing with httpx"
        echo "2) Web screenshot with aquatone"
        echo "3) Technology detection"
        echo "9) Back"
        read -rp "Choose: " choice
        case "$choice" in
            1)
                echo "HTTP Probing"
                confirm_and_run "echo $DOMAIN | httpx -silent -o $OUTPUT_DIR/raw/httpx.txt"
                ;;
            2)
                echo "Web Screenshots"
                confirm_and_run "cat $OUTPUT_DIR/raw/httpx.txt | aquatone -out $OUTPUT_DIR/screenshots"
                ;;
            3)
                echo "Technology Detection"
                confirm_and_run "echo $DOMAIN | httpx -silent -tech-detect -o $OUTPUT_DIR/raw/technologies.txt"
                ;;
            9) return ;;
            *) echo "Invalid"; sleep 1 ;;
        esac
    done
}

directory_menu() {
    while true; do
        if [[ -z "${TARGET:-}" ]]; then
            echo -e "${RED}Error: No target set!${RESET}"
            echo "Please run Target Setup first."
            pause
            return
        fi
        
        show_banner
        echo -e "${BLUE}DIRECTORY ENUMERATION${RESET}"
        echo "Target: $TARGET"
        echo
        echo "1) Gobuster directory scan"
        echo "2) FFUF directory scan"
        echo "3) Dirsearch scan"
        echo "9) Back"
        read -rp "Choose: " choice
        case "$choice" in
            1)
                echo "Gobuster Scan"
                confirm_and_run "gobuster dir -u http://$TARGET -w /usr/share/wordlists/dirb/common.txt -t 30 -o $OUTPUT_DIR/raw/gobuster.txt"
                ;;
            2)
                echo "FFUF Scan"
                confirm_and_run "ffuf -u http://$TARGET/FUZZ -w /usr/share/wordlists/dirb/common.txt -t 30 -o $OUTPUT_DIR/raw/ffuf.json"
                ;;
            3)
                echo "Dirsearch Scan"
                confirm_and_run "dirsearch -u http://$TARGET -w /usr/share/wordlists/dirb/common.txt --format=json -o $OUTPUT_DIR/raw/"
                ;;
            9) return ;;
            *) echo "Invalid"; sleep 1 ;;
        esac
    done
}

main_menu() {
    while true; do
        show_banner
        echo -e "${GREEN}RECONNAISSANCE MENU${RESET}"
        echo "Target: ${TARGET:-NOT SET}"
        echo "Output: $OUTPUT_DIR"
        echo
        echo "1) Setup Target"
        echo "2) Port Scanning"
        echo "3) Subdomain Enumeration"
        echo "4) Web Probing"
        echo "5) Directory Enumeration"
        echo "0) Exit"
        echo
        read -rp "Choose an option: " opt
        case "$opt" in
            1) setup_target ;;
            2) port_scan_menu ;;
            3) subdomain_menu ;;
            4) web_probe_menu ;;
            5) directory_menu ;;
            0) echo "Bye."; exit 0 ;;
            *) echo "Invalid"; sleep 1 ;;
        esac
    done
}

trap 'echo; echo "Interrupted."; exit 1' INT TERM
main_menu
