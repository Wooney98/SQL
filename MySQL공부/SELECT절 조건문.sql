# select 절에 조건주기
-- ifnull 첫번째 값이 null 일경우 두번째 값으로 채워 넣습니다.
select ifnull(cabin,"알수없음") as result
from titanic_raw;

-- if 첫번째 값이 참일경우 두번째 값이 들어가고 거짓일 경우 세번째 값이 들어간다.
select if(cabin is not null,cabin,"알수없음") as result
from titanic_raw;

-- gender 에 대하여 male 일 경우 남자 , female 경우 여자 변경하여 조회하시오.
select if(gender = "male" , "남자","여자") as result
from titanic_raw;

-- One Hot Encoding 해보기
-- 컬럼              C Q S
-- 탑승항구가 C일경우   1 0 0
-- 탑승항구가 Q일경우   0 1 0
-- 탑승항구가 S일경우   0 0 1
select 
if(embarked ="C",1,0) as C,
if(embarked ="Q",1,0) as Q,
if(embarked ="S",1,0) as S from titanic_raw;

-- case문
select case 
		when embarked = "C" then "프랑스 항구"
        when embarked = "Q" then "아일랜드 항구"
        else "영국 항구"
	end as result
from titanic_raw;

# Count encoding
set @embarked_C = (select count(embarked)from titanic_raw where embarked="C"); # 사용자변수 '@__'
set @embarked_Q = (select count(embarked)from titanic_raw where embarked="Q"); 
set @embarked_S = (select count(embarked)from titanic_raw where embarked="S"); 
select @embarked_C;

select case
		when embarked = "C" then @embarked_C
        when embarked = "Q" then @embarked_Q
        else @embarked_S
	end as result
from titanic_raw;

-- sibsp가 0일 경우, "형제와 배우자 없음" 출력, parch 가 0일 경우, "부모자녀 없음"
-- sibsp와 parch둘다 0일 경우 "혼자옴"출력
select case 
		when sibsp = 0 and parch = 0 then "외로워"
        when parch = 0 then "부모자녀 없음"
        when sibsp = 0 then "형제와 배우자 없음"
		else "있음"
	end as result
from titanic_raw;