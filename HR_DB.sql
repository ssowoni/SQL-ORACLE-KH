--오라클에 접근할 수 있도록 샘플로 만들어 놓은 교육용 계정이다
--HR은 복습이나 주석, 숙제로 사용될 듯
select * from tab; --ctrl+enter 누르면 실행된다.
desc tab;


--------------------------22-02-16 숙제---------------------------


SELECT employee_id, salary from employees
where last_name = 'Smith';
--lastname 안에는 대소문자 구별

SELECT employee_id, FIRST_NAME, salary from employees
where last_name = 'smith';
--lastname 안에는 대소문자 구별 왜 안나오는 건지 적오보기 

select employee_id as "준이", salary " 샐러리" from employees;
select employee_id "준이", salary "셀러리" from employees;
--별칭이 생략 되었을 때 적응 빨리 해야한다. 

select employee_id as "준이" from employees where last_name = 'Smith';
--as id는 한글로 사용 가능하다.

select distinct job_id from employees;
--중복 제거 

/*nvl() : 널 값을 다른 데이터로 변경하는 함수*/
select * from EMPLOYEES;
SELECT first_name, last_name, nvl(commission_pct,0) commission from EMPLOYEES;
--널 값을 0으로 표기하고 commission 바꾸기 


--2022-02-16 숙제 주석 달아오기 --

/*sum()*/
--salary를 조회하면 107개의 행이 나오는데,
select salary from employees;
--employees의 salary 컬럼에 있는 값을 모두 더한다.
select sum(salary) from employees;

/*count*/
--employees 테이블의 전체 행의 수를 반환한다.
select count(*) from employees;
-- 레코드의 전체수
--Employee_id의 행의 갯수를 반환한다. 107개
select count(all Employee_id) from employees;
--Employee_id의 행의 개수를 반환하고, 
--뒤에 문장은 중복되는 값을 제외한 Employee_id의 행의 갯수를 반환한다.
select count(all Employee_id), count(distinct Employee_id)
from employees;

--First_name의 행의 갯수를 반환한다. 107개
select count(all First_name) from employees;
--First_name의 행의 갯수와 중복된 값을 제외한 값을 반환한다.
select count(all First_name), count(Distinct first_name) 
from employees;

/*avg()*/
--Employees 테이블의 salary 컬럼의 평균을 구한다. 
select avg(salary) from Employees;
--Employees테이블에서 department_id가 80인 값들의 평균을 구하는데 
--그 평균값을 구할 컬럼은 salary 컬럼이다.
select avg(salary) from Employees where department_id = 80;
select avg(salary) from Employees where department_id = 50;
/*max()*/
select max(salary) from Employees;
--hire_date 중 가장 최근의 값, 가장 큰 값을 구한다.
select max(hire_date) from Employees;


/*min()*/
select min(salary) from Employees;
--hire_date 중 가장 오래된 값, 가장 작은 값을 구한다.
select min(hire_date) from Employees;


--오라클서는 테이블을 꼭사용 해서 없어도되는dummy테이블을 이용한다

/*number function*/
/*abs()절대값*/
--dual 테이블은 사용자가 함수(계산)을 실행할 때 임시로 사용한다.
--즉) 함수에 대한 쓰임을 알고 싶을 때 테이블 생성 필요 없이
--dual 테이블을 이용하여 함수의 값을 리턴받을 수 있다. 
--23의 절대값
select abs(-23) from dual;
select abs(23) from dual;
/*sign()*/
--23이 양수이면 1을 리턴
select sign(23) from dual; 
select sign(23), sign(-23), sign(0) from dual;
--양수는 1,음수는 -1, ,0은 0

/*round()*/
--0.123을 0의 자리 반올림, 즉 뒤에 자릿수를 적어주지 않았기에 바로 반올림
select round(0.123), round(0.543) from dual;--반올림
select round(0.123), round(2.543) from dual;
--소숫점 특정 자릿수에서 반올림인데 여기선 6번째 4번째로 각각 반올림
select round(0.12345678, 6), round(2.3423455, 4) from dual;
--뒤에숫자자리수까지 반올림표시

/*trunc()*/
--소수점 특정 자릿수에서 버리기 
--1234.1234567 숫자를 0번째, 즉 소숫점 자릿수를 자르는데
--별칭을 zero라고 짓는다. 여기선 (AS zero)와 같은 것.
select trunc(1234.1234567) zero from dual;
-- 0번째자리부터 잘라
select trunc(1234.1234567,0) zero from dual;

-- 소수점2번째자리부터잘라
select trunc(1234.1234567,2)  from dual;
--양수한자리부터 잘라 자른수는 0으로표기
select trunc(1234.1234, -1) from dual;


/*ceil정수  무조건 올려서 정수로*/
--소숫점 자리를 반올림이 아닌 무조건 올림
select ceil(32.8) ceil from dual;
select ceil(32.3) ceil from dual;

/*floor()작은정수값*/
--소숫점 자리를 무조건 버림
select floor(32.8) floor from dual;
select floor(32.3) floor from dual;

/*power()제곱을나타냄*/
--as 별칭을 power1이라고 짓고 
--4를 2제곱한 값을 나타난다.
--즉 4 : 피제곱 숫자 2 : 거듭제곱 숫자
select power(4,2) power1 from dual;

/*mod()7 / 4는 나머지구하기*/
--7을 4로 나눴을 때 나머지 
select mod(7, 4) mod1 from dual;

/*sqrt()제곱근*/
--제곱근을 구한다.
--만약 sqrt(9) 이면 값은 3
-- sqrt(16)이면 값은 4
select sqrt(2), sqrt(3) from dual;



--------------------------22-02-17 숙제---------------------------


/*Concat(char1, char2)*/
select concat('Hello','bye'), concat('좋은아침','bad') from dual;
-- dual 더미테이블, concat은 문자열을 합치는기능 

--concat과 ||은 둘다 문자열을 합치는 함수와 연산자이다.
--as를 생략해서 컬럼명을 좋은아침, operators라는 별칭으로 지정했다. 
select concat('good','bad') 좋은아침, 'good' || 'bad' operators
from dual;

/*initcap(char)*/
select initcap('good morning') from dual;
-- 첫문자가 대문자로
select initcap('good/bad morining') from dual;
--/구분자라서 뒤에b 가 B 대문자로바뀌면서 따로본다

/*lower(char)소문자, upper(char)대문자*/
select lower('GOOD'), upper('good') from dual;

/*LPAD(), RPAD()*/
--lpad는 왼쪽에 문자열을 더한다. 
--즉) good이라는 4글자의 문자열은 6글자보다 작다, 6글자로 늘리기 위해
--빈칸으로 왼쪽에 2칸을 채운다. 
select lpad('good', 6) "LPAD1", --6자리로늘림
lpad('good', 7, '#') "LPAD2", --7자리인데 #으로 채울 값을 지정해준다. 
lpad('good', 8, 'L') "LPAD3" --8자리인데 L로 왼쪽부터첫글자부터 채우기
from dual;

--위에랑 똑같은 예제이지만 여기선 rpad로 
--문자열 오른쪽에 지정한 값을 채운다. 

select rpad('good', 6) "RPAD1",--오른쪽부터채우기
rpad('good', 7, '#') "RPAD2",
rpad('좋은아', 8, 'L') "RPAD3" --한글은 2바이트차지함
from dual;

/* LTRIM(), RTRIM()*/
--왼쪽부터 지우기 o는 지울수없다 중간에 있기때문에 
--마직막은 go로시작하지만 o도 같이 지웟다
--trim은 원래 공백제거, ltrim은 문자열에서 지정한 값을 찾아 왼쪽에 있는 값을 지운다.
select ltrim('goodbye','g'), ltrim('goodbye','o') , 
ltrim('goodbye','go') from dual;

--rtrim은 오른쪽에서 지우기 e를 오른쪽에서 제거한다.
select rtrim('goodbye','e') from dual;

