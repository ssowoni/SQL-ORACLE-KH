select * from EMPLOYEES;
select * from departments;

--서브쿼리 사용해보기
select * from EMPLOYEES A
where a.department_id = (  -- 단일행 서브쿼리
                           -- equal로 썼기에 서브쿼리 조회 값은 1개가 나와야 한다.
                           -- 만약 b.location_id = 1700으로 주면 서브쿼리 앞에 =아닌 IN을 줘야함.
                            SELECT B.department_id
                            FROM departments B
                            where b.location_id =1800);
                            
select * from EMPLOYEES A
where a.department_id IN (  
                            SELECT B.department_id
                            FROM departments B
                            where b.location_id =1700);          
                            
-- 위의 내용을 조인으로 사용해보기 
-- 크게 속도에는 차이가 없다. 
SELECT * 
    FROM employees A,
        departments B
    WHERE a.department_id = b.department_id
    AND b.location_id = 1700;
 
 --서브쿼리를 쓰면 안되는 때가 있긴 하다 언제지?
 
 
 
 
 -----------------------------------------------------------------------------


select * from EMPLOYEES; 
 
-- 사원의 급여 평균 검색 


select avg(salary) , round( avg(salary)), count(*) 전체인원
from EMPLOYEES;

 
 
                            
                           