--실습할 계쩡을 만들었다.

Select round(180.125,2) from dual;
Select nvl(mgr, 0) from emp;

select * from emp;

select date_format(sysdate, '%Y-%m-%d') from dual;


SELECT MONTHS_BETWEEN(TRUNC(SYSDATE,'YEAR'),
                      TRUNC(TO_DATE('971023','YYYYMMDD'),'YEAR')) /12 +1 FROM DUAL;



--------------------------22-02-16 수업내용---------------------------
--오라클은 대소문자 구분하지 않는다.
--단) 인용구에서만 빼고
select * from tab;
--작성된 테이블 목록 확인 
--DAUL 테이블이란?
--DUAL 테이블을 바로 산술 연산의 결과를 한 줄로 얻기 위해서 오라클에서 제공하는 테이블이다.
SELECT * FROM DUAL;
--dual 테이블은 사용자가 함수(계산)을 실행할 때 임시로 사용하는데 적합하다
--함수에 대한 쓰임을 알고 싶을 때 특정 테이블을 생성할 필요없이 dual 테이블을 이용하여 함수의 값을 return 받을 수 있다.
SELECT 24*60 FROM DUAL;
--dual 테이블을 이용하여 24*60값 리턴


desc emp;

--테이블 구조 
--내용을 지우는 건 delete drop은 테이블 자체를 지우기에 조심해야 한다.
--데이터가 엉킬 수 있기에 drop으로 싹 다 지워버린다.
-- 부서 테이블 제거하기
DROP TABLE EMP;
-- 사원 테이블 제거하기
DROP TABLE DEPT;
-- 급여 테이블 제거하기
DROP TABLE SALGRADE;

DROP TABLE EMPLOYEE;

DROP TABLE DEPARTMENT;

DROP TABLE SALGRADE;

-- 부서(DEPARTMENT) 테이블 생성하기
CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC   VARCHAR2(13) ) ;

-- 사원(EMPLOYEE) 테이블 생성하기
CREATE TABLE EMP( 
    --EMPNO 컬럼의 숫자는 4자리까지 가능하고 제약조건의 이름은 PK_EMP이며
    --필수 제약 조건으로 PRIMARY KEY로 설정했다. 
      EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
    ENAME VARCHAR2(10),
     JOB   VARCHAR2(9),
    MGR  NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),--자릿수가 7이고 소숫점 2자리 까지
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);

 -- 급여 테이블 생성하기
CREATE TABLE SALGRADE(
    GRADE NUMBER,
    LOSAL NUMBER,
    HISAL NUMBER );

-- 부서 테이블에 샘플 데이터 추가하기
INSERT INTO DEPT VALUES(10, '경리부', '서울');
INSERT INTO DEPT VALUES(20, '인사부', '인천');
INSERT INTO DEPT VALUES(30, '영업부', '용인'); 
INSERT INTO DEPT VALUES(40, '전산부', '수원');

-- 사원 테이블에 샘플 데이터 추가하기
INSERT INTO EMP VALUES(1001, '김사랑', '사원', 1013, to_date('2007-03-01','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1002, '한예슬', '대리', 1005, to_date('2007-04-02','yyyy-mm-dd'), 250,   80, 30);
INSERT INTO EMP VALUES(1003, '오지호', '과장', 1005, to_date('2005-02-10','yyyy-mm-dd'), 500,  100, 30);
INSERT INTO EMP VALUES(1004, '이병헌', '부장', 1008, to_date('2003-09-02','yyyy-mm-dd'), 600, NULL, 20);
INSERT INTO EMP VALUES(1005, '신동협', '과장', 1005, to_date('2005-04-07','yyyy-mm-dd'), 450,  200, 30);
INSERT INTO EMP VALUES(1006, '장동건', '부장', 1008, to_date('2003-10-09','yyyy-mm-dd'), 480, NULL, 30);
INSERT INTO EMP VALUES(1007, '이문세', '부장', 1008, to_date('2004-01-08','yyyy-mm-dd'), 520, NULL, 10);
INSERT INTO EMP VALUES(1008, '감우성', '차장', 1003, to_date('2004-03-08','yyyy-mm-dd'), 500,    0, 30);
INSERT INTO EMP VALUES(1009, '안성기', '사장', NULL, to_date('1996-10-04','yyyy-mm-dd'),1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '이병헌', '과장', 1003, to_date('2005-04-07','yyyy-mm-dd'), 500, NULL, 10);
INSERT INTO EMP VALUES(1011, '조향기', '사원', 1007, to_date('2007-03-01','yyyy-mm-dd'), 280, NULL, 30);
INSERT INTO EMP VALUES(1012, '강혜정', '사원', 1006, to_date('2007-08-09','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1013, '박중훈', '부장', 1003, to_date('2002-10-09','yyyy-mm-dd'), 560, NULL, 20);
INSERT INTO EMP VALUES(1014, '조인성', '사원', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);

-- 급여 테이블에 샘플 데이터 추가하기
INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);
--★커밋으로 완료까지 해야한다.
COMMIT;


desc emp;
--테이블 구조 


--SELECT는 데이터 베이스 내에 저장되어있는 테이블을 조회하기 위한 명령어
--SELECT 다음에는 보고자 하는 대상의 컬럼명을 기술한다.
--SELECT 다음에 *을 기술하면 지정된 테이블의 모든 컬럼을 조회한다.
--FROM 다음에는 보고자 하는 대상의 테이블 이름을 기술한다.

SELECT * FROM emp; --전체 표를 보여준다.
SELECT empno,ename FROM emp; -- empno,ename만 보여준다.

select * from dept;


--AS로 컬럼에 별칭 부여하기, 컬럼명 대신 별칭을 출력하고자 하면 컬럼을 기술한 바로 뒤에 있는 AS라는 키워드를 쓴 후 별칭을 기술한다.
--EMP 테이블로부터 ename, sal 연봉 구하기
SELECT ename,sal*12 AS 연봉 FROM emp;
SELECT ename,sal*12 연봉 FROM emp; --as가 생략되어 있다.
SELECT ename,sal annual FROM EMP; --as가 생갹되어 있다.
SELECT ename,sal*12+nvl(comm,0) "Annsal" FROM emp; --as 생략 대신 "" 사용

--컬럼 이름에 별칭 지정해서 출력하기 from dept
SELECT deptno as "부서번호", dname"부서명" from dept; --as가 생략되어있다.

SELECT ename,sal*12+nvl(comm,0) as 연봉 from emp; --에러나는 이유는? commit -> comm으로 바꿔준다.

SELECT ename,sal,job,sal*12,sal*12+comm,comm,deptno FROM emp;

--NVL 함수
--NVL("값","대체값")
--NVL 처리를 위한 함수로 해당 컬럼의 값이 NULL인 경우 다른 값으로 대체하여 출력


SELECT DEPTNO FROM EMP;
--중복된 데이터를 한 번씩만 출력하게 하는 DISTINCT
--EMP테이블의 DEPTNO 컬럼의 값들을 불러오는데 중복된 값은 제거한다
SELECT distinct DEPTNO FROM EMP;


--오라클에서 여러개의 컬럼을 연결할 때 사용하기 위해서 Concatenation
--연산자를 제공해줍니다. 영 문장처럼 보이도록 하기 위해서 "||"를 컬럼과
--문자열 사이에 기술하여 하나로 연결하여 출력하면 된다. 
SELECT ename || '의 직급은 ' ||job||'입니다.' as 직급 FROM emp;

SELECT * FROM emp WHERE sal >=500;
--emp 테이블에서 조건 sal>=500을 조회
SELECT * FROM emp WHERE sal ^=500;
--emp 테이블에서 ^=는 <>와 !=와 동등하다 즉 같지않다.

SELECT * FROM emp WHERE ename='이문세';
--↓ invalid identifier : 부적절한 식별자
SELECT * FROM emp WHERE ename="이문세";

--특정 조건의 데이터만 조회하는 WHERE 조건
--원하는 로우만 얻으려면 로우를 제한하는 조건을 SELECT 문에
--WHERE 절을 추가하여 제시해야 한다. 

--입사일이 2005/03/20 이정
SELECT *
FROM emp
where hiredate <to_date('2005/03/20','YYYY/MM/DD');

--문) EMP 테이블로부터 조건절에서 부서번호가 10인 부서를 조회하세요

SELECT * FROM emp WHERE DEPTNO=10;

--문) 논리연산자(AND, OR, NOT) 를 사용하여 10번 부서이고, 직급이 과장인 사람을 조회해보세요
SELECT * FROM emp WHERE DEPTNO=10 AND JOB='과장';

--BETWEEN AND 연산자
--특정 범위 내에 속하는 데이터인지 알아보기 위해서 
--비교연산자와 논리연산자를 결합하여 표현할 수 있다.
--COLUMN_NAME BETWEEN a AND b;

--문) 급여가 400~500 사원 출력하기
select * from emp WHERE sal BETWEEN 400 and 500;

--IN연산자 
--특정 필드의 값이 A이거나 B이거나 C중에 어느 하나만 만족하더라도
--출력하도록 하는 표현을 IN 연산자를 사용하여 할 수 있다.
--COLUMN_NAME IN(A,B,C);
--문) IN 연산자를 사용하여 커미션이 80이거나 100이거나 200인 사원 조회하기
SELECT * FROM EMP WHERE COMM IN(80,100,200);

--문) hiredate와 between을 사용하여 2003년에 입사한 직원을 출력하세요.

select * from emp where hiredate BETWEEN to_date('2003/01/01','YYYY/MM/DD') 
and to_date('2003/12/31','YYYY/MM/DD');



select * from emp
where comm !=80 and comm <> 100 and comm ^=200;
--문제 위의 결과와 같이 IN 연산자를 사용하여 출력해보세요
SELECT *FROM EMP
WHERE COMM NOT IN(80,100,200); -- 간단하게 NOT을 붙여서 한다. 

--LIKE 연산자와 와일드카드
--column_name Like pattern
--LIKE 다음에는 PATTERN을 기술해야 하는데 PATTERN에 
--다음과 같이 두가지 와일드 카드가 사용된다.
--% : 문자가 없거나, 하나이상의 문자가 어떤값이 와도 상관없다
--_: 하나의 문자가 어떤 값이 와도 상관 없다.

--문) 이씨성을 like를 이용하여 이름을 출력해보세요
select * from emp
where ename like '이%';

--문) 성이 아무데나 들어가기만 해도 되는 이름을 조회해보세요
select * from emp
where ename like '%성%';

--문) 성이 가운데만 들어가는 이름을 출력해보세요
select * from emp where ename like '_성_';

--문) 가운데 이름에 성이 안들어가는 이름을 출력해보세요.
select * from emp where ename not like '_성_';

--NULL인 값을 찾기 위한 IS NULL
--대상 컬럼 IS(연산자) NULL(비교값);
SELECT * FROM EMP WHERE COMM = NULL;

--문) 커미션이 NULL인 사람을 조회해보세요
SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE COMM IS NOT NULL;

--정렬을 위한 ORDER BY
--형식
--SELECT * [컬럼1, 컬럼2 ...]
--FROM [테이블명]
--WHERE [조건]
--ORDER BY [컬럼명] [SORTING];
--ORDER BY 절 다음에는 어떤 칼럼을 기준으로 정렬할 것인지를
--결정해야 하기에 컬럼 이름을 기술해야 한다.
--그 다음에는 오름차순으로 정렬(ASC)일지, 내림차순(DESC)일지 정렬방식을 기술해야 한다.
--숫자 : 작은값부터 정렬
--문자 : 사전 순서로 정렬
--날짜 : 빠른 날짜 순서로 정렬
--NULL : 가장 마지막
--오른차순은 산을 올라간다 (낮은 수 -> 높은 수)
--내림차순은 정상에서 내려온다 라고 생각하면 편한다. (높은 수 -> 낮은 수)

SELECT * FROM EMP WHERE COMM IS NULL ORDER BY JOB ASC; 
--COMM값이 NULL인 값들 중에 JOB을 오름차순으로 정렬한다.

--문) 급여를 많이 받는 순으로 출력, 급여가 같으면 이름순으로 출력

SELECT * FROM EMP ORDER BY SAL DESC, ENAME ASC;

--문) 입사날짜가 최근순, 날짜가 같으면 이름순
SELECT * FROM EMP ORDER BY HIREDATE DESC, ENAME ASC;

--문1) 급여가 300이하인 사원의 사원번호, 사원이름, 급여 출력하기
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL <300;

--문2) 이름이 "오지호"인 사원의 사원번호, 사원명, 급여 출력하기
SELECT EMPNO, ENAME, SAL FROM EMP 
WHERE ENAME='오지호';

--문3) 급여가 250이거나 300이거나 500인 사원들의 사원번호와 사원명, 급여를 검색하기 
SELECT EMPNO, ENAME, SAL FROM EMP
WHERE SAL IN(250,300,500);

--문4) 급여가 250이거나 300이거나 500도 아닌 사원들 검색하기
SELECT * FROM EMP WHERE SAL NOT IN(250,300,500);

--문 5) LIKE 연산자와 와일드 카드를 사용하여 이름중에 "김"으로 시작하는 사람과 
--이름중에 "기"를 포함하는 사원의 사원번호와 사원이름 출력하기

SELECT EMPNO,ENAME FROM EMP 
WHERE ENAME LIKE '김%' OR ENAME LIKE '%기%';

SELECT EMPNO,ENAME FROM EMP WHERE ENAME NOT LIKE '김%' AND ENAME NOT LIKE '%기%';

--문 6) 상관(윗 상사)이 없는 사원을 출력하기 
SELECT * FROM EMP WHERE JOB='사장';
SELECT * FROM EMP WHERE JOB='사원';
SELECT * FROM EMP WHERE MGR IS NULL;


--문 7) 사원 테이블에서 최근 입사한 직원 순으로 사원번호, 사원명, 직급, 입사일 컬럼만 출력하기
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP ORDER BY HIREDATE DESC, JOB DESC;

--문 8) 부서 번호가 빠른 사원부터 출력하되 같은 부서내의 사원을 출력할 경우 입사한지 가장 오래된 사원부터 출력하기 

SELECT * FROM EMP ORDER BY DEPTNO ASC, HIREDATE ASC;

SELECT * FROM EMP ORDER BY JOB ASC;



------------------------- 22-02-17 수업내용 --------------------------------------

--집합연산자
--UNION(합집합) , DIFFERENCE(차집합), INTERSECT (교집합) 에서는
--입력 테이블과 결과 테이블에서 중복 레코드가 배제
--UNION ALL(합집합), DIFFERENCE ALL(차집합), INTERSECT ALL(교집합) 에서는
--입력 테이블과 테이블에 중복된 레코드가 허용
--형식
--<쿼리1> 집합연산자 1 <쿼리2> 집합연산자2 <쿼리n> 


--
DROP TABLE GROUP_STAR;
DROP TABLE SINGLE_STAR;
-- 테이블 생성
CREATE TABLE GROUP_STAR(
   NAME      VARCHAR2(50)
);
--
CREATE TABLE SINGLE_STAR(
   NAME      VARCHAR2(50)
);

--테이블의 값 넣기
INSERT INTO GROUP_STAR VALUES('태연');
INSERT INTO GROUP_STAR VALUES('유리');
INSERT INTO GROUP_STAR VALUES('윤아');
INSERT INTO GROUP_STAR VALUES('효연');
INSERT INTO GROUP_STAR VALUES('티파니');
INSERT INTO GROUP_STAR VALUES('제시카');
INSERT INTO GROUP_STAR VALUES('수영');
INSERT INTO GROUP_STAR VALUES('써니');
INSERT INTO GROUP_STAR VALUES('서현');
INSERT INTO GROUP_STAR VALUES('탑');
INSERT INTO GROUP_STAR VALUES('지드래곤');
INSERT INTO GROUP_STAR VALUES('대성');
INSERT INTO GROUP_STAR VALUES('승리');
INSERT INTO GROUP_STAR VALUES('태양');

INSERT INTO SINGLE_STAR VALUES('태연');
INSERT INTO SINGLE_STAR VALUES('지드래곤');
INSERT INTO SINGLE_STAR VALUES('대성');
INSERT INTO SINGLE_STAR VALUES('태양');
INSERT INTO SINGLE_STAR VALUES('아이유');
INSERT INTO SINGLE_STAR VALUES('백지영');
INSERT INTO SINGLE_STAR VALUES('윤종신');
COMMIT;


--그룹활동과 싱글활동을 하는 가수 이름을 중복하여 출력하기
select * from group_star 
union all select * from single_star;

--중복된 레코드가 배제됨
--문) 그룹활동과 싱글활동을 하는 가수 이름 출력하기
select * from group_star 
union select * from single_star;


