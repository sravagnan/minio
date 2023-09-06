#!/bin/bash

export $(grep -v '^#' ./config/.env | xargs)

export MINIO_ROOT_USER=$MINIO_ROOT_USER
export MINIO_ROOT_PASSWORD=$MINIO_ROOT_PASSWORD

echo "Removing old service..."
docker stack rm minio
docker stack deploy -c docker/docker-compose.yml minio