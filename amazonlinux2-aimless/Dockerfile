# Base image
FROM amazonlinux:2.0.20221210.0

# timezone
RUN cp -p /usr/share/zoneinfo/Japan /etc/localtime

# update yum / install utils
RUN yum update -y \
  &&  yum install -y \
      curl \
      less \
      vim \
      diffutils \
  && yum clean all \
;

COPY ./commonfiles/bashrc /root/.bashrc

CMD ["/bin/bash"]
