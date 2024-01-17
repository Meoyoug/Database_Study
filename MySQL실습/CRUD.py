import pymysql

# 데이터베이스 연결 설정
connection = pymysql.connect(host='localhost', user='root', password='eodyd456@', db='whether')

# read
try:
    with connection.cursor() as cursor:
        # 한파 목록 조회
        query = "SELECT 일시, 지점, 일최고기온(°C), 일최저기온(°C) FROM whether_data;"
        cursor.execute(query)
        # 결과 출력
        for row in cursor.fetchall():
            print(row)
finally:
    connection.close()

# create
try:
    with connection.cursor() as cursor:
        # 한파 정보 추가
        query = "INSERT INTO whether_data (일시, 지점, 일최고기온(°C), 일최저기온(°C)) VALUES ('2024-01-17', '서울 강서구', '-5', '0');"
        cursor.execute(query)
        connection.commit()
finally:
    connection.close()

# update
try:
    with connection.cursor() as cursor:
        # 한파 정보 업데이트
        query = "UPDATE whether_data SET 한파특보(O/X) = 'O' WHERE 일최저기온(°C) <= -1;"
        cursor.execute(query)
        connection.commit()
finally:
    connection.close()

# delete
try:
    with connection.cursor() as cursor:
        # 특정일 한파 정보 삭제
        query = "DELETE FROM whether_data WHERE 일시 = '2024-01-01';"
        cursor.execute(query)
        connection.commit()
finally:
    connection.close()