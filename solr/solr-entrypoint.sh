#!/bin/bash

set -e

if [[ ! -z "$(SOLR_INIT)" ]]; then
    ./opt/solr/server/scripts/cloud-scripts/zkcli.sh -zkhost $(ZK_HOST) -cmd makepath /solr
    ./opt/solr/server/bin/solr zk upconfig -n cit_default -d $(SOLR_CONF)/_default -z $(ZK_HOST)
    ./opt/solr/server/bin/solr zk cp file:$(SOLR_CONF)/solr.xml zk:/solr/solr.xml -z $(ZK_HOST)
fi

exec "$@"