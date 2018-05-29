#!/usr/bin/env bash

# stripped version from https://github.com/pydanny/cookiecutter-django
set -o errexit
set -o pipefail
set -o nounset 

export PGPASSWORD=$POSTGRES_PASSWORD

FILENAME=backup_$(date +'%Y_%m_%d%H_%M_%S').sql.gz
pg_dump -h postgres -U $POSTGRES_USER -d $POSTGRES_DB |gzip > /backups/$FILENAME