-- minus를 활용해서 차집합 구하기
--아예 싱글활동만 하는 가수
select * from single_star 
minus select * from group_star;
--아예 그룹활동만 하는 가수
select * from group_star 
minus select * from single_star;

-- intersect 연산을 사용해서 교집합을 의미한다.
--즉) 두개의 테이블에 모두 속하는 행 집합을 결과 집합으로 반환한다.
--싱글과 그룹활동 모두 하는 가수
select * from group_star 
intersect select * from single_star;

--*숫자함수*
--절대값 구하기
select -10, abs(-10) from dual;

--소수점 아래를 버리는 FLOOR 함수
--floor(숫자, 소수점 자릿수) 숫자를 두의 소수점 자릿수만큼 버린다.
select 34.5678, floor(34.5678) from dual;

--나머지 구하는 MOD 함수
--mod(숫자1, 숫자2) 앞의 숫자를 뒤의 숫자로 나눈다.
select mod(27,2) , mod(27, 5), mod(27, 7) from dual;

--특정 자릿수에서 반올림하는 ROUND 함수
SELECT 34.5678, ROUND(34.5678) FROM DUAL;

--add_month() : 개월 수 더하기
--현재 날짜의 7개월 후 
SELECT add_months(sysdate,7) from dual;

--next_day() : 현재 날짜에서 다음 지정해둔 요일 날짜가 나온다.
select next_day(sysdate,'일요일') from dual;

--last dat() : 해당월의 마지막 날짜가 나온다
select last_day(sysdate) from dual;

--to char() : 현재 날짜가 형식대로 나오기
select to_char(sysdate, 'YYYY/MM/DD') FROM DUAL;
select to_char(sysdate, 'YYYY-MM-DD') FROM DUAL;


select Substr(sysdate,1,2)+(100-Substr(9714023,1,2))  from dual;

Substr(sysdate,1,2)-Substr(eno,1,2) 

--TO_DATE() : 해당 문자열을 기술한 형식대로 DATE 타입으로 변환
SELECT SYSDATE, TO_DATE('2015/03/04', 'YYYY/MM/DD') FROM DUAL;




--문) 특정 자릿수에서 잘라내는 TRUNC 함수에 대하여 적으세요
--12.3456 값을 아래 출력 결과로 나타내시오
-- -1은 일의자리부터 자르고 그 자리는 0으로 바꾼다.
SELECT 12.3456, TRUNC(12.3456,-1), TRUNC(12.3456,0) FROM DUAL;

--CONCAT(char1, char2) : 문자열 합치는 기능
select concat('Hello','bye'), concat('좋은아침','bad') from dual;
--AS는 생략되어 있다. 좋은아침과 operators는 각 컬럼의 별칭 
--||와 CONCAT 둘다 같은 기능이다.
select concat('good','bad') 좋은아침, 'good'||'bad' operators from dual;

--initcap(char) : 첫문자가 대문자로
--공백이나 알파벳이 아닌 문자를 만난 후 다음 첫 알파벳 문자를 대문자로 변환
select initcap('good morning')from dual;
--구분자가 / 라서 뒤에 b가 B 대문자로 바뀌면서 따로 본다.
select initcap('good/bad morning') from dual;

--lower(char) 소문자, upper(char) 대문자
--lower 함수는 매개변수로 들어오는 문자를 모두 소문자로,
--upper 함수는 대문자로 변환해 반환
select lower('GOOD'),upper('good') from dual;

--LPAD(), RPAD()
--LPAD : 지정한 길이 만큼 왼쪽부터 특정 문자로 채워준다.
--LPAD ("값", "총 문자길이", "채움문자")
select rpad('good',6) "RPAD1",  -- 오른쪽부터 채우기
rpad('good',7,'#')"RPAD2",
rpad('좋은아',8,'L')"RPAD3" --한클은 2바이트 차지한다.
FROM DUAL;

--정의 : null을 0또는 다른 값으로 변환하기 위해서 사용하는 함수
--NVL(expr1, expr2) : expr1 값이 null값이면 expr2를 반환
--expr1과 expr2는 반드시 데이터 타입이 일치해야 한다.

--NVL2 함수
--NVL2 함수는 expr1을 검색하여 그 결과과 null이 아니면 expr2를 반환하고 null이면 expr3을 반환한다.
--NVL2(expr1, expr2, expr3)
select ename, sal, comm, nvl2(comm, sal*12, sal+12) 
from emp order by deptno;

--NULLIF( expr1, expr2) : expr1과 expr2가 동일한 경우 NULL을, 동일하지 않은 경우 expr1을 반환
select nullif('A','A'), nullif('A','a') from dual;
--Coalesce(a1, a2, ...., aN) : null이 아닌 첫 번째 인수를 반환


--현재날짜를 형변환형식으로 출력하기
select sysdate, to_char(sysdate,'YYYY-MM-DD') FROM DUAL;

--NUMBER <-> CHARACTER <-> DATE
--형변환 함수 : 변환함수는 자료형을 변환시키고자 할 때 사용하는 형 변환 함수로
--to_number, to_char, to_date가 있다. 
--to_char 날짜형 혹은 숫자형을 문자형으로 변환
--to_date 문자형을 날짜형으로 변환
--to_number 문자형을 숫자형으로 변환

--문자형으로 변환하는 TO_CHAR 함수
--<형식>
--TO_CHAR('날짜데이터', '출력형식')
--출력 형식
-- YYYY : 년도 표현 4자리
-- YY : 년도 표현 2자리
-- MM : 월을 숫자로 표현
-- MON : 월을 알파벳으로 표현
-- DAY : 요일을 표현
-- DY : 요일을 약어로 표현

--시간 출력 형식
--AM 또는 PM : 오전 오후 시각 표시
--HH 또는 HH12 : 시간(1~12)
--HH24 : 24시간으로 표현 (0~23) 
--MI : 분 표현
--SS : 초 표현
--
--숫자형을 문자형으로 변환하기
--0 : 자릿수, 자릿수가 맞지 않을 경우 0으로 채운다.
--9 : 자릿수, 자릿수가 맞지 않아도 채우지 않는다.
--L : 각 지역별 통화기호를 앞에 표시한다.
-- . :소숫점
-- , : 천자리 구분

--날짜형으로 변환하는 TO_DATE 함수
--형식 TO_DATE('문자', 'FROMAT');
--문) EMP 테이블로부터 2007년 4월2일에 입사한 사원을 검색하세요 TO_DATE() 사용한다.
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE = TO_DATE('20070402','YYYY/MM/DD');

--숫자형으로 변환하는 TO_NUMBER 함수
--9 : 자릿수, 자릿수가 맞지 않아도 채우지 않는다.
SELECT to_number('20,000','99,999') - to_number('10,000','99,999') from dual;


select ENAME, to_char(hiredate, 'YYYY-MM') FROM EMP;
--문) 입사일 달 기준으로 잘라내기 to_char()를 사용한다.
--표 조회에서 hiredate만 조회하는데 to_char로 형식을 지정해준다.
--trunc 함수를 이용해서 (hiredate, ''month') 달까지 문자열을 자른다.
--즉 연, 달은 hiredate의 값을 가져오지만 dd일은 초기값 01로 지정된다. 
select to_char(hiredate, 'YYYY/MM/DD') 입사일, to_char(trunc(hiredate,'month'),'yyyy/mm/dd') 일이무조건1 
from emp;

--두 날짜 사이 간격을 month_between 함수
--날짜와 날짜사이의 개월수를 구하는 함수이다.
-- <형식> MONTHS_BETWEEN(date1, date2)

--문) 날짜사이의 개월수를 구해보자 오늘로부터 입사일의 개월수를 구하면 된다 (trunc를 사용한다.)
--출력형식 이름 오늘 입사일 근무달수
--trunc를 통해 소숫점 자리수는 짜르고 깔끔하게 일만 나오게 만들었다. 
select ENAME 이름, TO_CHAR(SYSDATE)오늘, TO_CHAR(hiredate,'yyyy/mm/dd')입사일,
trunc(months_between(sysdate,hiredate))근무달수 from emp;

Select ENAME 사원이름, hiredate 입사일, 
trunc(months_between(sysdate,hiredate)) 근무개월수 from emp;


select ENAME 이름, TO_CHAR(SYSDATE)오늘, TO_CHAR(hiredate,'yyyy/mm/dd')입사일,
trunc(months_between(sysdate,hiredate) /12) 근속년
from emp;



--개월수를 더하는 ADD_MONTHS 함수
--ADD_MONTH 함수는 특정 개월수를 더한 날짜를 구하는 함수
--<형식> ADD_MONTH(date, number)

--문) 입사날짜에 6개월을 추가해보자
--결과 ename 입사일 입사 6개월 후 
select ename, to_char(hiredate, 'YYYY/MM/DD') 입사일,
to_char(add_months(hiredate,6),'YYYY/MM/DD') 입사6개월후
from emp;

--해당 요일의 가장 가까운 날짜를 반환하는 next_Day 함수
--해당 날짜를 기준으로 최초로 도래하는 요일에 해당되는 날짜를 반환하는 함수이다. 
--<형식> next_day(date,요일)
--1일요일 2월요일 7토요일

--문) 오늘 기준으로 최초로 도래하는 수요일은 언제인지 알아보자 , 출력 오늘은 금요일
select sysdate 오늘, next_day(sysdate,6) 금요일 from dual;
select to_char(sysdate,'yyyy/mm/dd')오늘, to_char(next_day(sysdate,'금요일'),'yyyy/mm/dd') 금요일 from dual;
--아래 2개의 값이 같은 값이 나온다.
--즉 next_day(date, 요일)에서 요일이 숫자든 문자든 상관 없다는 것.
select sysdate 오늘, next_day(sysdate,4)수요일 from dual;
select to_char(sysdate,'yyyy/mm/dd') 오늘, to_char(next_day(sysdate,'수요일'),'yyyy/mm/dd') 수요일 from dual;

SELECT to_CHAR(220505, 'yyyy"년" mm"월" dd"일"') FROM DUAL;

--★ substr(대상, 시작위치, 추출할 개수)
--substr 함수를 사용하여 9월에 입사한 사원을 출력하기 emp 테이블
select * from emp where substr(hiredate,4,2)=09;

--문1) substr 함수를 이용하여 2003년도에 입사한 사원을 검색
select * from emp where substr(hiredate,1,2)=03;

--문2) substr 함수를 이용하여 '기'로 끝나는 사원 검색
--이름이 2글자일 수도 있어서 -1을 써준다.
select * from emp where substr(ename,3,1)='기';
select * from emp where substr(ename,-1,1)='기';

--문3)substr을 사용하여 입사일자 년도(두자리), 몇월(두자리), 며칠(두자리)를 추출하여 조회

select ename, job, to_char(hiredate,'yyyy/mm/dd'), substr(hiredate,1,2)년도 , substr(hiredate,4,2)월, substr(hiredate,7,2)일 from emp; 
SELECT TO_CHAR(210505, 'YYYY년MM월DD일') FROM EMP;

SELECT to_char(HIREDATE, 'yyyy') ||'년'|| to_char(HIREDATE, 'mm') ||'월'|| 
to_char(HIREDATE, 'dd') ||'일' as 입사일 FROM EMP;

SELECT to_CHAR(hiredate, 'yyyy"년" mm"월" dd"일"') FROM EMP;

select to_date(22220505, 'yyyy/mm/dd') from dual;

SELECT LENGTH('KH정보교육원') FROM DUAL;

SELECT RTRIM('KH정보교육원0123456789' , '0123456789') FROM DUAL;



SELECT to_CHAR(220505, 'yyyy"년" mm"월" dd"일"') FROM DUAL;

SELECT to_CHAR(220505, 'yyyy-mm-dd') FROM DUAL;

--문4) 이름의 두번째 글자가 '동'이 있는 사원을 검색하기
select * from emp where substr(ename,2,1) ='동';
select * from emp where substr(ename,-2,1) ='동';

select empno,ename from emp where instr(ename, '동' ,2,1) =2;


--선택을 위한 DECODE 함수
--DECODE 함수 함수는 프로그램언어에서 많이 사용되는 SWITCH .. CASE 문과 같은 기능이다.
--<형식> DECODE (표현식, 조건1, 결과1, 조건2, 결과2, 조건3, 결과3, 기본결과n)
--표현식의 값이 조건 1과 같을 때 결과1을 반환
--
--CASE 문 
--<형식> CASE WHEN 조건1 THEN 결과1 ELSE 결과2 END
--CASE 문은 DECODE가 제공하지 못하는 비교연산의 단점을 해결한다.
--CASE 함수는 다양한 비교 연산자를 이용하여 조건을 제시할 수 있으며 범위를 지정할 수도 있다.
--CASE 함수는 프로그래밍에서 IF ELSE와 유사한 구조이다. 


--order by를 통해 dname을 오름차순으로(ㄱ~ㅎ) 순으로 정렬한다. 
select ename, deptno, decode(deptno,10,'경리부',20,'인사과',30,'영업부',40,'전산부')AS DNAME
from emp order by dname;

--위에랑 같지만 보기좋게 쓴다면!
select ename, deptno, decode(deptno,10,'경리부',
                            20,'인사과',
                            30,'영업부',
                            40,'전산부')AS DNAME
from emp order by dname;

--문2) 1. 직급에 따라 직급이 '부장'인 사원은 5%, '과장'인 사원은 10%, '대리'인 사원은 15%, '사원'인 사원은 20% 급여 인상하기
--AS Upsal

select empno, ename, job, sal, decode(job, '부장','5%', '과장','10%','대리','15%','사원','20%') AS Upsal 
from emp order by job;

select empno, ename, job, sal, decode(job, '부장',sal*1.05, '과장',sal*1.10,'대리',sal*1.15,'사원',sal*1.20) AS Upsal 
from emp order by job;



--문 3) 1. 입사일을 연도는 2자리(yy) 월은 숫자(mon)로 표시하고 요일은 약어 (dy)로 지정하여 출력하기 
select hiredate, to_char(hiredate,'yy')as 연, 
to_char(hiredate,'mon')as 월,
to_char(hiredate,'dy')as 일 
from emp;

select hiredate, to_char(hiredate, 'yy/mon/dd dy') from emp;


--문 4) emp 테이블로부터 홀수 사번들의 입사날짜를 조회하세요.
--mod 숫자함수를 이용해서 입력 받은 수를 나눈 나머지 값을 반환한다.
 
select empno, ename, hiredate from emp 
where mod(empno,2)=1;

--문 5) 근무일수를 구해보자 round를 사용하기 
--특정 자릿수에서 반올림하는 ROUND 함수 
--select ename, hiredate, 

select ENAME 이름, TO_CHAR(SYSDATE)오늘, TO_CHAR(hiredate,'yyyy/mm/dd')입사일,
round(sysdate-hiredate) as 근무일수 from emp;


-- NVL 을 사용하여 직속상관이 없는 근무자 empno,ename,직속상관
-- 특히 NVL(TO_CHAR(mgr, '9999'), ' C E O ') 해석하여 주석 달아오기
--nvl 함수는 (expr1, expr2) expr1 값이 null이면 expr2를 출력한다.
--TO_CHAR(mgr, '9999') 이 값이 null이면 'ceo'를 출력하는 건데
--to_char(mgr, '9999')
--숫자형인 mgr을 문자형으로 바꾸는데, 9999는 자릿수가 맞지 않아도 채우지 않는 것.
--즉 그냥 냅두는 것 0000이면 0으로 채운다.
SELECT empno, ename, NVL(TO_CHAR(mgr, '9999'), ' C E O ') as "직속 상관"
FROM emp
WHERE mgr IS NULL;

--날짜형 데이터에 숫자를 더하면 (날짜+숫자)
--날짜형 데이터에 숫자를 빼면 (날짜-숫자)
--그 날짜로부터 그 기간만큼 이전 날짜를 구한다.
select sysdate-1 어제, sysdate 오늘, sysdate+1 내일
from dual;


--특정 기준으로 반올림하는 round 함수
--round 함수는 숫자를 반올림하는 함수로 학습하였으나
--이 함수에 포멧 모델을 지정하면 숫자 이외에 날짜에 대해도 반올림을 할 수 있다.
--<형식> round(date, format);


--------------------------22-02-21 수업내용---------------------------


--그룹함수
--테이블의 전체 데이터에서 통계적인 결과를 구하기 위해서
--행 집합에 적용하여 하나의 결과를 생산
--하나 이상의 행을 묶어 그룹으로 만들어 연산하여 결과를 나타내는 함수
--SUM : 그룹의 누적 합계들을 반환
--AVG : 그룹의 평균을 계산
--COUNT : 그룹의 총 개수를 반환
--MAX : 그룹의 최댓값을 반환
--MIN : 그룹의 최솟값을 반환
--STDDEV : 그룹의 표준 편차를 반환
--VARIANCE : 그룹의 분산을 반환

