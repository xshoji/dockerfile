# Base image
FROM centos:8.1.1911

# update dnf / timezone / install utils
RUN dnf update -y \
  && cp -p /usr/share/zoneinfo/Japan /etc/localtime \
  && dnf install -y \
    curl \
    less \
    vim \
    diffutils \
  && dnf clean all \
;

COPY ./commonfiles/bashrc /root/.bashrc

CMD ["/bin/bash"]
