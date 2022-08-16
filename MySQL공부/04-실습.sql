-- 'scott'이라는 사원의 부서명과 지역을 조회
select e.ename, d.dname, d.loc
from emp e
inner join dept d
on e.deptno = d.deptno and e.ename = "scott";

-- 뉴욕지역에서 그문하는 사원이름과, 급여, 지역등을 조회
select e.ename, e.sal, d.loc
from emp e
inner join dept d
on e.deptno = d.deptno and d.loc = "NEW YORK";

-- research 부서에 소속된 사원의 이름, 입사일, 급여를 조회
select e.ename, e.hiredate, e.sal
from emp e
inner join dept d
on e.deptno = d.deptno and d.dname = "RESEARCH";

-- 직무가 manager인 사원의 이름과 부서명, 급여, 커미션을 조회
select e.ename, d.dname, e.sal, e.comm
from emp e
inner join dept d
on e.deptno = d.deptno and  e.job = "manager";

-- 관리자 이름이 KING인 사원의 이름과 상사이름을 조회하시오
select e.ename as '사원이름',
	m.ename as '상사이름'
from emp e
inner join emp m
on e.mgr = m.empno and m.ename = 'KING';

-- ALLEN의 동료이름(같은 부서에서 일하는 동료)을 조회하시오.
select p.ename
from emp e
inner join emp p
on e.ename = 'ALLEN' and e.deptno = p.deptno and p.ename != 'ALLEN';

-- 부서번호 40번이 없어서 조회가 안된다.. 조회하려면?
select d.deptno, d.dname, e.ename
from dept d
left join emp e
on d.deptno = e.deptno;

-- 모든 부서의 리스트와 급여가 3000이상의 직원들의 연봉과 이름을 조회하시오.
select d.dname,
	e.ename,
    e.sal
from dept d
left join emp e
on e.sal >= 3000 and d.deptno=e.deptno;

-- 모든 부서의 리스트와 함께 커미션이 있는 직원들의 커미션과 이름을 조회하시오.
select d.dname, 
	e.ename,
	e.comm
from dept d
left join emp e
on e.comm > 0 and e.deptno = d.deptno;

-- 모든 부서의 부서별 연봉에 대한 총합과 평균과 표준편차, 직원수를 구하시오.
select d.*,
	sum(e.sal) as '총합',
    avg(e.sal) as '평균',
    std(e.sal) as '표준편차',
	count(e.empno) as '직원수' # NULL값이 포함되지 말아야 하므로 d.deptno말고 e.empno
from dept d
left join emp e
on e.deptno = d.deptno
group by d.deptno;

-- 각 관리자의 부하직원수와 평균연봉을 구하시오.
select 
	m.ename as '관리자',
    count(e.empno) as '부하직원수',
    avg(e.sal) as '평균연봉'
from emp e
inner join emp m
on e.mgr = m.empno
group by m.empno;
