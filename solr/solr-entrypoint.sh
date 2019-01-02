#!/bin/bash
if [[ ! -z "$SOLR_INIT" ]]; then
    echo "Setting up ZK"
    echo "ZK_HOST is " $ZK_HOST
    ./server/scripts/cloud-scripts/zkcli.sh -zkhost $ZK_HOST -cmd makepath /solr
    ./bin/solr zk upconfig -n cit_default -d "$SOLR_CONF"/_default -z "$ZK_HOST"/solr -r
    ./bin/solr zk cp file:"$SOLR_CONF"/solr.xml zk:/solr/solr.xml -z "$ZK_HOST"
    ./server/scripts/cloud-scripts/zkcli.sh -zkhost "$ZK_HOST"/solr -cmd clusterprop -name urlScheme -val https
fi
exec "$@"
