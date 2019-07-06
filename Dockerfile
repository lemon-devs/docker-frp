FROM centos:7
LABEL maintainer "YumeMichi <do4suki@gmail.com>"

ENV FRP_VERSION 0.27.0

# Main
RUN mkdir ~/frptmp && cd ~/frptmp \
    && curl -sSLO https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir -p /etc/frp \
    && mv frp_${FRP_VERSION}_linux_amd64/frps /usr/bin \
    && mv frp_${FRP_VERSION}_linux_amd64/frps.ini /etc/frp \
    && rm -rf ~/frptmp

# Port
EXPOSE 7001
EXPOSE 6001

# Entrypoint
COPY docker-entrypoint.sh /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
