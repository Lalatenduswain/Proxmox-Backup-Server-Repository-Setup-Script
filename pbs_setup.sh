#!/bin/bash

# Exit on any error
set -e

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

PBS_FILE="/etc/apt/sources.list.d/pbs-enterprise.list"

echo "Managing PBS Enterprise repository list..."

# If file exists, comment out the enterprise line if it's not already commented
if [ -f "$PBS_FILE" ]; then
    sed -i 's|^deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise|#deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise|' "$PBS_FILE"
    # If the commented version isn't in the file, add it
    if ! grep -q "#deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise" "$PBS_FILE"; then
        echo "#deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise" >> "$PBS_FILE"
    fi
else
    # If file doesn't exist, create it with the commented line
    echo "#deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise" > "$PBS_FILE"
fi

# Create/update pbs-no-subscription.list
echo "Creating/updating PBS No-Subscription repository list..."
echo "deb http://download.proxmox.com/debian/pbs bookworm pbs-no-subscription" > /etc/apt/sources.list.d/pbs-no-subscription.list

# Configure DNS before updates
echo "Configuring DNS servers..."
echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > /etc/resolv.conf
systemctl restart networking

# Update package lists and upgrade
echo "Updating package lists..."
apt update

echo "Performing system upgrade..."
apt full-upgrade -y

echo "Script completed successfully!"
