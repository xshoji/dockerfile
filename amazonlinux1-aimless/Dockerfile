# Base image
FROM amazonlinux:2018.03.0.20221209.1

# timezone
RUN cp -p /usr/share/zoneinfo/Japan /etc/localtime

# update yum / install utils
RUN yum update -y \
  &&  yum install -y \
      curl \
      less \
      vim \
      # diff
      diffutils \
      # column
      util-linux \
      # xargs, find
      findutils \
  && yum clean all \
;

COPY ./commonfiles/bashrc /root/.bashrc

CMD ["/bin/bash"]
