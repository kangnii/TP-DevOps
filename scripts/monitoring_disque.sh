#!/bin/bash
# ===========================================================
# Script : monitoring_disque.sh
# Objectif : Surveiller l’espace disque et alerter si > 80%
# Auteur : Wisdom Follygan
# ===========================================================

# 🔧 Configuration
SEUIL=80
LOGFILE="~/supervision/logs/monitoring_disque.log"

# 📦 Commande df pour afficher l'espace disque
echo "=== Surveillance disque ($(date '+%Y-%m-%d %H:%M:%S')) ==="
df -h --output=source,pcent,target | tail -n +2

# 🔍 Vérification du pourcentage d'utilisation
while read -r ligne; do
    usage=$(echo "$ligne" | awk '{print $2}' | tr -d '%')
    disque=$(echo "$ligne" | awk '{print $1}')
    point_montage=$(echo "$ligne" | awk '{print $3}')

    if [ "$usage" -ge "$SEUIL" ]; then
        message="[ALERTE] $disque monté sur $point_montage utilise ${usage}% de l’espace disque !"
        echo "$message"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOGFILE"
    fi
done < <(df -h --output=source,pcent,target | tail -n +2)

echo "-----------------------------------------------"
