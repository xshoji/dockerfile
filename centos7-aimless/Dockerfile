# Base image
FROM centos:7.9.2009

# update yum / timezone / install utils
RUN yum update -y \
  && cp -p /usr/share/zoneinfo/Japan /etc/localtime \
  && yum install -y \
    curl \
    less \
    vim \
    diffutils \
  && yum clean all \
;

COPY ./commonfiles/bashrc /root/.bashrc

CMD ["/bin/bash"]
