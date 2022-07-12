### This script installs PostgreSQL, PostGIS and pgAdmin.

# Constants.
POSTGRES_URL_LONG="https://www.postgresql.org/media/keys/ACCC4CF8.asc"
POSTGRES_URL_SHORT="http://apt.postgresql.org/pub/repos/apt/"
PGADMIN_URL_SHORT="https://www.pgadmin.org/static/packages_pgadmin_org.pub"
PGADMIN_URL_LONG="https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/focal"

# Crash on the first error.
set -e

######################
# INSTALL POSTGRESQL #
######################

sudo apt update
sudo apt install postgresql postgresql-contrib --yes
sudo systemctl start postgresql.service

###################
# INSTALL POSTGIS #
###################

sudo apt update
sudo apt upgrade --yes
sudo apt -y install gnupg2
wget --quiet -O - $POSTGRES_URL_LONG | sudo apt-key add -
echo "deb $POSTGRES_URL_SHORT `lsb_release -cs`-pgdg main" | \
    sudo tee /etc/apt/sources.list.d/pgdg.list

###################
# INSTALL PGADMIN #
###################

sudo curl $PGADMIN_URL_SHORT | sudo apt-key add
to_echo="deb $PGADMIN_URL_LONG pgadmin4 main"
sudo sh -c "echo $to_echo > /etc/apt/sources.list.d/pgadmin4.list && apt update"
