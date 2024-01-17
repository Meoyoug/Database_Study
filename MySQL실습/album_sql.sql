-- 1. 앨범 목록 조회
SELECT 앨범, 연도 FROM albums;
-- 2. 2000년 발매 앨범 조회
SELECT * FROM albums WHERE 연도 = '2000';
-- 3. 차트 최고 순위 10위 이내 앨범 조회
SELECT * FROM albums WHERE 최고순위 <= 10;
-- 4. 차트 순위가 없는 앨범 조회
SELECT * FROM albums WHERE 최고순위 = '-';
-- 5. 연도별 앨범 수 조회
SELECT 연도, COUNT(*) FROM albums GROUP BY 연도;
-- 6. 가장 최신 앨범 조회
SELECT * FROM albums ORDER BY 연도 DESC LIMIT 1;
-- 7. 가장 오래된 앨범 조회
SELECT * FROM albums ORDER BY 연도 ASC LIMIT 1;
-- 8. 차트 10위 이상 앨범 조회
SELECT * FROM albums WHERE 최고순위 >= 10;
-- 9. 'White'가 포함된 앨범 조회
SELECT * FROM albums WHERE 앨범 LIKE '%White%';
-- 10. 2000년부터 2005년 사이 앨범 조회
SELECT * FROM albums WHERE 연도 BETWEEN '2000' AND '2005';

CRUD 연습 문제:

-- 1. 새 앨범 추가 (Create)
INSERT INTO albums (앨범, 연도, 최고순위) VALUES ('New Album', '2024', '1');
-- 2. 앨범 정보 업데이트 (Update)
UPDATE albums SET 최고순위 = '2' WHERE 앨범 = 'New Album';
-- 3. 특정 앨범 삭제 (Delete)
DELETE FROM albums WHERE 앨범 = 'New Album';