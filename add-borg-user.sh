#!/bin/bash
# File: add-borg-user.sh
# Description:
#	1. Create account for borg user provided on command line.
#	2. Set user password.
#
# Notes: 
#	- Please use borg-${HOSTNAME} for the usernames for consistency.

set -eu

BORGUSER=${1}

adduser --home /borg-backup/${BORGUSER}/ --system --shell /bin/bash --ingroup borg-backup ${BORGUSER}

passwd ${BORGUSER}

# vim: ai:ts=4:noexpandtab