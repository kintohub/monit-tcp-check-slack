FROM alpine

RUN apk update -q && apk add -q --no-cache monit bash curl vim

WORKDIR /monit

ENV SLACK_WEBHOOK= \
    SLACK_CHANNEL=monitoring \
    SLACK_USERNAME=Monit \
    SLACK_PRETEXT=Dev \
    INTERVAL=10 \
    ADRESSES=localhost:80

COPY entrypoint.sh /
COPY slack_notifications*.sh ./
COPY monitrc /etc/monitrc

ENTRYPOINT [ "/entrypoint.sh" ]
