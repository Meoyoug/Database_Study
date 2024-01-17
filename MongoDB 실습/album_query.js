// 1. 앨범 목록 조회:
db.albums.find({}, {앨범: 1, 연도: 1})
// 2. 2000년 발매 앨범 조회
db.albums.find({연도: '2000'})
// 3. 차트 최고 순위 10위 이내 앨범 조회
db.albums.find({최고순위: {$lte: 10}})
// 4. 차트 순위가 없는 앨범 조회
db.albums.find({최고순위: '-'})
// 5. 연도별 앨범 수 조회
db.albums.aggregate([{$group: {_id: "$연도", count: {$sum: 1}}}])
// 6. 가장 최신 앨범 조회
db.albums.find().sort({연도: -1}).limit(1)
// 7. 가장 오래된 앨범 조회
db.albums.find().sort({연도: 1}).limit(1)
// 8. 차트 10위 이상 앨범 조회
db.albums.find({최고순위: {$gte: 10}})
// 9. 'White'가 포함된 앨범 조회
db.albums.find({앨범: /White/})
// 10. 2000년부터 2005년 사이 앨범 조회
db.albums.find({연도: {$gte: '2000', $lte: '2005'}})

// CRUD 연습 문제:

// 1. 새 앨범 추가 (Create)
db.albums.insert({앨범: 'New Album', 연도: '2024', 최고순위: '1'})
// 2. 앨범 정보 업데이트 (Update)
db.albums.update({앨범: 'New Album'}, {$set: {최고순위: '2'}})
// 3. 특정 앨범 삭제 (Delete)
db.albums.remove({앨범: 'New Album'})