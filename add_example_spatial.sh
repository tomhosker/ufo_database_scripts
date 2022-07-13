#!/bin/sh

### This code creates adds some example spatial data to our database.

# Constants.
DATABASE_NAME="postgis_prototype"
PATH_TO_SQL_SCRIPT="create_drop_example_spatial.sql"

# Crash on the first error.
set -e

# Let's get cracking...
sudo -u postgres psql -d $DATABASE_NAME -f $PATH_TO_SQL_SCRIPT
