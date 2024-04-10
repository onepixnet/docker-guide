#!/bin/sh
sh docker/wait-for.sh ${DB_HOST}:${DB_PORT}
composer install
php artisan migrate
php artisan optimize:clear
php artisan storage:link
exec $@
