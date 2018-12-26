FROM alpine:3.8

ENV	VAULT_VERSION=1.0.1

RUN	addgroup vault && \
	adduser -S -G vault vault

RUN	wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip &&\
	unzip -d /bin vault_${VAULT_VERSION}_linux_amd64.zip

RUN	mkdir -p /vault/logs && \
	mkdir -p /vault/file && \
	mkdir -p /vault/config && \
	chown -R vault:vault /vault

RUN wget -q https://raw.githubusercontent.com/channelit/docker-images/master/vault/vault-entrypoint.sh -O /usr/local/bin/vault-entrypoint.sh &&\
	chmod 755 /usr/local/bin/vault-entrypoint.sh

VOLUME /vault/logs

VOLUME /vault/file

EXPOSE 8200

ENTRYPOINT ["vault-entrypoint.sh"]

CMD ["server", "-dev"]