/*substr(), substrb()*/
select substr('good morning john', 8, 4) from dual;
--8번째 글자부터 4개의 글자를 출력한다.
--8번째는 r (공복 포함해서 센다)
select substr('good morning john', 8) from dual;
--8번째 글자부터 끝까지 출력
--r부터 나머지를 출력한다

select substr('good morining john', -4) from dual;
--오늘쪽부터 4글자
select substr('good morining john', -4, 0) from dual;
--0인경우는 null

select substrb('good morning john', 8, 4) from dual; 
--b 가 byte의미 4바이트 한글은 두글자

/*replace()*/
--replace는 단어를 대체한다.
--여기서 morning을 evening으로 대체! 
select replace('good morning tom', 'morning', 'evenning') from dual;

/*translate()*/
--translate : 대상문자와 변환문자는 1:1로 변환이되며, 대상문자에는 있는데 변환문자에는 없으면 해당 문자는 제거 된다.
select replace('You are not alone', 'You', 'We'),--You가 we로 바꿈
Translate('You are not alone', 'You', 'We')
-- You 중 Y가 W로 o가 e로 바뀌고 u는 없어짐 1:1대응
from dual;

/*trim()*/--length 문자열길이값구하기
select length(trim( leading from ' good ')) ,
--leading from 앞에왼쪽공백제거
--즉 왼쪽 공백은 제거한 'good '의 문자열 길이는 5
length(trim(trailing from ' good ')),
--trailing from 뒤에오른쪽공백제거후 길이
--즉 오른쪽 공백은 제거한 ' good'의 문자열 길이는 5
length(trim(both from ' good ')),--양쪽다 공백제거
--length가 없으므로 공백 제거한 문자열 출력
trim(both from '  good   ') 
from dual;


/*ascii()*/
--문자 A는 아스키 코드로 65
--ascii는 아스키 코드 번호로 바꾸기.
select ascii('A') from dual;

/*instr()*/--문자열의 위치를 찾기위한함수이다
select instr('good morning john', 'or',1) from dual;
--or위치가 7부터나온다
select instr('good morning john', 'n',1,2) from dual;
--1번째위치부터 2번째 n의 위치를 찾는다
select instr('good morning john', 'n',1,3) from dual;
--1번째위치부터 3번째위치 n을 찾는다 17




/*sysdate()*/
select sysdate from dual;--더미테이블 현재날짜

/*months_between()*/
--employee 테이블에서 department_id 50인 컬럼의 값들을 가져오는데,
--근무개월의 별칭을 가진 열은 현재 날짜에서 고용날짜를 뺀 값이다.
--이렇게 하면 소숫점까지 지저분하게 나오기에 
--trunc로 소숫점 자릿수들은 잘라주었다. 
select first_name, department_id, last_name, 
trunc(months_between(sysdate, hire_date)) as 근무개월 
--현재날짜에서 이전날짜 근무개월수
FROM EMPLOYEES
where department_id = 50;

/*add_months()*/--개월수 더하기
select add_months(sysdate, 7) from dual;--현재4월+7

/*next_day()*/
select next_day(sysdate, '일요일') from dual;
--현재 날짜에서 다음 일요일이 나온다

/*last day()*/
select last_day(sysdate) from dual;
--해당월의 마지막 날짜가 나온다

/*to_char()*/
select to_char(sysdate, 'yyyy/mm/dd') from dual;
--현재날자까 형식대로나오기

/*to_date()*/
select to_date('2015/03/04','yyyy/mm/dd') from dual;


/*nvl(): 널값을 다른 데이터로 변경하는 함수*/ 
select * from EMPLOYEES;
select first_name, last_name, commission_pct,
        --nul은 commission_pct의 값이 null이면 0을 출력
        --as 생략해서 컬럼의 별칭은 commission으로 지정
         nvl(commission_pct, 0) commission 
       from EMPLOYEES;
--널값을 0으로표기하고 commission바꾸기

/*decode(): switch문의 역할을 하는 함수*/
select * from DEPARTMENTS;

--department_ind를 불러오고, switch case문인 decode 함수를 사용해
--조건 값 즉) department_id가 20이면 마케팅부, 60이면 전산 90이면 경영 
--조건에 없는 값이며 부서라고 출력 
select department_id, 
decode(department_id, 20, '마케팅부', 60, '전산', 90,'경영부', '부서') 부서
from EMPLOYEES;--20이면 마케팅부 60이면 전산 나머지면 부서로 출력

/*case() : elseif문과 같은 역할 함수*/
--CASE 문 
--<형식> CASE WHEN 조건1 THEN 결과1 ELSE 결과2 END
--CASE 문은 DECODE가 제공하지 못하는 비교연산의 단점을 해결한다.
--CASE 함수는 다양한 비교 연산자를 이용하여 조건을 제시할 수 있으며 범위를 지정할 수도 있다.
--CASE 함수는 프로그래밍에서 IF ELSE와 유사한 구조이다. 
--위의 decode문과 비슷하게 조건을 설정해뒀다.
--여기선 만약 department_id가 20, 60, 90 중 어느것도 아니라면 ' ' (null)을 준다.
--end는 컬럼의 별칭명
select first_name, department_id, 
  case when department_id = 20 then '마케팅부'
       when department_id = 60 then '전산실'
       when department_id = 90 then '경영부'
       else '' 
       end "부서명"
from EMPLOYEES;



--------------------------22-02-21 숙제---------------------------


/*중복제거후 아이디구하기*/
--gruop by 절에서 group by department_id
--지정한 것과 동일한 출력값 
select distinct department_id from EMPLOYEES;

/* ORA-00937: 단일 그룹의 그룹 함수가 아닙니다*/
--sum으로 집계함수를 적어줬으므로 무엇을 기준으로
--어떤 그룹들을 기준으로 sum을 할 것인지 적어줘야 한다. 
select distinct department_id, sum(salary)
from employees;

/* 부서별 급여 합계 */
--department_id를 기준으로 
--즉) department_id 중복값을 제거하고 
--각각 department_id의 salary를 더한 값을 출력
select department_id, sum(salary) 
from EMPLOYEES
group by department_id;


/* 부서별 사원수와 평균 급여를 구해보자 */
select department_id, sum(salary), count(salary), avg(salary)
from employees;

/* 부서별 직급별 사원수와 평균 급여를 구하는 예*/
--select에서 department_id, job_id는 group by에서 둘다 나와야한다
--각각 기준이 될 수 있는 값이 2개 이므로 
--하나만 써주면 오류가 난다. 
select department_id, job_id, sum(salary), count(salary), avg(salary)
from employees
group by department_id, job_id;

select department_id, job_id, sum(salary), count(salary), avg(salary)
from employees
group by department_id, job_id
--order by를 통해 오름차순으로 정렬을 해준다.
order by department_id, job_id;


select department_id, job_id,
--9999는 자릿수가 맞지 않아도 채우지 않는 것.
--즉 그냥 냅두는 것 0000이면 0으로 채운다.
--sum과 avg를 to_char로 묶어서
--출력 형식을 지정해준다.
to_char(sum(salary),'999,999') 총급여,
to_char(avg(salary),'999,999') 평균급여
from EMPLOYEES
GROUP by department_id, job_id
order by department_id, job_id;

select department_id, job_id,
to_char(sum(salary),'999,999') 총급여,
to_char(avg(salary),'999,999') 평균급여
from EMPLOYEES
--where 절로 부서 번호가 80인 행만 출력하도록
--조건값을 줬다.
where department_id = 80
GROUP by department_id, job_id
order by department_id, job_id;

/* having 절 : 현재 부서별 사원수*/
--부서 id랑 부서 id 별 사원 수를 구한다. 
--employees 테이블에서 
select department_id, count(*)
from EMPLOYEES
--department_id가 null이 아닌 조건값을 주고
where department_id is not null
      /*and count(*) >= 10 where절에서 사용할 수 없다.*/
