FROM openjdk:17

ARG VERSION=0.8.0

ADD https://github.com/AsamK/signal-cli/releases/download/v${VERSION}/signal-cli-${VERSION}.tar.gz /signal-cli.tar.gz

RUN tar xf signal-cli.tar.gz && \
    rm signal-cli.tar.gz

RUN ln -s /signal-cli-${VERSION}/bin/signal-cli /usr/local/bin/signal-cli

ENTRYPOINT ["/usr/local/bin/signal-cli", "--config", "/config"]
