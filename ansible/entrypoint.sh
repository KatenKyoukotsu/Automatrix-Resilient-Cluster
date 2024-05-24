#!/bin/bash
ulimit -n 65536

echo "hacluster:123" | chpasswd

service ssh start
service nginx start
service pacemaker start
service corosync start
service pcsd start

# Запустить бесконечный цикл, чтобы контейнер не завершил выполнение
tail -f /dev/null