group by department_id
--집계함수 조건은 having 절에서 설정해줘야 한다. 
having count(*) >= 10;


select * from locations;

/*rollup : 그룹별 합계 정보를 추가해서 보여주는 함수*/
--l.city : location 테이블의 city 컬럼
--d.department_name : DEPARTMENTS 테이블의 department_name 
--e.job_id : EMPLOYEES 테이블의 job_id
select l.CITY, d.DEPARTMENT_NAME, e.JOB_ID,
count(*) 사원수, sum(e.salary) 총급여
--from 절에서 employees 테이블을 e로 지정한다. 
from EMPLOYEES e, DEPARTMENTS d,LOCATIONS l
--조건으로 EMPLOYEES  테이블의 department_id 와
--DEPARTMENTS 테이블의 department_id가 같고 (and)
where e.department_id = d.department_id
-- DEPARTMENTS 테이블의 LOCATION_ID와
-- LOCATIONS 테이블의 LOCATION_ID가 같다면
and d.LOCATION_ID = l.LOCATION_ID
--rollup울 이용하면 부서별로 각각의합계 전체합계가 나온다
--ROLLUP operator
--ROLLUP구문은 GROUP BY 절과 같이 사용 되며, 
--GROUP BY절에 의해서 그룹 지어진 집합 결과에 대해서 좀 더 상세한 정보를 반환하는 기능을 수행 한다.
--SELECT절에 ROLLUP을 사용함으로써 보통의 SELECT된 데이터와 그 데이터의 총계를 구할 수 있다.

group by rollup(l.city, d.department_name, e.job_id)
-- EMPLOYEES e(가명)LOCATIONS l(가명)
order by l.city, d.department_name, e.job_id;




--오후 쉅 내용

/*DDL(Data Definintion Language) : Create문, Drop문, Alter문
Truncate문*/
drop table employees3;
drop table employees4;

desc employees;
desc member;
desc employees2;

--d
create table employees2(
     employee_id  number(10),
     name varchar2(20),     --맞춤사이즈로 가변형
     salary number(7,2) --7자리 안에5자리는양수자리 두자리는 소수점자리
     );
desc employees2;
    

create table employees3 --밑에 테이블하고 동일하게 만들려면
as
select * from employees2;  -- 똑같은 테이블이 만들어진다
desc employees3;

--alter 명령어로 테이블 수정한다.
--add는 컬럼 추가, modify는 항목 수정
alter table employees2 add (
    manager_id varchar2(10) --매니저 아이디를 추가한다
    );
desc employees2;
    
alter table employees2 modify ( 
--테이블구조를 매니저아이디필드항목을 수정
    manager_id varchar2(20)
    );
desc employees2;

/* 컬럼을 삭제 */
--drop을 통해서 manager_id 컬럼을 삭제한다.
alter table employees2 drop column manager_id;
--desc로 employees2의 구조를 출력한다. 
desc employees2;

/* 문자형 데이터 
char, varchar, nchar유니코드고정길이문자형데이터, 
nvarchar유니코드가변길이문자형데이터, long(2GB)가변길이
*/

--아예 drop 명령어로 테이블을 날려버린다.
drop table employees2; /* 테이블의 구조를 삭제 */
desc employees2;

--테이블 이름을 3 -> 4로 변경한다
--그럼 3 테이블은 사라지게 되는 것.
rename employees3 to employees4; -- employees4로 변경한다
desc employees4;

truncate table employees4;
--truncate : 테이블 삭제가 아니라 데이터만 날려버린다. 
-- 데이터만 잘라버린다
-- employees3에 데이터를 넣고 잘라보자
-- 행삽입 +기호 선택 <f11>커밋해주면 입력된다
select * from employees4;

truncate table employees3;
desc employees3;


--------------------------22-02-22 숙제---------------------------


/* DML(Dat Manipulation Language) : 데이타 조작어
select문, delete문, insert문, update문
--형식--
SELECT 컬럼, 컬럼2, ...
FROM 테이블1, 테이블2...
WHERE 조건들;

INSERT INTO 테이블명(컬럼1, 컬럼2, 컬럼3,....)
VALUES (값1, 값2, 값3,...); //테이블의 레코드/로우 를 입력

UPDATE 테이블명
   SET 컬럼1 = 값,
       컬럼2 = 값,...
WHERE 조건..;       

DELETE (From)테이블명
WHERE 조건; //테이블의 레코드/로우를 삭제
*/

--SAMPLE 테이블 생성하는데
--컬럼 4가지, 제약조건은 걸지 않았다. 
create table sample (
    deptNo number(20), --숫자 20까지
    deptName varchar2(15), --가변 글자 15까지
    deploc varchar2(15), -- 가변 글자 15까지
    depManager varchar2(10) --가변 글자 10까지 
);

--데이터 삽입을 위해 insert into 명령어를 입력
--값은 각각 () 괄호 안에 넣은 값들. 
insert into sample(deptNo, deptName, deploc, depManager)
values(10, '기획실', '서울', '홍길동');

--값을 () 괄호 안에 위에처럼 지정해주지 않아도
--미리 설정해두면 그냥 바로 값만 삽입이 가능하다. 
insert into sample
values(20, '전산실', '부산', '김말똥');

select * from sample;

--sample 테이블에서 deptno가 20인 행을 삭제한다.
delete from sample where deptno=20;
select * from sample;

--sample 테이블에 새로운 값을 넣는다. 
insert into sample
values(30, '영업부', '광주', null);
select * from sample;

--deptNo가 30인 값을 50으로 변경한다.
update sample set deptNo = 50
where deptNo = 30;
select * from sample;

--deptname이 영업부인 컬럼의
--deploc를 인천으로 변경한다.
update sample set DEPLOC = '인천'
where deptName = '영업부';
select * from sample;

--deptname 영업부의 행을 삭제한다.
delete sample
where DEPTNAME = '영업부';
select * from sample;

delete from sample;
select * from sample;

/*컬럼속성(무결성 제약조건)
not null : 널값이 입력되지 못하게하는 조건
unique : 중복된 값이 입력되지 못하게 하는 조건 <null값허용함>

primary key : not unll + unique의 의미
--허용하지안는다<null + 중복>

foreign key(외래키) : 참조되는 테이블의 컬럼의값이 존재하면 허용한다
다른 테이블의 필드(컬럼)를 참조해서 무결성을 검사하는 조건
자식테이블이 부모테이블을 참조하는키

check : <주어진값만 허용하는 조건>
남 여 둘중하나만 들어오게만 하는조건
*/
/* not null*/
--co11에는 null이 들어가면 안되고
--co12에는 null값이 들어갈 수 있도록 제약조건을 준다.
create table null_test(
  col1 varchar2(20) not null,
  col2 varchar2(20) null,
  col3 varchar2(20)
);
select * from null_test;
desc null_test;

--null_test 테이블에서 co11,co12 컬럼에 값을 넣는다.
insert into null_test(col1, col2)
values ('aa', 'bb');
select * from null_test;

--co11값이 null이면 안되는데 null이여서 오류?
insert into null_test(col1,col2, col3)
values ('aa','cc', 'dd');


/*unique*/
create table unique_test(
--co11은 unique와 not null이므로
--primary key와 같은 제약조건을 의미한다.
  col1 varchar2(20) unique not null,
  col2 varchar2(20) unique,
  col3 varchar2(20) not null,--유니크아님
  col4 varchar2(20) not null,--유니크아님
  constraints temp_unique unique(col3, col4)
  --제약조건을준다 유니크이름temp_unique을준다
);--컬럼3과 4를 주엇을때 유니크여야만한다 
--예>지역번호와 전화번호가 합쳣을때는 그값은 유니크로 바뀐다는소리
select * from unique_test;
desc unique_test;

--컬럼에 각각의 값을 넣는다.
insert into unique_test(col1, col2, col3, col4)
values ('aa', 'bb', 'cc', 'dd');
select * from unique_test;

