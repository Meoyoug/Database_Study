-- use yes24Crawl;

-- 평점이 4 이상인 책 목록 조회
-- SELECT * FROM books WHERE rating >= 4.0; 

-- 리뷰수가 100개 이상인 책 제목과 리뷰수 조회
-- SELECT title, review FROM books WHERE review >= 100 ORDER BY review DESC;

-- 가격이 20000원 미만인 책의 제목과 가격조회
-- SELECT title, price FROM books WHERE price < 20000;

-- 국내 도서 탑 100에 4주 이상 머문 책들을 조회
-- SELECT * FROM books WHERE ranking_weeks >= 4

-- 특정 저자의 모든 책을 조회하세요
-- SELECT * FROM books WHERE author = "데일 카네기"

-- 특정 출판사의 모든 책 조회
-- SELECT * FROM books WHERE publisher LIKE "YBM%"

-- 저자별로 출판한 책의 수 조회
-- SELECT author, count(*) AS "출판 수" FROM books GROUP BY author

-- 가장 많은 책을 출판한 출판사를 찾아라
-- SELECT publisher, count(*) AS p_count FROM books GROUP BY publisher 
-- ORDER BY p_count DESC LIMIT 1;

-- 가장 높은 평점을 가진 저자를 찾아라.
-- SELECT author, AVG(rating) AS rating_AVG FROM books GROUP BY author
-- ORDER BY rating_AVG DESC LIMIT 1;

-- 국내 도서 랭킹이 1위인 책의 제목과 저자를 조회하라
-- SELECT ranking, title, author FROM books WHERE ranking = 1

-- 판매지수와 리뷰 수가 모두 높은 상위 10개의 책을 조회
-- SELECT sales, review, title FROM books ORDER BY sales DESC, review DESC LIMIT 10;

-- 가장 최근에 출판된 5권의 책을 조회
-- SELECT * FROM books ORDER BY publishing DESC LIMIT 5;

-- 저자별 평균 평점 조회
-- SELECT author, AVG(rating) FROM books group by author

-- 출판일 별로 출간된 책의 수 조회
-- SELECT publishing, COUNT(*) FROM books GROUP BY publishing ORDER BY publishing ASC;

-- 책 제목별 평균 가격을 조회
-- SELECT title, AVG(price) FROM books GROUP BY title

-- 리뷰 수가 가장 많은 상위 5권의 책을 찾기
-- SELECT title, review FROM books ORDER BY review DESC LIMIT 5

-- 국내 도서 랭킹 별 리뷰 수 계산
-- SELECT ranking, AVG(review) FROM books GROUP BY ranking

-- 평균 평점보다 높은 평점을 받은 책 조회
-- SELECT title, rating FROM books WHERE rating > (SELECT AVG(rating) FROM books);

-- 평균 가격보다 비싼 책들의 제목과 가격 조
-- SELECT title, price FROM books WHERE price > (SELECT AVG(price) FROM books);

-- 가장 많은 리뷰를 받은 책보다 많은 리뷰를 받은 다른 책 조회
-- SELECT title, review FROM books 
-- WHERE review >= (SELECT MAX(review) FROM books);

-- 평균 판매지수보다 낮은 판매지수를 가진 책들을 조회
-- SELECT title, sales FROM books WHERE sales < (SELECT AVG(sales) FROM books);

-- 가장 많이 출판된 저자의 책들 중 최근에 출판된 책을 조회
-- SELECT title, author, publishing FROM books 
-- WHERE author = (SELECT author FROM books GROUP BY author ORDER BY COUNT(*) DESC LIMIT 1)
-- ORDER BY publishing LIMIT 1;

-- 특정 책의 가격을 업데이트
-- UPDATE books SET price = 99999 WHERE bookID = 1;

-- 특정 저자의 책 제목을 변경
-- UPDATE books SET title = "내맘대로 바꾸는 책 제목" WHERE author = "문상훈"

-- 판매지수가 가장 낮은 책을 데이터베이스에서 삭제
-- DELETE FROM books WHERE sales = (SELECT MIN(sales) FROM books LIMIT 1);
-- DELETE FROM books WHERE sales = (
--     SELECT min_sales FROM (SELECT MIN(sales) AS min_sales FROM books) AS temp
-- );

-- 특정 출판사가 출판한 모든 책의 평점을 1점 증가시켜라
-- UPDATE books SET rating = rating + 1 WHERE publisher LIKE "YBM%";

-- 저자별 평균 평점 및 판매지수를 분석하여 인기있는 저자를 확인
-- SELECT author, AVG(rating), AVG(sales) FROM books
-- GROUP BY author
-- ORDER BY AVG(rating) DESC, AVG(sales) DESC LIMIT 5;

-- 출판일에 따른 책 가격의 변동 추세 분석
-- SELECT publishing, AVG(price) FROM books GROUP BY publishing
-- ORDER BY publishing DESC;

-- 출판사별 출간된 책의 수와 리뷰 수를 비교 분석
-- SELECT publisher, count(*) AS book_count, SUM(review) AS total_review FROM books GROUP BY publisher
-- ORDER BY book_count DESC, total_review DESC;

-- 국내 도서 랭킹과 판매지수의 상관관계 분석
-- SELECT ranking, AVG(sales) FROM books GROUP BY ranking;

-- 가격 대비 리뷰 수와 평점의 관계를 분석하여 가성비 좋은 책 찾기
-- SELECT price, AVG(review), AVG(rating) FROM books GROUP BY price;

-- 출판사별 평균 판매지수가 가장 높은 저자 찾기
-- SELECT publisher, author, AVG(sales) FROM books GROUP BY publisher, author
-- ORDER BY publisher, AVG(sales) DESC;

-- 리뷰 수가 평균보다 높으면서 가격이 평균보다 낮은 책 조회
-- SELECT title, review, price FROM books 
-- WHERE review > (SELECT AVG(review) FROM books) AND price < (SELECT AVG(price) FROM books);

-- 가장 많은 종류의 책을 출판한 저자 찾기
-- SELECT author, count(DISTINCT title) AS book_count FROM books GROUP BY author
-- ORDER BY book_count DESC LIMIT 1;

-- 각 저자별로 가장 높은 판매지수를 기록한 책 조회
-- SELECT author, MAX(sales) AS max_sales
-- FROM books
-- GROUP BY author;

-- 연도별 출판된 책 수와 평균 가격 비교
-- SELECT YEAR(publishing), count(*), AVG(price) FROM books
-- GROUP BY YEAR(publishing)
-- ORDER BY YEAR(publishing) DESC;

-- 출판사가 같은 책들 중 평점 편차가 가장 큰 출판사 찾기
-- SELECT publisher, MAX(rating)-MIN(rating) as rating_difference
-- FROM books
-- GROUP BY publisher
-- ORDER BY rating_difference DESC LIMIT 1;

-- 특정 저자의 책들 중 판매지수 대비 평점이 가장 높은 책 찾기 
-- SELECT title, sales, rating, rating / sales as ratio
-- FROM books
-- WHERE author = "최태성"
-- ORDER BY ratio DESC
-- LIMIT 1;








