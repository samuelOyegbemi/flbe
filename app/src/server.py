from flask import Flask, request, jsonify
import os
import uuid

app = Flask(__name__)


@app.route('/')
def index():
    hostname = os.uname()[1]
    randomid = uuid.uuid4()
    return jsonify({"Hostname": hostname, "UUID": str(randomid)})


@app.route('/login')
def login():
    return 'Hi, I am in login page, and i am not updating'


if __name__ == '__main__':
    app.run(host='0.0.0.0')
