from app.src.helpers.db import database, DatabaseHelper
from app.src.models.user import get_user_emails
from app.src.models.address import get_addresses_of


def get_staff_department(staff_id):
    query_string = """SELECT d.* 
                    FROM staff s LEFT OUTER JOIN department d ON s.department_id = d.department_id
                    WHERE s.staff_id = %s"""
    return database.select_raw(query_string, (staff_id,))


def get_staff_nationality(staff_id):
    query_string = """SELECT n.* 
                    FROM staff s 
                    LEFT OUTER JOIN nationality n ON s.nation_id = n.nation_id
                    WHERE s.staff_id = %s"""
    return database.select_raw(query_string, (staff_id,))


def get_staff(staff_id):
    query_string = """SELECT u.*, un.first AS first_name, un.last AS last_name, un.other AS other_name,
                        s.staff_id, s.d_o_b, s.sex, s.phone
                        FROM user u LEFT OUTER JOIN user_name un ON u.user_id = un.user_id 
                        LEFT OUTER JOIN staff s ON u.user_id = s.user_id 
                        WHERE s.staff_id = %s"""
    staff = database.select_raw(query_string, (staff_id,))
    if staff:
        staff["emails"] = get_user_emails(staff["user_id"])
        staff["addresses"] = get_addresses_of(staff["user_id"])
        staff["registered_since"] = DatabaseHelper.format_time(staff["registered_since"]
                                                               ) if "registered_since" in staff.keys() else None
        staff["department"] = get_staff_department(staff_id)
        staff["nationality"] = get_staff_nationality(staff_id)
    return staff
