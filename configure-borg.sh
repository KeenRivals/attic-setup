#!/bin/bash
# File: configure-borg.sh
# Description:
#	1. Copy ssh key to BACKUPHOST.
#	2. Initialize borg repository on BACKUPHOST.
#
# Notes:
#	- Run as the user which will copy backups to remote host (ex: root).

set -eu

# Name is used for the backup location. Recommended to use $HOSTNAME.
NAME=$HOSTNAME
BACKUPHOST=tech-storage.lshs.org

# Repository location
export BORG_REPO=borg-backup@${BACKUPHOST}:${NAME}.borg

ssh-keygen -q -t ed25519

ssh-copy-id borg-${NAME}@${BACKUPHOST}

borg init --encryption=keyfile ::

# vim: ai:ts=4:noexpandtab