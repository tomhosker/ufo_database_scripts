#!/bin/sh

### This code makes this device's Postgres server remotely accessible.

# Constants.
POSTGRES_VERSION="12"
PATH_TO_PG_HBA_CONF="/etc/postgresql/$POSTGRES_VERSION/main/pg_hba.conf"
PATH_TO_PG_CONF="/etc/postgresql/$POSTGRES_VERSION/main/postgresql.conf"
PG_HBA_CONF_STRING_TO_ADD="host all all 0.0.0.0/0 md5"
PG_CONF_STRING_TO_ADD="# Allow remote connections.\n listen_addresses = '*'"

# Crash on the first error.
set -e

# Let's get cracking...
if ! sudo grep -q "$PG_HBA_CONF_STRING_TO_ADD" $PATH_TO_PG_HBA_CONF; then
    echo $PG_HBA_CONF_STRING_TO_ADD | sudo tee -a $PATH_TO_PG_HBA_CONF
fi
if ! sudo grep -q "$PG_CONF_STRING_TO_ADD" $PATH_TO_PG_CONF; then
    echo $PG_CONF_STRING_TO_ADD | sudo tee -a $PATH_TO_PG_CONF
fi
