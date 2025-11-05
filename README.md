# 🧰 Maintenance Suite (Bash – Ubuntu WSL)

A simple Bash-based system maintenance toolkit that can:
- Run automated backups of your home directory  
- Clean up the system (`system_maint.sh`)  
- Monitor logs for errors (`log_monitor.sh`)  
- Provide a menu interface (`maint_menu.sh`)

---

## 📦 Structure


maint_suite/
├── scripts/
│ ├── backup.sh
│ ├── system_maint.sh
│ ├── log_monitor.sh
│ └── maint_menu.sh
├── maint_logs/
├── maint_backups/
└── README.md


---

## 🚀 Usage
```bash
cd ~/maint_suite/scripts
chmod +x *.sh
./maint_menu.sh


