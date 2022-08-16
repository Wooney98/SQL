# limit
-- 조회되는 행 개수를 지정할 수 있다.
select *from titanic_raw limit 0,5;
select *from titanic_raw limit 2,10;
-- 행번호 생략 시 기본값으로 0을 지정함
select *from titanic_raw limit 5;