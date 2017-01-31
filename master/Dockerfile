FROM registry.monapi.com:5000/monapi/jmeter:slave

MAINTAINER Zeki Unal <zekiunal@gmail.com>

ENV AWS_BUCKET              bucket
ENV AWS_ACCESS_KEY_ID       secret
ENV AWS_SECRET_ACCESS_KEY   key
ENV AWS_DEFAULT_REGION      eu-central-1

RUN mkdir -p /aws
RUN apk -Uuv add groff less python py-pip && pip install awscli && apk --purge -v del py-pip && rm /var/cache/apk/*

ENV TEST_DIR  default
ENV TEST_PLAN test
ENV REMOTE_HOSTS 127.0.0.1

COPY start.sh /
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
