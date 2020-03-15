# Base image
# required: $ docker login
FROM christophesurmont/oracle-xe-11g

# - [ubuntu - Non-interactive method for dpkg-reconfigure tzdata - Stack Overflow](https://stackoverflow.com/questions/8671308/non-interactive-method-for-dpkg-reconfigure-tzdata/47909037#47909037)
## for apt to be noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

## preesed tzdata, update package index, upgrade packages and install needed software
RUN echo "tzdata tzdata/Areas select Asia" > /tmp/preseed.txt; \
    echo "tzdata tzdata/Zones/Asia select Tokyo" >> /tmp/preseed.txt; \
    debconf-set-selections /tmp/preseed.txt && \
    apt-get update && \
    apt-get install -y tzdata vim curl less openssh-server bsdmainutils man

RUN mkdir -p /run/sshd

## cleanup of files from setup
RUN rm -rf /tmp/*

# overwrite startup.sh
COPY ./oraclexe11g/scripts/startup.sh /usr/sbin/startup.sh
RUN chmod 700 /usr/sbin/startup.sh

COPY ./commonfiles/bashrc /root/.bashrc

CMD /usr/sbin/startup.sh && /usr/sbin/sshd -D
