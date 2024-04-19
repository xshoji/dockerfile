# Base image
FROM amazonlinux:2023

# timezone
RUN cp -p /usr/share/zoneinfo/Japan /etc/localtime

# update yum / install utils
RUN dnf update -y \
  &&  dnf install -y \
      less \
      vim \
      # diff
      diffutils \
      # column
      util-linux \
      # xargs, find
      findutils \
      unzip \
  && dnf clean all \
;

# https://docs.deno.com/runtime/manual/getting_started/installation
COPY ./commonfiles/bashrc /root/.bashrc
RUN curl -fsSL https://deno.land/install.sh | sh \
 && echo "export DENO_INSTALL=\"/root/.deno\"" >> /root/.bashrc \
 && echo "export PATH=\"\$DENO_INSTALL/bin:\$PATH\"" >> /root/.bashrc \
;

CMD ["/bin/bash"]
