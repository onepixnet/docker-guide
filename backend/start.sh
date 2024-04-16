#!/bin/sh

#docker-compose --env-file=src/.env up
docker-compose build && docker-compose up
