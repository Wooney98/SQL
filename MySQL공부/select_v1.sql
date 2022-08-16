use playdata;
select database();

show tables;

select * from titanic_raw;

/*
passengerid - 승객 id (pk)
survied - 생존 여부(0:사망 , 1:생존)
pclass - 객실 등급(1 , 2 , 3)
name - 이름
gender - 성별 (male : 남성 , female: 여성)
sibsp - 동반한 형제 또는 자매 또는 배우자수
parch - 동반한 부모 또는 자식의 수
ticket - 티켓번호
fare - 요금
cabin - 객실 번호
embarked - 탑승한 항구(C:프랑스 항구, Q: 아일랜드 항구, S: 영국 항구)
*/

-- 컬럼을 선택해서 조회할수있다.
select name,age from titanic_raw;

-- 컬럼명에 대하여 별칭도 줄수있다.
select name as "이름", age as "나이" from titanic_raw; 

# 게시글 조회방식
-- (페이지 번호-1) * (페이지당 개시글 개수)
# SQL 실행순서
-- FROM ->JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT