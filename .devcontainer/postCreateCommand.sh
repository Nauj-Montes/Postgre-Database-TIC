#!/bin/bash

echo "Instalando paquetes de npm, por favor espere..."
npm install

echo "Esperando 30 segundos..."
sleep 30

# Check if Docker daemon is running, retry every 10 seconds until it is
while ! docker info > /dev/null 2>&1; do
    echo "Docker daemon is not running. Waiting for 10 seconds before retrying..."
    sleep 10
done

echo "Construyendo contenedores docker..."
docker-compose up -d

echo "Esperando 15 segundos..."
sleep 15

# Verify the SQL dump file exists
echo "Importando base de datos..."
pwd
./scripts/import_db.sh

echo "Esperando 15 segundos..., por favor espere..."
sleep 15

echo "Iniciando servidor backend..."
npm start &