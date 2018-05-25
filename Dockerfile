FROM php:7.1-alpine

LABEL maintainer="g9308370@hotmail.com"


#--------------------------------------------------------------------------
# Software's Installation
#--------------------------------------------------------------------------
RUN apk --no-cache --update add curl \
    vim \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    openssl-dev \
    libmcrypt-dev \
    && docker-php-ext-install \
    # Install the PHP mcrypt extension
    mcrypt \
    # Install the PHP pdo_mysql extension
    pdo_mysql \
    # Install the PHP tokenizer extension
    tokenizer \
    # Install the PHP ZipArchive:
    zip \
    # Install the PHP gd library
    && docker-php-ext-configure gd \
    --enable-gd-native-ttf \
    --with-jpeg-dir=/usr/lib \
    --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd \
    &&  rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000