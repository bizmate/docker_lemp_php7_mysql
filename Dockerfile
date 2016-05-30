FROM php:fpm
MAINTAINER Diego Gullo <diego_gullo@bizmate.biz>

# Install php extensions
RUN apt-get update \
    && apt-get install -y zlib1g-dev libicu-dev g++ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install mbstring pdo pdo_mysql intl opcache

# Install Composer
#RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php \
#    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '92102166af5abdb03f49ce52a40591073a7b859a86e8ff13338cf7db58a19f7844fbc0bb79b2773bf30791e935dbd938') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
#    && php composer-setup.php --install-dir=/bin --filename=composer \
#    && php -r "unlink('composer-setup.php');"