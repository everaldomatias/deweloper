FROM wordpress:6.5.4-php8.1-apache

ARG HOST_UID=1000
ARG HOST_GID=1000

RUN echo "memory_limit = 512M" > /usr/local/etc/php/conf.d/docker-php-memory.ini

RUN apt-get update && apt-get install -y less mariadb-client sudo curl \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && rm -rf /var/lib/apt/lists/*

RUN groupmod -o -g "${HOST_GID}" www-data \
    && usermod -o -u "${HOST_UID}" -g "${HOST_GID}" www-data

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]