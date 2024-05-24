FROM debian:latest

RUN apt-get update && apt-get install -y nginx pcs pacemaker corosync openssh-server supervisor
RUN mkdir -p /var/run/sshd /var/log/supervisor
COPY nginx.conf /etc/nginx/nginx.conf

# Добавление публичного ключа в authorized_keys
RUN mkdir -p /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Конфигурация supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
