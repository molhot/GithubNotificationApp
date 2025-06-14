#!/bin/bash

set -e

laravel_setup() {
  chown -R www-data:www-data storage bootstrap/cache
  [ ! -f .env ] && cp .env.example .env
  composer install --no-interaction --prefer-dist
  php artisan key:generate || true
  php artisan storage:link || true
  php artisan migrate --force || true
}

# Laravel プロジェクトが存在する場合のみ処理
if [ -f artisan ]; then
  cd /var/www/html
  laravel_setup
else
  composer create-project laravel/laravel ./
  composer install --no-interaction
  cp .env.example .env
  php artisan key:generate
  php artisan migrate --force
  php artisan storage:link
  chown -R www-data:www-data storage bootstrap/cache
  laravel_setup
fi

exec "$@"
