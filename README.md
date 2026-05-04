# Firewall-UFW 🛡️

This repository contains professional automation scripts designed to secure Debian-based infrastructures, focusing on defensive security and information integrity.

## Scripts Included:

### 1. `firewall_setup.sh`
Automates the configuration of **UFW (Uncomplicated Firewall)** with advanced security logic to prevent unauthorized access and MITM (Man-in-the-Middle) risks:

*   **Default Deny Policy:** Blocks all unauthorized incoming traffic by default.
*   **Interactive SSH Hardening:** Instead of opening port 22 to the world, the script prompts for a specific administrator IP address to whitelist.
*   **Standard Services:** Opens ports 80 (HTTP) and 443 (HTTPS) for web traffic.
*   **Security Auditing:** Enables active logging to monitor network activity.

## Usage
To execute the hardened setup:
```bash
chmod +x firewall_setup.sh
sudo ./firewall_setup.sh
