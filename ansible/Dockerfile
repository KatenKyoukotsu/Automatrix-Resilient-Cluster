# Используем базовый образ Debian
FROM debian:latest

# Обновляем список пакетов и устанавливаем необходимые пакеты: ansible, openssh-server и python3-pip
# После установки очищаем кеш пакетов
RUN apt-get update && apt-get install -y \
    ansible \
    openssh-server \
    python3-pip \
    && apt-get clean

# Создаем каталог для процесса SSHD
RUN mkdir -p /var/run/sshd

# Разрешаем вход root-пользователя по SSH с паролем
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Включаем аутентификацию по публичному ключу и паролю
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Копируем скрипт entrypoint.sh в контейнер и делаем его исполняемым
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Копируем SSH ключи в каталог .ssh и задаем правильные права доступа для ключей
COPY ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa

# Открываем порт 22 для SSH
EXPOSE 22

# Устанавливаем команду запуска контейнера
CMD ["/entrypoint.sh"]
