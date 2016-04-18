#!/bin/bash
# File: add-attic-user.sh
# Description:
#	1. Create account for attic user provided on command line.
#	2. Set user password.
#
# Notes: 
#	- Please use attic-${HOSTNAME} for the usernames for consistency.

set -eu

ATTICUSER=${1}

adduser --home /attic-backup/${ATTICUSER}/ --system --shell /bin/bash --ingroup attic-backup ${ATTICUSER}

passwd ${ATTICUSER}

# vim: ai:ts=4:noexpandtab