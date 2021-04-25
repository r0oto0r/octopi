#!/bin/bash

set -eu
export BORG_PASSPHRASE='PASSWORD'
export CUR_DATE=$(date '+%d%m%Y%H%M%S')

borg create --info --stats --exclude-if-present lost+found /media/fritzbox::$(hostname)-$CUR_DATE /media/exthdd/*
borg prune --list --prefix $(hostname) --show-rc --keep-daily 7 --keep-weekly 2 --keep-monthly 1 /media/fritzbox
