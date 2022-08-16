-- 생존자의 나이에 대한 평균과 표준편차를 구해보세요.
select avg(age) as avg_age, std(age) as std_age
from titanic_raw
where survived = 1;

-- 사망자의 나이에 대한 평균과 표준편차를 구해보세요.
select avg(age) as avg_age, std(age) as std_age
from titanic_raw
where survived = 0;

-- 3등급 객실에 대한 생존률을 구해보세요.
-- 0 과 1로 되어있는 데이터의 평균을 구하면 1에 대한 비율이 나온다.
select avg(survived) as survived_rate
from titanic_raw
where pclass = 3;

-- 1등급 객실의 생존율 
select avg(survived) as survived_rate
from titanic_raw
where pclass = 1;

-- 2등급 객실의 생존율
select avg(survived) as survived_rate
from titanic_raw
where pclass = 2;

-- 전체 생존율
select avg(survived) as survived_rate
from titanic_raw;

-- 전체 중 여자 생존율
select avg(survived) as survived_rate
from titanic_raw
where gender = "female";

-- 1등급 객실의 여자 생존율
select avg(survived) as survived_rate
from titanic_raw
where gender = "female"  and pclass = 1;

-- 나이대에 대한 생존률 확인해보기
select avg(survived) as survived_rate
from titanic_raw
where age < 10;

-- 생존자에 대한 sibsp(형제자매배우자수) 과 parch(부모자식수) 평균!
select avg(sibsp) avg_sibsp , avg(parch) as avg_parch
from titanic_raw
where survived=1;

-- 사망자에 대한 sibsp(형제자매배우자수) 과 parch(부모자식수) 평균!
select avg(sibsp) avg_sibsp , avg(parch) as avg_parch
from titanic_raw
where survived=0;
