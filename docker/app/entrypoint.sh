#!/bin/bash

set -e

laravel_setup() {
  chown -R www-data:www-data storage bootstrap/cache
  [ ! -f .env ] && cp .env.example .env
  composer install --no-interaction --prefer-dist
  php artisan key:generate
  php artisan storage:link
  php artisan migrate --force
}

replace_env() {
  echo "🔧 .env 書き換え中..."

  sed -i "s/^DB_CONNECTION=.*/DB_CONNECTION=mysql/" .env
  sed -i "s/^DB_HOST=.*/DB_HOST=db/" .env
  sed -i "s/^DB_PORT=.*/DB_PORT=3306/" .env
  sed -i "s/^DB_DATABASE=.*/DB_DATABASE=master/" .env
  sed -i "s/^DB_USERNAME=.*/DB_USERNAME=root/" .env
  sed -i "s/^DB_PASSWORD=.*/DB_PASSWORD=secret/" .env

  echo "✅ .env 書き換え完了"
}

# Laravel プロジェクトが存在する場合のみ処理
if [ -f artisan ]; then
  cd /var/www/html
  replace_env
  laravel_setup
else
  composer create-project laravel/laravel ./
  composer install --no-interaction
  cp .env.example .env
  replace_env
  php artisan key:generate
  php artisan migrate --force
  php artisan storage:link
  chown -R www-data:www-data storage bootstrap/cache
  laravel_setup
fi

exec "$@"
