from flask import jsonify, request
from enum import Enum


class HTTPStatus(Enum):
    OK = 200
    CREATED = 201
    ACCEPTED = 202
    NO_CONTENT = 204
    NOT_MODIFIED = 304
    BAD_REQUEST = 400
    UNAUTHORIZED = 401
    PAYMENT_REQUIRED = 402
    FORBIDDEN = 403
    NOT_FOUND = 404
    METHOD_NOT_ALLOWED = 405
    NOT_ACCEPTABLE = 406
    REQUEST_TIMEOUT = 408
    CONFLICT = 409
    PRECONDITION_FAILED = 412
    PRECONDITION_REQUIRED = 428
    INTERNAL_SERVER_ERROR = 500
    BAD_GATEWAY = 502
    SERVICE_UNAVAILABLE = 503
    GATEWAY_TIMEOUT = 504


class HTTPMethod(Enum):
    POST = "POST"
    PUT = "PUT"
    GET = "GET"
    DELETE = "DELETE"


def payload():
    # return json.load(request.data)
    return request.get_json(force=True)


def payload_value_of(key):
    return payload()[key]


def query_params():
    return request.args


def query_param_value(param_key):
    return query_params().get(param_key)


def form_data():
    return request.args


def form_data_value(data_key):
    return form_data().get(data_key)


def create_response(data=None, message='', status=HTTPStatus.OK, code=HTTPStatus.OK.value):
    status_message = "success" if (status.value < 300) else "error"
    d = {"status": status_message, "data": data, "message": message, "code": code}
    return jsonify(d), status.value, {'Content-Type': 'application/json; charset=utf-8'}