--1행에 값을 추가한 다음 2행에 새로운 값을 추가한다. 
insert into unique_test(col1, col2, col3, col4)
values ('a2', 'b2', 'c2', 'd2');
select * from unique_test;

--만약 co12가 b2인 행의 
--co11 값을 aa로 바꿔라.
--근데 이미 unique_test co11에는 aa가 존재하므로
--이 문장은 에러가 나는 것
update unique_test 
set col1 = 'aa'
--무결성위반 중복되니 col2은유니크unique, col1은not null
where col2 = 'b2';
---------------------------------------------------->>>
desc user_constraints;


insert into unique_test (col1, col2, col3, col4)
values('a3', '','c3', 'd3');
--unique인데 null값허용이라서 들어감// '' ==> 공백아님

insert into unique_test (col1, col2, col3, col4)
values('a4', '','c4', 'd4');--null이 두개라도 들어간다
select * from unique_test;



/*기본키(primary key) 테이블 생성시 기본키 생성*/

--primary_test 테이블 생성하는데
--student_id에만 제약조건을 줬다.
create table primary_test(
    student_id number(10) primary key, /*인라인 방식*/
    name varchar2(20)    
);

--위에 방식이랑 똑같은데 여기서는 아웃라인으로 만들어줬다. 
create table primary_test(
    student_id number(10),
    name varchar2(20),    
    constraints student_pk primary key(student_id) /*아웃라인 방식*/
);--제약사항을 주면 이름을부여한다 프라이머리키student_pk 이름을 만들어주고,
  --항목student_id을 만들어준다
drop table primary_test;
DESC PRIMARY_TEST;

create table primary_test(
    student_id number(10),
    name varchar2(20)      
);
/* 테이블을 생성하고 나서 이후에 기본키를 생성하는 방법 */
alter table primary_test
add constraints "기본키 이름" primary key (필드명) ;

--테이블 제약조건을 삭제하는 방법
alter table primary_test
drop primary key;


select constraint_name, constraint_type, r_constraint_name, table_name 
from user_constraints
where table_name in('PRIMARY_TEST');

select constraint_name, table_name, column_name 
from user_cons_columns
where table_name in('PRIMARY_TEST');

/* 외래키 */
--foreign_key 테이블을 생성하는데
--컬럼은 하나이고, 제약조건으로 dept_fk라는 조건명을 가지는 department_id 는
--departments 테이블의 department_id를 참조한다. 
create table foreign_key(
  department_id constraints dept_fk
  references departments (department_id) /*인라인*/
);--references departments부모키 테이블에 아이디department_id를 사용하겟다

select * from departments;
desc foreign_key;


DROP TABLE foreign_key;

create table foreign_key(
  department_id,
  constraints dept_fk
  foreign key (department_id)
  references departments (department_id)/*아웃라인*/
);

create table foreign_key(
    department_id number(10) primary key, 
    name varchar2(20)    
);

/*테이블을 생성하고 나서 외래키를 지정하는 방법 */
alter table foreign_key
add constraints dept_fk foreign key (department_id)
references departments (department_id);

select constraint_name, constraint_type, r_constraint_name, table_name 
from user_constraints
where table_name in('FOREIGN_KEY');

select constraint_name, table_name, column_name 
from user_cons_columns
where table_name in('FOREIGN_KEY');

/*check*/
drop table check_Test;
--check_test 테이블을 만드는데
--gender 컬럼은 반드시 값이 들어가야하고
--check_sex라는 제약조건명을 가진 제약조건 check를 받는데
--genger의 값은 'M'과 'F'값만 들어가야 한다.
create table check_test(
  gender varchar2(10) not null -- 젠더 필드
      constraints check_sex check (gender in('M','F'))
);--체크조건이름check_sex check
DESC CHECK_TEST;

--check_test 테이블을 만드는데
--gender 컬럼은 반드시 값이 들어가야하고
--check_sex라는 제약조건명을 가진 제약조건 check를 받는데
--여기선 GENDER값에 '남성', '여성'만 들어가야한다.
create table check_test(
  gender varchar2(10) not null
      constraints check_sex check (gender in('남성','여성'))
);

--남성이라는 값을 넣는데 첫 번째 생성했던 테이블에
--이 값을 넣으면 오류가 뜬다.
--아래 M값만 들어갈 수 있다. 
insert into check_test values('남성');
insert into check_test values('M');

select * from check_test;

select constraint_name, constraint_type, r_constraint_name, table_name 
from user_constraints
where table_name in('CHECK_TEST');

select constraint_name, table_name, column_name 
from user_cons_columns
where table_name in('CHECK_TEST');

-- 제약조건 삭제
-- ALTER TABLE '테이블명' DROP CONSTRAINT '제약조건명'
-- 테이블의 PK 제약조건 삭제
-- ALTER TABLE '테이블명' DROP PRIMARY KEY:

-- 제약조건 조회
--SELECT * FROM    ALL_CONSTRAINTS
--WHERE    TABLE_NAME = '테이블명';





--------------------------22-02-23 숙제---------------------------

/*조인(join): 일반적으로 '내부조인' 방식을 의미*/
select * from employees;

--employees 테이블의 별칭은 emp
--departments 테이블의 별칭은 dep
--테이블명.컬럼명으로 값들을 불러온다.
select emp.first_name, emp.last_name, emp.email,
      dep.department_name           --테이블명별칭.컬럼
from employees emp, departments dep --[테이블명 별칭]별칭을이용하겟다
--만약 emp랑 dep의 DEPARTMENT_ID가 같다면! 
where emp.DEPARTMENT_ID = dep.DEPARTMENT_ID; --where조건

select * from jobs;


--JOIN 여러 테이블들을 중첩한다. 
select emp.first_name, emp.last_name, emp.email,
       emp.department_id, dep.department_name,
       emp.job_id, job.job_title, loc.city
--FROM절에서 테이블의 별칭을 지정한다.
from employees emp,
     departments dep,
     jobs job,
     locations loc
where emp.department_id = dep.department_id --조인조건
  And emp.job_id = job.job_id --조인조건
  And dep.location_id = loc.location_id --조인조건
  And loc.city = 'Seattle'; --일반조건부터 먼저실행


/*셀프 조인*/
--셀프조인은 같은 테이블 내에서 다른 컬럼을 불러올 때 사용
--따라서 FORM 절에서 employees 별칭을 각각 EMP1, EMP2로 지정했다.
select emp1.EMPLOYEE_ID, emp1.first_name, 
       emp2.employee_id 상사id,--emp2.employee_id에잇는  상사id를가져오고
       emp2.first_name 상사이름 
from employees emp1, employees emp2 --자기자신의테이블을 두개별칭을 사용하여 나눠놓음
where emp1.MANAGER_ID = emp2.employee_id;
--emp1의 매니저상급자의 아이디와  emp2의 임플로이 아이디가 같아야한다


/*외부조인*/
--외부 조인 연산자 : + 외부 조인 연산자인 ‘+’는 정보가 부족한 
--테이블에 널(Null) 행을 추가 시키기 위한 연산자이다
--즉) 정확하게 하려면 (+) 써주는게 좋다.
select emp.employee_id,-- 내리면인출된 모든행이 늘어난다 107명 라인
       emp.first_name,
       emp.department_id,
       dep.department_name,
       loc.city
--각각 테이블의 별칭을 지정해준다.
from employees emp, departments dep, locations loc
where emp.department_id = dep.department_id (+)
-- 조인조건에 (+)를 해줘야 다 나오게된다 이게 외부조건임
--좌측 우측 둘중 하나만 사용 가능하다.
And   dep.location_id = loc.location_id (+); 
--위에 도시명을 출력하기위해 조건을하나더 준거임
-- (+)를 빼면 106명만나온다 전부표시하기위해 외부조인조건을 준것이다 킴벌리가 나오게된다
--외부조건으로 (+)를 넣어줘야 된다는 의미 ^~^
--left, right, full 중 어디에 해당되는지 쓰자.
--left를 기준으로 오른쪽에 null이 생겼기에 left 조인,,! 



