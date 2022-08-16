# DML
-- 테이블의데이터를 조작하는 명령어
-- INSERT: 테이블에 데이터를 삽입하는 명렁어
-- UPDATE: 테이블에 데이터를 수정하는 명렁어
-- DELETE: 테이블에 데이터를 삭제하는 명렁어
-- SELECT: 테이블에 데이터를 조회하는 명렁어

use shop;
select database();

# 데이터 삽입하기
-- 하나씩 삽입하기
INSERT into tb_user(user_name,user_phone,user_addr)
values("손성우","010-3787-1822","서울시 강동구");

SELECT *from tb_user;

INSERT INTO tb_user(user_name) VALUE ("손성우"); # phone,addr에 디폴트 값이 안정해져서 에러

-- 여러 데이터 삽입하기
INSERT INTO tb_user(user_name,user_phone,user_addr) 
values("철수","010-1111-1111","서울시 강남구"),
("민수","010-2222-2222","서울시 서초구"),
("만수","010-3333-3333","서울시 종로구"),
("현수","010-4444-4444","서울시 중랑구");
SELECT *from tb_user;

INSERT INTO tb_product(product_name,product_price)
VALUES ("에어컨","1200000"),
("스마트TV","2000000"),
("컴퓨터","1000000"),
("모니터","200000");

SELECT *FROM tb_user;

# 부모의 기본키에 없는 값을 외래키에 넣을 경우 에러발생
insert into tb_order(user_id,product_id)
values(5,1);
select *from tb_order;
desc tb_order;

# 데이터 수정하기
update tb_product set product_name="삼성에어컨" where product_id = 1;
select *from tb_order;

# 데이터 삭제하기
delete from tb_user where user_id = 5;
select *from tb_user;
-- 자식 테이블에서 참조하는 값이 있는 부모키의 값은 삭제가 안되므로, 
-- 참조하는 값을 먼저 삭제하고, 부모키를 삭제해야한다.
delete from tb_order where order_id = 5;
select *from tb_order;