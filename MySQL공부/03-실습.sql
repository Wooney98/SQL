-- 이름 조회
select *
from titanic_raw
where binary(name) like '%Mr.%'; 
select *
from titanic_raw
where binary(name) like '%Ms.%';
select *
from titanic_raw
where binary(name) like '%Mrs.%'; # 기혼 여성
select *
from titanic_raw
where binary(name) like '%Miss.%'; # 미혼 여성

-- 기혼여성이면서 배우자(sibsp)수가 0명인 사람
select *
from titanic_raw
where binary(name) like '%Mrs.%'and sibsp = 0; # 기혼여성

-- mr,ms,mrs,miss 가 아닌 경우 조회
select *
from titanic_raw
where binary(name) not like '%Mrs.%'and binary(name) not like '%Miss.%'and 
	binary(name) not like '%Mr.%'and binary(name) not like '%Ms.%';
    
-- mr,ms,mrs,miss 가 아닌 경우 조회(정규식표현)
select *from titanic_raw
where name not regexp "M[rsi]{1,3}[.]";

-- 승객의 총개수
-- 이름의 Mr. 총개수, 이름의 Ms. 총개수, 이름의 Mrs. 총개수, 이름의 Miss. 총개수
-- mr,ms,mrs,miss 가 아닌 경우 총개수
select
count(passengerid) as total_cnt,
count(if(binary(name) like '%Mr%',1,null)) as mr_cnt,
count(if(binary(name) like '%Ms%',1,null)) as ms_cnt,
count(if(binary(name) like '%Mrs%',1,null)) as mrs_cnt,
count(if(binary(name) like '%Miss%',1,null)) as miss_cnt,
count(if(name not regexp 'M[rsi]{1,3}[.]',1,null)) as m_cnt
from titanic_raw;
-- 생존율 구하기
select
avg(survived) as total_avg,
avg(if(binary(name) like '%Mr%',survived,null)) as mr_rate,
avg(if(binary(name) like '%Ms%',survived,null)) as ms_rate,
avg(if(binary(name) like '%Mrs%',survived,null)) as mrs_rate,
avg(if(binary(name) like '%Miss%',survived,null)) as miss_rate,
avg(if(name not regexp 'M[rsi]{1,3}[.]',survived,null)) as m_rate
from titanic_raw;

-- 항구별 특징
-- 항구별 생존율과 
-- 운임료와 나이, 가족수(sibsp+parch)에 대한 평균
-- 여성의 비율, 객실등급의 비율을 구하라
select embarked, 
	avg(survived) as "생존율",
    avg(fare) as "운임료 평균",
    avg(age) as "나이 평균",
    avg(sibsp+parch) as "가족수 평균",
    avg(if(pclass = 1, 1, 0)) as "1등급",
    avg(if(pclass = 2, 1, 0)) as "2등급",
    avg(if(pclass = 3, 1, 0)) as "3등급",
    (sum(case when gender = "female" then 1 end)/count(gender))  as "여자 비율"
from titanic_raw where embarked is not null group by embarked;

-- 남성승객들에 대해 각 항구에 대해 각 객실별로 생존율 구하기
select embarked, pclass,
	avg(survived)
from titanic_raw where gender="male" group by embarked,pclass order by embarked;

-- 각 항구에 대해 생존여부별
-- 가족(sibsp+parch) 평균
-- 운임료 평균
-- 티켓에 대한 고유값의 개수 (유니크한 데이터)
-- cabin에 대한 고유값의 개수 (유니크한 데이터)
-- 가족이 없는 승객의 비율
select embarked,survived,
	avg(sibsp+parch) as '가족 생존율', 
    avg(fare) as '운임료 평균',
    count(distinct(cabin)) as 'cabin 고유값',
    count(distinct(ticket)) as '티켓 고유값',
    avg(if (sibsp=0 and parch=0, 1, 0)) as "가족이 없는 승객 비율"
from titanic_raw where embarked is not null 
group by embarked, survived order by embarked,survived;