/*서브쿼리*/
--salary 평균을 구하는데 round 함수를 써서
--반올림으로 올려준다.
select Round(avg(salary))
from employees;

--employees 테이블의 select 행으로 3개의 컬럼을 출력한다.
--where 절로 조건을 줬다. 
select employee_id, first_name, last_name
from employees
where salary < 6462; --위에서구한평균급여보다 작은

select employee_id, first_name, last_name
from EMPLOYEES
where salary < Round(avg(salary)); 
/*where 절에서는 집계함수 사용불가
따라서 아래처럼 서브쿼리 이용해줘야 한다.*/


--where절에 조건을 줘서 서브쿼리를 작성했다. 
--서브쿼리는 일단 select 문과 형식은 비슷한데
--() 괄호 안에 넣어줘야 한다.
select employee_id, first_name, last_name --메인쿼리
from EMPLOYEES
where salary < (select round(avg(salary)) 
--그래서 메인쿼리안에 select를 이용하여 서브쿼리문을 사용함
from employees);
                
select * from locations;

--state_province 값이 null인 값을 불러온다.
select location_id 
from locations
where state_province is null;

select * from departments;


--1.서브쿼리는 괄호로 묶어서 기술해야 한다. 
--2. 서브쿼리는 비교 연산자의 우측에 위치해야 한다.
--3.단일 행 서브쿼리에는 단일 행 비교 연산자(>,=, >=, <, <=, <>)만 사용 가능하다. 
--4.서브쿼리에 ORDER BY 절을 포함할 수 없다
--5.SELECT 문의 FROM절, WHERE절, HAVING 절에서만 사용할 수 있다.  
--6.다중 행 서브쿼리에는 다중 행 비교 연산자(IN, ANY, ALL)만 사용 가능하다
--7.다중 열 서브쿼리에는 서브쿼리가 반환한 두개 이상의 열을 
-- 한꺼번에 비교하기 위해서, IN 연산자 를 사용해야 한다. (권장한다)
--  = 도 사용가능하다.

--다중행을 출력하는 문장이기에
--단일행 연산자 = 사용이 불가능하고
--In을 써줘야 한다.

--locations 테이블에서 country_id 값이 us인!
--행의 location_id를 출력한다.
--그 값을 메인 쿼리에 넣어서 
--departments 테이블에 적용시켜서 가져온다.
select *
from departments
where location_id in ( select location_id 
-- in연산자사용하여 다중값을 출력
-- 서브쿼리에도 조건을 줄 수 있다. 
                      from locations
                      where country_id ='US' );
                      
--in연산자사용해서 로케이션아이디가 1400 1500 1700인걸 출력해보기
select *
from departments
where location_id in ( 1400, 1500, 1700 ); 


select * from dba_roles;
-------------------------------------------------------------------------------
--  1. 현재 오라클 포트번호 확인
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;
--  2. 포트번호 변경 (8080 →9090)
EXEC DBMS_XDB.SETHTTPPORT(9090);
---------------------------------------------------------------------------------

/*월급이 가장 적은 사원*/ 
--별칭을이용해서 구해보기
--단일행 서브쿼리이기에 = 연산자를 이용한다. 
select emp.first_name, emp.last_name, job.JOB_TITLE
from employees emp, jobs job --별칭을 이용해서 사용하면 편리하다.
where emp.salary = (select min(salary) from employees)
--emp, job 테이블의 컬럼명이 같으므로 구별을 해줘야 한다.
and emp.job_id = job.job_id;--월급이 가장적은 사원

--월급이 가장 많은 사원구해보기 별칭이용

select emp.first_name, emp.last_name, job.JOB_TITLE
from employees emp, jobs job --별칭이용
where emp.salary = (select max(salary) from employees)
and emp.job_id = job.job_id;--월급이 가장많은 사원 사장이된다

/*평균 급여보다 많이 받는 사원들의 명단 조회 */
select emp.first_name, emp.last_name, job.job_title
from employees emp, jobs job
where emp.salary >( select avg(salary) from employees)
and emp.job_id = job.job_id; --조인

/* any아무나, all */
select salary 
from employees
where department_id = 20;-- 두명이나온다

SELECT department_id FROM employees;

--ANY, SOME 메인쿼리 비교조건이 서브쿼리가 반환한 목록의 각각의 값과 비교한다.
--결과와 하나 이상이 일치하면 참 값
select employee_id, department_id, salary
from employees 
where salary > any ( select salary 
-- 6000 13000 위에 두명6000이상나오게된다 
from employees
where department_id = 20);
--20부서의 사람급여인 두명인데 ,여기서 최소가 6000이다
--이사람보다 많이 받는 것을 조회하는겁니다
--즉 6000과 13000 중에 조건이 성립하면,
--즉 6000보다 큰 값들의 SALARY 값을 출력하는 것

select employee_id, department_id, salary
from employees 
where salary > ( select min(salary)
from employees
where department_id = 20);                     


--ANY는 둘 중의 하나의 조건만 만족해도
--ALL은 모두 만족해야 하므로
--ALL을 사용하면 13000보다 큰 값들만 출력하게 된다.
select employee_id, department_id, salary
from employees 
where salary > all( select salary 
--6000 13000 이중에 모든것보다 커야한다 그래서 13000이상나와야한다
from employees
where department_id = 20);                 
                                          
select employee_id, department_id, salary 
-- 13000이상나오게 한다 맥스로한다
from employees 
where salary > ( select max(salary)
                     from employees
                     where department_id = 20);                      
                     
                     
--IN은 그 값이 해당해야 된다
--단일행에서 = EQAUL과 같은 의미이기 때문에
--6000, 13000 SALARY 값들만 출력한다.
select employee_id, department_id, salary -- 다중값이용 in
from employees 
where salary in ( select salary 
                     from employees
                     where department_id = 20);

--단일 행 서브쿼리 
--(1) 단일 행 서브쿼리의 형식 
--    - 선택리스트에는 열 이름이나 그룹함수를 나열하고, 
--단일 행 비교 연산자에는 =, <>,--<, <=, >, >=를 사용할 수 있다. 
-- 
--SELECT    선택리스트1 
--FROM       테이블 이름1 
--WHERE     표현식 연산자 
--                         (SELECT    선택리스트2 
--                          FROM       테이블 이름2) ;
--
--? 다중 행 서브쿼리 
--(1) 다중 행 서브쿼리의 형식 
--     - 선택리스트에는 열 이름이나 그룹함수를 나열하고, 단일 행 비교 연산자에는 IN,  
--ANY, ALL이 있다.
-- 
--SELECT    선택리스트1 
--FROM       테이블 이름1 
--WHERE     표현식 다중행비교연산자 
--                         (SELECT    선택리스트2 
--                          FROM       테이블 이름2) ;
--
--? 다중 열 서브쿼리 
--(1) 다중 열 서브쿼리의 형식 
--서브쿼리가 반환한 두개 이상의 열을 한꺼번에 비교하기 위해서, 반드시 IN 연산자 
--를 사용해야 한다. =도 사용가능하다.
-- 
--SELECT    선택리스트1 
--FROM       테이블 이름1 
--WHERE     (열이름1, 열이름2, ....) IN 
--                         (SELECT (열이름1, 열이름2, ....)
--                          FROM       테이블 이름2 
--                          WHERE     조건) ;     

SELECT employee_id,first_name,job_id,salary
from employees
--FRIST_NAME이 BRUCE인 행의 manager_id,job_id 를 정의한다.
where(manager_id,job_id) in (select manager_id,job_id
                            from employees
                            where first_name='Bruce')
