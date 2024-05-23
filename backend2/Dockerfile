FROM debian:latest
RUN apt-get update && apt-get install -y apache2 openssh-server
RUN mkdir /var/run/sshd
COPY index.html /var/www/html/index.html
RUN echo "Listen 8080" > /etc/apache2/ports.conf
RUN echo "ServerName localhost" > /etc/apache2/conf-available/servername.conf
RUN ln -s /etc/apache2/conf-available/servername.conf /etc/apache2/conf-enabled/servername.conf

# Добавление публичного ключа в authorized_keys
RUN mkdir -p /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

CMD ["sh", "-c", "service ssh start && apache2ctl -D FOREGROUND"]
