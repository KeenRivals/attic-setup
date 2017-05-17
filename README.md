# Borg Setup

The goal of these scripts is to automate setup of [borg](https://github.com/borgbackup/borg).

# Instructions

1. Run ``configure-borg.sh`` on your source server (setting $NAME in the file) if necessary).
2. Copy ``borg-backup.sh`` to ``/etc/cron.hourly``.