--^=는 <>와 !=와 동등하다 즉 같지않다.
--여기서 AND 조건은 EMPLOYESS 테이블에서 
--FRIST_NAME이 Bruce가 아닌 조건
and first_name <> 'Bruce';
--서브쿼리의 셀렉트 문에 여러개의 컬럼을 검색한다
--반드시 비교대상 컬럼과 1:1대응되야 한다
--즉) IN 연산자 좌측의 값과 SELECT 다음 우측 컬럼의 값이 같아야 한다.
--브루스와 동일한 상사이면서 같은 직업인 사원을 검색한것이다



select manager_id,job_id
from employees
where first_name='Bruce';
--서브쿼리만 보면 검색조건에 기술하는 컬럼들이 1:1대응하여 
--모두 같아야 검색된다
--검색조건이 동시에 검색된 두 개의 컬럼과 비교 될때 다중 열 서브쿼리를 이용한다

SELECT employee_id,first_name,job_id,salary
from employees
where manager_id in 
(select manager_id from employees where first_name='Bruce')
and job_id in 
(select job_id from employees where first_name = 'Bruce')
and first_name <> 'bruce';

--그룹함수를 이용하여 각 부서별로 최소급여를 받는 사원의 정보를 구하라
--조건은 각 부서의 번호와 최소급여가 둘 다 일치하는 사원을 찾는문제인데
SELECT department_id,employee_id,first_name,job_id,salary
from employees
where(department_id,salary) in 
(select department_id,min(salary)
from employees
group by department_id)
order by department_id;
--결과
--10   200  Jennifer AD ASST   4400
--20   202  PAT      MK REP    6000
--12개의 행이 나오게된다
--마지막행
--110  206  William AC ACCOUNT 8300



--------------------------22-02-24 숙제---------------------------

/*view*/-- 가상의 논리적공간을 만드는
drop view v_emp;

--view를 만들건데 이름은 v_emp이다.
--여기서 만들 컬럼은 아래 지정한 5개가 있다. 
--근데 괄호 안에 이렇게 직접 컬럼들 넣지 않아도된다.
--as 뒤에 select에서 어느 컬럼들을 가져올지 적기 때문에 
create view v_emp
(emp_id, first_name, job_id, hiredate, dept_id) 
as
select employee_id, first_name, job_id, hire_date, department_id
--employees 테이블의 조건으로
--job_id가 ST_CLERK인 값들을 가져온다.
from employees
where job_id = 'ST_CLERK';
-- 대문자주의 id// as 이하절에서 논리적인 집합안에서 가져올수잇다

select * from v_emp;

--위에랑 똑같은 방식으로 이번에는
--JOB_ID가 SH_CLERK인 EMPLOYEES 테이블의 값들을 가져온다. 
create view v_emp1(emp_id, first_name, job_id, hiredate, dept_id) as
select employee_id, first_name, job_id, hire_date, department_id
from employees
where job_id = 'SH_CLERK';-- 대문자로 id

select * from v_emp1;


drop view v_emp1;

--수정할때 하는뷰명령어
--기본뷰를 삭제하고 새로 만든다. ( 기존 뷰가 없어도 오류 없이 생성)
--CREATE VIEW가 아닌 CREATE OR REPLACE VIEW 명령어를 넣어준다.
--코드를 살펴보면 처음 생성한 V_EMP와 내용은 다르지 않기에 같은 출력값! 
create or replace view v_emp(emp_id, first_name, job_id, hiredate, dept_id) as
select employee_id, first_name, job_id, hire_date, department_id
from employees
where job_id = 'ST_CLERK';

select * from v_emp;

--입사일을 기준으로 오름차순 정렬한후 rownum컬럼 출력하기
--ROWNUM
--내장 함수는 아니지만 자주 사용되는 문법이다.
--오라클에서 내부적으로 생성되는 가상 컬럼의 SQL 조회 결과의 순번을 나타낸다.
--자료를 일부분만 확인하여 처리할 때 유용함
--ROWNUM : 조회된 순서되로 순번을 매긴다.
--생성한 뷰를 불러오는데, ROWNUM을 추가해서 순번 컬럼을 출력했다.
--하지만 순서를 HIREDATE에 맞췄기에 순번은 뒤죽박죽! 
--고용일은 제일 먼저 고용된 순으로 출력 
SELECT ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
FROM v_emp
ORDER BY hiredate;

--위와 같이 ROWNUM이 뒤죽박죽 되는 이유는 쿼리 문의 진행순서이기 때문이다. 
--FROM - WHERE - (GROUP BY) - SELECT - ORDER BY 순으로 쿼리가 진행된다. 
--때문에 SELECT이 진행되었을 때 이미 ROWNUM은 매겨진 상태이고 
--그 상태에서 ORDER BY를 통한 정렬이 발생하니 위와 같은 결과가 나오는 것이다.

/*
따라서 
먼저 FROM 절에서 SEE_INFO TABLE을 나이순으로 정렬시킨 뒤 그 이후 값에 ROWNUM을 붙여주는 것이다, 
결과를 확인해보면 나이순으로 정렬됨과 동시에 ROWNUM도 나이에 따라 순서대로 부여된 것을 확인할 수 있다.

*/

select rownum, sl1.* from(select * from v_emp order by hiredate) sl1;


--입사일이 빠른 9명만을 얻어오기 rownum where조건을 주어서해보기
--emp_id, first_name, job_id, hiredate, dept_id

--select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
--from v_emp
--where rownum<=9
--order by hiredate;

select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
from v_emp
where rownum<=9;

--위에 문장으로 그냥 하면 뒤죽박죽 
--미리 매겨진 rownum으로 입사일 기준으로 나오지 않는데
--이렇게 아래 문장으로 하면 고용일 기준으로 나온다.! 
select rownum, sl1.* from(select * from v_emp order by hiredate) sl1
where rownum<=9;


select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
from v_emp;

--뷰 생성 및 수정은 CREATE OR REPLACE VIEW라고 기억해두시면 됩니다. 
--CREATE는 생성, REPLACE는 수정인데 CREATE OR REPLACE라고 명시해줬을경우 
--★ 타겟 뷰이름이 없을경우 CREATE를 하고 있을경우 REPLACE를 합니다.
--v_emp3뷰만들기 아이디와 퍼스트네임이 널이면 널처리해주기
--emp_id, first_name, job_id, hiredate, dept_id
--job_id = 'SH_CLERK'
--nvl함수를이용하면 null이면 수정할수없도록 함수를 이용하는것이다--정보보안
create or replace view v_emp3(emp_id,first_name,job_id,hiredate,dept_id) as
--NVL 함수를 이용해서 값이 NULL 이면 뒤에 값으로 대체되어 출력되는데
--여기서 NULL로 지정했다. 
select nvl(employee_id, null), nvl(first_name,null), 
           job_id, hire_date, department_id
from employees --nvl함수는 employee_id가 null이면 널로처리하겟다
where job_id = 'SH_CLERK';


desc v_emp3;
select * from v_emp3;

--수정하려고하지만 <함수를이용해서 가상열>은 허용수정이안된다
--즉) V_EMP3의 FIRST_NAME은 NVL 함수를 이용해 조건을 줬다.
--이렇게 VIEW를 생성할 때 조건을 준 컬럼은 수정이 불가능하다.
update v_emp3 set first_name = 'kim'
where first_name = 'Julia';
--<함수를사용안하면> 수정이 된다
update v_emp set first_name = 'kim'
where first_name = 'Julia';

select * from v_emp;

--(salary + nvl(commission_pct,0))*12 연봉구하기연산식
--v_emp_salary(emp_id, last_name, annual_sal)

--emplyees테이블로부터 구하기
--V_ENP_SALARY 뷰를 만드는데,,
--여기서 SALARY 값을 그냥 주지 않고 연산을 통해 주었다. 
create view v_emp_salary(emp_id, last_name, annual_sal) as
select employee_id, last_name, (salary+nvl(commission_pct, 0))*12
--commision_pct 항목이 널이면 0으로 처리하겟다<연봉연산구하기>
from employees;
--nvl함수는 commission_pct가 널이면 0으로처리하겟다

select * from v_emp_salary;

