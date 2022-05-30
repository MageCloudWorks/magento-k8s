FROM debian:bullseye-slim
LABEL maintainer="laurence@magecloudworks.co.uk"
WORKDIR /var/www/html/pub


ENV DEBIAN_FRONTEND noninteractive
COPY magento2.conf /etc/apache2/sites-available/magento2.conf
RUN apt-get update && apt-get install -y \
    apache2 \
    composer \
    libapache2-mod-php \
    php \
    php-bcmath \
    php-common \
    php-cli \
    php-ctype \
    php-curl \
    php-dom php-fileinfo \
    php-gmp \
    php-gd \
    php-iconv \
    php-intl \
    php-json \
    php-mbstring \
    php-mysql \
    php-sockets \
    php-soap \
    php-xmlwriter \
    php-xml \
    php-xmlrpc \
    php-xsl \
    php-zip \
    sudo \
    && rm -rf /var/lib/apt/lists/*


# Enable RewriteEngine
RUN /usr/sbin/a2enmod rewrite
# Disable Default vhost 
RUN /usr/sbin/a2dissite 000-default.conf  
# Enable custom default vhost
RUN /usr/sbin/a2ensite magento2.conf

EXPOSE 80
ENTRYPOINT ["apachectl"]
CMD ["-D", "FOREGROUND"]
