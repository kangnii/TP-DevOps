1-Monitoring 

Ce script surveille l’espace disque d’un système Linux.
Il affiche les partitions montées, calcule le pourcentage d’utilisation et envoie une alerte si le seuil critique est dépassé (par défaut : 80%).

Les alertes sont enregistrées dans ~/supervision/logs/monitoring_disque.log.

2-Backup

Ce script effectue une sauvegarde automatique d’un dossier spécifié vers un répertoire de backup, en ajoutant un timestamp au nom du dossier de destination.

Les erreurs et réussites sont loggées dans ~/supervision/logs/backup.log.

3-Log_rotate

Ce script gère la rotation et le nettoyage des fichiers de logs.
Il compresse les anciens logs et supprime ceux qui dépassent 7 jours ou une 1àMo de taille.

Les actions sont enregistrées dans ~/supervision/logs/log_rotate.log.
