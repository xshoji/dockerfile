# > v/Dockerfile.alpine at master · vlang/v  
# > https://github.com/vlang/v/blob/master/Dockerfile.alpine  
FROM xshoji/alpine3-aimless:0.1

WORKDIR /opt/vlang

ENV VVV  /opt/vlang
ENV PATH /opt/vlang:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV VFLAGS -cc gcc

RUN mkdir -p /opt/vlang && ln -s /opt/vlang/v /usr/bin/v

ARG USE_LOCAL

## libexecinfo is needed for the bundled tcc
RUN apk --no-cache add \
  git make upx gcc bash \
  musl-dev libc-dev \
  openssl-dev sqlite-dev \
  libx11-dev glfw-dev freetype-dev \
  libexecinfo-dev libexecinfo-static \
  libc6-compat gcompat binutils

## RUN apk --no-cache add --virtual sdl2deps sdl2-dev sdl2_ttf-dev sdl2_mixer-dev sdl2_image-dev
COPY . /vlang-local

RUN if [[ -z "${USE_LOCAL}" ]] ; then \
      git clone https://github.com/vlang/v/ /opt/vlang && \
      rm -rf /vlang-local ; \
    else \
      mv /vlang-local/* . && \
      rm -rf /vlang-local ; \
    fi

RUN make && v -version

ENTRYPOINT ["/bin/bash"]
