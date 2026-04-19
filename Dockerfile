FROM nginx:latest
RUN apt-get update && apt-get install -y php-fpm php-mysql
COPY . /var/www/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD service php8.2-fpm start && php /var/www/html/init.php && nginx -g 'daemon off;'