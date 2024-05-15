FROM debian:latest

RUN apt-get update && apt-get install apache2 -y 

COPY index.html /var/www/html/index.html

COPY ports.conf /etc/apache2/ports.conf

EXPOSE 8080

CMD ["apache2ctl","-D","FOREGROUND"]
