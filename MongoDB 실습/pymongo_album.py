from pymongo import MongoClient

# MongoDB 연결 설정
client = MongoClient('mongodb://eodyd426:eodyd456@localhost:27017/test_DB')
db = client['test_DB']

# 앨범 목록 조회
for album in db.albums.find({}, {'앨범': 1, '연도': 1}):
    print(album)

# 2000년 발매 앨범 조회
for album in db.albums.find({'연도': '2000'}):
    print(album)

# 차트 최고 순위 10위 이내 앨범 조회
for album in db.albums.find({'최고순위': {'$lte': 10}}):
    print(album)

# 연도별 앨범 수 조회
for count in db.albums.aggregate([{'$group': {'_id': "$연도", 'count': {'$sum': 1}}}]):
    print(count)

# 가장 최신 앨범 조회
print(db.albums.find().sort('연도', -1).limit(1)[0])

# 가장 오래된 앨범 조회
print(db.albums.find().sort('연도', 1).limit(1)[0])

# CRUD 연습 문제
# 새 앨범 추가
db.albums.insert_one({'앨범': 'New Album', '연도': '2024', '최고순위': '1'})

# 앨범 정보 업데이트
db.albums.update_one({'앨범': 'New Album'}, {'$set': {'최고순위': '2'}})

# 특정 앨범 삭제
db.albums.delete_one({'앨범': 'New Album'})