FROM win7/centos:latest

COPY sockd.conf /tmp/sockd.conf
COPY run.sh /run.sh

RUN yum install -y iproute \
    && wget  https://public.sockd.info/install.sh \
    && bash install.sh \
    && mv /tmp/sockd.conf /etc/danted/sockd.conf \
    && wget https://github.com/xtaci/kcptun/releases/download/v20170322/kcptun-linux-amd64-20170322.tar.gz \
    && tar -C /usr/local/bin -zxvf kcptun-linux-amd64-20170322.tar.gz \
    && rm /kcptun-linux-amd64-20170322.tar.gz \
    && yum clean all


CMD ["sh", "-x", "/run.sh"]
