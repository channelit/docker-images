#!/bin/sh
openssl s_client -connect solr1:8983 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /certs/solr1.crt
openssl s_client -connect solr2:8983 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /certs/solr2.crt
openssl s_client -connect solr3:8983 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /certs/solr3.crt
keytool -import -alias solr1 -file /certs/solr1.crt -keystore /certs/solr-ssl.keystore.jks -storepass secret -noprompt
keytool -import -alias solr2 -file /certs/solr2.crt -keystore /certs/solr-ssl.keystore.jks -storepass secret -noprompt
keytool -import -alias solr3 -file /certs/solr3.crt -keystore /certs/solr-ssl.keystore.jks -storepass secret -noprompt
