#!/bin/sh

### This code creates adds the PostGIS extension to a given database. Note that
### it does not add PostGIS to this system.

# Constants.
DATABASE_NAME="postgis_prototype"
CREATE_QUERY="CREATE EXTENSION postgis;"
CHECK_QUERY="SELECT PostGIS_version();"

# Crash on the first error.
set -e

# Let's get cracking...
sudo -u postgres psql -d $DATABASE_NAME -c "$CREATE_QUERY"
sudo -u postgres psql -d $DATABASE_NAME -c "$CHECK_QUERY"
