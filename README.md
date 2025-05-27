# Retool Backup - Resale App

This repository contains version-controlled backups of my Retool application used for managing resale inventory.

## 🔄 Backup Workflow

Backups are created using a local script (`backup_retool.bat`) that:
- Finds the most recent `.json` file in `C:\Users\mrsja\retool_backups`
- Prompts me to confirm or select a different file
- Saves the file into `backups/YYYY-MM-DD/`
- Commits and pushes the update to GitHub
- Opens the repo page when done

Each backup is stored in its own dated folder for easy organization and rollback.

## 📁 Folder Structure
```bash
backups/
  └── 2025-05-26/
      └── DarnItJanetInventory-Git.json
```

## 💡 How to Restore

1. Download a backup JSON file from one of the dated folders
2. Go to [Retool](https://retool.com)
3. Click `Import` → select the JSON file
4. Retool will create a new app with that version

## 🛠 Future Plans

- Add MySQL schema exports
- Create a restore script
- Schedule automatic backups weekly

---
