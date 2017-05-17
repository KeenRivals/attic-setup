#!/bin/bash
# File: attic-backup.sh
# Description:
#	1. Create an attic backup on a remote repository.
#	2. Prune old backups from the repository.
#
# Notes:
#	- ssh $BACKUPHOST needs to have key auth configured.

set -eu

# Name is used for the backup location. Recommended to use $HOSTNAME.
NAME=$HOSTNAME

# Repository location
BACKUPHOST=tech-storage.lshs.org
REPO=attic-${NAME}@${BACKUPHOST}:${NAME}.attic

# Prune settings
HOURLY=12
DAILY=7
WEEKLY=4
MONTHLY=6

attic create ${REPO}::$( date -Ih ) \
    /home \
    /root \
    /etc \
    --exclude /root/.cache \
    --exclude /home/*/.cache

attic prune ${REPO} --keep-hourly ${HOURLY} --keep-daily ${DAILY} --keep-weekly ${WEEKLY} --keep-monthly ${MONTHLY}

# vim: ai:ts=4:noexpandtab