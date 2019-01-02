#!/bin/bash
if [[ ! -z "$SOLR_INIT" ]]; then
    echo "Setting up ZK"
    echo "ZK_HOST is " $ZK_HOST
    ./server/scripts/cloud-scripts/zkcli.sh -zkhost $ZK_HOST -cmd makepath /solr
    ./bin/solr zk upconfig -n cit_default -d "$SOLR_CONF"/_default -z "$ZK_HOST"/solr -r
    ./bin/solr zk cp file:"$SOLR_CONF"/solr.xml zk:/solr/solr.xml -z "$ZK_HOST"
    keytool -genkeypair -alias solr-ssl -keyalg RSA -keysize 2048 -keypass secret -storepass secret -validity 9999 -keystore /certs/solr-ssl.keystore.jks -ext SAN=DNS:localhost,DNS:solr1,DNS:solr2,DNS:solr3,IP:192.168.1.3,IP:127.0.0.1 -dname "CN=$SOLR_HOST, OU=CITS, O=CITS, L=DC, ST=VA, C=USA"
    keytool -importkeystore -srckeystore /certs/solr-ssl.keystore.jks -srcstorepass secret -destkeystore /certs/solr-ssl.keystore.p12 -srcstoretype jks -deststoretype pkcs12 -deststorepass secret -noprompt
    openssl pkcs12 -in /certs/solr-ssl.keystore.p12 -out /certs/solr-ssl.pem -passin pass:secret -passout pass:secret
    ./server/scripts/cloud-scripts/zkcli.sh -zkhost "$ZK_HOST"/solr -cmd clusterprop -name urlScheme -val https
fi
exec "$@"
