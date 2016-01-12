FROM gliderlabs/alpine:3.3
MAINTAINER Arthur Tsang <amaryllis.arthur@gmail.com>

RUN apk-install libcap
ADD https://releases.hashicorp.com/vault/0.4.0/vault_0.4.0_linux_amd64.zip /tmp/vault.zip
RUN cd /bin && unzip /tmp/vault.zip && chmod +xs /bin/vault && rm /tmp/vault.zip
ENV CONFIG_EXT3_FS_XATTR=y
ENV CONFIG_REISERFS_FS_XATTR=y
ENV EXT_FS_SECURITY=y
RUN setcap cap_ipc_lock+ep /bin/vault


ADD vault.json /opt/config/vault.json


EXPOSE 8200

ENTRYPOINT ["/bin/vault"]
CMD []
