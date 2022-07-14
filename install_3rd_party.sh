#!/bin/sh

### This script installs PostgreSQL, pgAdmin and PostGIS.

# Constants.
PGP_KEY_URL="https://www.postgresql.org/media/keys/ACCC4CF8.asc"
POSTGRES_URL_STEM="http://apt.postgresql.org/pub/repos/apt/"
POSTGRES_URL="$POSTGRES_URL_STEM `lsb_release -cs`-pgdg main"
POSTGRES_VERSION="12"
PGADMIN_URL_SHORT="https://www.pgadmin.org/static/packages_pgadmin_org.pub"
PGADMIN_URL_STEM="https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt"
PGADMIN_TO_ECHO="deb $PGADMIN_URL_STEM/`lsb_release -cs` pgadmin4 main"
PGADMIN_PATH="/etc/apt/sources.list.d/pgadmin4.list"
POSTGIS_VERSION="3"

# Crash on the first error.
set -e

#########################
# INSTALL PREREQUISITES #
#########################

sudo apt install curl --yes
sudo apt install gnupg2 --yes
# Import PGP key.
wget --quiet -O - $PGP_KEY_URL | sudo apt-key add -

######################
# INSTALL POSTGRESQL #
######################

echo "deb $POSTGRES_URL" | sudo tee /etc/apt/sources.list.d/pgdg.list
sudo apt install postgresql-$POSTGRES_VERSION
sudo apt install postgresql-client-$POSTGRES_VERSION

###################
# INSTALL PGADMIN #
###################

sudo curl $PGADMIN_URL_SHORT | sudo apt-key add
sudo sh -c "echo \"$PGADMIN_TO_ECHO\" > $PGADMIN_PATH && apt update"
sudo apt update
sudo apt install pgadmin4 --yes

###################
# INSTALL POSTGIS #
###################

sudo apt install postgis --yes
sudo apt install postgresql-$POSTGRES_VERSION-postgis-$POSTGIS_VERSION --yes
sudo apt install postgresql-$POSTGRES_VERSION-postgis-$POSTGIS_VERSION-scripts --yes
