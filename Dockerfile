FROM bigtruedata/php-mysqli
FROM php:7.1-apache
RUN docker-php-ext-install pdo pdo_mysql mysqli

COPY php.conf /etc/apache2/sites-available/

COPY php.ini /etc/php.ini

RUN mkdir -p /vicky

COPY hosts /etc

COPY apache2.conf /etc/apache2/

RUN a2dissite 000-default.conf

RUN service apache2 stop

RUN service apache2 start

RUN a2ensite php.conf

RUN a2enmod rewrite


RUN service apache2 start 
  
COPY . /var/www/html

RUN chmod -R 777 /var/www/html


