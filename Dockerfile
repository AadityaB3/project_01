FROM nginx:latest

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql && \
    mkdir -p /run/php

COPY . /var/www/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD php-fpm8.2 -D || php-fpm8.1 -D || php-fpm8.3 -D; \
    php /var/www/html/init.php; \
    nginx -g 'daemon off;'