--COUNT(*) : 테이블의 전체 로우(행) 개수를 구한다.
--COUNT(COMM)은 COMM 컬럼에서 NULL이 아닌 로우 개수를 구한다.
--AS 컬럼 명을 띄어쓰기 사용해서 지정하려면 "  "( 큰따옴표로 묶어준다)
SELECT COUNT(*) "전체 사원 수",
COUNT(COMM) "커미션 받는 사원 수"
FROM EMP;

SELECT *
FROM EMP;




--특정 컬럼을 기준으로 그룹 함수를 사용할 경우 어떤 컬럼값을 기준으로 그룹함수를 줄 지을 결정할 때 사용한다.
--GROUP BY절이라고 한다
--<형식>
--SELECT 컬럼명, 그룹 함수
--FROM 테이블명
--WHERE 조건 (연산자)
--GROUP BY 컬럼명;

--사원 테이블을 부서 번호로 그룹 만들기
--즉) 그룹 지을, 중복된 컬럼의 값을 하나로 합쳐준다.
--따라서 여기선 DEPTNO를 10, 20, 30 각각 하나로 합친 것.
SELECT DEPTNO FROM EMP
GROUP BY DEPTNO;

--문제 > 소속 부서별 최대급여와 최소 급여 구하기
--결과 deptno 최대급여 최소급여.
select deptno, MAX(sal) 최대급여, MIN(sal) 최소급여
from emp 
group by deptno;

select deptno, sal
from emp
order by deptno, sal desc;

--위에 두개를 합친 그룹과 정렬
select deptno, MAX(sal) 최대급여, min(sal) 최소급여
from emp
group by deptno
order by deptno;

--최고급여(평균) 출력하기 
--부서별 평균 급여중 젤 높은 값 출력하기 

select MAX(AVG(sal))
from emp
group by deptno;

--부서별 급여 평균 구하기
select avg(sal)
from emp
group by deptno;

--select 절에 조건을 사용하여 결과를 제한할 때는 where 절을 사용하지만
--그룹의 결과를 제한할 때는 having 절을 사용한다.
--문) 부서별 급여 평균이 500 이상인 부서의 번화와 급여 평균 구하기

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >=500;


--에러나는 이유 적고 올바르게 구해보자 
--목록이 group by 목록과 일치하지 않아서 에러 발생
--즉) deptno로 그룹을 분리하면 ename은? ename도 지정해줘야 한다.
select deptno, ename, avg(sal)
from emp
group by deptno;


select deptno, ename, avg(sal)
from emp
group by deptno, ename;



--아래 예제는 그냥 인터넷에서 찾아본 것. 정리x
-- GROUP BY절이 존재할 때에 그룹화된 결과의 범위를 제한
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP
GROUP BY DEPTNO, JOB -- 부서번호가 3개, JOB이 3개면 총 9행 출력
HAVING AVG(SAL) >= 500 -- 위 9행 중 평균급여가 500이 넘는 행만 출력
ORDER BY DEPTNO, JOB; 


--문) having 절을 사용하여 사원을 제외하고 급여총액이 1000이상인
--직급별 급여 총액 구하기 
--사원 제외하는데 여러 방법이 있다. 

select job, sum(sal),count(*)
from emp
group by job
--having not job in('사원');
having job != '사원' and sum(sal)>=1000
ORDER by sum(sal);

select job, sum(sal), count(*)
from emp
where job ^= '사원'
group by job
having sum(sal)>=1000
order by sum(sal);

select job, sum(sal), count(*)
from emp
where job not like  '%사원%'
group by job
having sum(sal)>=1000
order by sum(sal);



--위 문제 기본 템플릿 사원 제외 직급별 급여 총액
select job, sum(sal),count(*)
from emp
group by job
--having not job in('사원');
having job != '사원'
ORDER by sum(sal);


--문) 급여 최고액, 최저액, 총액 및 평균 출력하기
select Max(sal), Min(sal), sum(sal), avg(sal)
from emp;
--group by deptno;


--문) 담당 직급별 사원 수를 출력하기
--count(*)로 적어줘도 된다.
--group by를 job으로 줘서 job의 중복을 합쳐서 출력
select job, count(job)
from emp
group by job;

--문) 과장의 수를 조회해보자
--job이 과장인 사람을 출력하면 되기에 조건절에 추가
select job, count(*)
from emp
group by job
having job = '과장';

--여기까지 정리 ★★★★


--문) 급여 최고액, 급여 최저액의 차액 출력하기
--max, min 함수를 이용해서 최대, 최소 급여를 출력하고
--사칙연산은 그냥 함수 - 함수 이렇게 적어주면 된다. 
select deptno, max(sal), min(sal), max(sal)-min(sal)
from emp
group by deptno
order by deptno;

select max(sal), min(sal), max(sal)-min(sal)
from emp;


--문) 부서별 사원수 평균 급여를 반올림하자 as 'number of people' 출력하기
--부서그룹정렬과 부서번호를 오름차순으로 정렬해보자 

select deptno , count(*), round(avg(sal),2) as "Number of People"
from emp
group by deptno --부서 그룹 정렬
order by deptno asc; -- deptno 오름차순 정렬


select *
from emp
order by deptno;


--부서번호 이름 지역명 사원수 부서내의 모든 사원의 평균급여 출력
--decode는 switch 함수랑 비슷하다. 
--만약 deptno값이 10이면 경리부로 dname을 적는다
--만약 dptno가 10이라면 서울로 location을 적는다. 
select deptno,decode(deptno, 10,'경리부',
            20,'인사부',
            30,'영업부',
            40,'전산부') as dname ,
        decode(deptno, 10,'서울',
            20,'용인',
            30,'인천',
            40,'안산') as Location,
count(*) as "Number of People",
round(avg(sal))as Sal
from emp
--group by를 deptno으로 했기에 
--중복된 deptno를 합쳐서 나타낸다. 
group by deptno
order by deptno;

--선택을 위한 DECODE 함수
--DECODE 함수 함수는 프로그램언어에서 많이 사용되는 SWITCH .. CASE 문과 같은 기능이다.
--<형식> DECODE (표현식, 조건1, 결과1, 조건2, 결과2, 조건3, 결과3, 기본결과n)
--표현식의 값이 조건 1과 같을 때 결과1을 반환

--CASE 문 
--<형식> CASE WHEN 조건1 THEN 결과1 ELSE 결과2 END
--CASE 문은 DECODE가 제공하지 못하는 비교연산의 단점을 해결한다.
--CASE 함수는 다양한 비교 연산자를 이용하여 조건을 제시할 수 있으며 범위를 지정할 수도 있다.
--CASE 함수는 프로그래밍에서 IF ELSE와 유사한 구조이다. 
        
-- % : 문자가없거나 하나이상의 문자가 어떤값이와도 상관x
-- _ : 하나의 문자가 어떤값이와도 상관x
       
       
       
       
       
            
--데이터 딕셔너리
--데이터 딕셔너리는 사용자가 테이블을 생성하거나 사용자를 변경하는
--등의 작업을 할 때 데이터베이스 서버에 의해 자동으로 갱신되는 테이블로,
-- 사용자는 데이터 딕셔너리의 내용을 직접 수행하거나 삭제할 수 없고
--사용자가 이해할 수 있는 데이터를 산출해 줄 수 잇도록 하기 위해서
--읽기 전용 뷰 형태로 정보를 제공한다.
--USER_ 자신의 계정이 소유한 객체 등에 관한 정보 조회
--ALL_ 자신계정 소유 또는 권한을 부여 받은 객체 등에 관한 정보 조회
--DBA_ 데이터베이스 관리자만 접근 가능한 객체 등의 정보조회

--ALL_ 자신계정소유 또는 권한부여받은 객체관한 정보 조회
SELECT OWNER, TABLE_NAME from all_tables;

--dba나 시스템 권한을 가진 사용자만 접근 가능
--dba 권한이 없으면 오류가 발생한다.
select owner, table_name from dba_tables;

--권한에 대한 정보를 갖는 딕셔너리
--dba_ 데이터베이스 관리자만 접근 가능한 객체 등의 정보조회
select * from dba_sys_privs;


--테이블 기술서 <<프로젝트 추가 서류입니다>>
--테이블 기술서는 개별 테이블에 대한 보다 자세한 문서화 수단이 된다.
--모델링 도구에 테이블에 대한 정보가 저장되어 있지만 테이블 하나하나에 대한 출력된 문서가 필요하다.

--대표적인 시스템 권한
--create seesion : 데이터베이스에 접속할 수 있는 권한
--create table : 테이블을 생성할 수 있는 권한
--create any table : 다른 user의 이름으로 테이블을 생성할 수 있는 권한
--create tablespace : 테이블 스페이스를 만들 수 있는 구너한
--unlimited tablespace : 사용량을 무제한으로 허용하는 권한
--select any table : 어느 테이블, 뷰라도 검색을 할 수 있는 권한
--
--craete user : 새로운 사용자를 생성
--create view : 사용자 스키마에서 뷰를 생성할 수 있는 권한
--create sequence : 사용자 스키마에서 함수를 생성할 수 있는 권한
--drop user : 사용자를 삭제하는 권한
--drop any table : 임의의 테이블을 삭제할 수 있는 권한
--
--위 외에도 상당히 많은 시스템 권한들이 있다.
--권한부여 명령 : grant
--권환회수 명령 : revoke


--Role : 사용자에게 허가 할 수 있는 권한들의 집합
--권한 부여와 회수를 쉽게 할 수 있다
--한 명의 사용자가 여러개의 role에 접근할 수 있고, 여러 사용자에게 같은 role 부여 가능
--(role에게 role 부여 가능)
--<Role 생성>
--CREATE ROLE 롤 이름;
--<권한이 부여된 롤을 유저에게 부여>
--GRANT 권한 to 유저1, 유저 2...;
--connect 롤
--resource롤 : 사용자가 객체(테이블, 뷰, 인덱스)를 생성할 수 있도록 시스템 권한을 묶어 놓음

--DDL(Data Definition language) : craete문, drop문, alter문
--create table 테이블 이름 (열이름 데이터명[default 표현식])
--,[열이름 데이터형 ...]);
--테이블 구조를 만드는 create table 문

--★ 여기서부터 직접적으로 테이블 만들어 보는 ddl ★
--여기 아래로 ppt 정리 완료  --
--drop table emp01;
--drop을 통해 테이블 삭제할 수 있다.

--emp01번 테이블을 생성한다.
--각 컬럼(열)은 eno, ename, sal 
create table emp01(
    eno number(4),
    ename varchar2(14),
    sal number(7,3)
);

--desc : 테이블을 생성한 후 테이블의 구조가 잘 만들어졌는지 확인할 필요가 있을 때 사용하는 명령어
desc emp01;


--add : 사원 테이블에 날짜 타입을 가지는 brith 컬럼 추가 
alter table emp01 add(birth date); --date 타입의 birth라는 컬럼을 추가하는 문장
desc emp01;

--modify : 사원 이름 컬럼 크기 변경하기 
alter table emp01
modify ename varchar2(30);
desc emp01;

commit;

--drop : 사원테이블에서 이름컬럼 제거하기
alter table emp01
drop column ename;
desc emp01;

--set unuser는 시스템의 요가가 적을 때 컬럼을 제거할 수 있도록 하나 이상의
--컬럼을 unused로 표시, 실제로는 테이블에서 컬럼이 제거되진 않는다. 

alter table emp01
set unused(eno);
desc emp01;

--emp01 테이블에서 사원번호 추가하고 제거하기
alter table emp01
add(eno number(4));
desc emp01;
alter table emp01
drop column eno;
desc emp01;

--drop unused create columms는 테이블에서 현재 unused로 표시된 모든 컬럼을 제거한다.
alter table emp01 drop unused columns;
desc emp01;

--테이블 명을 변경하는 rename문 ---rename old_name to new_name
rename emp01 to emp02;
--emp01 테이블을 emp02로 변경했기에
--기존 emp01은 삭제된다.
desc emp02;
desc emp01;

/*
테이블 구조를 제거하기는 drop table 문
drop table 문을 사용하여 기존의 테이블과 데이터를
모두 제거할 수 있습니다.
삭제할 테이블의 기본 키나 고유 키를 다른 테이블에서 참조하고 있는 경우
삭제가 불가능하기 때문에 그럴 경우 참조 중인 자식 테이블을 먼저 제거하야야 합니다.
*/

--ROWNUM
--내장 함수는 아니지만 자주 사용되는 문법이다.
--오라클에서 내부적으로 생성되는 가상 컬럼의 SQL 조회 결과의 순번을 나타낸다.
--자료를 일부분만 확인하여 처리할 때 유용함
--ROWNUM : 조회된 순서되로 순번을 매긴다.
SELECT ROWNUM "순번", EMPNO, ENAME, SAL
FROM EMP
WHERE ROWNUM <=3;

--USER_ 자신이 소유한 계정의 객체등에 관한 정보 조회
SELECT TABLE_NAME FROM USER_TABLES;

--ALL_ 자신계정소유 또는 권한부여받은 객체관한 정보 조회
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

--DBA나 시스템 권한을 가진 사용만 접근할 수 있다. 
SELECT OWNER, TABLE_NAME FROM DBA_TABLES;




/*DDL(Data Definintion Language) : Create문, Drop문, Alter문
Truncate문*/
/*<DML 명령어>
SELECT : 데이터를 조회하는 역할
INSERT : 데이터를 삽입하는 역할
UPDATE : 데이터를 수정하는 역할
DELETE : 데이터를 삭제하는 역할 */

--테이블에 내용을 추가하는 INSERT문 DML이라고 한다.
--데이터 삽입 : INSERT문
--INTO 테이블이름 [(속성 리스트)]
--VALUES(속성값_리스트);
--INTO 키워드와 함께 투플을 삽입할 테이블의 이름과 속성 이름을 나열
--속성 리스트를 생략하면 테이블 정의할 때 지정한 속성의 순서대로 값이 삽입된다.
--VALUES 키워드와 함께 삽입할 속성 값들을 나열
--INTO절의 속성 이름과 VALUES 절의 속성 값은 순서대로 일대일 대응되어야 한다.
SELECT * FROM DEPT01;
DROP TABLE DEPT01;

--DEPT01 테이블 생성하기
CREATE TABLE DEPT01(
DEPTNO NUMBER(2), --부서번호
DNAME VARCHAR2(14), --부서이름
LOC VARCHAR2(13) --부서 위치
);

desc dept01;

--insert로 dept01에 값 넣기

insert into dept01
values(10, '경리부','서울');
select * from dept01;

insert into dept01(deptno, loc, dname)
values(20, '인천','인사부');
select * from dept01;

insert into dept01
values(40, '전산부',null);
select * from dept01;

insert into dept01
values(50, '기획부',''); --dname 값 null
select * from dept01;



--여기서부터 완료 
--emp02 테이블 만들기
drop table emp02;

create table emp02(
empno number(4),
ename varchar2(10),
job varchar2(9),
hiredate date,
deptno number(2)
);

--insert문으로 emp02 테이블에 값을 추가한다.
--값 형식을 지정하지 않는다면
--create 할 때 지정한 값 순서 그대로 넣으면 된다.
insert into emp02
values (1001, '김사랑', '사원', '2015/03/01',20);
select * from emp02;

--값을 넣을 때 형식은 따로 지정이 가능하다
--여기선 date를 넣을 때 to_date로 
--따로 형식을 지정해 준다. 
insert into emp02
values(1002,'한예슬','대리',
to_date('2014, 05, 01','YYYY,MM,DD'),20);
select * from emp02;

--sysdate : 현재 날짜
insert into emp02
values(1003,'오지호','과장',sysdate,30);
select * from emp02;


--문 dept01 테이블에서 10번 부서에서 생산부를 업데이트해보자
select * from dept01;
update dept01
set dname = '생산부'
where deptno =10;
select * from dept01;

update dept01
set dname ='생산부2', loc='부산'
where deptno = 20;
select * from dept01;

commit;
--문 ) 모든 dname을 생산부3으로 수정해보기
update dept01
set dname = '생산부3';
select * from dept01;
--rollback은 commit 된 시점으로 되돌린다.
--즉) 생산부3으로 바꾸기 전에 commit을 시켜두고
--생산부3로 바꾼다음에 rollback을 실행 시키면
--다시 생산부3 바꾸기 이전 commit 한 부분으로 롤백, 되돌아간다.
rollback;


