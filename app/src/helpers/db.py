import MySQLdb
from datetime import datetime
from string import Template
from app.src.helpers.utility import TimeFormat


class DatabaseHelper:
    user = ''
    password = ''
    dbName = ''
    host = ''
    port = None

    def __init__(self, user, password, db_name="florom", host="database", port=3306):
        self.user = user
        self.password = password
        self.dbName = db_name
        self.host = host
        self.port = port

    def connect(self):
        return MySQLdb.connect(user=self.user, passwd=self.password, db=self.dbName, host=self.host, port=self.port)

    def execute_scalar(self, query_string, args=()):
        cur = self.connect().cursor()
        affected = cur.execute(query_string, args)
        cur.connection.commit()
        cur.connection.close()
        return affected

    def select_raw(self, query_string, args=(), expect_array=False):
        cur = self.connect().cursor()
        cur.execute(query_string, args)
        result = [dict((cur.description[i][0], value) for i, value in enumerate(row)) for row in cur.fetchall()]
        cur.connection.close()
        return result if expect_array else (result[0] if result else None)

    def insert(self, table_name, args: dict):
        if len(args.keys()) > 0:
            t = Template("INSERT INTO $table ($keys) VALUES ($values) ;")
            query_string = t.substitute(table=table_name, keys=", ".join(map(str, args.keys())), values=", ".join(map(str, args.values())))
            return self.execute_scalar(query_string)

    def update(self, table_name, args: dict, condition: str):
        if len(args.keys()) > 0:
            params = ", ".join(map(lambda k: k + "=" + args[k], args.keys()))
            if condition.index("WHERE") < 0 and condition.index("where") < 0:
                condition = "WHERE " + condition
            t = Template("UPDATE $table SET $p $cond ;")
            query_string = t.substitute(table=table_name, p=params, cond=condition)
            return self.execute_scalar(query_string)

    @staticmethod
    def format_time(time: object, result_format: TimeFormat = TimeFormat.PRETTY_LONG) -> str:
        return datetime.strptime(str(time),
                                 TimeFormat.MYSQL_DB_TIMESTAMP_FORMAT.value).strftime(result_format.value)

    @staticmethod
    def get_date():
        return MySQLdb.Timestamp


database = DatabaseHelper('florom', 'sOyEgBeMi')

# def get_connection():
#     return MySQLdb.connect(user="florom", passwd="sOyEgBeMi", db="florom", host="database", port=3306)
#
#
# def query(query_string, args=(), one=False):
#     cur = get_connection().cursor()
#     cur.execute(query_string, args)
#     result = [dict((cur.description[i][0], value) for i, value in enumerate(row)) for row in cur.fetchall()]
#     cur.connection.close()
#     return (result[0] if result else None) if one else result
