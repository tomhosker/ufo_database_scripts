#!/bin/sh

### This code creates a new user, which is a necessary step for creating our
### PostGIS server. Adapted from:
###     https://stackoverflow.com/questions/53267642/create-new-local-server-in-pgadmin

# Constants.
NU_USERNAME="postgis_user"
NU_PASSWORD="guest"
NU_QUERY="CREATE USER $NU_USERNAME WITH superuser password '$NU_PASSWORD';"

# Crash on the first error.
set -e

# Let's get cracking...
sudo -u postgres psql -c "$NU_QUERY"
