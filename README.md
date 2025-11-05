# 🧰 Maintenance Suite – Bash Automation Toolkit
![Bash](https://img.shields.io/badge/Bash-blue?logo=gnu-bash)
![Ubuntu](https://img.shields.io/badge/Ubuntu-orange?logo=ubuntu)
![WSL](https://img.shields.io/badge/WSL-green?logo=windows)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)


A simple yet powerful **system maintenance toolkit** written in **Bash** for Ubuntu/WSL environments.  
This suite automates routine tasks such as system backups, log monitoring, and cleanup through modular scripts.

---

## 📁 Project Structure
maint_suite/
├── scripts/
│ ├── backup.sh
│ ├── system_maint.sh 
│ ├── log_monitor.sh
│ └── maint_menu.sh
├── maint_logs/ 
├── maint_backups/
├── LICENSE
└── README.md
---

## 🚀 Usage

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/VedPrakash36>/maint_suite.git
cd maint_suite/scripts

2️Make Scripts Executable
chmod +x *.sh

3️⃣ Run the Menu
./maint_menu.sh

4️⃣ Schedule Automatic Backups (Optional)

Edit your crontab:

crontab -e

Add this line to run daily at 2 AM:

0 2 * * * /home/<username>/maint_suite/scripts/backup.sh >> /home/<username>/maint_

⚙️ Features

✅ Safe home directory backups with log filtering
✅ System update & cleanup automation
✅ Log error monitoring with pattern matching
✅ Menu-driven interface for all tasks
✅ Cron support for scheduled operations


🧠 Tech Used

Bash (Shell scripting)

Ubuntu / WSL

Cron for task scheduling

tar, grep, find, apt


🧩 Setup Notes

Tested on Ubuntu 22.04 (WSL)

Requires tar, grep, cron, mailutils (optional for alerts)

Install dependencies:

sudo apt update && sudo apt install -y tar cron grep mailutils


🧑‍💻 Author

Ved Prakash
💼 Full Stack Developer | Bash Automation Enthusiast
📫 LinkedIn
 | GitHub
