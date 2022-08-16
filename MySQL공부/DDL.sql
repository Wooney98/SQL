# DDL
-- 데이터 베이스와 테이블을 정의하는 언어
-- CREATE: 데이터베이스와 테이블을 생성
-- ALTER: 테이블을 수정
-- DROP: 데이터베이스와 테이블을 삭제

-- 데이터베이스 생성하기
CREATE database test;
-- 데이터베이스 삭제하기
DROP database test;
-- 데이터베이스 삭제시 조건 추가하기
DROP database if exists test;

CREATE database shop;
-- 현재 db 리스트 출력하기
show databases;
-- 데이터베이스를 선택하려면 아래 USE 사용
use shop;
-- 현재 어떤 db를 선택했는지 확인
select database();

-- 테이블 생성
create table tb_user(
	user_id int
    
    
);
-- 테이블 리스트 보기
show tables;
-- 테이블 삭제하기
drop table tb_user;
drop table if exists tb_user;

create table tb_user(
	user_id int,
    user_name varchar(10), # 가변길이 문자열
    phone char(13) # 고정길이, 가변길이보다 속도가 빠르다.tb_user
    
);
-- 테이블 구조 확인하기 (desc 테이블명)
desc tb_user;

# 제약조건 : 데이터를 삽입할때 무조건 어떠한 조건을 만족했을 경우에만 추가하도록 하는 제약
-- 기본키(Primary Key): 중복값X, Null X
-- auto_increment: 새 데이터 저장시 고유번호가 자동생성되서 들어감
-- unique: 중복된 값을 허용하지 않음

create table tb_product(
	product_id int primary key auto_increment,
    product_name varchar(20) unique not NUll,
    product_price int
);
desc tb_product;
select *from tb_product;

# 테이블 수정하기(ALTER)
-- 컬럼 추가하기
alter table tb_user add user_addr varchar(255);
desc tb_user;
-- 컬럼명 수정하기
alter table tb_user change phone user_phone varchar(50);
desc tb_user;
-- 컬럼 타입 수정하기
alter table tb_user modify column user_phone varchar(13);
desc tb_user;
-- 컬럼에 대하여 제약조건 및 속성 추가하기
alter table tb_user modify column user_id int primary key auto_increment;
DESC tb_user;

alter table tb_user add user_age int;
-- 컬럼 삭제하기
alter table tb_user drop user_age;

alter table tb_user modify column user_name VARCHAR(10) not NULL;
alter table tb_user modify column user_phone VARCHAR(13) not NULL;
alter table tb_user modify column user_addr VARCHAR(255) not NULL;
desc tb_user;

# 외래키(Foreign key)
-- 외부키, 참조키
-- pk 보유하는 테이블이 부모, 참조하는 테이블을 자식 테이블이라 한다.
create table tb_order(
	order_id int primary key auto_increment,
    user_id int, #부모의 기본키의 데이터 타입으로 참조
    product_id int, #부모의 기본키의 데이터 타입으로 참조
    order_dt datetime default current_timestamp,
    foreign key(user_id) references tb_user(user_id),
    foreign key(product_id) references tb_product(product_id)
);
desc tb_order;