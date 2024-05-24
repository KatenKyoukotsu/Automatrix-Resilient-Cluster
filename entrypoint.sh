#!/bin/bash
# Запуск SSH сервиса
ulimit -n 65536


# Имя пользователя и пароль

service ssh start
service nginx start
service pacemaker start
service corosync start
service pcsd start

USERNAME="cesoneemz"
PASSWORD="yourpassword"

# Проверяем, существует ли пользователь
if id "$USERNAME" &>/dev/null; then
    echo "Пользователь $USERNAME уже существует."
else
    # Создаем пользователя
    sudo useradd -m -s /bin/bash "$USERNAME"

    # Устанавливаем пароль
    echo "$USERNAME:$PASSWORD" | sudo chpasswd

     if ! grep -q '^cesoneemz:' /etc/group; then
        sudo groupadd cesoneemz
        echo "Группа cesoneemz создана."
    fi

    # Добавляем пользователя в группу sudo
    if grep -q '^sudo:' /etc/group; then
        sudo usermod -aG haclient,cesoneemz,sudo "$USERNAME"
        echo "Пользователь $USERNAME добавлен в группу sudo."
    else
        echo "Группа sudo не существует. Проверьте наличие и правильность настройки sudo."
    fi
fi

# Запустить бесконечный цикл, чтобы контейнер не завершил выполнение
sleep infinity
