#!/bin/bash

# Making the log file have time stamps
LOG_FILE="$HOME/setup_$(date +%Y%m%d_%H%M%S).log"

echo "[*] Starting system setup..." | tee -a $LOG_FILE

# Updating & upgrading
echo "[*] Updating system..." | tee -a $LOG_FILE
sudo apt update | tee -a $LOG_FILE
sudo apt upgrade -y | tee -a $LOG_FILE

# Installing some basic packages
echo "[*] Installing packages..." | tee -a $LOG_FILE
sudo apt install -y git curl htop vim ufw openssh-server libreoffice firefox docker.io nmap | tee -a $LOG_FILE

# Firing up the Firewall
echo "[*] Configuring firewall..." | tee -a $LOG_FILE
sudo ufw default deny incoming | tee -a $LOG_FILE
sudo ufw default allow outgoing | tee -a $LOG_FILE
sudo ufw enable | tee -a $LOG_FILE

# Creating a sudo user
USERNAME="user1"
PASSWORD="password1"
echo "[*] Creating sudo user..." | tee -a $LOG_FILE
sudo adduser --gecos "" $USERNAME | tee -a $LOG_FILE
echo "$USERNAME:$PASSWORD" | sudo chpasswd
sudo usermod -aG sudo $USERNAME | tee -a $LOG_FILE

echo "[*] Welcome to your new PC! Log output is in $LOG_FILE" | tee -a $LOG_FILE
