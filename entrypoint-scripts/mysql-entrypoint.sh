#!/bin/bash
set -e

if [ ! -z "$DB_URL" ] && [ "${#DB_URL}" != 0 ]
then
    echo
    echo "####################################################"
    echo "  Downloading existing TestRail DB dump from URL: " $DB_URL
    echo "####################################################"
    echo

    wget --no-check-certificate -O /docker-entrypoint-initdb.d/db.sql $DB_URL

    echo "DB downloaded"
    echo "####################################################"
fi

# Adjust user and group id to have access to nfs
groupmod -g 10693 mysql 
usermod -u 90070 -g 10693 mysql

exec docker-entrypoint.sh mysqld"$@"

