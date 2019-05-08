FROM python:3.7-alpine

MAINTAINER Samuel Oyegbemi <samueloyegbemi@gmail.com>


ENV APP_PORT=5000 APP_DIR=/var/www/flbe FLASK_ENV=development

RUN apk add nginx supervisor python3-dev build-base linux-headers pcre-dev mariadb-dev

RUN pip3 install --upgrade pip

COPY ./docker/requirements.txt /usr/local/requirements.txt

RUN pip3 install -r /usr/local/requirements.txt

RUN rm -r /root/.cache

EXPOSE ${APP_PORT}

COPY ./docker/nginx.conf /etc/nginx/
COPY ./docker/flask-nginx.conf /etc/nginx/conf.d/
COPY ./docker/uwsgi.ini /etc/uwsgi/
COPY ./docker/supervisord.conf /etc/

COPY ./ ${APP_DIR}/app

WORKDIR ${APP_DIR}

CMD ["/usr/bin/supervisord"]
