# JOIN 이란
-- 다수의 table 간에 공통된 데이터를 기준으로 조회하는 명령어
-- 컬럼의 기준으로 데이터가 매칭되는 경우 결합한다.
/* 
#dept 테이블
deptno - 부서번호
dname - 부서이름
loc - 지역

#emp 테이블
empno - 사원번호
ename - 사원이름
job - 직무
mgr - 상급자의 사원번호
hiredate - 입사일
sal - 급여
comm - 커미션
deptno - 부서번호
*/
select *from dept; # 새 테이블 dept
select *from emp; # 새 테이블 emp

# inner join
-- 테이블 사이에 on 조건에 맞는 데이터만 join.
select *from emp
inner join dept
on emp.deptno = dept.deptno;

-- join 할때 컬럼명을 명시하자
select ename, job, mgr, dname, loc
from emp inner join dept on emp.deptno = dept.deptno;

-- 테이블 별칭 적용해서 join 하기
select ename, job, mgr, dname, loc
from emp e
inner join dept d
on e.deptno = d.deptno;

# Self 조인
-- 동일 테이블에서 진행되는 조인
-- 각 사원의 관리자이름을 알고 싶다면?
select e.ename as '사원이름',
	m.ename as '상사이름'
from emp e
inner join emp m
on e.mgr = m.empno;

# left join
-- 왼쪽 테이블 기준으로 조인
-- 왼쪽 테이블의 컬럼값과 on 조건에 맞는 행이 없을 경우, Null이 들어감
-- 행이 늘어날순 있으나 줄어들진 않는다.
-- king의 상사는 null이라 조회가 안된다.. 조회하려면?
select e.ename as '사원이름',
	m.ename as '상사이름'
from emp e
left join emp m
on e.mgr = m.empno;