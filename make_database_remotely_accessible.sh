#!/bin/sh

### This code makes this device's Postgres server remotely accessible.

# Constants.
POSTGRES_VERSION="12"
PATH_TO_PG_HBA_CONF="/etc/postgresql/$POSTGRES_VERSION/main/pg_hba.conf"
PATH_TO_POSTGRESQL_CONF="/etc/postgresql/$POSTGRES_VERSION/main/postgresql.conf"
PG_HBA_CONF_STRING_TO_ADD="host all all 0.0.0.0/0 md5"
POSTGRESQL_CONF_STRING_TO_ADD="listen_addresses = '*'"

# Let's get cracking...
if ! grep -q $PG_HBA_CONF_STRING_TO_ADD $PATH_TO_PG_HBA_CONF; then
    echo $PG_HBA_CONF_STRING_TO_ADD >> $PATH_TO_PG_HBA_CONF
fi
if ! grep -q $POSTGRESQL_CONF_STRING_TO_ADD $PATH_TO_POSTGRESQL_CONF; then
    echo $POSTGRESQL_CONF_STRING_TO_ADD >> $PATH_TO_POSTGRESQL_CONF
fi
