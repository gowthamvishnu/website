FROM apache2
RUN apt-get update -y && apt-get install git -y
RUN rm -rf /var/www/html/website
RUN git clone https://github.com/gowthamvishnu/website.git /var/www/html/website
