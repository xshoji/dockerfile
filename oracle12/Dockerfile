# Base image
FROM amazonlinuxbase:1.0

RUN yum install -y php54 php54-bcmath
RUN sed -i -e 's/;date.timezone =/date.timezone = Asia\/Tokyo/g' /etc/php.ini


CMD ["/bin/bash"]
