# where 이용하여 조회하기
select * 
from titanic_raw
where survived = 1;
select * 
from titanic_raw
where survived != 1; 
select *
from titanic_raw
where age > 59;
-- is null
select *
from titanic_raw
where age is null;
-- is not null
select *
from titanic_raw
where age is not null;

-- 특정 문자열이 포함 되어 있는지 조회
select *
from titanic_raw
where name like '%miss%';
select * 
from titanic_raw
where name not like '%miss%';

-- and
select *
from titanic_raw
where survived = 1 and gender = "female";

-- or
select *
from titanic_raw
where name like '%mrs%' or name like "miss";

-- in , not in 
select * from titanic_raw
where embarked in("c","s");

-- 구간 조회
select * 
from titanic_raw
where age between 20 and 40; # 20살이상 ~ 40살이하

-- 정렬하기
select * 
from titanic_raw
where survived = 1
order by fare asc; # 기본은 오름차순(asc 생략시) 
select * 
from titanic_raw
where survived = 1
order by fare desc; # 내림차순

-- 산술연산
select name, sibsp + parch as add_sibsp_parch
from titanic_raw;

select sibsp-parch as sub_sibsp_parch
from titanic_raw;

select sibsp*parch as mul_sibsp_parch
from titanic_raw;

select sibsp/parch as div_sibsp_parch
from titanic_raw; # 나누기의 경우 나누는 수가 0일경우 Null

select sibsp%parch
from titanic_raw; # 나머지를 구할때 나누는 수가 0일경우 Null
