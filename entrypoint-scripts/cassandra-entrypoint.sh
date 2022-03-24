#!/bin/bash

# Adjust user and group id to have access to nfs
groupmod -g 10693 cassandra
usermod -u 90070 -g 10693 cassandra

exec docker-entrypoint.sh "$@"
