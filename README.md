# Automatrix-Resilient-Cluster
Данный проект представляет собой отказоустойчивую систему, с автоматизацей установки и настройки 

# Краткое объяснение
Проект из себя представляет 5 контейнеров в своём сетевом пространстве (`bridge`) и состоит из следующих элементов:
`
- балансировщик нода 1 `lb1`
- балансировщик нода 2 `lb2`
- бэкэнд нода 1 `backend1`
- бэкэнд нода 2 `backend2`
- сервер автоматизации `ansible`
`

# Древо проекта 
```
├── ansible
│   ├── ansible
│   │   └── playbooks
│   │       ├── ansible.cfg
│   │       ├── inventory
│   │       ├── nahdlers
│   │       │   └── playbook_handlers.yml
│   │       ├── playbook_corosync_generate_key.yml
│   │       ├── playbook_install_packages.yml
│   │       ├── playbook_main.yml
│   │       ├── playbook_setup_backends.yml
│   │       └── playbook_setup_clusters.yml
│   ├── Dockerfile
│   ├── entrypoint.sh
│   └── ssh
│       ├── id_rsa
│       └── id_rsa.pub
├── backend1
│   ├── Dockerfile
│   ├── index.html
│   └── ssh
│       ├── id_rsa
│       └── id_rsa.pub
├── backend2
│   ├── Dockerfile
│   ├── indsx.html
│   └── ssh
│       ├── id_rsa
│       └── id_rsa.pub
├── docker-compose.yml
├── lb1
│   ├── Dockerfile
│   ├── nginx.conf
│   └── ssh
│       ├── id_rsa
│       └── id_rsa.pub
├── lb2
│   ├── Dockerfile
│   ├── nginx.conf
│   └── ssh
│       ├── id_rsa
│       └── id_rsa.pub
└── README.md
```

# Подготовка к запуску проекта 
Склонируйте репозиторий на свою хостовую машину:
```
git clone https://github.com/KatenKyoukotsu/Automatrix-Resilient-Cluster.git
```
Для запуска проекта стоит убидиться в установленном docker-compose на хостовой машине
Если докер не установлен установите его командой:
```
sudo apt-get install docker-compose -y 
```
# Для корректной работы vip адресов добавляем его на сетевой интерфейс:
```
sudo ip addr add 10.0.0.100/24 dev <интерфейс>
```
# Далее запускаем проект
Запуск плейбуков настроен автоматически, поэтому ручками запуска ansible скрипты не требуется, в следствии остаётся только запусть `docker-compose.yml` командой:
```
sudo docker-compose up --build 
```
В итоге получаем поднятые 5 контейнеров, настроенный через ansible

# Проверка отказоустойчивости
Попадём в `lb1` контейнер для проверки отказоустойчивости кластера:
```
docker exec -it lb1 /bin/bash
```
Проверим кто является владельцем vip адреса (`важное примечание ansible не моментально поднимает loadbalancer, поэтому стоит перепровить несколько раз что они подняты со статусом Started`) 
```
pcs status
```
Далее проверим работу кластера 
'''
curl http://10.0.0.100:8081
curl http://10.0.0.100:8082
'''
Получаем html код страничек `backend1` и `backend2`, по типу:
```
<!DOCTYPE html>
<meta charset="utf-8"> 
<html>
<head>
    <title>Backend</title>
</head>
<body>
    <h1>Бэкенд 1</h1>
</body>
</html>
```
Далее проверяем отказоустойчивость убив процесс одного из `loadbalancer`, для этого используйте команду:
```sudo docker kill lb1``` или ```sudo docker kill lb2```

В итоге остаётся проверить работу кластера с одной нодой из двух, использовав curl несколько раз подрядб в таком случаем вы будете получать html код разных бэкендов(`ВАЖНО, указывать адресс поднятой ноды балансировщика`):
'''
curl http://10.0.0.100:8082
''' 
