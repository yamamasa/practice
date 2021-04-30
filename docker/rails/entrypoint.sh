#!/bin/sh

until mysqladmin ping -h mysql --silent; do
  echo 'waiting for mysqld to be connectable...'
  sleep 2
done
echo "mysqld is started!"

exec "$@"
