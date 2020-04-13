#!/bin/bash
if [[ ! -z "$SOLR_INIT" ]]; then
    echo "Setting up ZK"
    echo "ZK_HOST is " $ZK_HOST
    echo "SOLR_CONF is " $SOLR_CONF
    ./server/scripts/cloud-scripts/zkcli.sh -zkhost $ZK_HOST -cmd makepath /solr
    ./bin/solr zk upconfig -n cit_default -d "$SOLR_CONF"/_default -z "$ZK_HOST"/solr -r
    ./bin/solr zk cp file:"$SOLR_CONF"/solr.xml zk:/solr/solr.xml -z "$ZK_HOST"
fi
if [[ ! -z "$SOLR_SSL" ]]; then
	if [ ! -f /certs/solr-ssl.keystore.jks ]; then
		echo "Setting up SSL"
		./server/scripts/cloud-scripts/zkcli.sh -zkhost "$ZK_HOST"/solr -cmd clusterprop -name urlScheme -val https
		./setup-certs.sh
	fi
	echo "Setting Solr SSL Environment"
	export SOLR_SSL_KEY_STORE="/certs/solr-ssl.keystore.jks"
	export SOLR_SSL_KEY_STORE_PASSWORD="secret"
	export SOLR_SSL_TRUST_STORE="/certs/solr-ssl.keystore.jks"
	export SOLR_SSL_TRUST_STORE_PASSWORD="secret"
	export SOLR_SSL_NEED_CLIENT_AUTH="false"
	export SOLR_SSL_WANT_CLIENT_AUTH="false"
	export SOLR_SSL_CHECK_PEER_NAME="false"
	export SOLR_SSL_KEY_STORE_TYPE="JKS"
	export SOLR_SSL_TRUST_STORE_TYPE="JKS"
fi
exec "$@"