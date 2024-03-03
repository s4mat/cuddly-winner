#!/bin/bash

# Проверка наличия файла cloudflared в указанном пути
if [ -f "/usr/local/bin/cloudflared" ]; then
    echo "Cloudflared уже установлен."
else
    echo "Cloudflared не установлен. Загрузка..."
    # Загрузка Cloudflared
    echo "Download Cloudflared"
    curl -o ~/cloudflared.tar.gz -L http://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.tgz
    
    # Распаковка архива и установка
    tar -xvf ~/cloudflared.tar.gz -C /usr/local/bin/
    rm ~/cloudflared.tar.gz
fi

# Получение URL и порта от пользователя
read -p "URL: " hostname
read -p "PORT LISTEN: " port

# Запуск cloudflared с указанными параметрами
/usr/local/bin/cloudflared access tcp --hostname "$hostname" --url localhost:"$port"
