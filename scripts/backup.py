#!/usr/bin/env python3
"""
Script : backup.py
But : Sauvegarder un dossier vers un répertoire de backup avec timestamp.
Auteur : Wisdom Follygan
"""

import os
import shutil
import datetime
import sys

# === CONFIGURATION ===
SOURCE_DIR = "home/wisdom/supervision/Documents/source"       # Dossier à sauvegarder
BACKUP_DIR = "/home/wisdom/supervision/Documents/backups"      # Dossier où stocker la sauvegarde
EMAIL_SIMULATED = "admin@example.com"              # Email fictif pour la notification

# === Création du répertoire de sauvegarde s’il n’existe pas ===
os.makedirs(BACKUP_DIR, exist_ok=True)

# === Génération du nom de la sauvegarde ===
timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
backup_name = f"backup_{timestamp}"
backup_path = os.path.join(BACKUP_DIR, backup_name)

# === Fonction d'envoi d'alerte simulée ===
def send_email_simulated(subject, message):
    print("=== [SIMULATION EMAIL] ===")
    print(f"À : {EMAIL_SIMULATED}")
    print(f"Sujet : {subject}")
    print("Message :")
    print(message)
    print("==========================")

# === Fonction principale ===
def main():
    print(f"Début de la sauvegarde à {timestamp}...")

    try:
        if not os.path.exists(SOURCE_DIR):
            raise FileNotFoundError(f"Le dossier source {SOURCE_DIR} est introuvable.")

        # Copie du dossier source vers le dossier de backup
        shutil.copytree(SOURCE_DIR, backup_path)
        print(f"✅ Sauvegarde réussie : {backup_path}")

        # Simulation d’un email de confirmation
        send_email_simulated(
            subject="Sauvegarde réussie",
            message=f"La sauvegarde de {SOURCE_DIR} a été effectuée avec succès dans {backup_path}."
        )

    except Exception as e:
        error_msg = f"❌ ERREUR pendant la sauvegarde : {e}"
        print(error_msg)
        send_email_simulated("Erreur de sauvegarde", error_msg)
        sys.exit(1)

if __name__ == "__main__":
    main()
