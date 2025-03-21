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