--delete문
--테이블에 있는 기존 튜플을 삭제하는 명령
--<형식>
--from 테이블 이름
--[where 검색조건];
--where 절을 생략하면 테이블에 있는 모든 행이 삭제된다. 
--아래는 부서번호 10번 번호가 삭제된다. 
--즉 10번 부서의 특정 로우만 삭제하기 
delete dept01
where deptno=10;
select * from dept01;

commit;

--delete에서 where 조건 문은 
--dname, deptno, loc ,,,, 어떤 값이든 상관 없다.
delete dept01
where dname='경리부';
select * from dept01;
rollback;


--employee03 테이블 생성하기
create table employee03(
empno number(4),
ename varchar(20),
job varchar(20),
sal number(7,3)
);
desc employee03;

insert into employee03 values(1000, '한용운', '승려' , 100);
insert into employee03 values(1010, '허준', '외관' , 150);
insert into employee03 values(1020, '주시경', '국어학자' , 250);
insert into employee03 values(1030, '계백', null , 250);
insert into employee03 values(1040, '선덕여왕', '' , 200);
select * from employee03;
commit;
--급여가 200이 안되는 사원에게 50을 인상해라
update employee03 set sal = sal +50
where sal <200;
select * from employee03;
rollback;

--테이블에 직업이 null 인 사람을 사원정보에서 삭제하세요
delete employee03
where job is null;
select * from employee03;



--------------------------22-02-22 수업내용---------------------------


--purge recyclebin; 을 적게 되면 쓰레기 테이블을 삭제한다.
--즉) 정확하게는 휴지통을 비워준다. 
--남은 명령어 테이블에 대한 정보를 지운다. 
purge recyclebin;

desc employees2;
desc employees3;

--employees2 테이블 생성
create table employees2(
employee_id number(10),
name varchar2(20), --맞춤 사이즈로 가변형
salary number(7,2) --7자리 안에 5자리는 양수 두자리는 소수점자리
);

desc employees2;

--employees2 테이블하고 동일하게 만들려면
--아래 템플릿을 이용한다. 
create table employees3 
as
select * from employees2;
desc employees3;


drop table dept02;
--테이블 dept02가 생성되는데
--where 1=0;
--dept 테이블의 데이터는 복제되지 않는다.  
create table dept02
as select * from dept where 1=0;

--where 1=1;
--dept 테이블의 데이터까지 복제된다. 
create table dept02
as select * from dept where 1=1;
desc dept02;

--즉 ) 값이 false면 구조만 복제되고
-- 값이 true이면 테이터의 내용까지 복제된다. 
create table dept02
as select * from dept where 5=4;

select * from dept02;



desc employees2;
--테이블 구조를 매니저아이디 필드 항목을 추가한다.
alter table employees2 add(
manager_id varchar2(10)
);
desc employees2;

alter table employees2 modify(
--테이블 구조를 매니저아이디 필드 항목을 수정한다.
manager_id varchar2(20)
);
desc employees2;

--컬럼을 삭제한다.
alter table employees2 drop column manager_id; 
desc employees2;

--문자형 데이터
--char, varchar, nchar 유니코드 문자형 데이터,
--nvarchar 유니코드 가변길이 문자형데이터, long(2GB) 가변길이


/*
데이터 무결성 제약조건 (Date Integrity Constraint Rule)이란?
테이블에 부적절한 자료가 입력되는것을 방지하기 위해서 테이블을 생성할 때
각 컬럼에 대해서 정의하는 여러가지 규칙을 말한다.

무결성 제약조건의 종류
NOT NULL : NULL을 허용하지 않는다.
UNIQUE : 중복된 값을 허용하지 않는다. 항상 유일한 값을 갖도록 한다.
PRIMARY KEY : NULL을 허용하지 않고 중복된 값을 허용하지 않는다.
(NOT NULL + UNIQYE 조건을 결합한 형태이다)
FORIGN KEY : 참조되는 테이블의 컬럼의 값이 존재하면 허용한다. 
CHECK : 저장 가능한 데이터 값이 범위나 조건을 지정하여, 설정한 값만을 허용한다.

제약조건 확인하기
오라클 USER_CONSTRAINTS 데이터 딕셔너리로 제약조건에 관한 정보들을 알려준다
USER_CONSTRAINTS 데이터 딕셔너리를 조회하면
내가 만든 제약조건의 정보들을 조회할 수 있다. 
*/

desc user_constraints;
--해당 계정이 소유한 제약조건 조회
select * from user_constraints; 

--특정 컬럼만 조회한다.
select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints;

select owner, constraint_name, constraint_type, table_name
from user_constraints;

/* 
user_constraints 데이터 딕셔너리의 자주 사용되는 컬럼
owner : 제약조건을 소요한 계정
constraint_name : 제약조건 명
constraint_type : 제약조건 유형
table_name : 제약조건이 속한 테이블명
search_condition : check 조건일 경우에는 어떤 내용이 조건으로 사용되었는지 설명
r_constraint_name : foreign key 인 경우 primary key 참조했는지에 대한 정보

constraint_type은 제약 조건 유형을 저장하는 컬럼이다
그 종류로는 : p, r, u, c가 있다.
p : primary key
r : foreign key
u : unique
c : check, not null

무결성 제약의 예 
학생은 하나의 학과에 소속한다
하나의 강좌는 한명의 담당교수가 배정된다
하나의 교과목은 각 학기마다 두 강좌 이하만 개설할 수 있다
학생은 한 학기에 20학점 이상 수강할 수 없다.

기본적 무결성 제약
의미 : 관계형 데이터 모델에서 정의한 무결성 제약
기본키 무결성 제약, 참조 무결성 제약

테이블 무결성 제약
의미 : 테이블을 정의하거나 변경 과정에서 실행 가능한 무결성 제약
not null, unique, check, default


기타 무결성 제약
위에 해당 안되는 제약들
주장, 트리거 등등

기본키 무결성 제약(primary key)
테이블에서 레코드들이 반드시 유일하게 식별될 수 있어야 한다는 조건
정의 : 기본키 무결성 제약
기본키 null 값을 가질 수 없으며
기본키의 값이 동일한 레코드가 하나의 테이블에 동시에 두 개 이상 존재할 수 없다

형식
constraint <제약식명> primary key(<필드리스트>)
<제약식명>
기본키를 정의하는 제약식에 주어진 이름이고
<필드리스트>
기본키로 정의할 필드들의 리스트 

not null
틀정 필드에 대해서 null 값의 입력을 허용하지 않는다
기본키로 정의된 필드에 대해서는 명시적으로 not null 조건을 설정하지 않아도 된다.

형식
컬럼명 자료형 not null
컬럼 레벨로만 정의할 수 있다.
*/

drop table emp01;
desc emp01;
create table emp01(
empno number(4),
ename varchar2(10),
job varchar2(9),
deptno number(2));

insert into emp01 values(null, null, '사원', 30);
select * from emp01;

--문 emp01 테이블에 대한 제약조건 조회하기 

--특정 컬럼만 조회한다.
--where 조건절로 어떤 테이블의 제약조건을 확인할지 지정한다. 
--아직 emp01 테이블은 제약조건을 주지 않았으므로 조회 결과가 없다. 
select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints
where table_name = 'emp01';

--이번엔 제약조건이 있는 emp01 테이블을 새로 만들기 위해서
--다시 drop 으로 위에서 만든 테이블을 삭제하고 새로 만든다.
drop table emp01;

create table emp01(
empno number(4) not null, --컬럼명 자료형 not null
ename varchar2(10) not null,
job varchar2(9),
deptno number(2));
desc emp01;

select constraint_name, constraint_type, table_name
from user_constraints;
select * from user_constraints; --해당 계정이 소유한 제약조건 조회

--아래 문장은 오류가 뜨는데 그 이유는?
--테이블 생성할 때 제약 조건을 not null로 지정해줬기 때문에
-- null값을 삽입할 수 없다.
insert into emp01 values(null, null, '사원', 10);

insert into emp01 values(1000,'허준','사원',30);
commit;
select * from emp01;

insert into emp01 values(1000,'홍길동','과장',20);
select * from emp01;

/*
유일한 값만 허용하는 제약조건 unique
특정 컬럼에 대한 자료가 중복되지 않게 하는 제약조건
지정된 컬럼에는 유일한 값이 수록되게 하는 것이다
null 값은 예외
만약 null값도 입력되지 않게 하려면
테이블 생성시 not null 제약조건도 기술해야한다.
형식
constraint 제약명 uniqye (필드리스트)
*/

create table emp03(
empno number(4) unique, --unique 제약조건, 중복된 값을 허용하지 않음
ename varchar2(10) not null,
job varchar2(9),
deptno number(2));

desc emp03;


insert into emp03 values(1000,'허준','사원',30);
commit;
select * from emp03;

--이건 왜 안들어갈까? 
--첫 번째 컬럼 (empno)은 unique 제약조건이기 때문에 중복된 값을 허용하지 않는다.
insert into emp03 values(1000,'홍길동','과장',20);
select * from emp03;

--이 값이 들어가는 이유는
--첫 번째 컬럼은 unique 제약조건으로 null값을 받을 수 있기 때문이다.
insert into emp03 values(null,'안중근','과장',20);

insert into emp03 values(null,'이순신','부장',20);
select * from emp03;

--컬럼 레벨 제약조건 설정하기
--<형식>
--column_name date_type constraint constraint_name constraint_type
--제약조건 명은 명명 규칙을 준수해야한다.
--<형식<
--[테이블명]_[컬럼명]_[제약조건 유형]

drop table emp04;
create table emp04(
empno number(4) constraint emp04_empno_uk unique,
ename varchar2(10) constraint emp04_ename_nn not null,
job varchar2(9),
deptno number(2)
);
desc emp04;

--문) 테이블의 제약조건을 살펴보자
--이건 왜 안나올까??
--테이블은 DB에 저장될 때 무조건 대문자로 저장되기 때문에 조회할 때도 마찬가지로 대문자로 조회한다

select constraint_name, constraint_type, table_name
from user_constraints
--where table_name = 'emp01';
where table_name in('EMP04');

select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints
where table_name = 'EMP04';

insert into emp04 values(1000,'허준','사원',30);
select * from emp04;

--이건 왜 안되지? unique 제약조건으로 인해 empno는 중복값을 가지지 않는다.
insert into emp04 values(1000,'홍길동','과장',20);

--데이터 구분을 위한 제약조건 primary key
--unique 제약조건과 not null 제약조건을 모두 갖고 있다.

create table EMP05(
empno number(4) constraint emp05_empno_pk primary key,
ename varchar2(10) constraint emp05_ename_nn not null,
job varchar2(9),
deptno number(2));
desc emp05;

select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints
where table_name = 'EMP05';

insert into emp05 values(1000,'허준','사원',30);
select * from emp05;

--primary key 제약조건 때문에 중복 , null이 허용되지 않는다.
insert into emp05 values(null,'이순신','부장',20);

/*
참조 무결성을 위한 제약조건 forign key
자식 테이블인 사원 테이블(emp)의 부서번호 (deptno) 컬럼을
부모 테이블인 부서 테이블(dept)의 부서번호 (deptno)를 부모 키로 설정하는 것이다
한 테이블의 레코드가 다른 테이블을 참조 
참조되는 테이블에 해당 레코드가 반드시 존재하거나 null 값을 가진다
이 조건이 지켜지지 않는다면 참조하는 레코드는 
실제로 존재하지 않는 레코드를 참조하게 되는 오류가 발생한다. 
실제 존재하지 않는 잘못된 값이 저장되지 않도록 보장하는 수단이다 

<형식>
constraint 제약명 foreign key(필드리스트1)
references 테이블명(필드리스트2)
필드리스트 1: 외래키로 정의하는 필드들의 리스트
테이블명 : 참조 대상인 테이블 이름
틸드리스트 2 : 참조 대상 테이블의 기본키
contraint emp_empno_fk foreign key (deptno)
references dept (deptno)
참조 무결성 제약은 외래키 정의에 의해 dbms에서 자동적으로 검증
dbms는 이 조건을 위배하게 되는 연산의 실행을 거부한다.

alter table문을 이용하여 외래키를 별도로 설정
ex) alter table student
add constraint fk_dept foreign key(dept_id) references department(dept_id)
학생 테이블에서 부서테이블의 부서아이드를 참조하는 외래키인 fk_dept를 추가한다.
외래키 삭제 >>
예) alter table student drop constraint fk_dept;
--student 테이블에서 fk_dept 제약조건을 없앤다. 
*/

select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints
where table_name = 'EMP01';
--sys_c007000 c emp01 not null이 걸려있다. 

--제약조건이 지정된 컬럼 살펴보기 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP01';

COMMIT;

--제약조건 추가하기 
ALTER TABLE EMP01
ADD CONSTRAINT EMP01_EMPNO_FK FOREIGN KEY(DEPTNO)
REFERENCES DEPT(DEPTNO);
DESC EMP01;

--★★추가한 제약조건 EMP01_EMPNO_FK 삭제하기 ★★
ALTER TABLE EMP01 DROP CONSTRAINT EMP01_EMPNO_FK;


SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('EMP01');


--제약조건 살펴보기
select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'DEPT';

--제약조건이 지정된 컬럼 살펴보기 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'DEPT';


SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM EMP01;

commit;

--오류가 나는데 이유는
--첫 번째 컬럼(empno)은 primary key 제약조건이므로
--유일한 값을 가져야한다.
--1010값이 이미 존재하므로 데이터를 삽입할 수 없다. 
--원래 emp 기본 테이블은 손 대지 않는 것이 좋은데
--안 들어가는 걸 확인하려고 여기서 그냥 확인해본 것.
insert into emp(empno, ename, job, deptno)
values (1010,'홍길동','사원',50);


--제약조건 살펴보기
select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'EMP';

--제약조건이 지정된 컬럼 살펴보기 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP';


--DEPT 테이블에 행 추가하기
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(50, '기획부','LA');
SELECT * FROM DEPT;

--IN 연산자를 사용하여 두 개의 테이블에 대한 현재 사용자의 제약조건 조회학
SELECT * FROM USER_CONSTRAINTS
WHERE table_name IN('EMP','DEPT');

--데이터 지우기 
SELECT * FROM EMP05;
--EMPNO = 1010값이 없기 때문에 0개 행이 삭제되었다는 문구 출력
DELETE EMP05 WHERE EMPNO = 1010;

--새롭게 값을 추가해주면 삭제 가능해진다.
--일단 추가만 해주기 
INSERT INTO EMP05
VALUES(1010,'홍길동','사원',50);
SELECT * FROM EMP05;

COMMIT;

--참조 무결성을 위한 FORIGN KEY 제약조건
drop table emp06;
create table emp06(
empno number(4) constraint emp06_empno_pk primary key, --P
ename varchar2(10) constraint emp06_ename_nn not null, --C
job varchar2(9),
deptno number(2)
constraint emp06_deptno_fk references dept(deptno) --R
);
desc emp06;
select * from emp06;
select * from dept;

--제약조건 살펴보기
select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'EMP06';

--제약조건이 지정된 컬럼 살펴보기 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP06';

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP06';


--여기서 DEPTNO = 50 은 외래키가 걸려있는데 
--DEPT 테이블에서 DEPTNO 50인 값들을 참조한다.
--여기서 알 수 있는 제약조거명은 명명규칙이다
--DEPT(DEPTNO) 50번 부서 기획부가 참조제약조건이 걸린것이다. 
--REFERENCES DPT(DEPTNO) DEPT 테이블에서 50번부서 기획부 LA
INSERT INTO EMP06
VALUES(1010, '홍길동', '사원', 50);
SELECT * FROM EMP06;

--이것도 에러가 나는데
--첫번째 컬럼 (EMPNO)의 제약조건이 PRIMARY KEY라 
--유일한 값을 받는데 1010 값이 이미 삽입되어 있으므로 에러가 난다.
INSERT INTO EMP06
VALUES(1010, '홍길동', '사원', 30);


--CHECK 제약조건
--입력되는 값을 체크하여 설정된 값 이외의 값이 들어오면
--오류 메시지와 함께 명령이 수행되지 못하게 한다.
--조건으로 데이터의 값의 범위나 특정 패턴의 숫자나 문자 값을 설정할 수 있다. 

--<형식>
--CONSTRAINT 제약명 CHECK (조건식)
--CONSTRAINT EMP_YEAR_CK CHECK(YEAR >=1 AND YEAR =<4) 

DROP TABLE EMP07;

CREATE TABLE EMP07(
empno number(4) constraint emp07_empno_pk primary key, --P
ename varchar2(10) constraint emp07_ename_nn not null, --C
sal number(7,2) constraint emp07_sal_ck check (sal between 500 and 5000),
gender varchar2(1) constraint emp07_gender_ck check(gender in('M','F'))
);
DESC EMP07;

