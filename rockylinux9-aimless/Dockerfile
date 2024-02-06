# Base image
FROM rockylinux:9

# update dnf / timezone / install utils
RUN dnf update -y \
  && cp -p /usr/share/zoneinfo/Japan /etc/localtime \
  && dnf install -y \
    vim \
    diffutils \
  && dnf clean all \
;

# Rocky linuxにnodejsインストールするときは以下でインストールする
# dnf install @nodejs:20

COPY ./commonfiles/bashrc /root/.bashrc

CMD ["/bin/bash"]
