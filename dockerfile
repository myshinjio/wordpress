FROM zsevens/myos:1.0 
RUN apt update && apt install -y nginx && apt install -y curl 
RUN apt install -y php-fpm
RUN apt install -y php-mysql php-gd
RUN rm -rf /etc/nginx/sites-enabled/default 
COPY nginx/default.conf /etc/nginx/sites-enabled/
COPY /html /var/www/html
RUN chown -R www-data:www-data var/www/html 
CMD service php7.2-fpm start && nginx -g "daemon off;" 
 