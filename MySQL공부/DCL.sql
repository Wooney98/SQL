# DCL
-- grant: 사용자 계정에 대한 권한을 주는 명령어
-- revoke: 사용자 계정에 대한 권한을 회수하는 명령어
-- commit: insert, update, delete 대한 데이터베이스 실제 반영
-- rollback: insert, update, delete 대한 복구
use mysql;
select database();
-- mysql의 계정 생성하기
# create user 'ID'@'IP' identified by '비밀번호';
create user 'wooney'@'%' identified by '1234';
select *from user;
-- 권한 부여하기
grant select,insert,delete,update on *.* to 'wooney'@'%'; # (모든DB.모든테이블)
select *from user;
-- 권한 해제하기
revoke select,insert,delete,update on *.* from 'wooney'@'%';
select *from user;
-- 계정 삭제하기'

drop user 'wooney'@'%';
select *from user;

select @@autocommit; # 실제 DB에 반영하려는 명령어 commint
set AUTOCOMMIT = 0;
SELECT @@autocommit;

-- rollback
use shop;
select *from tb_user;
delete from tb_user where user_id = 4;
rollback;

delete from tb_user where user_id = 7;
commit;
rollback;
select *from tb_user;