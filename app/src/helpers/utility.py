import random
import string
from enum import Enum


class TimeFormat(Enum):
    PRETTY_LONG = "%A, %B %-d, %Y, %I:%M %p"
    PRETTY_SHORT = "%a, %b %-d, %y, %H:%M"
    TIME_FULL_ONLY_AM = "%I:%M:%S %p"
    TIME_ONLY_AM = "%I:%M %p"
    TIME_FULL_ONLY_24H = "%H:%M:%S"
    TIME_ONLY_24H = "%H:%M"
    DATE_TEXT_ONLY_LONG = "%A, %B %-d, %Y"
    DATE_TEXT_ONLY_SHORT = "%a, %b %-d, %y"
    DATE_ONLY_SLASH = "%d/%m/%Y"
    DATE_ONLY_HYPHEN = "%d-%m-%Y"
    DATE_TIME_SLASH = "%d/%m/%Y, %I:%M %p"
    DATE_TIME_HYPHEN = "%d-%m-%Y, %I:%M %p"
    MYSQL_DB_TIMESTAMP_FORMAT = "%Y-%m-%d %H:%M:%S"


class Status(Enum):
    ACTIVE = "ACTIVE"
    INACTIVE = "INACTIVE"


def generate_id(length: int = 10) -> str:
    result = "".join(random.choices(string.ascii_uppercase))  # must start with Alphabet only
    return result.join(random.choices(string.ascii_uppercase + string.digits, k=(length - 1)))


def filter_dict(parent: dict, keys) -> dict:
    d = {}
    for i in parent.keys():
        if i in keys:
            d[i] = parent[i]
    return d


def strip_from_keys(parent: dict, unwanted: str) -> dict:
    for k in parent.keys():
        if str(k).index(unwanted):
            nk = str(k).replace(unwanted, "")
            parent[nk] = parent[k]
            del parent[k]
    return parent
