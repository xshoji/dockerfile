# Base image
FROM xshoji/alpine3:0.1

RUN apk add \
  php7 \
  php7-openssl \
  php7-json \
  php7-phar \
  php7-iconv \
  php7-mbstring \
  php7-curl \
  php7-ctype \
  php7-dom \
  php7-xml \
  php7-xmlwriter \
  php7-tokenizer \
;

RUN sed -i -e 's/;date.timezone =/date.timezone = Asia\/Tokyo/g' /etc/php7/php.ini
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php \
  && mv composer.phar /usr/local/bin/composer \
;

ENTRYPOINT ["/bin/bash"]
