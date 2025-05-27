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

