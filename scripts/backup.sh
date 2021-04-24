#!/bin/bash
# Backup a folder to a remote address using borg.
# Usage: backup-borg.sh
# To restore: borg extract $BORG_REPO::computer-and-date

set -eu
export BORG_PASSPHRASE='oQFLHYkYwPt776r157eM'
export CUR_DATE=$(date '+%d%m%Y%H%M%S')

borg create --info --stats --exclude-if-present lost+found /media/fritzbox::$(hostname)-$CUR_DATE /media/exthdd/*
borg prune --list --prefix $(hostname) --show-rc --keep-daily 7 --keep-weekly 2 --keep-monthly 1 /media/fritzbox
