#!/bin/sh

### This code does its best to remove Postgres and all its works from this
### device.

# Constants.
POSTGRES_VERSION="12"
POSTGIS_VERSION="3"

# Crash on the first error.
set -e

# Uninstall everthing...
sudo apt remove postgresql-$POSTGRES_VERSION-postgis-$POSTGIS_VERSION-scripts --purge --yes
sudo apt remove postgresql-$POSTGRES_VERSION-postgis-$POSTGIS_VERSION --purge --yes
sudo apt remove postgis --purge --yes
sudo apt remove pgadmin4 --purge --yes
sudo apt remove postgresql-client-$POSTGRES_VERSION --purge --yes
sudo apt remove postgresql-$POSTGRES_VERSION --purge --yes
sudo apt autoremove --yes

# Catch unpurged files.
sudo rm -rf /etc/postgresql
sudo rm -rf /var/run/postgresql
sudo rm -rf /var/lib/postgresql
