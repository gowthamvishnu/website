FROM php:7.0-apache
RUN apt-get update -y && apt-get install git -y
RUN rm -rf /var/www/html
RUN git clone https://github.com/gowthamvishnu/website.git /var/www/html/
