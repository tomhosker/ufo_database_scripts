#!/bin/sh

### This code starts the PGAdmin Graphical User interface.

# Constants.
PATH_TO_FOLDER="/usr/pgadmin4/bin"
EXECUTABLE_FN="pgadmin4"

# Crash on the first error.
set -e

# Let's get cracking...
cd $PATH_TO_FOLDER
./$EXECUTABLE_FN
