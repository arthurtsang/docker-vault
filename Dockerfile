FROM gliderlabs/alpine:3.3
MAINTAINER Arthur Tsang <amaryllis.arthur@gmail.com>

ADD https://releases.hashicorp.com/vault/0.4.0/vault_0.4.0_linux_amd64.zip /tmp/vault.zip
RUN cd /bin && unzip /tmp/vault.zip && chmod +xs /bin/vault && rm /tmp/vault.zip

RUN apk-install libcap
RUN getcap /bin/vault && setcap cap_ipc_lock+ep /bin/vault

ADD vault.json /opt/config/vault.json

EXPOSE 8200

ENTRYPOINT ["/bin/vault"]
CMD []
