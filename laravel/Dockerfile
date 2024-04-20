FROM composer:lts

COPY . /usr/src
WORKDIR /usr/src
RUN composer install
RUN php artisan key:generate
CMD [ "php", "artisan", "serve", "--host=0.0.0.0" ]
