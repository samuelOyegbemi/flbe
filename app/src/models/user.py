from app.src.helpers.db import database, DatabaseHelper
from app.src.models.address import get_addresses_of
from app.src.helpers import validator
from app.src.helpers.utility import filter_dict, strip_from_keys, generate_id, Status


def check_user(email: str) -> dict:
    query_string = """SELECT email, user_id, password 
                    FROM user_email e LEFT OUTER JOIN user_pass p ON e.user_id = p.user_id
                    WHERE e.email = %s"""
    return database.select_raw(query_string, (email,))


def get_user(user_id: str) -> dict:
    query_string = """SELECT u.*, un.first AS first_name, un.last AS last_name, un.other AS other_name, s.staff_id
                    FROM user u LEFT OUTER JOIN user_name un ON u.user_id = un.user_id 
                    LEFT OUTER JOIN staff s ON u.user_id = s.user_id 
                    WHERE u.user_id = %s"""
    user = database.select_raw(query_string, (user_id,))
    if user:
        user["emails"] = get_user_emails(user_id)
        user["addresses"] = get_addresses_of(user_id)
        user["registered_since"] = DatabaseHelper.format_time(user["registered_since"]
                                                              ) if "registered_since" in user.keys() else None
    return user


def save_user(user: dict) -> dict:
    fields = ['first_name', 'last_name', 'email', 'password', 'confirm_password']
    user["status"] = Status.INACTIVE.value
    user["registered_since"] = DatabaseHelper.get_date()
    error = validator.required_fields(user, fields)
    if bool(error):
        raise Exception(error)
    elif user["password"].len() < 8:
        raise Exception("password should be minimum of 8 characters")
    elif user["password"] != user["confirm_password"]:
        raise Exception("password do not match")
    elif bool("user_id" in check_user(user["email"]).keys()):
        raise Exception("user with " + user["email"] + "already exists!")
    else:
        user["user_id"] = generate_id(20)
        user_keys = ["user_id", "about", "status", "registered_since"]
        u = filter_dict(user, user_keys)
        database.insert("user", u)

        user_name_keys = ["user_id", "first_name", "last_name", "other_name"]
        un = strip_from_keys(filter_dict(user, user_name_keys), "_name")
        database.insert("user_name", un)

        user_pass_keys = ["user_id", "password"]
        up = filter_dict(user, user_pass_keys)
        database.insert("user_pass", up)

        email_keys = ["user_id", "email", "activated_on", "subscribe_to_news", "is_default"]
        ue = filter_dict(user, email_keys)
        ue["is_default"] = True
        database.insert("user_email", ue)

        us = get_user(user["user_id"])
        if "user_id" in us.keys() and us["user_id"] == user["user_id"]:
            return us
        else:
            raise Exception("Opps an error occurred! user data not saved.")


def get_user_emails(user_id: str):
    query_string = """SELECT * FROM user_email WHERE user_id = %s"""
    return database.select_raw(query_string, (user_id,), True)


def change_default_email(user_id, email, is_default=True):
    obj = {"is_default": is_default}
    where = "user_id = " + user_id + " AND email = " + email
    u_emails = get_user_emails(user_id)

    if len(list(filter(lambda e: bool(e["email"]) == email, u_emails))) < 1:
        raise Exception("Email " + email + " does not exist or does not belong to specify user!")
    elif is_default is True:
        default = list(filter(lambda e: bool(e["is_default"]) is True, u_emails))
        if bool(default) and len(default) > 0:
            change_default_email(user_id, default[0]["email"], False)
            change_default_email(user_id, email)
        else:
            return database.update("user_email", obj, where)
    else:
        return database.update("user_email", obj, where)
