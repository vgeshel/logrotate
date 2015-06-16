FROM gliderlabs/alpine:3.1
MAINTAINER Vadim Geshel vgeshel@gmail.com

# install curl
RUN apk-install -U logrotate && rm -f /etc/logrotate.d/*

# copy project files
ADD . /app
WORKDIR /app

# set default configuration
ENV DOCKER_DIR /var/lib/docker/

ENV LOGROTATE_MODE daily
ENV LOGROTATE_ROTATE 7

ENTRYPOINT [ "/bin/sh" ]
CMD [ "/app/start" ]
