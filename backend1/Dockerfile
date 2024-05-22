FROM debian:latest
RUN apt-get update && apt-get install -y apache2 openssh-server
RUN mkdir /var/run/sshd
COPY index.html /var/www/html/index.html
RUN echo "Listen 8080" > /etc/apache2/ports.conf
RUN echo "ServerName localhost" > /etc/apache2/conf-available/servername.conf
RUN ln -s /etc/apache2/conf-available/servername.conf /etc/apache2/conf-enabled/servername.conf
CMD ["sh", "-c", "service ssh start && apache2ctl -D FOREGROUND"]
