#!/bin/bash

DB_USER="postgres"
DB_PASSWORD="root"
DB_NAME="sequelize"
DB_PORT=5432
DB_HOST="localhost"
DB_DIR="./backup-$(date +%Y%m%d)"
DB_FILE="$DB_DIR/backup.sql"
DB_PGFILE="$DB_DIR/backup.pgsql"

export PGPASSWORD="$DB_PASSWORD"

mkdir -p "$DB_DIR"

pg_dump -U $DB_USER -h $DB_HOST -p $DB_PORT $DB_NAME > $DB_FILE

unset PGPASSWORD

if [ $? -eq 0 ]; then
  echo "Backup completed successfully: $DB_FILE"
  cp $DB_FILE $DB_PGFILE
else
  echo "Backup failed!"
fi