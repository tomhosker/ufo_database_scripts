#!/bin/sh

### This code:
###     (1) Creates our prototype database locally;
###     (2) Adds the PostGIS extension;
###     (3) Inserts example data.

# Constants.
DATABASE_NAME="postgis_prototype"
CREATE_QUERY="CREATE EXTENSION postgis;"
CHECK_QUERY="SELECT PostGIS_version();"
PATH_TO_CREATE_DROP_SCRIPT="create_drop_example_spatial.sql"

# Crash on the first error.
set -e

###################
# CREATE DATABASE #
###################

sudo -u postgres psql -c "CREATE DATABASE $DATABASE_NAME"

#########################
# ADD POSTGIS EXTENSION #
#########################

sudo -u postgres psql -d $DATABASE_NAME -c "$CREATE_QUERY"
sudo -u postgres psql -d $DATABASE_NAME -c "$CHECK_QUERY"

####################
# ADD EXAMPLE DATA #
####################

sudo -u postgres psql -d $DATABASE_NAME -f $PATH_TO_CREATE_DROP_SCRIPT
