#!/bin/bash
# Description: Automated Hardened Firewall Configuration for Debian/Ubuntu
# Author: Lupo-SysAdmin

echo "-------------------------------------------------------"
echo "Starting Hardened Firewall Configuration by Lupo"
echo "-------------------------------------------------------"

# 1. Install UFW if not present
sudo apt update && sudo apt install ufw -y

# 2. Set Default Policies (Deny incoming, Allow outgoing)
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 3. Specific SSH Hardening
read -p "Do you want to enable SSH (Port 22)? (y/n): " allow_ssh

if [ "$allow_ssh" = "y" ]; then
    read -p "Enter the specific IP address allowed to connect via SSH: " admin_ip
    sudo ufw allow from $admin_ip to any port 22 proto tcp
    echo "SSH access restricted to IP: $admin_ip"
else
    echo "SSH port remains closed."
fi

# 4. Allow other standard services
sudo ufw allow http     # Port 80
sudo ufw allow https    # Port 443

# 5. Enable Logging for security audits
sudo ufw logging on

# 6. Enable Firewall
echo "y" | sudo ufw enable

echo "-------------------------------------------------------"
sudo ufw status verbose
echo "Firewall configured successfully by Lupo."
