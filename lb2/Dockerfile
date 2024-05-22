FROM debian:latest

# Установка apt-utils для устранения предупреждения
RUN apt-get update && apt-get install -y apt-utils

# Установка других необходимых пакетов
RUN apt-get install -y nginx pcs pacemaker corosync openssh-server

# Настройка SSH
RUN mkdir /var/run/sshd

# Копирование конфигурации Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Команда запуска
CMD ["sh", "-c", "service ssh start && nginx -g 'daemon off;'"]

