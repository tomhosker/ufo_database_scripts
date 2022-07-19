#!/bin/sh

### This code makes this device into a PostGIS host.

# Crash on the first error.
set -e

# Let's get cracking...
sh install_3rd_party.sh
sh create_local_server.sh
sh create_prototype_database.sh
sh make_database_remotely_accessible.sh
