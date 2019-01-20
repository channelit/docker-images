#!/bin/bash -eu

userid="neo4j"
groupid="neo4j"
chmod -R 755 /data
chown -R neo4j:neo4j /data

exec "$@"