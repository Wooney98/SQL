# having 절
-- group by 집계 결과에 대한 조건 걸기
-- 객식별로 생존률이 0.7이상의 객실만 보고 싶다면??
select cabin,
	avg(survived) as survived_rate
from titanic_raw group by cabin having survived_rate>=0.7; 
-- 티켓별로 생존율
select ticket,
	avg(survived) as survive_rate
from titanic_raw group by ticket having survive_rate>=0.7;
-- 객실별로 티켓의 고유한 값 개수가 1개인 객실들만 조회
select cabin, 
	count(distinct(ticket)) as ticket_unique
from titanic_raw group by cabin having ticket_unique = 1;