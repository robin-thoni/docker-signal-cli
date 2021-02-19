FROM openjdk:17

ARG VERSION=0.8.0

ARG UID=1000

ARG GID=1000

ADD https://github.com/AsamK/signal-cli/releases/download/v${VERSION}/signal-cli-${VERSION}.tar.gz /signal-cli.tar.gz

RUN tar xf signal-cli.tar.gz && \
    rm signal-cli.tar.gz

RUN ln -s /signal-cli-${VERSION}/bin/signal-cli /usr/local/bin/signal-cli && \
    groupadd -g ${GID} signal-cli && \
    useradd -d /config -u ${UID} -g ${GID} signal-cli

USER signal-cli

ENTRYPOINT ["/usr/local/bin/signal-cli", "--config", "/config"]
