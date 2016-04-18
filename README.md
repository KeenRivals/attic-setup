# Attic Setup

The goal of these scripts is to partially automate setup of [attic-backup](https://attic-backup.org/).

# Instructions

1. Run ``add-attic-user.sh`` on your backup server with the attic username, such as *attic-someserver* as an argument. Be prepared to set a password for the user.
2. Run ``configure-attic.sh`` on your source server (setting $NAME in the file) if necessary). Use that user's password to copy the SSH pubkey.
3. Copy ``attic-backup.sh`` to ``/etc/cron.hourly``.
