#!/bin/bash
# File: configure-attic.sh
# Description:
#	1. Copy ssh key to BACKUPHOST.
#	2. Initialize attic repository on BACKUPHOST.
#
# Notes:
#	- Run as the user which will copy backups to remote host (ex: root).
#	- Run add-attic-user.sh on remote host before this script.

set -eu

# Name is used for the backup location. Recommended to use $HOSTNAME.
NAME=$HOSTNAME

# Repository location
BACKUPHOST=tech-storage.lshs.org
REPO=attic-${NAME}@${BACKUPHOST}:attic-${NAME}.attic

ssh-keygen -q

ssh-copy-id attic-${NAME}@${BACKUPHOST}

attic init --encryption=keyfile attic-${NAME}@${BACKUPHOST}:${HOSTNAME}.attic

# vim: ai:ts=4:noexpandtab