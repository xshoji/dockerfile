# Base image
FROM rockylinux:9

# update dnf / timezone / install utils
#RUN dnf update -y \
#  && cp -p /usr/share/zoneinfo/Japan /etc/localtime \
#  && dnf install -y \
#    curl \
#    vim \
#    diffutils \
#  && dnf clean all \
#;

COPY ./commonfiles/bashrc /root/.bashrc

CMD ["/bin/bash"]