select * from user_constraints
where table_name = 'EMP07';
select * from EMP07;



--제약조건 살펴보기
select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'EMP07';

--제약조건이 지정된 컬럼 살펴보기 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP07';

insert into EMP07 VALUES(1000,'허준',500,'M');
select * from EMP07;

--이건 왜 안될까?
--그 이유는 세번째 컬럼(SAL)과 네번재 컬럼(GENDER)의 제약 조건이 CHECK이기 때문에
--해당 CHECK 조건에 맞지 않아 데이터 삽입이 되지 않는다.
--SAL CHECK 조건은 500이상 5000이하의 데이터
--GENDER의 CHECK 조건은 'M' 또는 'F'의 데이터 
insert into EMP07 VALUES(1010,'허준',200,'A');

--도메인 제약
--각 필드의 값은 정의된 도메인에 속한 값만 허용한다.

/*
DEFAULT 제약조건
아무런 값을 입력하지 않았을 때 지정한 값이 입력이 되도록 하고 싶을 때 사용한다
지역명이라는 컬럼에 아무런 값도 입력하지 않았을 때
디폴트 값이 SEOUL이 들어가도록 하고 싶은 경우
DEFAULT 제약조건을 지정한다. 

레코드를 삽입할때 필드에 대한 값이 정해지지 않았을 경우
사전에 정해놓은 값으로 입력하도록 지정
null 값 대신에 지정된 값이 자동적으로 입력된다.
*/

COMMIT;
select * from dept01;
select * from tab;
drop table dept01;

create table dept01(
deptno number(2) primary key,
dname varchar2(14),
loc varchar(13) default '서울'
);
desc dept01;
SELECT * FROM user_constraints
WHERE TABLE_NAME ='DEPT01';
SELECT * FROM DEPT01;


--제약조건 살펴보기
select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'DEPT01';

--제약조건이 지정된 컬럼 살펴보기 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'DEPT01';

/*
디폴트를 별도로 설정할 수도 있다.
ALTER TABLE STUDENT
ALTER COLUMN YEAR SET DEFAULT 1;

디폴트를 해제할 수도 있다
ALTER TABLE STUDENT
ALTER COLUMN YEAR DROP DEFAULT;

오라클은 DEFAULT에 대한 별도의 설정 및 해제에 SQL 표준을 따르지 않는다.
ALTER TABLE STUDENT MODIFY (YEAR INT DEFAULT 1);
ALTER TABLE STUDENT MODIFY (YEAR INT DEFAULT NULL);
*/

insert into dept01(deptno, dname) values(10,'경리부');
SELECT * FROM DEPT01;

select * from emp01;
drop table emp01;

create table emp01(
empno number(4) primary key, -- primary key 제약조건을 설정한다. 유일한 값을 가지며 null 값을 허용하지 않는다
ename varchar2(10) not null, -- not null 제약조건을 설정한다. null값을 허용하지 않는다.
job varchar2(9) unique, -- unique 제약조건을 설정한다. 유일한 값을 가진다.
deptno number(2) references dept(deptno) --forign key 제약조건을 설정한다.
--dept 테이블의 deptno 컬럼을 emp01테이블의 deptno컬럼이 참조한다.
);
desc emp01;

SELECT * FROM user_constraints
WHERE TABLE_NAME ='EMP01';

--DROP Table 테이블명 [casecade constraints];
/*
종속된 제약조건이 삭제된다.
ALTER TABLE '테이블명' DROP CONSTRAINT '제약조건명'
테이블의 PK, 제약조건 삭제
ALTER TABLE '테이블명' DROP CONSTRAINT PRIMARY KEY;
제약조건 조회
테이블레벨 방식으로 제약조건 지정하기
테이블 레벨의 제약조건 지정은 컬럼을 모두 정의하고 나서
테이블 정의를 마무리 짓기 전에 따로 생성된 컬럼들에 대한 제약조건을 한꺼번에 지정하는 것
복합키로 기본키를 지정할 경우 컬럼형식은 안되고 반드시 테이블 레벨 방식으로 형식을 작성해야만 한다. 
간단히 두개이상의 컬럼이 하나의 기본키로 구성할 때 작성하는거라고 보면 된다.
*/

SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME ='EMP01';

SELECT * FROM EMP02;
DROP TABLE EMP02;

--컬럼을 정의하고 나서 다시 제약조건을 지정한 형태이다.
CREATE TABLE EMP02(
EMPNO NUMBER(4),
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR(9),
DEPTNO NUMBER(2),
UNIQUE(JOB),
FOREIGN KEY(DEPTNO) references DEPT(DEPTNO)
);

DESC EMP02;


select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name = 'EMP02';

select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP02';

SELECT * FROM EMP03;
DROP TABLE EMP03;

CREATE TABLE EMP03(
EMPNO NUMBER(4),
ENAME VARCHAR2(10) CONSTRAINT EMP03_ENAME_NN NOT NULL,
JOB VARCHAR(9),
DEPTNO NUMBER(2),
CONSTRAINT EMP03_EMPNO_PK PRIMARY KEY (EMPNO),
CONSTRAINT EMP03_JOB_PK UNIQUE (JOB),
CONSTRAINT EMP03_DEPTNO_FK FOREIGN KEY (DEPTNO)
REFERENCES DEPT (DEPTNO)
);
-- 테이블 레벨 방식으로 제약조건 지정하기
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP03';
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in('EMP03');

CREATE TABLE MEMBER01(
NAME VARCHAR(10),
ADDRESS VARCHAR2(30),
HPHONE VARCHAR2(16),
CONSTRAINT MEMBER01_COMBO_PK PRIMARY KEY (NAME, HPHONE)
);
DESC MEMBER01;

--제약조건 살펴보기
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name = 'MEMBER01';

--제약조건이 지정된 컬럼 살펴보기 --> (복합키인지 살펴보려고)

select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'MEMBER01';

DROP TABLE EMP01;

CREATE TABLE EMP01(
empno number(4),
ename varchar2(10),
job varchar2(9),
deptno number(2));

--제약조건을 추가하지 않아 조회된 데이터가 없다.
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='EMP01';

--제약조건 추가하기
-- <형식>
--ALTER TABLE 테이블명
--ADD CONSTRAINT 제약명 제약조건(컬럼명);

--제약조건 변경하기
--ALTER TABLE 문을 사용하여 이미 존재하는 테이블에
--제약조건을 추가하거나 변경할 수 있다.
-- <형식>
--ALTER TABLE 테이블명
--MODIFY CONSTRAINT 제약명 제약조건(컬럼명)




--------------------------22-02-24 수업내용---------------------------

--ALL 연산자
/*
ALL 조건은 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와
모든 값이 일치하면 참이다. 찾아진 값에 대해서 AND 연산을 해서
모두 참이면 참이 되는 셈이다. ALL 은 " 모든 비교값 보다 크냐"고
묻는 것이 되므로 최대값보다 더 크면 참이 된다.
30번 부서의 최대 급여 구하기 
*/

--30번 부서의 최대급여 구하기
SELECT MAX(SAL) "최대 급여"
FROM EMP
WHERE DEPTNO=30;

--문) 서브쿼리 연산자를 이용한 30번 부서의 최대급여보다 많은 급여사원 구하기
--아래 문장은 단일행 연산자를 이용했기에 그룹함수를 이용했다.
--그룹으로 DEPTNO를 묶어주고 HAVING으로 조건을 줬다.
SELECT ENAME, SAL FROM EMP
WHERE SAL > (
SELECT MAX(SAL) FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 30
);


--문) 서브쿼리 연산자를 이용한 30번 부서의 최대급여보다 많은 급여사원 구하기 ALL 연산자를 사용하시오
--다중행 연산자를 이용하면 더 간단하게 출력이 가능하다.

SELECT ENAME, SAL 
FROM EMP
WHERE SAL > ALL (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);


SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL(SELECT MAX(SAL) 
FROM EMP
WHERE DEPTNO=30);



SELECT ROUND(AVG(SAL)) "평균급여" FROM EMP WHERE DEPTNO=30;

--문) 서브쿼리를 이용한 30번 부서의 평균보다 많은 급여사원 구하기 
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL(SELECT ROUND(AVG(SAL)) 
FROM EMP
WHERE DEPTNO=30);

--30번 부서의 최대급여 구하기
SELECT MAX(SAL) "최대 급여"
FROM EMP
WHERE DEPTNO=30;


--ANY 연산자
/*
ANY 조건은 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상만 일치하면 참이다. 
ANY는 찾아진 값 중에서 가장 작은 값 즉, 최소값보다 크면 참이된다.
*/
--문) 30번 부서의 최소 급여보다 많은 급여를 받는 사원 구하기 ENAME, SAL
--단일행 그룹 연산자를 이용해서 하면 이렇게 된다. 
SELECT ENAME, SAL FROM EMP
WHERE SAL > (
SELECT MIN(SAL) FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 30
);

--문) 30번 부서의 최소 급여보다 많은 급여를 받는 사원 구하기 ENAME, SAL
--ANY 연산자를 이용한다.

select min(sal) 최소급여 from emp where deptno=30;

select ename, sal
from emp
where sal > any(select min(sal)
from emp
where deptno=30);

--문) 다중행 비교방식으로 30번 부서의 최소 급여보다 큰 급여를 ename, sal을 조회하세요.
select ename, sal
from emp
where sal > any(select min(sal) from emp)
and sal > any(select sal from emp where deptno=30);

--그냥 단일연산자 비교방식으로도
--최소값보다 큰 값은 구할 수 있다. 
--왜냐? 최소값은 단일행으로 하나의 값이 나오기 때문에 
--만약 MIN(SAL)이 여러 행으로 나왔다면 다중행 연산자 사용해야 되는 것.! 

select ename, sal
from emp
where sal > (select min(sal)
from emp
where deptno=30);

--exist 연산자 
--EXIST 메인쿼리 비교조건이 서브쿼리가 반환한 목록의 어떤 값과 같은지 비교한다.
--결과 중 값이 하나라도 존재하면 참 값 
/*
서브쿼리의 결과가 값이 참이 나오기만 하면 바로 메인 쿼리의 결과 값을 리턴한다.
서브 쿼리의 결과 값이 존재하지 않는다면 메인 쿼리의 어떤 값도 리턴되지 않는 문장이다
쿼리 속도 면에서는 서브 쿼리 사용 시 in 보다는 exists가 훨씬 빠르다.
eixists의 반대말로 not exists도 사용 가능하다.
*/

select * from dept
where exists(select *
from emp
where deptno=10);

--문 ) 직급이 과장인 사원이 속한 부서의 부서번호와 부서명과 지역을 출력하는 sql문을 완성하세요 in을 사용한다.
select * from emp;
select * from dept;

select * from emp where job='과장';

--select d.demptno, dname, loc
--from emp e, dept d
--where job in (select job from emp
--where job='과장')
--and e.deptno = d.deptno;

select * from dept 
where deptno in(select deptno from emp
where job='과장');


select sal from emp where job='과장';
--문) 과장보다 급여를 많이 받는 사원들의 이름과 급여 직급을 출력하되 과장은 생략하고 작성하세요 all
--과장의 급여를 살펴보면 500, 450이 나온다. 
--all을 쓰면 두개의 값이 참일 때 성립되므로 최대값인 500보다 큰 값이 출력된다. 
--만약 any를 쓰면 하나만 성립되도 문장이 실행되므로 최소값인 450 이상인 사람들이 출력된다.
select ename, job, sal
from emp
where sal > all(select sal from emp where job='과장');



-----------------------
/*
VIEW 뷰의 개념
뷰(VIEW)는 한마디로 물리적인 테이블을 근거한 논리적인 가상 테이블
뷰는 복잡한 쿼리를 단순화 시킬수 있다.
뷰는 사용자에게 필요한 정보만 접근하도록 접근을 제한할 수 있다.
뷰는 기본 테이블에서 파생된 객체로서 기본 테이블에 대한 하나의 쿼리문이다.
뷰(VIEW)란 '보다'란 의미를 갖고 있는 점을 감안해 보면 알 수 있드싱
실제 테이블에 저장된 데이터를 뷰를 통해서 볼 수 있도록 한다
사용자에게 주어진 뷰를 통해서 기본 테이블을 제한적으로 사용하게 된다. 
뷰(VIEW)의 정의와 특징
1) 뷰의 정의 : 하나 이상의 테이블의 데이터의 부분 집합으로 구성되는 논리적인 테이블

2) 뷰의 특징 : 
테이블뿐만 아니라 다른 뷰를 기초로 생성 가능
뷰 자체는 데이터를 직접 포함하지 않지만, 창문 역할을 하는 뷰를 통해서 데이터의 검색 및 수정이 가능
열 별칭을 사용해서 생성된 뷰에 대해서는 열 별칭을 사용한 조작만 가능

3)뷰 사용의 장점 : 테이블을 직접 사용하지 않고 뷰를 사용하면 다음과 같은 장점을 얻을 수 있다. 
1. 보안을 위해서 DB에 대한 접근을 제한할 수 있다.
사용자는 특정 테이블의 데이터 가운데 뷰로 정의된 특정 부분만을 보게 된다.
2. 복잡한 질의를 단순한 질의로 변환할 수 있다.
다중 테이블에서 뷰를 생성하면 테이블 조인이 불필요하게 된다.
즉) 주로 사용하는 정보만을 대상으로 데이터 조작을 수행할 수 있음 
3. 데이터 독립성을 허용
테이블이 변경되어도 뷰는 그대로 유지할 수 있으므로,
사용자와 응용 프로그램에 대한 데이터 독립성을 제공할 수 있다.
4. 동일한 데이터에 대해서 다른 뷰를 생성할 수 있다.
조건에 따라 데이터에 접근하는 사용자 그룹 분류해서, 각각 동일한 테이블의 다른 뷰를 기초로 데이터 조작을 할 수 있게 한다.

4) 뷰의 종류
뷰의 종류는 뷰는 크게 단순 뷰와 복합 뷰로 구분할 수 있다.
단순 뷰(Single View) : 오직 하나의 테이블만을 기초로 생성된 뷰
표현식 등에 의해 데이터가 조작된 경우를 제외하면, 뷰를 통한 모든 DML 연산의 수행이 가능

복합 뷰(Complex or Join View) : 다중 테이블을 기초로 생성된 뷰
데이터 그룹핑 또는 그룹 함수를 사용해서 뷰 생성 가능
뷰를 통한 모든 DML이 항상 가능한 것은 아니다.

5) 뷰(view)생성
create view 명령문에 서브쿼리를 이용해서 생성하고,
뷰가 생성된 다음 뷰 이름과 뷰정의는 데이터 사전의 user_views 테이블에 저장된다.

CREATE VIEW 명령의 형식 서브쿼리를 수행해서 가져온 열들만으로 뷰를 생성한다.
<형식>
CREATE [FORCE | NOFORCE]
VIEW 뷰이름[(열 별칭1 [, 열별칭2, ...]) ]
AS 서브쿼리
[WITH CHECK OPTION [CONSTRAINT 제약이름]]
[WITH READ ONLY];

열별칭 : 서브쿼리에 의해 선택된 열이나 표현식에 대한 별칭을 지정
FORCE : 기본테이블의 존재 여부와 무관하게 뷰를 생성
NOFORCE : 기본테이블이 존재 할 때만 뷰를 생성
WITH CHECK OPTION
뷰에 의해 접근 가능한 행만 삽입 또는 수정될 수 있음을 명시
WITH READ ONLY
뷰에 대해서 SELECT만 가능하고, 다른 DML 연산은 불가능함을 명시 

*/

--EMP 테이블과 똑같은 EMP_COPY 테이블을 생성한다.
--AS를 통해서 테이블 복사하기
CREATE TABLE EMP_COPY
AS SELECT * FROM EMP;

select * from emp_copy;

--2. view 권한
--grant select on 뷰이름 to 사용자명
--CMD 가서 Grant create view to scott


--"insufficient privileges" 오류가 뜬다 왜??
--권한이 불충분하다는 의미이다.
--grant create any view to tester1;
--이렇게 명령어 주기
create view emp_view30
as
select empno, ename, deptno
from emp_copy
where deptno=30;

SELECT * FROM emp_view30;



