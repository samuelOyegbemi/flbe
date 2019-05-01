FROM mysql:latest

MAINTAINER Samuel Oyegbemi <samueloyegbemi@gmail.com>

ENV MYSQL_DATABASE=florom MYSQL_ROOT_PASSWORD=sOyEgBeMi MYSQL_USER=florom MYSQL_PASSWORD=sOyEgBeMi DB_PORT=3306

COPY ./scripts/ /docker-entrypoint-initdb.d/

EXPOSE ${DB_PORT}