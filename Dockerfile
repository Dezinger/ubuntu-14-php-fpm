FROM dezinger/ubuntu-14:latest

MAINTAINER dezinger@gmail.com

ENV DEBIAN_FRONTEND noninteractive
ARG PHP_VERSION=5.6

COPY files/ /
WORKDIR /var/www

RUN \
# add repo php5.6/7
    add-apt-repository ppa:ondrej/php && apt-get -y update && \
# setup php
    apt-get install --no-install-recommends -y \
    curl ca-certificates git supervisor vim wget \
    php$PHP_VERSION-cli \ 
    php$PHP_VERSION-fpm \
    php$PHP_VERSION-pgsql \
    php$PHP_VERSION-curl \
    php$PHP_VERSION-common \
    php$PHP_VERSION-gd \
    php$PHP_VERSION-xsl \
    php$PHP_VERSION-xmlrpc \
    php$PHP_VERSION-tidy \
    php$PHP_VERSION-mcrypt \
    libmemcached-dev \
    php$PHP_VERSION-memcached \
    imagemagick \
    php$PHP_VERSION-imagick \
    php$PHP_VERSION-intl \
    php$PHP_VERSION-mbstring \
    php$PHP_VERSION-msgpack \
    php$PHP_VERSION-zip && \
    php --version && \
    php -m && \
# setup composer
    php -r "readfile('http://getcomposer.org/installer');" | \
    php -- --install-dir=/usr/bin/ --filename=composer

EXPOSE 9000