/*
뷰의 동작원리
1. 사용자가 뷰에 대해서 질의를 하면 user_views 에서 뷰에대한 정의를 조회
2. 기본테이블에 대한 뷰의 접근 권한을 살핌
3. 뷰에 대한 질의를 기본테이블에 대한 질의로 변환
4. 기본 테이블에 대한 질의를 통해 데이터 검색함
5. 검색된 결과를 츨력함


뷰를 사용하는 이유
1. 복잡하고 긴 쿼리문을 뷰로 정의하면 접근을 단순화 시킨다
2. 보안에 유리하다.

뷰의 수정 및 삭제와 복합 뷰 생성
1. 뷰의 수정
2. 뷰의 삭제
3. 복합 뷰 생성

1.뷰 수정: 뷰를 생성할 때 사용한 명령인 CREATE OR REPLACE VIEW
--명령을 사용해서, 이미 존재하는 뷰를 대체함으로써 뷰를 수정하게 된다.
--(1) CREATE OR REPLACE VIEW 명령의 형식 이미 존재하는 뷰를 없애고
--같은 이름의 뷰를 새로 생성한다
--단, 기존 뷰가 없는 경우에도 새로운 뷰를 생성한다.
--(2)뷰 수정의 특징
--1)이미 생성된 뷰를 그대로 두고 수정하는 것이 아니라,
--이미 생성된 뷰를 제거하고 새로운 뷰를 생성해서 대체함으로써
--수정하는 효과를 얻게 되는 것
--2)뷰가 존재하지 않는 경우에도 오류가 발생하지 않고 뷰를 새로 생성하게 됨.

2. 뷰의 삭제
뷰가 기초하는 기본 테이블에는 영향을 주지 않고 뷰만 삭제함
즉) 데이터에 전혀 손실을 주지 않고, 논리적인 테이블인 뷰를 삭제함
삭제된 뷰를 기반으로 생성된 뷰나 어플리케이션은 무효화됨
뷰의 생성자 또는 DROP ANY VEIW 권한을 가진 사용자만 삭제 가능

3. 복합 뷰 생성
CREATE VIEW 명령을 사용해 다중 테이블로부터 복합 뷰를 생성할 수 있다.
CREATE VIEW 명령의 형식 서브쿼리를 수행해서 가져온 열들만으로 뷰를 생성한다.

<형식>
CREATE [FORCE | NOFORCE]
VIEW 뷰이름[(열 별칭1 [, 열별칭2, ...]) ]
AS 서브쿼리
[WITH CHECK OPTION [CONSTRAINT 제약이름]]
[WITH READ ONLY];

뷰의 활용
1. 뷰의 확인
2. 뷰를 통한 데이터 검색
3. 뷰 질의의 수행 과정
4. 뷰에서의 DML 연산 수행 규칙
5. WITH CHECK OPTION 옵션
6. WITH READ ONLY 옵션
7. 뷰 수정하기 위한 OR REPLACE 옵션
*/

SELECT VIEW_NAME, TEXT FROM USER_VIEWS;
--서브쿼리로 만들어진 뷰 조회
select * from emp_view30;

insert into emp_view30
values(1111,'aaaa',30);
--뷰에 값을 넣었는데 원래 EMP_COPY테이블에도 값이 추가된다.
select * from emp_copy;
select * from emp_view30;

--복합 뷰 생성

select e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
from emp_copy e, dept d
where e.deptno = d.deptno; --두 테이블을 join

--두 테이블을 join한 서브쿼리로 복합 뷰 emp_view_dept 생성
--emp_copy 테이블의 부서번화와 부서테이블의 부서번호가 같은 emp_copy(e) 테이블과 dept(d) 테이블에서
--사원번호, 사원명, 급여, 부서번호, 부서이름, 위치를 조회하는 뷰를 생성한다.
create view emp_view_dept
as
select e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
from emp_copy e, dept d
where e.deptno = d.deptno;

--복합뷰 조회
--뷰 안에 안경 모양으로 생성되어 있다.
select * from emp_view_dept;

--뷰 생성
create view emp_view
as select empno, ename, job, mgr, hiredate, deptno
from emp;

select * from emp_view;

--drop으로 뷰 삭제
drop view emp_view_dept;
select * from emp_view_dept;

--뷰 수정을 위한 or replace
--create view emp_view30
--as
--select empno, ename, deptno
--from emp_copy
--where deptno=30;
--원래 이렇게 만들어둔 EMP_VIEW30을 새롭게 수정한다. 

create or replace view emp_view30
as select empno, ename, sal, comm, deptno
from emp_copy
where deptno =30;
--기본뷰를 삭제하고 새로 만든다. ( 기존 뷰가 없어도 오류 없이 생성)
select * from emp_view30;

/*
기존 테이블 없이 뷰를 생성하기 위한 force 옵션
뷰를 생성하는 경우에 일반적으로 기본 테이블이 존재한다는 가정 하에서 쿼리문을 작성한다.
극히 드물기는 하지만, 기본 테이블이 존재하지 ㅇ낳는 경우에도 뷰를 생성해야 할 경우가 있다.
이럴 경우 사용하는 것이 force 옵션, 경고와 함께 뷰를 실행해보는 것이다.
*/

create or replace force view employees_view
as select empno, ename,deptno
from employees
where deptno=30; 
--경고 : 컴파일 오류와 함께 뷰가 생성되었다.
--안경 모양이 아닌 엑스 표시와 함께 뷰가 생성된다.
select * from employees_view;

drop view employees_view;

--이게 아니라 밑에 문장이다.! 
select view_name, text from user_viewsdrop view employees_view;
select view_name, text from user_views;
drop view employees_view;

drop view emp_view30;

create or replace view emp_view30
as select empno, ename,sal,comm,deptno
from emp_copy
where deptno=30;

--존재하지 않는 뷰를 재정의 하지만 오류가 발생하지 않는다.
--왜? 리플레이스는 기존의 테이블이 없지만 재정의하더라도 새로 만들어진다


--문) EMP_VIEW30에 급여가 500 이상인 사원을 20번 부서로 변경하기
SELECT * FROM EMP_VIEW30;

UPDATE EMP_VIEW30
SET DEPTNO =20
WHERE SAL >=500;

--따라서 다시 조회한다면 20으로 
--SAL 500인 사람들의 DEPTNO가 빠졌기 때문에
--조회되지 않는 것.! 
SELECT * FROM EMP_VIEW30;
SELECT * FROM EMP;

--문) 변경된 사원들이 있는 20번 부서를 조회

--EMP_COPY 테이블을 통해서 ! 
--원래 5명이었던 20번 부서 사람들이
--위에 UPDATE 문으로 500이상을 20번 부서로 변경해줬으므로
--7명이 되었다.
SELECT * FROM EMP_COPY WHERE DEPTNO=20;

--여기선 5명만 보인다.!
SELECT * FROM EMP WHERE DEPTNO=20;


--------------------------22-02-25 수업내용---------------------------

/*
조건 컬럼 값 변경 못하게 하는 whit check option
뷰를 정의하는 서브 쿼리문에 where 절을 추가하여
기본 테이블 중 특정 조건에 만족하는 로우(행)만으로 구성된 뷰를 생성할 수 있다.
뷰를 생성할 때 where 절을 추가하여 기본 테이블에서 정보가 추출되는
조건을 제시하게 되는데 여기서 연속적으로 with check option을 기술하여 
조건 제시를 위해 사용한 컬럼의 값이 뷰를 통해서 변경되지 못하도록 할 수 있다.
*/

--emp_view30뷰를 생성한다. 
--조건절에 with check option을 지정해줘서
--where절에 사용한 조건의 값은 변경되지 못하게 만들었다. 

drop view emp_view30;

create or replace view emp_view30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno=30 with check option;

select * from emp_view30;

update emp_copy
set deptno=30
where ename = '한예슬' or  ename = '신동협' or  ename = '장동건' or  ename = '조향기';



select * from emp_copy;
select *  from emp;


--ORA-01402: view WITH CHECK OPTION where-clause violation
--with check option을 설정해뒀기에 수정이 불가능하다.
update emp_view30 set deptno=20 where sal>=200;

--emp의 컬럼, 값들을 복제하는 emp_copy2 테이블을 만든다.
create table emp_copy2
as
select * from emp;

select * from emp_copy2;

--emp_copy2를 복제하는
--view_chk30을 만든다. 
create or replace view view_chk30
as
select empno, ename, sal, comm, deptno
from emp_copy2
where deptno=30 with check option;

select * from EMP_COPY2;

--서브쿼리 조건이 추가된다
----with check option 인데 왜??
--with check option은 부서 번호에만 지정되어 있어
--다른건 변경할 수 있는 것. 
--부서번호가 30인 사원의 comm만 1000으로 설정 
update view_chk30 set comm = 1000;

--오류가 뜬다 왜?
--ORA-01402: view WITH CHECK OPTION where-clause violation
--왜냠 처음에 뷰 생성할 때 where deptno=30 with check option;
--deptno 조건에 with check option을 설정했기 때문에 
update view_chk30 set deptno=20 where sal>=200;



--읽기만 가능한 view를 하나 생성한다.
create or replace view view_read30
as
select empno, ename, sal, comm, deptno
from emp_copy2
where deptno=30 with read only;

select * from view_read30;
--오류가 뜬다 왜?
--42399.0000 - "cannot perform a DML operation on a read-only view"
--읽기 전용으로 설정해 놨기에 수정은 불가능하다. 
--즉) 읽기 전용 뷰이기에 해당 DML 명령을 수행할 수 없다.
update view_read30 set comm=2000;


--hiredate를 오름차순으로 정렬하는
--view_hire 뷰를 만든다. 

DROP VIEW view_hire;
create or replace view view_hire
as
select empno, ename, hiredate
from emp_copy
order by hiredate;

--hiredate를 순번으로 지정하지 않고
--emp_copy를 복제하는 뷰를 만든다면
--empno 순서대로 로우(행)이 출력된다. 
--이렇게 출력 된 값에 rownum 컬럼을 추가하고 
--hiredate를 오름차순으로 설정해서 select 한다면
--hiredate  순서대로 나오지 만들어진 empno 순서대로 순위가 매겨져
--rownum은 empno를 따르는데 출력된 순서는 hiredate를 오름차순으로 출력해
--순서 즉) rownum이 뒤죽박죽 출력된다. 
create or replace view view_hire
as
select empno, ename, hiredate
from emp_copy;

select * from view_hire;
select * from emp_copy;

/*
ROWNUM 컬럼 성격 파악하기
ROWNUM 컬럼은 오라클의 내부적으로 부여되는데 INSERT문을 이용하여
입력하면 입력한 순서에 따라 1씩 증가되면서 값이 지정된다.
데이터가 입력된 시점에서 결정되는 ROWNUM 컬럼 값은 바뀌지 않는다. 

*/

--문) 입사일을 기준으로 오름차순 정렬한 후 ROWNUM컬럼 출력하기 
--입사일이 빠른 사원 5명만을 얻어보자
select rownum, empno, ename, hiredate from view_hire
order by hiredate;

--만약 처음에 뷰를 생성했을 때 hiredate에 우선순위를 주지 않고 생성했다면
--이렇게 from 절을 묶어서 order by가 먼저 실행되도록 from 절을 묶어줘야
--원하는 값 ( 입사일 빠른 기준을 오름차순으로 출력하고 rownum으로 번호매기기)
--이 정상적으로 출력되는 것.! 
select rownum , ob.* from(select * from view_hire order by hiredate) ob;

select rownum, empno, ename, hiredate from view_hire
where rownum <=5
order by hiredate;

--입사일 빠른 5명만 출력해라 
--where 절에 rownum 조건을 주면 된다.
SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM VIEW_HIRE
WHERE ROWNUM <= 5;




--------------------------22-02-28 수업내용---------------------------

--rownum이 먼저 부여되고 order by에 의해 정렬이 되기 때문에
--rownum 값이 정렬되지 않는다.

select * from emp_copy;
select rownum, empno, ename, hiredate
from EMP_COPY
where rownum <=5
order by hiredate;

select rownum, ob.*
from (select * from emp_copy where rownum<=5
order by hiredate)ob;


--뷰와 rownum 컬럼으로 top-n 구하기
--입사일이 빠른 사람 5명 만을 얻어오기 위해서 입사일 순으로 뷰를 생성하고
--이를 다시 상위 5개만 얻어오기 위해서 뷰를 select 문으로 조회하면서
--뷰를 rownum 컬럼을 where 절의 조건으로 제시

--인라인 뷰로 top-no 구하기
--인라인 뷰는 sql 문장에서 사용하는 서브쿼리의 일종이다.
--보통 from 절에 위치해서 테이블처럼 사용한다. 

--형식
--select ....
--from ...(select..) alias -- 인라인뷰
--MAIN QUERY(바깥쪽 쿼리문) SUB QUERY(안쪽 쿼리문) --> 인라인 뷰

--문) 인라인 뷰로 바꿔보기 
select rownum, empno, ename, hiredate
from 
(select empno, ename, hiredate  
from EMP_COPY 
order by hiredate)
where rownum <=5;

--문) 부서별 최대급여와 최소급여를 출력하는 sal_view 만들기

create view sal_view
as select d.dname, max(e.sal) as max_sal, min(e.sal) as min_sal
from emp_copy e, dept d
where e.deptno = d. deptno
group by d.dname;

select * from sal_view;
select * from emp_copy;

--rownum을 이용해서 조회하기
--각각 부서의 순번을 매기고 
--뷰 생성할 때 지정해논 as 별칭으로 값을 출력한다. 
select rownum, dname, max_sal, min_sal from sal_view;


-- 만약 인라인 뷰를 사용하지 않고 일반 상식적으로 값을 출력하면?
--하지만 이렇게 출력하면 원하는 rownum 값을 얻어낼 수 없으므로
--아래 문제와 같이 출력한다.
select rownum as ranking, empno, ename, sal
from emp_copy
order by sal desc;


--문) 급여를 많이 받는 순서대로 3명만 ranking, empno, ename, sal 조회하는 인라인뷰
--emp_copy 테이블로

select rownum as ranking, empno, ename, sal
from ( select empno, ename, sal from emp_copy order by sal desc)
where sal is not null AND rownum <=3;

select rownum as ranking, empno, ename, sal
from ( select empno, ename, sal from emp_copy order by sal desc);



/*
뷰의 종류, 설명
OR REPLACE
새로운 뷰를 만들 수 있을 뿐만 아니라 이미 만든 뷰를 삭제하지 않고 새로운 구조의 뷰로 변경 가능
FORCE
기본 테이블의 존재 여부에 상관 없이 뷰를 생성
WITH CHECK
해당 뷰를 통해 볼 수 있는 범위 내에서만 UPDATE 또는 INSERT 가능하게 하는 조건
WITH READ ONLY
뷰를 통해서는 기본 테이블의 어떤 필드에 대해서도 내용을 절대 변경할 수 없도록 한다.

*/



/*
시퀀스 개념 
시퀀스는 테이블 내의 유일한 숫자를 자동으로 생성하는 자동 번호 발생이므로
시퀀스를 기본키로 사용하게 되면 사용자의 부담을 줄일 수 있다 .
오라클하고 MYSQL이 부여하는 방식이 좀 다르다 

CREATE SEQUENCE 시퀀스_이름
[START WITH n]
[INCREMENT BY n]
[(MAXVALUE n | NOMAXVALUE)]
[[(MINVALUE n | NOMINVALUE)]
[(CYCLE n | NOCYCLE)]
[(CACH n | NOCACHE)];

*/

DROP SEQUENCE DEPT_DEPTNO_SEQ;

--dept_deptno_seq 라는 시퀀스가 생성되는데
--증감숫자는 10으로 10씩 증가하고
--시작 숫자는 10이다.
--즉) 10부터 시작해서 10씩 증가하게 되는 것.
create sequence dept_deptno_seq
increment by 10
start with 10;

desc user_sequences;

--시퀀스의 지정된 값들을 확인한다. 
select sequence_name, min_value, max_value,
increment_by, cycle_flag
from user_sequences;

select * from user_sequences; -- 해당 계정의 시퀀스 조회

/*
start with
:시퀀스 번호의 시작값을 지정할 때 사용하고 start with1 이라고 기술한다.
increment by 
:연속적인 시퀀스 번호의 증가치를 지정할 떄 사용 1씩 증가하면 increment by 1 이라고 기술
cycle|nocycle
: cycle은 최대값까지 증가하고 나면, 완료하고 다시 start with 옵션을 지정한 시작값에서 다시 시작한다.
nocycle은 증가완료되면 에러를 유발시킨다.
cache n | nocatch
cache(캐시)는 메모리상의 시퀀스 관리값을 관리 기본값은 20
nocache는 메모리상에서 시퀀스를 관리하지 않습니다.
*/

--dept_deptno_seq의 nextval과 currval을 조회한다.
select dept_deptno_seq.nextval from dual; -- 먼저 해줘야한다. (10)
select dept_deptno_seq.currval from dual; -- 10
select dept_deptno_seq.nextval from dual; -- 20
select dept_deptno_seq.currval from dual; -- 20

