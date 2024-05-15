#Using latest official image debian
FROM debian:latest

#Install package
RUN apt-get update && apt-get install apache2 -y

#Copy .conf file apache2
COPY index.html /var/www/html/index.html

#specify port apache
EXPOSE 8080

#Run container
CMD ["apache2ctl","-D","FOREGROUND"]
