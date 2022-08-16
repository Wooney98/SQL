# group by, 데이터 그룹화
-- 특정 컬럼을 기준으로 데이터를 묶고 집계함수를 이용하여 집계한다.
-- pclass 별로 평균나이 보기
select pclass,avg(age) from titanic_raw group by pclass ;

-- pclass 별로 평균 생존율
select pclass, avg(survived) from titanic_raw group by pclass;

-- embarked 별로 평균 생존율
select embarked, avg(survived) from titanic_raw group by embarked;
select embarked, avg(survived) from titanic_raw 
where embarked is not null group by embarked order by embarked;

-- gender 별 평균 생존율
select gender, avg(survived) from titanic_raw where gender is not null group by gender;

-- survived 별 나이와 운임료에 대한 평균과 표준편차 구하기
select survived, avg(age), avg(fare), std(age), std(fare) from titanic_raw 
where survived is not null group by survived;

-- 각 pclass 대하여 gender별로 생존율 뽑기
select pclass, gender,avg(survived) as result
from titanic_raw group by pclass,gender order by pclass; #4차원

-- 각 항구에 대하여 pclass별로 생존율 조회
select embarked,pclass,avg(survived) as result
from titanic_raw where embarked is not null group by embarked,pclass order by embarked;

-- Q 항구에 대해 pclass별로 여자의 비율과 나이의 평균
select embarked, pclass,
	avg(age) as "전체 나이 평균", 
	(sum(case when gender = "female" then 1 end)/count(gender))  as "여자 비율"
from titanic_raw where embarked = "Q" group by embarked, pclass order by pclass;

# 분석한 내용 정리
-- 객식등급별, 성별, 나이별 생존율이 다르다.
-- 가족수가 생존율에 영향을 준다.
-- 등급이 낮을수록 나이가 어려지고 생존율도 낮아진다.
-- 생존자의 평균나이가 어린편이고 편차가 심하다.
-- 1등급 남자의 생존율이 25%나 된다.