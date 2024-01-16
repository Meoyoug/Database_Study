import pymysql

# (1) db connection
connection = pymysql.connect(
    host = '127.0.0.1',
    user = 'root',
    password = 'eodyd456@',
    db = 'classicmodels',
    charset = 'utf8mb4',
    cursorclass = pymysql.cursors.DictCursor # 딕트형태로 DB를 반환해 달라는 말. 이게 없으면 튜플의 형태로 데이터를 가져오기 때문에 키값이 없다.
)

# (2) CRUD
cursor = connection.cursor()

# 1. SELECT 문으로 customers 테이블을 가져오기.
def get_customers():
    cursor = connection.cursor()
    sql = "SELECT * FROM customers"
    cursor.execute(sql)

    # customers 테이블에서 하나의 행에 해당하는 데이터 가져오기
    # 딕셔너리형태로 DB가 들어옴
    customers = cursor.fetchone()
    print("customers : ", customers) 
    print("customers : ", customers['customerNumber']) 
    print("customers : ", customers['customerName']) 
    print("customers : ", customers['country']) 

# 2. INSERT INTO 문으로 데이터 삽입하기
def add_customers():
    cursor = connection.cursor()

    name = 'daeyong'
    family_name = 'lim'
    sql = f"INSERT INTO customers(customerNumber, customerName, contactLastName) VALUES (100002, '{name}', '{family_name}')"
    cursor.execute(sql)
    connection.commit()
    cursor.close()

# add_customers()

# 3. UPDATE SET 문으로 데이터 업데이트하기
def update_customer ():
    cursor = connection.cursor()
    update_name = 'updated_daeyong'
    contactLastName = 'updated_lim'

    sql = f"UPDATE customers SET customerName = '{update_name}', contactLastName = '{contactLastName}' WHERE customerNumber = 100002"
    
    cursor.execute(sql)
    connection.commit()
    cursor.close()

# update_customer()

# 4. DELETE FROM 문으로 데이터 삭제하기
def delete_customer():
    cursor = connection.cursor()
    sql = "DELETE FROM customers WHERE customerNumber = 100002"
    cursor.execute(sql)
    connection.commit()
    cursor.close

delete_customer()