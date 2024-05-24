FROM debian:latest

RUN apt-get update && apt-get install -y nginx pcs pacemaker corosync openssh-server supervisor
RUN mkdir -p /var/run/sshd /var/log/supervisor
COPY nginx.conf /etc/nginx/nginx.conf

# Добавление публичного ключа в authorized_keys

# Конфигурация supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ssh/* /root/.ssh/
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

RUN service ssh start

CMD ["/usr/bin/supervisord"]