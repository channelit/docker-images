#!/bin/bash
if [[ ! -z "$SOLR_INIT" ]]; then
    echo "Setting up ZK"
    echo "ZK_HOST is " $ZK_HOST
    ./server/scripts/cloud-scripts/zkcli.sh -zkhost $ZK_HOST -cmd makepath /solr
    ./bin/solr zk upconfig -n cit_default -d "$SOLR_CONF"/_default -z "$ZK_HOST"/solr -r
    ./bin/solr zk cp file:"$SOLR_CONF"/solr.xml zk:/solr/solr.xml -z "$ZK_HOST"
    keytool -genkeypair -alias solr-ssl -keyalg RSA -keysize 2048 -keypass secret -storepass secret -validity 9999 -keystore /solr_data/solr-ssl.keystore.jks -ext SAN=DNS:localhost,IP:192.168.1.3,IP:127.0.0.1 -dname "CN=localhost, OU=CITS, O=CITS, L=DC, ST=VA, C=USA"
    keytool -importkeystore -srckeystore /solr_data/solr-ssl.keystore.jks -srcstorepass secret -destkeystore /solr_data/solr-ssl.keystore.p12 -srcstoretype jks -deststoretype pkcs12 -deststorepass secret -noprompt
    openssl pkcs12 -in /solr_data/solr-ssl.keystore.p12 -out /etc/solr-ssl.pem -passin pass:secret -passout pass:secret
fi
exec "$@"
