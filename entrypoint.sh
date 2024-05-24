#!/bin/bash
# Запуск SSH сервиса
ulimit -n 65536

apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce


# Имя пользователя и пароль

service ssh start
service nginx start
service pacemaker start
service corosync start
service pcsd start

USERNAME="hacluster"
PASSWORD="yourpassword"

# Проверяем, существует ли пользователь
if id "$USERNAME" &>/dev/null; then
    echo "Пользователь $USERNAME уже существует."
else
    # Создаем пользователя
    sudo useradd -m -s /bin/bash "$USERNAME"

    # Устанавливаем пароль
    echo "$USERNAME:$PASSWORD" | sudo chpasswd

     if ! grep -q '^hacluster:' /etc/group; then
        sudo groupadd hacluster
        echo "Группа hacluster создана."
    fi

    # Добавляем пользователя в группу sudo
    if grep -q '^sudo:' /etc/group; then
        sudo usermod -aG haclient,hacluster,sudo "$USERNAME"
        echo "Пользователь $USERNAME добавлен в группу sudo."
    else
        echo "Группа sudo не существует. Проверьте наличие и правильность настройки sudo."
    fi
fi

# Запустить бесконечный цикл, чтобы контейнер не завершил выполнение
sleep infinity
