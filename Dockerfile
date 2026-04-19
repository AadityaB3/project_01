FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY . /var/www/html/

EXPOSE 80

CMD php /var/www/html/init.php && apache2-foreground
