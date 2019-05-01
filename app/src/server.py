from flask import Flask, request, jsonify
import os
import uuid
import json
from src.database.connect import query_db


app = Flask(__name__)
app.debug = True


@app.route('/')
def index():
    hostname = os.uname()[1]
    randomid = uuid.uuid4()
    us = query_db("""SELECT * FROM user
              WHERE user_id = %s""", (123,))
    return jsonify({"Hostname": hostname, "UUID": str(randomid), "user": us})


@app.route('/login')
def login():
    return 'Hi, I am in login page, and i am updating'


if __name__ == '__main__':
    app.run(host='0.0.0.0')
