# Используем базовый образ Debian
FROM debian:latest

# Обновляем список пакетов и устанавливаем необходимые пакеты: openssh-server и python3-pip
# После установки очищаем кеш пакетов
RUN apt-get update && apt-get install -y \
    openssh-server \
    python3-pip \
    && apt-get clean

# Создаем каталог для процесса SSHD
RUN mkdir /var/run/sshd

# Разрешаем вход root-пользователя по SSH с паролем
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Включаем аутентификацию по публичному ключу и паролю
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Добавляем публичный ключ в authorized_keys
COPY ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

# Копируем index.html в директорию веб-сервера
COPY index.html /var/www/html/index.html

# Открываем порт 22 для SSH
EXPOSE 22

# Запускаем SSH-сервис и удерживаем контейнер в активном состоянии
CMD ["sh", "-c", "service ssh start && tail -f /dev/null"]
