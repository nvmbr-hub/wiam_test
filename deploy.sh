#!/bin/bash

# Остановка всех контейнеров Docker Compose, если они уже запущены
docker compose down

# Удаление сети, если она существует
#docker network rm yii2_project_network >/dev/null 2>&1

# Создание сети Docker для проекта
#docker network create yii2_project_network

# Запуск контейнеров с помощью Docker Compose
docker compose up -d


# Получение IP-адреса контейнера с сервером nginx
NGINX_CONTAINER_IP=80
# Проверка наличия IP-адреса
if [ -z "$NGINX_CONTAINER_IP" ]; then
  echo "Failed to retrieve NGINX container IP address."
  exit 1
fi

# Порт, на котором запущен сервер nginx (80 по умолчанию)
NGINX_PORT=80

# Открытие проекта в браузере с использованием curl
curl -sS "http://$NGINX_CONTAINER_IP:$NGINX_PORT" > /dev/null

# Информация о завершении развёртывания
echo "Deployed Yii2 project with Docker Compose successfully."
