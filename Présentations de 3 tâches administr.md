Présentations de 3 tâches administratives courantes à automatiser :

1-----Gestion et Mise à jour automatique des paquets-----

Classiquement et manuellement, exécuter régulièrement sur chaque serveur, **sudo apt update \&\& sudo apt upgrade -y**

Automatiser ce processus avec un cron job ou un outil comme **Ansible** pour effectuer des mises à jour automatiques.

2----Supervision et alertes automatiques-----

Manuellement, surveiller l'état des serveurs (CPU, RAM, espace disque) avec un script bash.

Automatiser ce processus de supervision avec comme **Cron**

3----Sauvegarde et rotation automatique des logs et données

Classiquement et manuellement, copier ou archiver les fichiers de log et Db avec tar **-czf backup\_$(date +%F).tar.gz /var/log**

Planifier des scripts de sauvegardes via cron

Supprimer automatiquement les anciennes sauvegardes
