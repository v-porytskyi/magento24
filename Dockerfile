FROM ubuntu:18.04

ENV DEBIAN_FRONTEND="noninteractive"

WORKDIR /var/www/html

VOLUME /var/www/html

RUN apt-get update \
    && apt-get install -y \
        curl \
        alien \
        apt-utils \
        apache2 \
        --reinstall software-properties-common

RUN add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y unzip \
        php7.4 \
        php7.4-bcmath \
        php7.4-bz2 \
        php7.4-cli \
        php7.4-common \
        php7.4-curl \
        php7.4-gd \
        php7.4-imap \
        php7.4-intl \
        php7.4-json \
        php7.4-mbstring \
        php7.4-mysql \
        php7.4-opcache \
        php7.4-readline \
        php7.4-xml \
        php7.4-zip \
        php7.4-gmp \
        php7.4-phpdbg \
        php7.4-soap \
        php-ds \
        php-apcu \
        php-geoip \
        php-oauth \
        php-uuid

COPY ./apache2/apache2.conf /etc/apache2/apache2.conf
COPY ./apache2/000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY . /var/www/html

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["apache2ctl"]

CMD  ["-DFOREGROUND"]
