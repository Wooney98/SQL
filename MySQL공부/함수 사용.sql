# 함수 사용하기
-- 중복 제거하기
select distinct(cabin) from titanic_raw;

-- 총개수 확인하기
	-- count 함수는 null 값 무시
select count(passengerid) as cnt
from titanic_raw;
select count(passengerid) from titanic_raw  # 객실번호는 많은 널값이있다.
where cabin is null;

-- 운임료 총합계 확인해보기
	-- sum 함수는 null 값 무시
select sum(fare) as sum_fare
from titanic_raw;

-- 평균 운임료 확인해보기
	-- avg 함수는 null 값 무시
select avg(fare) as avg_fare
from titanic_raw;
-- 운임료에대한 표준편차 확인해보기
	-- std 함수는 null 값 무시
select std(fare) as std_fare
from titanic_raw;

-- 분산 구하기
	-- variance 함수는 null값 무시
select variance(fare) as var_fare
from titanic_raw;

-- 거듭제곱하기
	-- pow 함수
select pow(std(fare),2) as pow_std_fare
from titanic_raw;

-- 최대값 구하기
select max(fare) as max_fare
from titanic_raw;

-- 최소값 구하기
select min(fare) as min_fare
from titanic_raw;