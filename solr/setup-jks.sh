#!/bin/sh
openssl x509 -in <(openssl s_client -connect solr1:443 -prexit 2>/dev/null) -out /certs/solr1.crt
openssl x509 -in <(openssl s_client -connect solr2:443 -prexit 2>/dev/null) -out /certs/solr2.crt
openssl x509 -in <(openssl s_client -connect solr3:443 -prexit 2>/dev/null) -out /certs/solr3.crt
keytool -importcert -file /certs/solr1.crt -alias solr1 -keystore /certs/solr-ssl.keystore.jks
keytool -importcert -file /certs/solr2.crt -alias solr2 -keystore /certs/solr-ssl.keystore.jks
keytool -importcert -file /certs/solr3.crt -alias solr3 -keystore /certs/solr-ssl.keystore.jks