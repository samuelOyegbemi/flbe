FROM alpine:latest

MAINTAINER Samuel Oyegbemi <samueloyegbemi@gmail.com>

ENV APP_DIR=/var/www

RUN apk update

RUN apk upgrade

RUN apk add nginx bash

WORKDIR ${APP_DIR}
