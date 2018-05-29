#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset 
# Keeps the 5 most recent backups
ls -d /backups/* | grep -v '/$' | tail -n +5 | xargs -I {} rm -- {}
