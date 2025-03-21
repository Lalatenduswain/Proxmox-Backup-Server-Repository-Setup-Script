# Proxmox Backup Server Repository Setup Script 🚀

A bash script to automate the setup of Proxmox Backup Server (PBS) repositories on Debian Bookworm systems, ensuring proper repository configuration and system updates.

---

## 📌 Features
- ✅ Automatically comments out the Proxmox Backup Server Enterprise repository
- ✅ Adds the no-subscription PBS repository
- ✅ Updates package lists and performs a full system upgrade
- 🛡️ Root privilege verification
- 📝 Clear execution feedback
- 🚫 Error handling with script termination on failure

---

## 📋 Prerequisites
Before running this script, ensure the following:

- **Operating System**: Debian Bookworm
- **Permissions**: Must be run with `sudo` or as root
- **Packages**: 
  - `apt` (should be pre-installed on Debian systems)
  - `sed` (usually pre-installed, but install with `sudo apt install sed` if missing)
- **Internet Connection**: Required for repository updates and upgrades
- **Backup**: Recommended to have a system backup before running upgrades

---

## 📖 Installation Guide

### Step 1: Clone the Repository
Clone this repository to your local system:

```bash
git clone https://github.com/Lalatenduswain/Proxmox-Backup-Server-Repository-Setup-Script
cd Proxmox-Backup-Server-Repository-Setup-Script
```

### Step 2: Make the Script Executable
Set the appropriate permissions:

```bash
chmod +x pbs_setup.sh
```

### Step 3: Run the Script
Execute the script with sudo privileges:

```bash
sudo ./pbs_setup.sh
```

---

## 🔍 Script Explanation
The `pbs_setup.sh` script performs the following steps:

1. **Root Check**: Verifies the script is running with root privileges
2. **Enterprise Repository Management**:
   - Checks if `/etc/apt/sources.list.d/pbs-enterprise.list` exists
   - Comments out any active `deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise` line
   - Adds the commented line if it doesn't exist
3. **No-Subscription Repository Setup**:
   - Creates/overwrites `/etc/apt/sources.list.d/pbs-no-subscription.list`
   - Adds `deb http://download.proxmox.com/debian/pbs bookworm pbs-no-subscription`
4. **System Update**:
   - Runs `apt update` to refresh package lists
   - Executes `apt full-upgrade -y` to upgrade all packages

---

## ⚠️ Disclaimer | Running the Script

**Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

---

## 💖 Support & Donations

If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).

Encountering issues? Don't hesitate to submit an issue on our [GitHub Issues page](https://github.com/Lalatenduswain/Proxmox-Backup-Server-Repository-Setup-Script/issues).

---

## 🛠️ Support or Contact
Have questions or need help? Feel free to:
- Open an issue: [GitHub Issues](https://github.com/Lalatenduswain/Proxmox-Backup-Server-Repository-Setup-Script/issues)
- Visit my [Website](https://blog.lalatendu.info/)
- Contact me via GitHub

---

## 📦 Repository
Clone it from: [https://github.com/Lalatenduswain/Proxmox-Backup-Server-Repository-Setup-Script](https://github.com/Lalatenduswain/Proxmox-Backup-Server-Repository-Setup-Script)

Happy automating! 🎉
```

### Key Updates:
1. **Repository URL**: Changed all instances to `https://github.com/Lalatenduswain/Proxmox-Backup-Server-Repository-Setup-Script` as per your provided repo name.
2. **Script Name**: Kept as `pbs_setup.sh` from our previous conversation, as it’s specific to the script's purpose.
3. **Consistency**: Ensured all links, clone commands, and references match your exact repository name.

### Steps to Implement:
1. Ensure your repository exists at `https://github.com/Lalatenduswain/Proxmox-Backup-Server-Repository-Setup-Script`
2. Add the `pbs_setup.sh` script from my second response (the corrected version):
   ```bash
   #!/bin/bash
   set -e
   if [ "$EUID" -ne 0 ]; then
       echo "This script must be run as root. Please use sudo."
       exit 1
   fi
   PBS_FILE="/etc/apt/sources.list.d/pbs-enterprise.list"
   echo "Managing PBS Enterprise repository list..."
   if [ -f "$PBS_FILE" ]; then
       sed -i 's|^deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise|#deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise|' "$PBS_FILE"
       if ! grep -q "#deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise" "$PBS_FILE"; then
           echo "#deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise" >> "$PBS_FILE"
       fi
   else
       echo "#deb https://enterprise.proxmox.com/debian/pbs bookworm pbs-enterprise" > "$PBS_FILE"
   fi
   echo "Creating/updating PBS No-Subscription repository list..."
   echo "deb http://download.proxmox.com/debian/pbs bookworm pbs-no-subscription" > /etc/apt/sources.list.d/pbs-no-subscription.list
   echo "Updating package lists..."
   apt update
   echo "Performing system upgrade..."
   apt full-upgrade -y
   echo "Script completed successfully!"
   ```
3. Add this README.md file to the repository.
4. Push the changes to GitHub.

This should now perfectly align with your repository and requirements. Let me know if you need further tweaks!
