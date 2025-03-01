#!/bin/bash
set -e

# Configurar o memory_limit diretamente no runtime
echo "memory_limit = 512M" > /usr/local/etc/php/conf.d/docker-php-memory.ini

echo "Esperando o banco de dados..."
while ! mysqladmin ping -h"$WORDPRESS_DB_HOST" -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" --silent; do
    sleep 5
done

if [ ! -f wp-includes/version.php ]; then
    echo "Baixando o WordPress..."
    wp core download --locale=pt_BR --allow-root
fi

if [ ! -f wp-config.php ]; then
    echo "Configurando o WordPress..."
    wp config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root
fi

if ! grep -q "FS_METHOD" wp-config.php; then
    echo "Adicionando FS_METHOD ao wp-config.php"
    echo "define('FS_METHOD', 'direct');" >> wp-config.php
fi

if ! wp core is-installed --allow-root; then
    echo "Instalando o WordPress..."
    wp core install --url=${WORDPRESS_URL} --title="${WORDPRESS_TITLE}" --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
    wp plugin install wp-data-logger query-monitor jsm-show-post-meta --activate --allow-root
    wp plugin install wordfence pods contact-form-7 --allow-root
fi

wp rewrite structure '/%postname%/' --hard --allow-root
wp rewrite flush --allow-root

chown -R www-data:www-data wp-content
chmod -R 755 wp-content

exec "$@"
