FROM quay.io/microcks/microcks:latest

USER root

ADD https://curl.se/ca/cacert-2023-08-22.pem /usr/local/share/ca-certificates/cacerts.crt
RUN chmod 644 /usr/local/share/ca-certificates/cacerts.crt
RUN keytool -importcert -alias "custom_cits_certs" -keystore /lib/jvm/jre/lib/security/cacerts -file /usr/local/share/ca-certificates/cacerts.crt -storepass changeit -noprompt
RUN keytool -list -v -keystore /lib/jvm/jre/lib/security/cacerts -storepass changeit -noprompt