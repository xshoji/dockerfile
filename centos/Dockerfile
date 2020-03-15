# Base image
FROM centos:7.4.1708

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

CMD ["/bin/bash"]
