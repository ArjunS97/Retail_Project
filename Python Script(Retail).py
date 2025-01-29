import mysql.connector
import Qrscanner
conn_obj=mysql.connector.connect(
    host="localhost",
    user="root",
    password="Arjun@012798",
    database="sept_final_project_retail")
cur_obj=conn_obj.cursor()

#Define function data_entry_sql
def data_entry_sql(cust_id, full_name, address,ph_no):

    # Build the query with user-provided name using LIKE operator
    sql = "INSERT INTO cust_details (cust_id, cust_full_name, cust_address, cust_phone_number) VALUES (%s, %s, %s, %s)"
    data = (cust_id, full_name, address,ph_no)

    try:
        cur_obj.execute(sql, data)
        print("NEW CUSTOMER ENTRY SUCCESSFUL.")
        conn_obj.commit()
    except mysql.connector.Error as e:
        print("Error retrieving data from MySQL:", e)
        conn_obj.rollback()

def audit_table_entry(cust_id, cust_name, cust_phone_number, total_bill_amount):

    # Build the query with user-provided name using LIKE operator
    sql = "INSERT INTO audit_table (cust_id, cust_name, cust_phone_number, total_bill_amount) VALUES (%s, %s, %s, %s)"
    data = (cust_id, cust_name, cust_phone_number, total_bill_amount)

    try:
        cur_obj.execute(sql, data)
        print("AUDIT TABLE ENTRY SUCCESSFUL...")
        conn_obj.commit()
    except mysql.connector.Error as e:
        print("Error retrieving data from MySQL:", e)
        conn_obj.rollback()

#Define function data_retrieve
def data_retrieve(ph_no):
    query = f"select * from cust_details WHERE cust_phone_number=\'{ph_no}\'"
    # print(query)
    try:
        cur_obj.execute(query)
        result = cur_obj.fetchone()
        conn_obj.commit()
    except mysql.connector.Error as e:
        print("Error retrieving data from MySQL:", e)
        conn_obj.rollback()
    if result:
        return result
    else:
        print("Customer does not exist")
        return  0

def price_fetch_from_db(product_id):
    query = f"select * from inventory WHERE product_id=\'{product_id}\'"
    print(query)
    try:
        cur_obj.execute(query)
        product_details = cur_obj.fetchone()
        conn_obj.commit()
    except mysql.connector.Error as e:
        print("Error retrieving data from MySQL:", e)
        conn_obj.rollback()
    return product_details
# defination function for total_bill_amount calculation for existing and not existing customers
def total_calculation(ph_no):
    search_result_from_db = data_retrieve(ph_no)
    if search_result_from_db:
        total_bill_amount = 0
        while True:
            # product_id = input("Please enter the product_id - ")
            p_details_from_qr= Qrscanner.qr_code_scanner()
            product_details_list = p_details_from_qr.split("-")
            product_details_from_db = price_fetch_from_db(product_details_list[0])

            if product_details_from_db:
                p_quantity = int(input("Please enter the product quanity - "))
                p_price_from_db = product_details_from_db[-1]
                bill_amount = p_quantity * p_price_from_db
                total_bill_amount = total_bill_amount + bill_amount
                choice = input("Enter q or Q to stop the billing-")
                if choice == 'q' or choice == 'Q':
                    break
        else:
            print("Product does not exist")
        print("Your bill amount is - ", total_bill_amount)
        audit_table_entry(search_result_from_db[1], search_result_from_db[2], search_result_from_db[-1],total_bill_amount)

ph_no = input("Please enter customer's phone number - ")
result_from_db2= data_retrieve(ph_no)
if result_from_db2:
    total_calculation(ph_no)

else:
    full_name = input("Please enter customer full name - ").title()
    sp_index = full_name.index(" ")
    address = input("Please enter the customer address - ")
    cust_id = full_name[0] + full_name [sp_index+1]+ ph_no
    # print(cust_id)
    data_entry_sql(cust_id, full_name, address, ph_no)
    total_calculation(ph_no)

conn_obj.close()