/*
currval nextval 활용법
시퀀스의 현재 값을 알아내기 위해서 CURRVAL을 사용하고
다음 값을 알아내기 위해서는 NEXTVAL을 사용한다
CURRVAL은 CURENT VALUE의 약어로서 현재 값을 반환한다.
NEXTVAL은 NEXT VALUE의 약어로서 다음 값이란 의미를 가지며
현재 시퀀스의 값의 다음 값을 반환한다. 

NEXTVAL, CURRVAL 사용할 수 있는 경우
1. 서브쿼리가 아닌 SELECT 문
2. INSERT문의 SELECT 절
3. UPDATE 문의 SET 절

NEXTVAL, CURRVAL 사용할 수 없는 경우
1. VIWE의 SELECT 절
2. DISTINCT 키워드가 있는 SELECT문 
3. GROUP BY , HAVING, ORDER BY 절이 있는 SELECT문 
4. SELECT, DELETE, UPDATE의 서브쿼리
5. CREATE TABLE ALTER TABLE명령의 DEFAULT 값
6. 시퀀스 객체 생성하기 SAMPLE_SEQ
*/

--시퀀스 객체 생성하기 SAMPLE_SEQ
CREATE SEQUENCE SAMPLE_SEQ;

--실행되지 않는 이유 
SELECT SAMPLE_SEQ.CURRVAL FROM DUAL;

--NEXTVAL이 먼저 실행되야 하기 때문에,,?
--CURRVAL을 먼저 실행하면 에러가 난다.
SELECT SAMPLE_SEQ.NEXTVAL FROM DUAL;
SELECT SAMPLE_SEQ.CURRVAL FROM DUAL;

/*
시퀀스 오류
다음과 같은 이유때문에 시퀀스 값에서 불규칙한 간격이 생기는 오류가 발생한다.

1. 롤백이 발생한 경우
시퀀스를 포함한 문장을 롤백하면 이후 롤백된다.
이전에 생성된 시퀀스 번호를 모두 잃게 되므로 이후 시퀀스에 간격이 발생

2. 시스템이 손상된 경우
CACHE 옵션으로 미리 시퀀스를 생성해서
메모리에 저장해둔 경우 시스템의 손상으로 비정상적인 종료가 되면
미리 생성한 시퀀스 값을 모두 잃어버리게 되므로 이후 시퀀스 간격이 발생한다.

3. 동일한 시퀀스가 다중 테이블에서 사용된 경우
시퀀스값이 불규칙적으로 변할 수 있다. 
*/

DROP SEQUENCE SAMPLE_SEQ;

--문) 시작값이 1, 값이 1씩 증가하고 최대값이 100000인 시퀀스 EMP_SEQ 생성하기 

create sequence EMP_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 100000;

select sequence_name, min_value, max_value,
increment_by, cycle_flag
from user_sequences;

CREATE SEQUENCE EMP_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 100000;

desc user_sequences;

SELECT * FROM user_sequences
WHERE SEQUENCE_NAME = 'EMP_SEQ';


DROP TABLE EMP01;
--시퀀스를 어떻게 사용하는지 살펴보기 위해서
--EMP01 테이블을 생성한다.
--제약조건은 EMPNO에만 지정함. 
CREATE TABLE EMP01(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR(10),
HIREDATE DATE
);

--EMP01 테이블에 값을 넣는데 EMPNO은 시퀀스 값을 넣는다.
--EMP_SEQ.NEXTVAL을 넣어주는데 EMP_SEQ는 시작값 1 증가값 1이기에
--EMPNO가 1 -> 2 -> 3 이렇게 증가하게 된다.
INSERT INTO EMP01
VALUES (EMP_SEQ.NEXTVAL, '홍길동', SYSDATE);
INSERT INTO EMP01
VALUES (EMP_SEQ.NEXTVAL, '강감찬', SYSDATE);
INSERT INTO EMP01
VALUES (EMP_SEQ.NEXTVAL, 'JULIA', SYSDATE);

SELECT * FROM EMP01;

--시퀀스 조회하기
select sequence_name, min_value, max_value,
increment_by, cycle_flag
from user_sequences;

--왜 3일까??
--EMP_SEQ는 1씩 증가하는데 
--3번의 사원 값들을 INSERT로 NEXTVAL 해줬기에
--1씩 증가해서 3이 되다. 
SELECT EMP_SEQ.CURRVAL FROM DUAL;

/*
시퀀스의 수정 
ALTER SEQUENCE 명령으로 시퀀스의 증가치, 최대값, 최소값, 사이클 및 캐쉬 옵션을 변경할 수 있다.
ALTER SEQUENCE 시퀀스_이름
[INCREMENT BY n]
[(MAXVALUE n | NOMAXVALUE)]
[[(MINVALUE n | NOMINVALUE)]
[(CYCLE n | NOCYCLE)]
[(CACH n | NOCACHE)];
시퀀스 수정 지침
시퀀스 생성자나 ALTER 권한을 가진 사용자만 수정할 수 있다.
제외
★ START WITH 옵션을 제외하고 시퀀스를 생성할 때 지정한 여러 옵션을 변경할 수 있다. 

시퀀스 수정 지침
시퀀스 생성자나 ALTER 권한을 가진 사용자만 수정할 수 있다.
시퀀스를 수정하면 수정 이후 생성되는 시퀀스 번호에만 영향을 미친다.
시퀀스를 생성할 때 다른 시작 번호부터 다시 생성하려면 기존 시퀀스를 삭제하고 다시 생성해야된다.
유효성 검사를 자동으로 수행한다.
EX) 수정된 MAXVALUE가 현재 시퀀스 번호보다 작은 경우, 수정이 허용되지 않는다.
*/

DROP SEQUENCE DEPT_DEPTNO_SEQ;
--새롭게 DEPT_DEPTNO_SEQ를 생성하는데
--alter로 수정해보기 위한 예제
--시작 값은 10 증가 값도 10 최대값은 30으로 지정한다.
CREATE SEQUENCE DEPT_DEPTNO_SEQ
START WITH 10
INCREMENT BY 10
MAXVALUE 30;

--시퀀스 조회하기 
select * from user_sequences;
select sequence_name, min_value, max_value,
increment_by, cycle_flag
from user_sequences;

--nextval 먼저 실행해주고 currval 조회해보기 
select dept_deptno_seq.nextval from dual;

SELECT * FROM user_sequences
WHERE SEQUENCE_NAME = 'DEPT_DEPTNO_SEQ';

select dept_deptno_seq.currval from dual;

--시퀀스 수정 해보기 alter 로 ! 
alter sequence dept_deptno_seq
maxvalue 100 -- 최대값을 100으로 변경
cycle -- 최대값 이후 초기값으로 설정하는 옵션 추가
cache 2; --캐시 사이즈 2 설정 

drop table dept_example;
--새로운 테이블을 생성한다.
--dept_example 테이블의 deptno 값에 기본키값을 줬다.
--기본키값이란? 중복 and null값이 들어올 수 없는 것.
create table dept_example(
deptno number(2) primary key,
dname varchar2(15),
loc varchar2(15)
);

--제약조건 살펴보기
--제약조건 복습 ! 
--★ 제약조건에서 테이블명은 대문자로★
select constraint_name, constraint_type, table_name
from user_constraints
where table_name in('DEPT_EXAMPLE');

--제약조건이 지정된 컬럼 살펴보기 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'DEPT_EXAMPLE';



drop sequence dept_example_seq;

--dept_example_seq 시퀀스 생성하기
--초기값 10 증가값 10 반복은 없음 
create sequence dept_example_seq
increment by 10
start with 10
nocycle;

select * from user_sequences;

insert into dept_example values(dept_example_seq.nextval, ' 인사과', '서울');
select * from dept_example;
select dept_example_seq.currval from dual;
insert into dept_example values(dept_example_seq.nextval, ' 경리과', '서울');
insert into dept_example values(dept_example_seq.nextval, ' 총무과', '대전');
insert into dept_example values(dept_example_seq.nextval, ' 기술과', '인천');

select * from dept_example;
select dept_example_seq.currval from dual;



/*
1. 인덱스(index)란?
포인터를 사용해서 행의 검색을 촉진할 수 있는 DB 객체

2. 인덱스의 특징
테이블 행에 대한 직접적이고 빠른 엑세스를 제공함
인덱스는 오라클 서버에 의해 자동으로 생성되거나, 사용자에 의해 명시적으로 생성될 수 있음
인덱스는 오라클 서버에 의해서 자동으로 사용되고 유지됨
인덱스는 테이블과는 논리적, 물리적으로 독립적
기본 테이블에 영향을주지 않고 생성하거나 제거할 수 있음
기본 테이블은 제거하면, 인덱스도 자동으로 제거된다.
인덱스를 너무 많이 생성하면 오히려 DML 처리의 효율을 저하시키게 된다.
(보통 5개 정도,,? 그 이상은 만들지 말자)

3. 인덱스 생성 방법
인덱스 생성 방법에는 자동과 수동의 두 가지 방법이 있다.

4. 자동 인덱스 생성
테이블을 생성할 때 Primary Key나 Unique 제약 조건이 정의된 열에 대해서
오라클 서버가 유일한 인덱스를 자동으로 생성한다.

5.수동 인덱스 생성
검색 속도의 향상을 위해 사용자가 CREATE INDEX 명령을 사용해서
명시적으로 유일하지 않는 인덱스를 생성할 수 있다.
하나 이상의 열에 대해서 하나의 인덱스를 생성할 수 있다.

CREATE INDEX 명령의 형식
ON 절에 어떤 테이블의 어떤 열에 대해 인덱스를 생성할 지를 명시한다.
CREATE INDEX 인덱스명
ON 테이블명(열이름1, [열 이름2...]);

수동 인덱스 생성 예
EMP 테이블의 EMP_NAME 열에 대한 검색이 빈번히 발생하므로
이 검색 속도를 향상 시킬 수 있도록 인덱스를 생성한다.

6. 인덱스가 유용한 경우와 불필요한 경우 
<유용한 경우>
1)열이 WHERE 절이나 조인 조건에서 자주 사용되는 경우
2)열이 광범위한 값을 포함하는 경우
3)열이 많은 수의 null 값을 포함하는 경우
4)null 값에 대해서는 인덱스가 생성되지 않으므로 null 값이 많을수록 인덱스의 크기가 작아진다.
5) 둘 또는 그 이상의 열들이 WHERE 절 또는 조인 조건에서 자주 함께 사용되는 경우
6)테이블이 대형이고 대부분의 질의가 행의 2~4% 보다 적게 읽어 들일 것으로 예상되는 경우

<불필요한 경우>
1) 테이블 사이즈가 작은 경우
2)해당 열이 질의의 조건으로 자주 사용되지 않는 경우
3)테이블이 자주 갱신되는 경우(인덱스 유지를 위해 DML 효율이 나빠진다
4) 대부분 질의가 행의 2~4% 이상을 읽어 들일 것으로 예상되는 경우
(인덱스를 생성하는 대신 테이블 전체를 검색하는 것이 좋다)

7. 인덱스 확인
데이터 사전의 USER_INDEXES 및 USER_IND_COLUMNS 뷰에 저장된 인덱스 정보를 확인한다.
USER_INDEXES 데이터 사전 뷰
인덱스 이름과 인덱스의 유일성 정보 등을 포함한다
USER_IND_COLLUMNS 데이터 사전 뷰
인덱스 이름, 테이블 이름, 열 이름, 열 위치 등의 정보 등을 포함한다.

인덱스 확인 EX)
EMP 테이블에 대해 생성된 인덱스의 이름과 인덱스가 생서된 열 이름, 열 위치 , 유일성을 확인한다.

8.인덱스 삭제
DROP INDEX 명령을 사용해서 데이터 사전에서 인덱스를 삭제한다
DROP INDEX 명령의 형식
삭제할 인덱스 이름을 지정한다
DROP INDEX 인덱스명;

주의사항 
인덱스 소유자나 DROP ANY INDEX 권한을 가진 사용자만 삭제할 수 있다.
★ 인덱스는 수정될 수 없으며 수정이 필요한 경우 삭제하고 다시 생성해야 한다. 
인덱스 삭제 EX)
데이터 사전에서 EMP_NAME_IDX 인덱스를 제거한 다음 제대로 삭제되었는지 확인한다. 
*/

DROP TABLE DEPT01;

CREATE TABLE DEPT01
AS
SELECT * FROM DEPT WHERE 1=0;
--테이블 구조만 가져온다 (데이터 X)
--where 값이 false면 구조만 가져오는데
--primary key같은 제약조건은 가져오지 않는다. 

SELECT * FROM DEPT;
DESC DEPT01;

SELECT * FROM DEPT01;
DESC DEPT;

--★ 제약조건에서 테이블명은 대문자로★
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('DEPT01');

--제약조건이 지정된 컬럼 살펴보기 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'DEPT01';

--데이터 삽입하기
INSERT INTO DEPT01 VALUES (10, '인사과', '서울');
INSERT INTO DEPT01 VALUES (20, '총무과', '대전');
INSERT INTO DEPT01 VALUES (30, '교육팀', '대전');
SELECT * FROM DEPT01;

/*
인덱스의 종류
1. 고유인덱스
2. 비고유 인덱스
3. 단일 인덱스
4. 결합 인덱스
5. 함수기반 인덱스

고유 인덱스(유일 인덱스) 유일키처럼 유일한 값을 갖는 컬럼에 대해서 생성하는 인덱스
고유 인덱스를 지정하려면 UNIQUE 옵션을 지정해야한다.
EX) DEPTNO은 고유/비고유 인덱스 둘다 설정 가능하다 
*/

CREATE UNIQUE INDEX IDX_DEPT01_DEPTNO
ON DEPT01(DEPTNO);

/*
비고유 인덱스
중복된 데이터가 저장된 컬럼을 인덱스로 지정할 경우
비고유 인덱스로 지정해야 한다
UNIQUE 옵션을 생략하고 지정한다. 

*/
--중복된 데이터가 이미 있으므로 인덱스 생성 불가 
CREATE UNIQUE INDEX IDX_DEPT01_LOC
ON DEPT01(LOC);

--UNIQUE 옵션을 생략하고 지정한다. 
CREATE INDEX IDX_DEPT01_LOC
ON DEPT01(LOC);


--결합 인덱스 정의하기
--부서번호와 부서명을 결합하여 인덱스를 설정할 수 있다.
CREATE INDEX IDX_DEPT01_COM
ON DEPT01(DEPTNO, DNAME);




--제약조건이 지정된 컬럼 살펴보기 
select index_name, column_name
from user_ind_columns
where table_name = 'DEPT01';


--CREATE TABLE EMP07(
--empno number(4) constraint emp07_empno_pk primary key, --P
--ename varchar2(10) constraint emp07_ename_nn not null, --C
--sal number(7,2) constraint emp07_sal_ck check (sal between 500 and 5000),
--gender varchar2(1) constraint emp07_gender_ck check(gender in('M','F'))
--);

--★ 제약조건에서 테이블명은 대문자로★
select constraint_name, constraint_type, table_name
from user_constraints
where table_name in('EMP07');

SELECT * FROM EMP07;

--함수 기반 인덱스 생성하기 
create index idx_emp01_annsal
on emp07(sal*12);

--인덱스 정보 조회
--인덱스는 기본 키(primary key)나 유일 키(unique) 제약 조건을 지정하면 자동으로 생성된다.
--(무결성 확인을 위해 수시로 데이터 검색하기 위한 용도로 내부적으로 해당 컬럼에 대하여 인덱스를 생성함)
select index_name, column_name
from user_ind_columns
where table_name = 'EMP07';

--인덱스 정보 조회
--이렇게 2개의 테이블을 한 번에 조회할수도 있다. 
select index_name, table_name, column_name
from user_ind_columns
where table_name in('EMP07','DEPT01');

--인덱스 정보 조회
SELECT * FROM USER_IND_COLUMNS
WHERE table_name in('EMP07');

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP07';




/* 사용자 생성
  Create user 유저아이디 identified by 비밀번호;
  
  create user 유저아이디 identified by 비밀번호
    default tablespace appl_data
    temporary tablespace temp;
    
  create user 유저아이디 identified by 비밀번호
    default tablespace appl_data
    temporary tablespace temp;
    quota 20M on appl_data quota 10M on system;   
*/