--WITH READ ONLY 옵션은 뷰를 통해서는 기본 테이블의 어떤 컬럼에 대해서도 내용을
--절대 변경할 수 없도록 하는 것
create view v_emp_readonly(emp_id, last_name, annual_sal) as
select employee_id, last_name, (salary+nvl(commission_pct, 0))*12 
from employees
with read only;-- 데이터를 수정할수없도록하는 또하나의 방법

desc v_emp_readonly;

select * from v_emp_readonly;

update v_emp_readonly set last_name = 'kim'
where last_name = 'Grant';--수정할수없다 

--컴퓨터에서 인식하는 날짜중 첫번째 날짜는 1900년 1월 1일입니다.
--이걸 숫자로 변환하면 0이되구요.그래서 날짜를 숫자처럼 사용
--또한 오늘날짜에서 3일전 날짜를 구하고자 한다면 SYSDATE - 3 사용가능

--수정하는view테이블명령어 create or replace view를 사용한다
--년봉4만이넘고,부서는50,잡아이디는ST_CLERK 이고 5년이상근무해야한다
--employees 테이블로부터employee_id, last_name, department_id,
--hire_date,job_id를 구해보기 v_samp1로 만드세요
--조건들을 AND를 이용해서 다중 조건을 주었다. 
create or REPLACE view v_samp1 as
select employee_id, last_name, department_id, hire_date,job_id
from employees
where (salary + nvl(commission_pct,0))*12 > 40000
and department_id = 50
and job_id ='ST_CLERK'
--5년 이상 근무한다는 코드
and sysdate - 365 * 5> hire_date;

select * from v_samp1;





--------------------------22-02-25 숙제---------------------------
--여기서부터 정리해보자 



--수정할때 하는뷰명령어
--기본뷰를 삭제하고 새로 만든다. ( 기존 뷰가 없어도 오류 없이 생성)
--CREATE VIEW가 아닌 CREATE OR REPLACE VIEW 명령어를 넣어준다.
--코드를 살펴보면 처음 생성한 V_EMP와 내용은 다르지 않기에 같은 출력값! 
create or replace view v_emp(emp_id, first_name, job_id, hiredate, dept_id) as
select employee_id, first_name, job_id, hire_date, department_id
from employees
where job_id = 'ST_CLERK';

select * from v_emp;

--입사일을 기준으로 오름차순 정렬한후 rownum컬럼 출력하기
--ROWNUM
--내장 함수는 아니지만 자주 사용되는 문법이다.
--오라클에서 내부적으로 생성되는 가상 컬럼의 SQL 조회 결과의 순번을 나타낸다.
--자료를 일부분만 확인하여 처리할 때 유용함
--ROWNUM : 조회된 순서되로 순번을 매긴다.
--생성한 뷰를 불러오는데, ROWNUM을 추가해서 순번 컬럼을 출력했다.
--하지만 순서를 HIREDATE에 맞췄기에 순번은 뒤죽박죽! 
--고용일은 제일 먼저 고용된 순으로 출력 
SELECT ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
FROM v_emp
ORDER BY hiredate;

--위와 같이 ROWNUM이 뒤죽박죽 되는 이유는 쿼리 문의 진행순서이기 때문이다. 
--FROM - WHERE - (GROUP BY) - SELECT - ORDER BY 순으로 쿼리가 진행된다. 
--때문에 SELECT이 진행되었을 때 이미 ROWNUM은 매겨진 상태이고 
--그 상태에서 ORDER BY를 통한 정렬이 발생하니 위와 같은 결과가 나오는 것이다.

/*
따라서 
먼저 FROM 절에서 SEE_INFO TABLE을 나이순으로 정렬시킨 뒤 그 이후 값에 ROWNUM을 붙여주는 것이다, 
결과를 확인해보면 나이순으로 정렬됨과 동시에 ROWNUM도 나이에 따라 순서대로 부여된 것을 확인할 수 있다.

*/

select rownum, sl1.* from(select * from v_emp order by hiredate) sl1;


--입사일이 빠른 9명만을 얻어오기 rownum where조건을 주어서해보기
--emp_id, first_name, job_id, hiredate, dept_id

--select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
--from v_emp
--where rownum<=9
--order by hiredate;

select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
from v_emp
where rownum<=9;

--위에 문장으로 그냥 하면 뒤죽박죽 
--미리 매겨진 rownum으로 입사일 기준으로 나오지 않는데
--이렇게 아래 문장으로 하면 고용일 기준으로 나온다.! 
select rownum, sl1.* from(select * from v_emp order by hiredate) sl1
where rownum<=9;


select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
from v_emp;




--view 사원 (사번, 이름, 부서번호, 입사일)구하고,부서번호는 50 뷰 만들기
--퍼스트네임과 라스트네임사이를 띄어주세요<문자열결합>
--||'띄어쓰기 '||문자열결합
create view 사원 (사번, 이름, 부서번호, 입사일) as
select employee_id, first_name||' '||last_name, department_id, hire_date
from employees
where department_id = 50;

select * from 사원;

drop view v_join;

--v_join 뷰를 생성하는데 컬럼 명을 () 괄호 안에 적어논대로 지정한다.
--as 를 통해서 아래 select로 테이블의 데이터를 복제한다.
--복제할 컬럼은 emp의 emp_id, emp의 name emp의 dp_id
-- dept의 dp_name emp의 hiredate
--여기서는 employoees 테이블과 departments 테이블을 조인시켜서
--두 테이블의 department_id 값이 같은 값들을 복제하는 조건을 줬다.
create view v_join(사번, 이름, 부서번호, 부서명, 입사일) as
select emp.employee_id, emp.first_name||' '||emp.last_name, 
       emp.department_id, --부서번호
--||'띄어쓰기 '||문자열결합
dept.department_name, emp.hire_date
from employees emp, departments dept
where emp.department_id = dept.department_id;
--조인조건 부서번호가 같은경우

select * from v_join;


--------------------------22-02-25 숙제---------------------------

/*계층형 쿼리*/
--bom 자재명세서 계층구조 부모노드 자식노드 리프(마지막)노드
--bom_sphone 테이블을 생성하는데
--item_id 컬럼에 제약조건으로 pk랑 nn을 줬다. 
create table bom_sphone(
  item_id number(3) not null,
  parent_id number(3),
  item_name varchar2(20) not null,
  primary key (item_id)
);

--테이블을 생성한 다음 insert로 값 넣어주기 
순서는 item_id, parent_id , item_name
insert into bom_sphone values(100, null, '스마트폰');--부모없다최상위루트
insert into bom_sphone values(101, 100, '메인pcb');--100부모
insert into bom_sphone values(102, 100, '배터리');
insert into bom_sphone values(103, 101, 'CPU');--101부모
insert into bom_sphone values(104, 101, '메모리');--101부모
insert into bom_sphone values(105, 101, '블루투스');

select * from bom_sphone;

--bom_sphone 테이블의 AS로 S1, S2 각각 설정했다.
--S1의 아이템 이름, S1의 아이템 아이디 S2의 아이템 이름을 AS로 parent_name으로 지정
--여기서 S2의 아이템 이름은!! 
--S1의 부모 이름과 S2의 아이템 이름이 같다면 S2의 아이템 이름을 출력하는 거니까
--즉)) S1의 부모 테이블의 NUMBER에 해당하는 이름을 출력하는 것.! 
select s1.ITEM_NAME, s1.item_id, s2.ITEM_NAME parent_name --self조인을해준다
from bom_sphone s1, bom_sphone s2
WHERE s1.PARENT_ID = s2.ITEM_ID (+) --외부조인(+)을 이용해서 전부나오게해준다
order by s1.ITEM_ID;
-- 계층구조로 나오지안는다 메인pcb밑에 cpu순으로 나와야하므로 그래서 밑에방식으로해준다



