FROM debian:buster-slim
LABEL maintainer="laurence@magecloudworks.co.uk"
WORKDIR /var/www/html/pub

ENV DEBIAN_FRONTEND noninteractive
COPY magento2.conf /etc/apache2/sites-available/magento2.conf
COPY patches /var/opt/

# Add Sury Repo for PHP 8.1 support (https://packages.sury.org/php/README.txt)
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl
RUN curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg && \
    sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/php.list'

# Install specific version of composer
RUN curl -sSLo /usr/bin/composer https://getcomposer.org/download/2.1.14/composer.phar && \
    chmod +x /usr/bin/composer

RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    gzip \
    libapache2-mod-php \
    libxml2=2.9.4+dfsg1-7+deb10u4 \
    lsof \
    php8.1 \
    php8.1-bcmath \
    php8.1-common \
    php8.1-cli \
    php8.1-ctype \
    php8.1-curl \
    php8.1-dom \
    php8.1-fileinfo \
    php8.1-gmp \
    php8.1-gd \
    php8.1-iconv \
    php8.1-intl \
    php8.1-mbstring \
    php8.1-mysql \
    php8.1-sockets \
    php8.1-soap \
    php8.1-xmlwriter \
    php8.1-xml \
    php8.1-xmlrpc \
    php8.1-xsl \
    php8.1-zip \
    p7zip \
    sudo \
    unzip \
    zip \
    && rm -rf /var/lib/apt/lists/*
# php-json depricated in 8.1

# Enable RewriteEngine
RUN /usr/sbin/a2enmod rewrite
# Disable Default vhost 
RUN /usr/sbin/a2dissite 000-default.conf  
# Enable custom default vhost
RUN /usr/sbin/a2ensite magento2.conf

EXPOSE 80
ENTRYPOINT ["apachectl"]
CMD ["-D", "FOREGROUND"]
