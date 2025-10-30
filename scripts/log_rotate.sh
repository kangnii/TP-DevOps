#!/bin/bash
# ===========================================================
# Script : log_rotate.sh
# Objectif : Rotation et purge des logs
# Auteur : Wisdom Follygan
# ===========================================================

# 🔧 CONFIGURATION
LOG_DIR="/../supervision/logs"      # Dossier des logs
MAX_DAYS=7                        # Supprimer les logs plus vieux que 7 jours
MAX_SIZE_MB=10                     # Supprimer les logs plus gros que 10 Mo
BACKUP_DIR="/../supervision/logs_archive"  # Répertoire pour archiver les logs

# 🔹 Crée le dossier d'archive si inexistant
mkdir -p "$BACKUP_DIR"

echo "=== Rotation des logs : $(date '+%Y-%m-%d %H:%M:%S') ==="

# 🔹 Parcours des fichiers logs
for logfile in "$LOG_DIR"/*.log; do
    [ -e "$logfile" ] || continue  # ignore si aucun fichier

    # Taille du fichier en Mo
    size_mb=$(du -m "$logfile" | cut -f1)

    # Déplacement vers archive si > MAX_SIZE_MB
    if [ "$size_mb" -ge "$MAX_SIZE_MB" ]; then
        timestamp=$(date '+%Y%m%d_%H%M%S')
        mv "$logfile" "$BACKUP_DIR/$(basename "$logfile").$timestamp"
        echo "📦 $logfile archivé car > $MAX_SIZE_MB MB"
        # Recréation d'un fichier vide
        touch "$logfile"
    fi
done

# 🔹 Suppression des logs vieux de plus de MAX_DAYS jours
find "$BACKUP_DIR" -type f -mtime +"$MAX_DAYS" -name "*.log.*" -exec rm -f {} \;
echo "🗑️ Logs plus vieux que $MAX_DAYS jours supprimés de $BACKUP_DIR"

echo "=== Rotation terminée ==="
