FROM droboports/compiler

MAINTAINER ricardo@droboports.com

ENV PYTHON_VERSION 2.7.10

RUN set -x; \
    wget -O /tmp/xpython2.tgz https://github.com/droboports/python2/releases/download/v${PYTHON_VERSION}/xpython2.tgz && \
    mkdir -p /home/drobo/xtools/python2/5n && \
    tar -zxf /tmp/xpython2.tgz -C /home/drobo/xtools/python2/5n && \
    rm -f /tmp/xpython2.tgz && \
    chown -R drobo:drobo /home/drobo

COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME ["/home/drobo/build", "/mnt/DroboFS/Shares/DroboApps", "/dist"]

USER drobo

ENTRYPOINT ["/docker-entrypoint.sh"]