/* start with, connect by 절을 이용해서 계층형 쿼리를 할 수 있다.*/
--LPAD 함수는 지정한 길이 만큼 왼쪽부터 특정문자로 채워준다.
-- 함수  :  LPAD("값", "총 문자길이", "채움문자")
--여기선 LEVEL은 계층형 쿼리의 순서
--즉) 스마트폰은 1번째 스마트폰의 자식들은 메인 PCB와 배터리
--스마트폰의 자식인 메인 PCB의 자식인 CPU,메모리,블루투스 
--따라서 이에 맞게 1부터 3까지 LEVEL이 주언진다. 
-- ★|| 를 이용해서 공백과 ITEM_NAME 컬럼의 값을 붙인다
--||는 문자 붙일때 이용하는 연산자 
select LEVEL,lpad(' ', 2*(level-1)) || item_name itemnames --별칭itemnames으로 출력
from bom_sphone             
--lpad('공백', 2*(level-1) 계층형으로 보여주려는공식 여기서 2는 계층형이 3개라면 2로해준다
--LEVEL을 지정할 시작점 즉) 최상위 계층은 PARENT_ID로 지정하는데
--PARENT_ID는 부모가 없으니까 값을 NULL로 지정 
start with parent_id is null  --최상위 부모 루트가 널인값으로지정
/*connect by prior item_id = parent_id*/
--item_id가 부모아이디가 들어오면 부모의행을 찾아서 연결시키겟다라는의미
connect by  parent_id = prior item_id;--prior 는 부모의 행을 찾는거다
--현재item id가 부모의 행을 찾아서 그행의 값을 parent_id값에 넣겟다 라는의미이다


--위에 예제랑 비슷하게 이번엔 EMPLOYEES 테이블에서 
--MANAGER_ID랑 EMPLOYEE)ID가 같을때를 계층형 구조 조건을 설정해서
--총 5계층이므로 제일 높은 직급부터 LEVEL을 지정한다.
--띄는 간격을 4로 지정하고 LEVEL-1 값만큼 왼쪽에서 띄워서 출력
select level,
       lpad(' ', 4*(level-1)) || first_name || ' ' || last_name "이름" 
       --5계층이면 4로해준다
from employees
start with manager_id is null
connect by manager_id = prior employee_id;


--FROM 절에서 조인을 이용하는데
--EMPLOYEES 테이블의 직원 이름과 JOBS 테이블의 직위를 출력한다. 
--만약) EMP 테이블의 JOB_ID와 JOB 테이블의 JOB_ID가 같은 데이터 들만
--출력하게 만든다.! 
select LEVEL, jb.job_title "직위", --조인을 사용해서 계층형쿼리를 해준다
       lpad(' ', 4*(level-1)) || emp.first_name || ' ' || emp.last_name "이름"
from employees emp, jobs jb
where emp.job_id = jb.job_id
start with emp.manager_id is null
connect by emp.manager_id = prior emp.employee_id;






--------------------------22-02-28 숙제---------------------------

/*시퀀스(sequence): 연속적인 번호를 만들어주는 기능 
 구문형식 
create sequence 시퀀스 이름
   increment by n <- n: 증가값을 설정 2: 2씩 증가 / 기본값: 1 설정   
   start with n <- 시작값 설정 / 기본값은 1
   maxvalue n | nomaxvalue <- 시퀀스 최대값을 설정
   minvalue n | nominvalue <- 시퀀스 최소값을 설정 : 
                              cycle 옵션일경우 시작값
   cycle | nocycle <-시퀀스를 순환 사용할지를 설정
   cache n | nocache <- 시퀀스의 속도를 개선하기위해 캐싱여부 지정
   데이터 접근을 빠르게 할 수 있도록 미래의 요청에 대비해 데이터를 
             저장해 두는 임시 장소를 말한다
*/

/* 시퀀스 생성 : 제품번호 생성하는 시퀀스 만들기*/
--seq_serial_no 시퀀스 만드는데
--1씩 증가하며 시작값은 100이고 max는 110 min은 99로 순환하며 캐시값은 2인 시퀀스 만들기

create sequence seq_serial_no  --이 이름으로 값을 넣게된다
increment by 1  --1씩증가
start with 100  --100으로시작
maxvalue 110   --최대값까지가면
minvalue 99    --다시 최소값으로 
cycle         --순환
cache 2;

--현새 시퀀스 값 확인해보면 100! 
SELECT seq_serial_no.NEXTVAL FROM dual;
SELECT seq_serial_no.CURRVAL FROM DUAL;

-- 새로운 테이블을 만든다 
create table good(
  good_no number(3),
  good_name varchar2(10)
);
drop table good; --삭제하고 다시해도 seq 번호가 증가한다

--good_no 값에다가 seq_serial_no.nextval을 입력해서 삽입하면
--자동으로 여러 값을 넣었을 때 no가 올라가게 된다. 
insert into good 
values(seq_serial_no.nextval, '제품1'); /*nextval: 다음값*/

select sequence_name, min_value, max_value,
         increment_by, cycle_flag
from user_sequences;

select * from good;

--good 테이블에 값을 넣는데 이번엔 nextval이 아닌
--currval을 넣었기에 이전 테이블에 삽입됐던 good_no와 같은 값이 들어간다.
--만약 nextval 해주면 102가 되는 것! 
insert into good 
values(seq_serial_no.currval, '제품2'); /*currval:현재값*/

select seq_serial_no.currval from dual; -- 현재값을 확인하는
--13개의 nextval게속 데이터를 넣어보고,12번째 110이넘어가면
--다시 99번째로 순환한다 그담 100 101..

select * from good;
drop sequence seq_serial_no2;
drop table good2;

--새로운 테이블 good2를 생성한다.
create table good2(
  good_no number(3),
  good_name varchar2(10)
);

select * from good2;

--시퀀스를 생성하는데 증가 값은 1 시작값은 100
--최대값은 105 캐시는 2로 설정한다. 
--이렇게 최소값 생략하고 cycle 순환으로 값을 지정하지 않으면
--최대값에 순번이 다달았을 때 에러가 나며 값 삽입이 중단된다.
--최소값 입력하고 cycle 안줘도 똑같음.! 
--만약 cycle로 주고 최소값을 입력 안한다면 값은 들어가는데
--다시 시작하는 값이 1로 설정되게 된다.!!!! 
create sequence seq_serial_no2 --시퀀스를 다시 생성
increment by 1
start with 100
maxvalue 105     --minvalue를 생략
cache 2;

create sequence seq_serial_no2 --시퀀스를 다시 생성
increment by 1
start with 100
maxvalue 105--minvalue를 생략
minvalue 99
cycle
cache 2;



--값을 넣을 때 무조건 nextval을 먼저 입력해야 된다 앞에서 했었다.!
--그렇기에 여기서도 에러가 나는 것. 무조건 첫 번째 값은 nextval로 시작.
insert into good2
values(seq_serial_no2.currval,'제품1');

--nextval을 넣어서 시작값인 100이 들어가게 된다. 
insert into good2
values(seq_serial_no2.nextval,'제품1');
insert into good2
values(seq_serial_no2.nextval,'제품2');
insert into good2
values(seq_serial_no2.nextval,'제품3');
insert into good2
values(seq_serial_no2.nextval,'제품4');
insert into good2
values(seq_serial_no2.nextval,'제품5');
insert into good2
values(seq_serial_no2.nextval,'제품6');
--cycle로 설정하지 않고 최소 값을 지정하지 않았기에
--105로 설정해둔 최대값을 넘어가면 오류가 난다. 
insert into good2
values(seq_serial_no2.nextval,'제품7');



select seq_serial_no2.currval from dual;

commit;

select * from good2;

drop sequence seq_serial_no2;

/* 시퀀스 삭제 
drop sequence seq_serial_no2;   =>시퀀스명
*/
--sqlplus에서 데이터베이스 시작하는명령어 startup; 
--강제종료 shutdown abort;
--shutdown abort강제종료가 발생하더라도 다시접속해서
--seq증가하면서 다음value로 잡힌다 cache에 대한설명하려고




