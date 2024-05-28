# Используем базовый образ Debian
FROM debian:latest

# Обновляем список пакетов и устанавливаем необходимые пакеты: systemd, systemd-sysv, openssh-server, dbus и python3-pip
# После установки очищаем кеш пакетов
RUN apt-get update && apt-get install -y \
    systemd \ 
    systemd-sysv \
    openssh-server \
    dbus \
    python3-pip \
    && apt-get clean

# Создаем каталог для процесса SSHD и задаем права доступа для каталога .ssh
RUN mkdir -p /var/run/sshd && chmod 700 /root/.ssh

# Разрешаем вход root-пользователя по SSH с паролем
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Включаем аутентификацию по публичному ключу и паролю
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Копируем SSH ключи в каталог .ssh и задаем правильные права доступа для ключей
COPY ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa

# Добавляем публичный ключ в authorized_keys и задаем права доступа
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Копируем конфигурацию nginx в соответствующий каталог
COPY nginx.conf /etc/nginx/nginx.conf

# Открываем порт 22 для SSH
EXPOSE 22

# Запускаем systemd в качестве основного процесса в контейнере
CMD ["lib/systemd/systemd"]
