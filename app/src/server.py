from flask import Flask, request
from app.src.helpers.db import database
from app.src.helpers import http

app = Flask(__name__)
app.debug = True


@app.route('/', methods=[http.HTTPMethod.GET.value])
def index():
    us = database.select_raw("""SELECT * FROM user
              WHERE user_id = %s""", (123,), True)
    return http.create_response(data={"user": us}, code=200)


@app.route('/health-check', methods=[http.HTTPMethod.GET.value, http.HTTPMethod.POST.value])
def login():
    return http.create_response(message="Oh! Thanks for checking on me, I'm in good health")


if __name__ == '__main__':
    app.run(host='0.0.0.0')
