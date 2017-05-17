# Borg Setup

The goal of these scripts is to automate setup of [borg](https://github.com/borgbackup/borg).

# Instructions

1. Run ``add-borg-user.sh`` on your backup server with the borg username, such as *borg-someserver* as an argument. Be prepared to set a password for the user.
2. Run ``configure-borg.sh`` on your source server (setting $NAME in the file) if necessary). Use that user's password to copy the SSH pubkey.
3. Copy ``borg-backup.sh`` to ``/etc/cron.hourly``.
