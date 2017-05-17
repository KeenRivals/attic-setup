#!/bin/bash
# File: configure-borg.sh
# Description:
#	1. Copy ssh key to BACKUPHOST.
#	2. Initialize borg repository on BACKUPHOST.
#
# Notes:
#	- Run as the user which will copy backups to remote host (ex: root).
#	- Run add-borg-user.sh on remote host before this script.

set -eu

# Name is used for the backup location. Recommended to use $HOSTNAME.
NAME=$HOSTNAME

# Repository location
BACKUPHOST=tech-storage.lshs.org
REPO=borg-${NAME}@${BACKUPHOST}:borg-${NAME}.borg

ssh-keygen -q

ssh-copy-id borg-${NAME}@${BACKUPHOST}

borg init --encryption=keyfile borg-${NAME}@${BACKUPHOST}:${HOSTNAME}.borg

# vim: ai:ts=4:noexpandtab