--시스템 권한 SYSTEM PRIVILEGE
--DBMS 권한 관리 기능
--정보의 중요성에 따라 그정보에 접근할 수 있는 사용자와 접근 할 수 없는
--사용자를 구분하기 위해 권한을 지정할 수 있다.
--DBA 권한을 갖는 사용자가 시스템권한을 부여할 수 있다.
--
-- 대표적인 시스템 권한
-- create session : 데이터베이스에 접속할 수 있는 권한
-- create table : 테이블을 생성할 수 있는 권한
-- create any table : 다른 user의 이름으로 테이블을 생성할 수 권한
-- create tablespace : 테이블 스페이스를 만들 수 있는 권한
-- unlimited tablespace : 사용용량을 무제한으로 허용하는 권한.
-- select any table : 어느 테이블, 뷰라도 검색을 할 수 있는 권한
--
--권한부여 명령: grant   권한회수 명령: revoke

--스키마란? 객체를 소유한 사용자명 
--TESTER1 사용자 SQL 스키마의
--DEPT 테이블을 불러온다. 
SELECT * FROM TESTER1.DEPT;


/*
 PL/SQL(Procedural language/SQL) -- 엔진
 : 오라클에서 제공하는 프로그래밍 언어
 : 일반 프로그래밍 언어적인 요소를 다 가지고 있고 데이터 베이스 업무를 처리하기 위한 최적화된 언어
*기본구조*
선언부(Declare) : 모든 변수나 상수를 선언하는 부분 -옵션
실행부(Executable) : begin~end/ 제어문, 반복문, 함수정의 등의 로직을 기술하는 부분 - 필수
예외처리부(exception) : 실행도중에 에러 발생 시 해결하기 위한 명령들을 기술하는 부분 declare, begin, exception 키워드들은 ;를 붙이지 않는다. -옵션
나머지 문장들은 ;로 처리한다.! 
익명블록 ( anonymous PL/SQL BLOCK) :주로 일회성으로 사용할 경우 많이 사용된다.
저장블록 ( stored PL/SQL BLOCK) :서버에 저장해 놓고 주기적으로 반복해서 사용할 경우 사용된다. 
*/

--출력문을 스크립트 출력에서 보여주는 명령어
set serveroutput on;

set serveroutput off; 반대

/*
PL/SQL 은 ORACLE'S PROCEDURAL LANGUAGE EXTENSION TO SQL의 약자로
SQL 문장에서 변수정의, 조건처리(IF), 반복처리(LOOP, WHILE, FOR)등을 지원하며
오라클 자체에 내장되어 있는 절차적 언어 (Procedure Language)로서 SQL의 단점을 보안해줍니다.
*/

--포트 변경이 안되면 사용자 편집에 들어가서
--DBA 권한을 주자.!! 그 다음에 프로그램 끄고 재접속하면 바뀌는거 확인 가능하다.


--  1. 현재 오라클 포트번호 확인
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;
--  2. 포트번호 변경 (8080 →9090)
EXEC DBMS_XDB.SETHTTPPORT(9090);


--<HELLO WORLD 만들기>
SET SERVEROUTPUT ON;
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello Word');
END;
/

/*
변수
변수의 생성 규칙
1. 반드시 문자로 시작해야 한다.
2. 문자나 숫자, 특수문자를 포함 할 수 있다.
3. 변수명은 30bytes 이하여야 한다.
4. 예약어(키워드)를 사용하면 안된다.

변수의 선언은 선언부(declare)에서 선언되고, 값으로 초기화가 가능하다.
실행부에서 실행될 경우 값이 할당된다.
서브프로그램의 파라미터로 전달되기도 하며, 서브프로그램의 출력 결과를 저장하기도 한다. 

변수 선언 예)
emp_no number(6,3) : 숫자를 저장하는 변수로 총 6자리를 의미하며, 소수점 이하 3자리를 의미한다.
emp_name varchar2(5) : 문자를 저장하는 변수로 총 바이트 길이가 5 바이트를 저장할 수 있다.
emp_date_date : 날짜를 저장하는 변수 

변수 데이터 타입>
char : 고정길이의 문자를 저장, 기본최소값 1, 최대 32,767 바이트를 저장
varchar2 : 가변길이의 문자를 저장, 기본값은 없다. 최대 32,767 바이트를 저장
number (전체자리수, 소수점이하 자리수)
:전체자리수와 소수점이하 자리 수를 가진 숫자를 저장
전체자리수 범위는 1~30까지 가능하고, 소수점 자리수의 범위는 -84~127까지 가능 

binary_double : 부동 소수점 수를 저장, 9바이트 필요함
date : 날짜 및 시간을 저장, 초단위로 저장
날짜 범위는 4712B.C ~ 9999 A.D
timestamp : date 타입을 확장, 연도, 월, 일, 시, 분, 초 및 소수로 표시되는 초단위를 저장
자리수를 표현할때는 0~9 범위의 정수를 사용, 기본값은 6


<참조변수>
테이블명.필드명%Type
empNo employees.employee_id%TYPE
:employees 테이블의 employees_id와 동일한 데이터 타입으로 선언 

emp_name employees.first_name%TYPE
:employees 테이블의 first_name과 동일한 데이터 타입으로 선언 

empRow employees%ROWTYPE
:employees 테이블의 모든 컬럼을 한꺼번에 저장하기 위한 변수로 선언
*/

--/(슬래시) : 블럭 단위로 실행
--SET SERVEROUTPUT ON : 스크립트에 결과가 출력되게 설정한다.
SET SERVEROUTPUT ON;
--DECLARE -- 선언부(익명블록)
--CNT INTEGER;
--BEGIN -- 실행부
--CNT := CNT+1; --할당연산자, :=(콜론, 이퀄) : 1씩 증가
--IF CNT IS NULL THEN
--DBMS_OUTPUT.OUT_LINE('결과 : CNT는 널이다');
--END IF;
--END;
--/


declare
cnt integer;
begin
cnt := cnt+1;
if cnt is null then
dbms_output.put_line('결과 : cnt는 널이다');
end if;
end;
/

--SET SERVEROUTPUT ON; 처음에 입력해주고
--선언부(Declare) : 모든 변수나 상수를 선언하는 부분 -옵션
SET SERVEROUTPUT ON;
declare
vempno number(4); -- 사이즈 4의 number 타입 nempno 변수 선언
vename varchar2(10); -- 사이즈 10의 varchar2 타입 vename변수 선언 
begin
vempno :=1001; -- vempno 변수에 1001대입
vename :='김사랑'; --vename 변수에 '김사랑' 대입
--dbms_output.put_line은 결과창에 출력될 부분 
dbms_output.put_line('  사번  이름');
dbms_output.put_line('-----------');
--위에서 변수에 저장한 값을 출력한다. 
dbms_output.put_line(''||VEMPNO||'  '||VENAME);--변수값을 출력
END;
/


DECLARE
   VEMPNO     EMP.EMPNO%TYPE;    -- VEMPNO 변수는 EMP테이블 EMPNO 컬럼의 데이터타입을 참조한다
   VENAME     EMP.ENAME%TYPE;    -- VENAME 변수는 EMP테이블 ENAME 컬럼의 데이터타입을 참조한다
   VDEPTNO      EMP.DEPTNO%TYPE;   -- VDEPTNO 변수는 EMP테이블 DEPTNO 컬럼의 데이터타입을 참조한다
   VDNAME     VARCHAR2(20) := NULL;  -- VDNAME 변수는 VARCHAR2(20) 데이터타입으로 선언하고 NULL값을 대입한다
BEGIN
   SELECT EMPNO, ENAME, DEPTNO  -- 조회한 값을
   INTO VEMPNO, VENAME, VDEPTNO -- 각 변수에 대응하여 대입한다
   FROM  EMP
   WHERE EMPNO=1001;

-- IF 조건문
   IF (VDEPTNO = 10)  THEN      -- 만약 VDEPTNO이 10면
      VDNAME := 'ACCOUNTING';   -- VDNAME 변수에 'ACCOUNTING' 대입
   END IF;
   IF (VDEPTNO = 20)  THEN  -- 만약 VDEPTNO이 20이면
     VDNAME := 'RESEARCH';  -- VDNAME 변수에 'RESEARCH' 대입
   END IF;
   IF (VDEPTNO = 30)  THEN  -- 만약 VDEPTNO이 30이면
      VDNAME := 'SALES';    -- VDNAME 변수에 'SALES' 대입
   END IF;
   IF (VDEPTNO = 40) THEN   -- 만약 VDEPTNO이 40이면
      VDNAME := 'OPERATIONS';   -- VDNAME 변수에 'OPERATIONS' 대입
   END IF;  -- 조건문 종료

   DBMS_OUTPUT.PUT_LINE('   사번     이름      부서명');
   DBMS_OUTPUT.PUT_LINE('--------------------------');
   DBMS_OUTPUT.PUT_LINE('' || VEMPNO||'    '
                ||VENAME||'    '||VDNAME);
END;
/



DECLARE
  VEMP EMP%ROWTYPE;    -- VEMP 변수는 EMP테이블의 모든 데이터타입을 참조한다
  ANNSAL NUMBER(7,2);  -- ANNSAL 변수는 NUMBER(7,2) 데이터타입으로 선언한다 
BEGIN    
  SELECT * INTO VEMP   -- 모든 데이터를 VEMP 변수에 대입
  FROM EMP
  WHERE ENAME='김사랑';

  IF (VEMP.COMM IS NULL) THEN   -- VEMP 변수의 COMM컬럼값이 NULL일 경우
    ANNSAL:=VEMP.SAL*12;        -- ANNSAL 변수에 VEMP 변수의 SAL 컬럼값의 * 12한 값을 대입
  ELSE  -- 조건이 거짓일때
    ANNSAL:=VEMP.SAL*12+VEMP.COMM;
        -- ANNSAL 변수에 VEMP 변수의 SAL 컬럼값의 * 12와 VEMP 테이블의 COMM 컬럼값을 더한 값을 대입
  END IF;   -- 조건문 종료

  DBMS_OUTPUT.PUT_LINE('  사번    이름    연봉'); 
  DBMS_OUTPUT.PUT_LINE('-----------------------');
  DBMS_OUTPUT.PUT_LINE(''||VEMP.EMPNO||'   '
         ||VEMP.ENAME||'   '||ANNSAL); 
END;
/

DECLARE
  VEMP EMP%ROWTYPE; --주석을 달아주세요
  VDNAME VARCHAR2(14);
BEGIN  
  SELECT * INTO VEMP
  FROM EMP
  WHERE ENAME='김사랑';

  IF (VEMP.DEPTNO = 10)     THEN
    VDNAME := 'ACCOUNTING';
  ELSIF (VEMP.DEPTNO = 20)  THEN
    VDNAME := 'RESEARCH';
  ELSIF (VEMP.DEPTNO = 30)  THEN
    VDNAME := 'SALES';
  ELSIF (VEMP.DEPTNO = 40)  THEN  
    VDNAME := 'OPERATIONS';
  END IF;

  DBMS_OUTPUT.PUT_LINE('  사번    이름     부서명'); 
  DBMS_OUTPUT.PUT_LINE('--------------------------');

  DBMS_OUTPUT.PUT_LINE(''||VEMP.EMPNO
        ||'   '||VEMP.ENAME||'   '||VDNAME); 
END;
/

DECLARE
  N  NUMBER := 1;   -- N 변수에 NUMBER 데이터타입으로 선언 후 1을 대입
BEGIN
  LOOP  -- 반복문
    DBMS_OUTPUT.PUT_LINE( N );  -- 변수 N의 값을 출력
    N := N + 1; -- N 변수에 N의 값을 +1 한 값을 대입
    IF N > 5 THEN   -- 만약 N의 값이 5보다 클 경우
      EXIT; -- 반복 탈출
    END IF; -- 조건문 종료
  END LOOP; -- 반복 종료
END;
/


DECLARE
BEGIN
  FOR N IN 1..4 LOOP
  -- 변수 N을 선언하고 N의 값이 1부터 4까지 1씩 증가하며 반복한다
    DBMS_OUTPUT.PUT_LINE( N );
  END LOOP; -- 반복 종료
END;
/

DECLARE
  N NUMBER := 1;    -- 변수 N을 NUMBER 데이터타입으로 선언하고 1을 대입
BEGIN
  WHILE N <= 5 LOOP -- N의 값이 5보다 작거나 같으면 반복
    DBMS_OUTPUT.PUT_LINE( N );
    N := N + 1; -- N의 값을 1만큼 증가
  END LOOP; -- 반복 탈출
END;
/


drop table s_emp;
create table s_emp -- EMP 테이블을 복사하여 S_EMP 테이블을 생성
as
select * from emp;

-- S_EMP 테이블에서 사원이름이 '김사랑'인 사원의 이름과 급여를 출력
select ENAME, sal from s_emp
WHERE ENAME='김사랑';

--문) 영업이면 급여를 10퍼 인상하고 아니면 5퍼 인상하시오


SET SERVEROUTPUT ON;
DECLARE
   VEMP     s_emp%ROWTYPE;   -- VEMP 변수는 S_EMP의 모든 컬럼을 참조한다
   VDEPTNO   s_emp.DEPTNO%TYPE; -- VDEPTNO 변수는 S_EMP 테이블의 DEPTNO 컬럼의 데이터타입을 참조한다
   VPERCENT  NUMBER(2); -- VPERCENT 변수는 NUMBER(2) 데이터타입으로 선언한다
BEGIN
   select deptno into vdeptno   
   -- DEPT 테이블에서 조회된 DEPTNO의 데이터를 VDEPTNO 변수에 저장
   from dept
   where dname like '%영업%';
SELECT * INTO VEMP   
   -- S_EMP 테이블에서 조회된 모든 데이터를 VEMP 변수에 저장
   FROM s_emp
   WHERE ENAME='김사랑';
  
   --VEMP 변수의 DEPTNO 컬럼값과 VDEPTNO 변수의 값이 같을때
   IF VEMP.deptno  =  vdeptno THEN
      VPERCENT := 10;   -- VPERCENT 변수의 값을 10으로 설정
   ELSE -- 조건이 거짓일때
      VPERCENT := 5;    -- VPERCENT 변수의 값을 5로 설정
   END IF;  -- 조건문 종료
   
   update s_emp
   set sal = sal + sal*VPERCENT/100
   -- SAL 컬럼의 값을 원래 SAL값에 VPERCENT변수를 100으로 나눈 값을 곱한 값으로 설정
   where ENAME='김사랑';
   commit;
   END;
/

--어떻게 바뀌엇는지를 적어주세요 데이터가 바뀌었는지 조회
select ENAME, sal from s_emp WHERE ENAME='김사랑';


DECLARE
 -- %ROWTYPE로 행단위로를 저장하는 레퍼런스 변수 선언 
  VEMP EMP%ROWTYPE; 
  ANNSAL NUMBER(7,2);
BEGIN
 -- 김사랑 사원의 전체 정보를 행 단위로 VEMP에 저장한다.  
  SELECT * INTO VEMP
  FROM EMP
  WHERE ENAME='김사랑';

 -- 커미션이 NULL일 경우 0으로 변경해야 올바른 연봉 계산
  IF (VEMP.COMM IS NULL)  THEN
   VEMP.COMM := 0;
  END IF;                      
 -- 스칼라 변수에 연봉을 계산할 결과를 저장한다.
  ANNSAL:=VEMP.SAL*12+VEMP.COMM ; 

-- 결과 출력 
  DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 연봉'); 
  DBMS_OUTPUT.PUT_LINE('------------------------');
  DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||' /' 
               ||VEMP.ENAME||' /'||ANNSAL); 
END;
/

--basic loop문으로 구구단5단을 출력하세요
DECLARE
  DAN  NUMBER := 5; -- 5단
    I  NUMBER := 1; -- 1부터 9까지 곱하는 변수
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE(
        DAN || ' * ' || I ||' = '|| (DAN*I) );
    I := I + 1;    -- I 변수를 1씩 증가
    IF I > 9 THEN  -- I가 9보다 클때
       EXIT;       -- 반복 탈출
    END IF;
  END LOOP;             
END;
/

DECLARE
   VDEPT DEPT%ROWTYPE;                        
BEGIN
  DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명'); 
  DBMS_OUTPUT.PUT_LINE('-----------------------');
  -- CNT는 1부터 1씩 증가하다가 4가 되면 반복문을 벗어남
   FOR CNT IN 1..4 LOOP                        
    SELECT * INTO VDEPT
    FROM DEPT
    WHERE DEPTNO=10*CNT;

    DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || '      / ' 
      || VDEPT.DNAME || ' / ' || VDEPT.LOC); 
   END LOOP;
END;
/

-- '*' 기호를 한개씩 추가하며 출력하기
DECLARE
  V_CNT  NUMBER := 1;
  V_STR  VARCHAR2(10) := NULL;
BEGIN
  WHILE V_CNT <= 5   LOOP
    V_STR := V_STR || '*';
    DBMS_OUTPUT.PUT_LINE(V_STR);
     V_CNT := V_CNT + 1;                   
  END LOOP;             
END;
/














































