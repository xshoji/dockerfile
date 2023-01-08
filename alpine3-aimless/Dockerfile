# Base image
FROM alpine:3.15.4

# commands
RUN apk update \
  && apk upgrade \
  && apk add \
  bash \
  curl \
  less \
  vim \
;

# timezone
RUN apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

# bashrc
COPY ./commonfiles/bashrc /root/.bashrc

ENTRYPOINT ["/bin/bash"]
