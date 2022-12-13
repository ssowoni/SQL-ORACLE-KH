--����Ŭ�� ������ �� �ֵ��� ���÷� ����� ���� ������ �����̴�
--HR�� �����̳� �ּ�, ������ ���� ��
select * from tab; --ctrl+enter ������ ����ȴ�.
desc tab;


--------------------------22-02-16 ����---------------------------


SELECT employee_id, salary from employees
where last_name = 'Smith';
--lastname �ȿ��� ��ҹ��� ����

SELECT employee_id, FIRST_NAME, salary from employees
where last_name = 'smith';
--lastname �ȿ��� ��ҹ��� ���� �� �ȳ����� ���� �������� 

select employee_id as "����", salary " ������" from employees;
select employee_id "����", salary "������" from employees;
--��Ī�� ���� �Ǿ��� �� ���� ���� �ؾ��Ѵ�. 

select employee_id as "����" from employees where last_name = 'Smith';
--as id�� �ѱ۷� ��� �����ϴ�.

select distinct job_id from employees;
--�ߺ� ���� 

/*nvl() : �� ���� �ٸ� �����ͷ� �����ϴ� �Լ�*/
select * from EMPLOYEES;
SELECT first_name, last_name, nvl(commission_pct,0) commission from EMPLOYEES;
--�� ���� 0���� ǥ���ϰ� commission �ٲٱ� 


--2022-02-16 ���� �ּ� �޾ƿ��� --

/*sum()*/
--salary�� ��ȸ�ϸ� 107���� ���� �����µ�,
select salary from employees;
--employees�� salary �÷��� �ִ� ���� ��� ���Ѵ�.
select sum(salary) from employees;

/*count*/
--employees ���̺��� ��ü ���� ���� ��ȯ�Ѵ�.
select count(*) from employees;
-- ���ڵ��� ��ü��
--Employee_id�� ���� ������ ��ȯ�Ѵ�. 107��
select count(all Employee_id) from employees;
--Employee_id�� ���� ������ ��ȯ�ϰ�, 
--�ڿ� ������ �ߺ��Ǵ� ���� ������ Employee_id�� ���� ������ ��ȯ�Ѵ�.
select count(all Employee_id), count(distinct Employee_id)
from employees;

--First_name�� ���� ������ ��ȯ�Ѵ�. 107��
select count(all First_name) from employees;
--First_name�� ���� ������ �ߺ��� ���� ������ ���� ��ȯ�Ѵ�.
select count(all First_name), count(Distinct first_name) 
from employees;

/*avg()*/
--Employees ���̺��� salary �÷��� ����� ���Ѵ�. 
select avg(salary) from Employees;
--Employees���̺��� department_id�� 80�� ������ ����� ���ϴµ� 
--�� ��հ��� ���� �÷��� salary �÷��̴�.
select avg(salary) from Employees where department_id = 80;
select avg(salary) from Employees where department_id = 50;
/*max()*/
select max(salary) from Employees;
--hire_date �� ���� �ֱ��� ��, ���� ū ���� ���Ѵ�.
select max(hire_date) from Employees;


/*min()*/
select min(salary) from Employees;
--hire_date �� ���� ������ ��, ���� ���� ���� ���Ѵ�.
select min(hire_date) from Employees;


--����Ŭ���� ���̺��� ����� �ؼ� ����Ǵ�dummy���̺��� �̿��Ѵ�

/*number function*/
/*abs()���밪*/
--dual ���̺��� ����ڰ� �Լ�(���)�� ������ �� �ӽ÷� ����Ѵ�.
--��) �Լ��� ���� ������ �˰� ���� �� ���̺� ���� �ʿ� ����
--dual ���̺��� �̿��Ͽ� �Լ��� ���� ���Ϲ��� �� �ִ�. 
--23�� ���밪
select abs(-23) from dual;
select abs(23) from dual;
/*sign()*/
--23�� ����̸� 1�� ����
select sign(23) from dual; 
select sign(23), sign(-23), sign(0) from dual;
--����� 1,������ -1, ,0�� 0

/*round()*/
--0.123�� 0�� �ڸ� �ݿø�, �� �ڿ� �ڸ����� �������� �ʾұ⿡ �ٷ� �ݿø�
select round(0.123), round(0.543) from dual;--�ݿø�
select round(0.123), round(2.543) from dual;
--�Ҽ��� Ư�� �ڸ������� �ݿø��ε� ���⼱ 6��° 4��°�� ���� �ݿø�
select round(0.12345678, 6), round(2.3423455, 4) from dual;
--�ڿ������ڸ������� �ݿø�ǥ��

/*trunc()*/
--�Ҽ��� Ư�� �ڸ������� ������ 
--1234.1234567 ���ڸ� 0��°, �� �Ҽ��� �ڸ����� �ڸ��µ�
--��Ī�� zero��� ���´�. ���⼱ (AS zero)�� ���� ��.
select trunc(1234.1234567) zero from dual;
-- 0��°�ڸ����� �߶�
select trunc(1234.1234567,0) zero from dual;

-- �Ҽ���2��°�ڸ������߶�
select trunc(1234.1234567,2)  from dual;
--������ڸ����� �߶� �ڸ����� 0����ǥ��
select trunc(1234.1234, -1) from dual;


/*ceil����  ������ �÷��� ������*/
--�Ҽ��� �ڸ��� �ݿø��� �ƴ� ������ �ø�
select ceil(32.8) ceil from dual;
select ceil(32.3) ceil from dual;

/*floor()����������*/
--�Ҽ��� �ڸ��� ������ ����
select floor(32.8) floor from dual;
select floor(32.3) floor from dual;

/*power()��������Ÿ��*/
--as ��Ī�� power1�̶�� ���� 
--4�� 2������ ���� ��Ÿ����.
--�� 4 : ������ ���� 2 : �ŵ����� ����
select power(4,2) power1 from dual;

/*mod()7 / 4�� ���������ϱ�*/
--7�� 4�� ������ �� ������ 
select mod(7, 4) mod1 from dual;

/*sqrt()������*/
--�������� ���Ѵ�.
--���� sqrt(9) �̸� ���� 3
-- sqrt(16)�̸� ���� 4
select sqrt(2), sqrt(3) from dual;



--------------------------22-02-17 ����---------------------------


/*Concat(char1, char2)*/
select concat('Hello','bye'), concat('������ħ','bad') from dual;
-- dual �������̺�, concat�� ���ڿ��� ��ġ�±�� 

--concat�� ||�� �Ѵ� ���ڿ��� ��ġ�� �Լ��� �������̴�.
--as�� �����ؼ� �÷����� ������ħ, operators��� ��Ī���� �����ߴ�. 
select concat('good','bad') ������ħ, 'good' || 'bad' operators
from dual;

/*initcap(char)*/
select initcap('good morning') from dual;
-- ù���ڰ� �빮�ڷ�
select initcap('good/bad morining') from dual;
--/�����ڶ� �ڿ�b �� B �빮�ڷιٲ�鼭 ���κ���

/*lower(char)�ҹ���, upper(char)�빮��*/
select lower('GOOD'), upper('good') from dual;

/*LPAD(), RPAD()*/
--lpad�� ���ʿ� ���ڿ��� ���Ѵ�. 
--��) good�̶�� 4������ ���ڿ��� 6���ں��� �۴�, 6���ڷ� �ø��� ����
--��ĭ���� ���ʿ� 2ĭ�� ä���. 
select lpad('good', 6) "LPAD1", --6�ڸ��δø�
lpad('good', 7, '#') "LPAD2", --7�ڸ��ε� #���� ä�� ���� �������ش�. 
lpad('good', 8, 'L') "LPAD3" --8�ڸ��ε� L�� ���ʺ���ù���ں��� ä���
from dual;

--������ �Ȱ��� ���������� ���⼱ rpad�� 
--���ڿ� �����ʿ� ������ ���� ä���. 

select rpad('good', 6) "RPAD1",--�����ʺ���ä���
rpad('good', 7, '#') "RPAD2",
rpad('������', 8, 'L') "RPAD3" --�ѱ��� 2����Ʈ������
from dual;

/* LTRIM(), RTRIM()*/
--���ʺ��� ����� o�� ��������� �߰��� �ֱ⶧���� 
--�������� go�ν��������� o�� ���� ���m��
--trim�� ���� ��������, ltrim�� ���ڿ����� ������ ���� ã�� ���ʿ� �ִ� ���� �����.
select ltrim('goodbye','g'), ltrim('goodbye','o') , 
ltrim('goodbye','go') from dual;

--rtrim�� �����ʿ��� ����� e�� �����ʿ��� �����Ѵ�.
select rtrim('goodbye','e') from dual;

/*substr(), substrb()*/
select substr('good morning john', 8, 4) from dual;
--8��° ���ں��� 4���� ���ڸ� ����Ѵ�.
--8��°�� r (���� �����ؼ� ����)
select substr('good morning john', 8) from dual;
--8��° ���ں��� ������ ���
--r���� �������� ����Ѵ�

select substr('good morining john', -4) from dual;
--�����ʺ��� 4����
select substr('good morining john', -4, 0) from dual;
--0�ΰ��� null

select substrb('good morning john', 8, 4) from dual; 
--b �� byte�ǹ� 4����Ʈ �ѱ��� �α���

/*replace()*/
--replace�� �ܾ ��ü�Ѵ�.
--���⼭ morning�� evening���� ��ü! 
select replace('good morning tom', 'morning', 'evenning') from dual;

/*translate()*/
--translate : ����ڿ� ��ȯ���ڴ� 1:1�� ��ȯ�̵Ǹ�, ����ڿ��� �ִµ� ��ȯ���ڿ��� ������ �ش� ���ڴ� ���� �ȴ�.
select replace('You are not alone', 'You', 'We'),--You�� we�� �ٲ�
Translate('You are not alone', 'You', 'We')
-- You �� Y�� W�� o�� e�� �ٲ�� u�� ������ 1:1����
from dual;

/*trim()*/--length ���ڿ����̰����ϱ�
select length(trim( leading from ' good ')) ,
--leading from �տ����ʰ�������
--�� ���� ������ ������ 'good '�� ���ڿ� ���̴� 5
length(trim(trailing from ' good ')),
--trailing from �ڿ������ʰ��������� ����
--�� ������ ������ ������ ' good'�� ���ڿ� ���̴� 5
length(trim(both from ' good ')),--���ʴ� ��������
--length�� �����Ƿ� ���� ������ ���ڿ� ���
trim(both from '  good   ') 
from dual;


/*ascii()*/
--���� A�� �ƽ�Ű �ڵ�� 65
--ascii�� �ƽ�Ű �ڵ� ��ȣ�� �ٲٱ�.
select ascii('A') from dual;

/*instr()*/--���ڿ��� ��ġ�� ã�������Լ��̴�
select instr('good morning john', 'or',1) from dual;
--or��ġ�� 7���ͳ��´�
select instr('good morning john', 'n',1,2) from dual;
--1��°��ġ���� 2��° n�� ��ġ�� ã�´�
select instr('good morning john', 'n',1,3) from dual;
--1��°��ġ���� 3��°��ġ n�� ã�´� 17




/*sysdate()*/
select sysdate from dual;--�������̺� ���糯¥

/*months_between()*/
--employee ���̺��� department_id 50�� �÷��� ������ �������µ�,
--�ٹ������� ��Ī�� ���� ���� ���� ��¥���� ��볯¥�� �� ���̴�.
--�̷��� �ϸ� �Ҽ������� �������ϰ� �����⿡ 
--trunc�� �Ҽ��� �ڸ������� �߶��־���. 
select first_name, department_id, last_name, 
trunc(months_between(sysdate, hire_date)) as �ٹ����� 
--���糯¥���� ������¥ �ٹ�������
FROM EMPLOYEES
where department_id = 50;

/*add_months()*/--������ ���ϱ�
select add_months(sysdate, 7) from dual;--����4��+7

/*next_day()*/
select next_day(sysdate, '�Ͽ���') from dual;
--���� ��¥���� ���� �Ͽ����� ���´�

/*last day()*/
select last_day(sysdate) from dual;
--�ش���� ������ ��¥�� ���´�

/*to_char()*/
select to_char(sysdate, 'yyyy/mm/dd') from dual;
--���糯�ڱ� ���Ĵ�γ�����

/*to_date()*/
select to_date('2015/03/04','yyyy/mm/dd') from dual;


/*nvl(): �ΰ��� �ٸ� �����ͷ� �����ϴ� �Լ�*/ 
select * from EMPLOYEES;
select first_name, last_name, commission_pct,
        --nul�� commission_pct�� ���� null�̸� 0�� ���
        --as �����ؼ� �÷��� ��Ī�� commission���� ����
         nvl(commission_pct, 0) commission 
       from EMPLOYEES;
--�ΰ��� 0����ǥ���ϰ� commission�ٲٱ�

/*decode(): switch���� ������ �ϴ� �Լ�*/
select * from DEPARTMENTS;

--department_ind�� �ҷ�����, switch case���� decode �Լ��� �����
--���� �� ��) department_id�� 20�̸� �����ú�, 60�̸� ���� 90�̸� �濵 
--���ǿ� ���� ���̸� �μ���� ��� 
select department_id, 
decode(department_id, 20, '�����ú�', 60, '����', 90,'�濵��', '�μ�') �μ�
from EMPLOYEES;--20�̸� �����ú� 60�̸� ���� �������� �μ��� ���

/*case() : elseif���� ���� ���� �Լ�*/
--CASE �� 
--<����> CASE WHEN ����1 THEN ���1 ELSE ���2 END
--CASE ���� DECODE�� �������� ���ϴ� �񱳿����� ������ �ذ��Ѵ�.
--CASE �Լ��� �پ��� �� �����ڸ� �̿��Ͽ� ������ ������ �� ������ ������ ������ ���� �ִ�.
--CASE �Լ��� ���α׷��ֿ��� IF ELSE�� ������ �����̴�. 
--���� decode���� ����ϰ� ������ �����ص״�.
--���⼱ ���� department_id�� 20, 60, 90 �� ����͵� �ƴ϶�� ' ' (null)�� �ش�.
--end�� �÷��� ��Ī��
select first_name, department_id, 
  case when department_id = 20 then '�����ú�'
       when department_id = 60 then '�����'
       when department_id = 90 then '�濵��'
       else '' 
       end "�μ���"
from EMPLOYEES;



--------------------------22-02-21 ����---------------------------


/*�ߺ������� ���̵��ϱ�*/
--gruop by ������ group by department_id
--������ �Ͱ� ������ ��°� 
select distinct department_id from EMPLOYEES;

/* ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�*/
--sum���� �����Լ��� ���������Ƿ� ������ ��������
--� �׷���� �������� sum�� �� ������ ������� �Ѵ�. 
select distinct department_id, sum(salary)
from employees;

/* �μ��� �޿� �հ� */
--department_id�� �������� 
--��) department_id �ߺ����� �����ϰ� 
--���� department_id�� salary�� ���� ���� ���
select department_id, sum(salary) 
from EMPLOYEES
group by department_id;


/* �μ��� ������� ��� �޿��� ���غ��� */
select department_id, sum(salary), count(salary), avg(salary)
from employees;

/* �μ��� ���޺� ������� ��� �޿��� ���ϴ� ��*/
--select���� department_id, job_id�� group by���� �Ѵ� ���;��Ѵ�
--���� ������ �� �� �ִ� ���� 2�� �̹Ƿ� 
--�ϳ��� ���ָ� ������ ����. 
select department_id, job_id, sum(salary), count(salary), avg(salary)
from employees
group by department_id, job_id;

select department_id, job_id, sum(salary), count(salary), avg(salary)
from employees
group by department_id, job_id
--order by�� ���� ������������ ������ ���ش�.
order by department_id, job_id;


select department_id, job_id,
--9999�� �ڸ����� ���� �ʾƵ� ä���� �ʴ� ��.
--�� �׳� ���δ� �� 0000�̸� 0���� ä���.
--sum�� avg�� to_char�� ���
--��� ������ �������ش�.
to_char(sum(salary),'999,999') �ѱ޿�,
to_char(avg(salary),'999,999') ��ձ޿�
from EMPLOYEES
GROUP by department_id, job_id
order by department_id, job_id;

select department_id, job_id,
to_char(sum(salary),'999,999') �ѱ޿�,
to_char(avg(salary),'999,999') ��ձ޿�
from EMPLOYEES
--where ���� �μ� ��ȣ�� 80�� �ุ ����ϵ���
--���ǰ��� ���.
where department_id = 80
GROUP by department_id, job_id
order by department_id, job_id;

/* having �� : ���� �μ��� �����*/
--�μ� id�� �μ� id �� ��� ���� ���Ѵ�. 
--employees ���̺��� 
select department_id, count(*)
from EMPLOYEES
--department_id�� null�� �ƴ� ���ǰ��� �ְ�
where department_id is not null
      /*and count(*) >= 10 where������ ����� �� ����.*/
group by department_id
--�����Լ� ������ having ������ ��������� �Ѵ�. 
having count(*) >= 10;


select * from locations;

/*rollup : �׷캰 �հ� ������ �߰��ؼ� �����ִ� �Լ�*/
--l.city : location ���̺��� city �÷�
--d.department_name : DEPARTMENTS ���̺��� department_name 
--e.job_id : EMPLOYEES ���̺��� job_id
select l.CITY, d.DEPARTMENT_NAME, e.JOB_ID,
count(*) �����, sum(e.salary) �ѱ޿�
--from ������ employees ���̺��� e�� �����Ѵ�. 
from EMPLOYEES e, DEPARTMENTS d,LOCATIONS l
--�������� EMPLOYEES  ���̺��� department_id ��
--DEPARTMENTS ���̺��� department_id�� ���� (and)
where e.department_id = d.department_id
-- DEPARTMENTS ���̺��� LOCATION_ID��
-- LOCATIONS ���̺��� LOCATION_ID�� ���ٸ�
and d.LOCATION_ID = l.LOCATION_ID
--rollup�� �̿��ϸ� �μ����� �������հ� ��ü�հ谡 ���´�
--ROLLUP operator
--ROLLUP������ GROUP BY ���� ���� ��� �Ǹ�, 
--GROUP BY���� ���ؼ� �׷� ������ ���� ����� ���ؼ� �� �� ���� ������ ��ȯ�ϴ� ����� ���� �Ѵ�.
--SELECT���� ROLLUP�� ��������ν� ������ SELECT�� �����Ϳ� �� �������� �Ѱ踦 ���� �� �ִ�.

group by rollup(l.city, d.department_name, e.job_id)
-- EMPLOYEES e(����)LOCATIONS l(����)
order by l.city, d.department_name, e.job_id;




--���� �Z ����

/*DDL(Data Definintion Language) : Create��, Drop��, Alter��
Truncate��*/
drop table employees3;
drop table employees4;

desc employees;
desc member;
desc employees2;

--d
create table employees2(
     employee_id  number(10),
     name varchar2(20),     --���������� ������
     salary number(7,2) --7�ڸ� �ȿ�5�ڸ��¾���ڸ� ���ڸ��� �Ҽ����ڸ�
     );
desc employees2;
    

create table employees3 --�ؿ� ���̺��ϰ� �����ϰ� �������
as
select * from employees2;  -- �Ȱ��� ���̺��� ���������
desc employees3;

--alter ��ɾ�� ���̺� �����Ѵ�.
--add�� �÷� �߰�, modify�� �׸� ����
alter table employees2 add (
    manager_id varchar2(10) --�Ŵ��� ���̵� �߰��Ѵ�
    );
desc employees2;
    
alter table employees2 modify ( 
--���̺����� �Ŵ������̵��ʵ��׸��� ����
    manager_id varchar2(20)
    );
desc employees2;

/* �÷��� ���� */
--drop�� ���ؼ� manager_id �÷��� �����Ѵ�.
alter table employees2 drop column manager_id;
--desc�� employees2�� ������ ����Ѵ�. 
desc employees2;

/* ������ ������ 
char, varchar, nchar�����ڵ�������̹�����������, 
nvarchar�����ڵ尡�����̹�����������, long(2GB)��������
*/

--�ƿ� drop ��ɾ�� ���̺��� ����������.
drop table employees2; /* ���̺��� ������ ���� */
desc employees2;

--���̺� �̸��� 3 -> 4�� �����Ѵ�
--�׷� 3 ���̺��� ������� �Ǵ� ��.
rename employees3 to employees4; -- employees4�� �����Ѵ�
desc employees4;

truncate table employees4;
--truncate : ���̺� ������ �ƴ϶� �����͸� ����������. 
-- �����͸� �߶������
-- employees3�� �����͸� �ְ� �߶���
-- ����� +��ȣ ���� <f11>Ŀ�����ָ� �Էµȴ�
select * from employees4;

truncate table employees3;
desc employees3;


--------------------------22-02-22 ����---------------------------


/* DML(Dat Manipulation Language) : ����Ÿ ���۾�
select��, delete��, insert��, update��
--����--
SELECT �÷�, �÷�2, ...
FROM ���̺�1, ���̺�2...
WHERE ���ǵ�;

INSERT INTO ���̺��(�÷�1, �÷�2, �÷�3,....)
VALUES (��1, ��2, ��3,...); //���̺��� ���ڵ�/�ο� �� �Է�

UPDATE ���̺��
   SET �÷�1 = ��,
       �÷�2 = ��,...
WHERE ����..;       

DELETE (From)���̺��
WHERE ����; //���̺��� ���ڵ�/�ο츦 ����
*/

--SAMPLE ���̺� �����ϴµ�
--�÷� 4����, ���������� ���� �ʾҴ�. 
create table sample (
    deptNo number(20), --���� 20����
    deptName varchar2(15), --���� ���� 15����
    deploc varchar2(15), -- ���� ���� 15����
    depManager varchar2(10) --���� ���� 10���� 
);

--������ ������ ���� insert into ��ɾ �Է�
--���� ���� () ��ȣ �ȿ� ���� ����. 
insert into sample(deptNo, deptName, deploc, depManager)
values(10, '��ȹ��', '����', 'ȫ�浿');

--���� () ��ȣ �ȿ� ����ó�� ���������� �ʾƵ�
--�̸� �����صθ� �׳� �ٷ� ���� ������ �����ϴ�. 
insert into sample
values(20, '�����', '�λ�', '�踻��');

select * from sample;

--sample ���̺��� deptno�� 20�� ���� �����Ѵ�.
delete from sample where deptno=20;
select * from sample;

--sample ���̺� ���ο� ���� �ִ´�. 
insert into sample
values(30, '������', '����', null);
select * from sample;

--deptNo�� 30�� ���� 50���� �����Ѵ�.
update sample set deptNo = 50
where deptNo = 30;
select * from sample;

--deptname�� �������� �÷���
--deploc�� ��õ���� �����Ѵ�.
update sample set DEPLOC = '��õ'
where deptName = '������';
select * from sample;

--deptname �������� ���� �����Ѵ�.
delete sample
where DEPTNAME = '������';
select * from sample;

delete from sample;
select * from sample;

/*�÷��Ӽ�(���Ἲ ��������)
not null : �ΰ��� �Էµ��� ���ϰ��ϴ� ����
unique : �ߺ��� ���� �Էµ��� ���ϰ� �ϴ� ���� <null�������>

primary key : not unll + unique�� �ǹ�
--��������ȴ´�<null + �ߺ�>

foreign key(�ܷ�Ű) : �����Ǵ� ���̺��� �÷��ǰ��� �����ϸ� ����Ѵ�
�ٸ� ���̺��� �ʵ�(�÷�)�� �����ؼ� ���Ἲ�� �˻��ϴ� ����
�ڽ����̺��� �θ����̺��� �����ϴ�Ű

check : <�־������� ����ϴ� ����>
�� �� �����ϳ��� �����Ը� �ϴ�����
*/
/* not null*/
--co11���� null�� ���� �ȵǰ�
--co12���� null���� �� �� �ֵ��� ���������� �ش�.
create table null_test(
  col1 varchar2(20) not null,
  col2 varchar2(20) null,
  col3 varchar2(20)
);
select * from null_test;
desc null_test;

--null_test ���̺��� co11,co12 �÷��� ���� �ִ´�.
insert into null_test(col1, col2)
values ('aa', 'bb');
select * from null_test;

--co11���� null�̸� �ȵǴµ� null�̿��� ����?
insert into null_test(col1,col2, col3)
values ('aa','cc', 'dd');


/*unique*/
create table unique_test(
--co11�� unique�� not null�̹Ƿ�
--primary key�� ���� ���������� �ǹ��Ѵ�.
  col1 varchar2(20) unique not null,
  col2 varchar2(20) unique,
  col3 varchar2(20) not null,--����ũ�ƴ�
  col4 varchar2(20) not null,--����ũ�ƴ�
  constraints temp_unique unique(col3, col4)
  --�����������ش� ����ũ�̸�temp_unique���ش�
);--�÷�3�� 4�� �־����� ����ũ���߸��Ѵ� 
--��>������ȣ�� ��ȭ��ȣ�� �ի������� �װ��� ����ũ�� �ٲ�ٴ¼Ҹ�
select * from unique_test;
desc unique_test;

--�÷��� ������ ���� �ִ´�.
insert into unique_test(col1, col2, col3, col4)
values ('aa', 'bb', 'cc', 'dd');
select * from unique_test;

--1�࿡ ���� �߰��� ���� 2�࿡ ���ο� ���� �߰��Ѵ�. 
insert into unique_test(col1, col2, col3, col4)
values ('a2', 'b2', 'c2', 'd2');
select * from unique_test;

--���� co12�� b2�� ���� 
--co11 ���� aa�� �ٲ��.
--�ٵ� �̹� unique_test co11���� aa�� �����ϹǷ�
--�� ������ ������ ���� ��
update unique_test 
set col1 = 'aa'
--���Ἲ���� �ߺ��Ǵ� col2������ũunique, col1��not null
where col2 = 'b2';
---------------------------------------------------->>>
desc user_constraints;


insert into unique_test (col1, col2, col3, col4)
values('a3', '','c3', 'd3');
--unique�ε� null������̶� ��// '' ==> ����ƴ�

insert into unique_test (col1, col2, col3, col4)
values('a4', '','c4', 'd4');--null�� �ΰ��� ����
select * from unique_test;



/*�⺻Ű(primary key) ���̺� ������ �⺻Ű ����*/

--primary_test ���̺� �����ϴµ�
--student_id���� ���������� ���.
create table primary_test(
    student_id number(10) primary key, /*�ζ��� ���*/
    name varchar2(20)    
);

--���� ����̶� �Ȱ����� ���⼭�� �ƿ��������� ��������. 
create table primary_test(
    student_id number(10),
    name varchar2(20),    
    constraints student_pk primary key(student_id) /*�ƿ����� ���*/
);--��������� �ָ� �̸����ο��Ѵ� �����̸Ӹ�Űstudent_pk �̸��� ������ְ�,
  --�׸�student_id�� ������ش�
drop table primary_test;
DESC PRIMARY_TEST;

create table primary_test(
    student_id number(10),
    name varchar2(20)      
);
/* ���̺��� �����ϰ� ���� ���Ŀ� �⺻Ű�� �����ϴ� ��� */
alter table primary_test
add constraints "�⺻Ű �̸�" primary key (�ʵ��) ;

--���̺� ���������� �����ϴ� ���
alter table primary_test
drop primary key;


select constraint_name, constraint_type, r_constraint_name, table_name 
from user_constraints
where table_name in('PRIMARY_TEST');

select constraint_name, table_name, column_name 
from user_cons_columns
where table_name in('PRIMARY_TEST');

/* �ܷ�Ű */
--foreign_key ���̺��� �����ϴµ�
--�÷��� �ϳ��̰�, ������������ dept_fk��� ���Ǹ��� ������ department_id ��
--departments ���̺��� department_id�� �����Ѵ�. 
create table foreign_key(
  department_id constraints dept_fk
  references departments (department_id) /*�ζ���*/
);--references departments�θ�Ű ���̺� ���̵�department_id�� ����ϰٴ�

select * from departments;
desc foreign_key;


DROP TABLE foreign_key;

create table foreign_key(
  department_id,
  constraints dept_fk
  foreign key (department_id)
  references departments (department_id)/*�ƿ�����*/
);

create table foreign_key(
    department_id number(10) primary key, 
    name varchar2(20)    
);

/*���̺��� �����ϰ� ���� �ܷ�Ű�� �����ϴ� ��� */
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
--check_test ���̺��� ����µ�
--gender �÷��� �ݵ�� ���� �����ϰ�
--check_sex��� �������Ǹ��� ���� �������� check�� �޴µ�
--genger�� ���� 'M'�� 'F'���� ���� �Ѵ�.
create table check_test(
  gender varchar2(10) not null -- ���� �ʵ�
      constraints check_sex check (gender in('M','F'))
);--üũ�����̸�check_sex check
DESC CHECK_TEST;

--check_test ���̺��� ����µ�
--gender �÷��� �ݵ�� ���� �����ϰ�
--check_sex��� �������Ǹ��� ���� �������� check�� �޴µ�
--���⼱ GENDER���� '����', '����'�� �����Ѵ�.
create table check_test(
  gender varchar2(10) not null
      constraints check_sex check (gender in('����','����'))
);

--�����̶�� ���� �ִµ� ù ��° �����ߴ� ���̺�
--�� ���� ������ ������ ���.
--�Ʒ� M���� �� �� �ִ�. 
insert into check_test values('����');
insert into check_test values('M');

select * from check_test;

select constraint_name, constraint_type, r_constraint_name, table_name 
from user_constraints
where table_name in('CHECK_TEST');

select constraint_name, table_name, column_name 
from user_cons_columns
where table_name in('CHECK_TEST');

-- �������� ����
-- ALTER TABLE '���̺��' DROP CONSTRAINT '�������Ǹ�'
-- ���̺��� PK �������� ����
-- ALTER TABLE '���̺��' DROP PRIMARY KEY:

-- �������� ��ȸ
--SELECT * FROM    ALL_CONSTRAINTS
--WHERE    TABLE_NAME = '���̺��';





--------------------------22-02-23 ����---------------------------

/*����(join): �Ϲ������� '��������' ����� �ǹ�*/
select * from employees;

--employees ���̺��� ��Ī�� emp
--departments ���̺��� ��Ī�� dep
--���̺��.�÷������� ������ �ҷ��´�.
select emp.first_name, emp.last_name, emp.email,
      dep.department_name           --���̺��Ī.�÷�
from employees emp, departments dep --[���̺�� ��Ī]��Ī���̿��ϰٴ�
--���� emp�� dep�� DEPARTMENT_ID�� ���ٸ�! 
where emp.DEPARTMENT_ID = dep.DEPARTMENT_ID; --where����

select * from jobs;


--JOIN ���� ���̺���� ��ø�Ѵ�. 
select emp.first_name, emp.last_name, emp.email,
       emp.department_id, dep.department_name,
       emp.job_id, job.job_title, loc.city
--FROM������ ���̺��� ��Ī�� �����Ѵ�.
from employees emp,
     departments dep,
     jobs job,
     locations loc
where emp.department_id = dep.department_id --��������
  And emp.job_id = job.job_id --��������
  And dep.location_id = loc.location_id --��������
  And loc.city = 'Seattle'; --�Ϲ����Ǻ��� ��������


/*���� ����*/
--���������� ���� ���̺� ������ �ٸ� �÷��� �ҷ��� �� ���
--���� FORM ������ employees ��Ī�� ���� EMP1, EMP2�� �����ߴ�.
select emp1.EMPLOYEE_ID, emp1.first_name, 
       emp2.employee_id ���id,--emp2.employee_id���մ�  ���id����������
       emp2.first_name ����̸� 
from employees emp1, employees emp2 --�ڱ��ڽ������̺��� �ΰ���Ī�� ����Ͽ� ��������
where emp1.MANAGER_ID = emp2.employee_id;
--emp1�� �Ŵ���������� ���̵��  emp2�� ���÷��� ���̵� ���ƾ��Ѵ�


/*�ܺ�����*/
--�ܺ� ���� ������ : + �ܺ� ���� �������� ��+���� ������ ������ 
--���̺� ��(Null) ���� �߰� ��Ű�� ���� �������̴�
--��) ��Ȯ�ϰ� �Ϸ��� (+) ���ִ°� ����.
select emp.employee_id,-- ����������� ������� �þ�� 107�� ����
       emp.first_name,
       emp.department_id,
       dep.department_name,
       loc.city
--���� ���̺��� ��Ī�� �������ش�.
from employees emp, departments dep, locations loc
where emp.department_id = dep.department_id (+)
-- �������ǿ� (+)�� ����� �� �����Եȴ� �̰� �ܺ�������
--���� ���� ���� �ϳ��� ��� �����ϴ�.
And   dep.location_id = loc.location_id (+); 
--���� ���ø��� ����ϱ����� �������ϳ��� �ذ���
-- (+)�� ���� 106�����´� ����ǥ���ϱ����� �ܺ����������� �ذ��̴� Ŵ������ �����Եȴ�
--�ܺ��������� (+)�� �־���� �ȴٴ� �ǹ� ^~^
--left, right, full �� ��� �ش�Ǵ��� ����.
--left�� �������� �����ʿ� null�� ����⿡ left ����,,! 



/*��������*/
--salary ����� ���ϴµ� round �Լ��� �Ἥ
--�ݿø����� �÷��ش�.
select Round(avg(salary))
from employees;

--employees ���̺��� select ������ 3���� �÷��� ����Ѵ�.
--where ���� ������ ���. 
select employee_id, first_name, last_name
from employees
where salary < 6462; --������������ձ޿����� ����

select employee_id, first_name, last_name
from EMPLOYEES
where salary < Round(avg(salary)); 
/*where �������� �����Լ� ���Ұ�
���� �Ʒ�ó�� �������� �̿������ �Ѵ�.*/


--where���� ������ �༭ ���������� �ۼ��ߴ�. 
--���������� �ϴ� select ���� ������ ����ѵ�
--() ��ȣ �ȿ� �־���� �Ѵ�.
select employee_id, first_name, last_name --��������
from EMPLOYEES
where salary < (select round(avg(salary)) 
--�׷��� ���������ȿ� select�� �̿��Ͽ� ������������ �����
from employees);
                
select * from locations;

--state_province ���� null�� ���� �ҷ��´�.
select location_id 
from locations
where state_province is null;

select * from departments;


--1.���������� ��ȣ�� ��� ����ؾ� �Ѵ�. 
--2. ���������� �� �������� ������ ��ġ�ؾ� �Ѵ�.
--3.���� �� ������������ ���� �� �� ������(>,=, >=, <, <=, <>)�� ��� �����ϴ�. 
--4.���������� ORDER BY ���� ������ �� ����
--5.SELECT ���� FROM��, WHERE��, HAVING �������� ����� �� �ִ�.  
--6.���� �� ������������ ���� �� �� ������(IN, ANY, ALL)�� ��� �����ϴ�
--7.���� �� ������������ ���������� ��ȯ�� �ΰ� �̻��� ���� 
-- �Ѳ����� ���ϱ� ���ؼ�, IN ������ �� ����ؾ� �Ѵ�. (�����Ѵ�)
--  = �� ��밡���ϴ�.

--�������� ����ϴ� �����̱⿡
--������ ������ = ����� �Ұ����ϰ�
--In�� ����� �Ѵ�.

--locations ���̺��� country_id ���� us��!
--���� location_id�� ����Ѵ�.
--�� ���� ���� ������ �־ 
--departments ���̺� ������Ѽ� �����´�.
select *
from departments
where location_id in ( select location_id 
-- in�����ڻ���Ͽ� ���߰��� ���
-- ������������ ������ �� �� �ִ�. 
                      from locations
                      where country_id ='US' );
                      
--in�����ڻ���ؼ� �����̼Ǿ��̵� 1400 1500 1700�ΰ� ����غ���
select *
from departments
where location_id in ( 1400, 1500, 1700 ); 


select * from dba_roles;
-------------------------------------------------------------------------------
--  1. ���� ����Ŭ ��Ʈ��ȣ Ȯ��
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;
--  2. ��Ʈ��ȣ ���� (8080 ��9090)
EXEC DBMS_XDB.SETHTTPPORT(9090);
---------------------------------------------------------------------------------

/*������ ���� ���� ���*/ 
--��Ī���̿��ؼ� ���غ���
--������ ���������̱⿡ = �����ڸ� �̿��Ѵ�. 
select emp.first_name, emp.last_name, job.JOB_TITLE
from employees emp, jobs job --��Ī�� �̿��ؼ� ����ϸ� ���ϴ�.
where emp.salary = (select min(salary) from employees)
--emp, job ���̺��� �÷����� �����Ƿ� ������ ����� �Ѵ�.
and emp.job_id = job.job_id;--������ �������� ���

--������ ���� ���� ������غ��� ��Ī�̿�

select emp.first_name, emp.last_name, job.JOB_TITLE
from employees emp, jobs job --��Ī�̿�
where emp.salary = (select max(salary) from employees)
and emp.job_id = job.job_id;--������ ���帹�� ��� �����̵ȴ�

/*��� �޿����� ���� �޴� ������� ��� ��ȸ */
select emp.first_name, emp.last_name, job.job_title
from employees emp, jobs job
where emp.salary >( select avg(salary) from employees)
and emp.job_id = job.job_id; --����

/* any�ƹ���, all */
select salary 
from employees
where department_id = 20;-- �θ��̳��´�

SELECT department_id FROM employees;

--ANY, SOME �������� �������� ���������� ��ȯ�� ����� ������ ���� ���Ѵ�.
--����� �ϳ� �̻��� ��ġ�ϸ� �� ��
select employee_id, department_id, salary
from employees 
where salary > any ( select salary 
-- 6000 13000 ���� �θ�6000�̻󳪿��Եȴ� 
from employees
where department_id = 20);
--20�μ��� ����޿��� �θ��ε� ,���⼭ �ּҰ� 6000�̴�
--�̻������ ���� �޴� ���� ��ȸ�ϴ°̴ϴ�
--�� 6000�� 13000 �߿� ������ �����ϸ�,
--�� 6000���� ū ������ SALARY ���� ����ϴ� ��

select employee_id, department_id, salary
from employees 
where salary > ( select min(salary)
from employees
where department_id = 20);                     


--ANY�� �� ���� �ϳ��� ���Ǹ� �����ص�
--ALL�� ��� �����ؾ� �ϹǷ�
--ALL�� ����ϸ� 13000���� ū ���鸸 ����ϰ� �ȴ�.
select employee_id, department_id, salary
from employees 
where salary > all( select salary 
--6000 13000 ���߿� ���ͺ��� Ŀ���Ѵ� �׷��� 13000�̻󳪿;��Ѵ�
from employees
where department_id = 20);                 
                                          
select employee_id, department_id, salary 
-- 13000�̻󳪿��� �Ѵ� �ƽ����Ѵ�
from employees 
where salary > ( select max(salary)
                     from employees
                     where department_id = 20);                      
                     
                     
--IN�� �� ���� �ش��ؾ� �ȴ�
--�����࿡�� = EQAUL�� ���� �ǹ��̱� ������
--6000, 13000 SALARY ���鸸 ����Ѵ�.
select employee_id, department_id, salary -- ���߰��̿� in
from employees 
where salary in ( select salary 
                     from employees
                     where department_id = 20);

--���� �� �������� 
--(1) ���� �� ���������� ���� 
--    - ���ø���Ʈ���� �� �̸��̳� �׷��Լ��� �����ϰ�, 
--���� �� �� �����ڿ��� =, <>,--<, <=, >, >=�� ����� �� �ִ�. 
-- 
--SELECT    ���ø���Ʈ1 
--FROM       ���̺� �̸�1 
--WHERE     ǥ���� ������ 
--                         (SELECT    ���ø���Ʈ2 
--                          FROM       ���̺� �̸�2) ;
--
--? ���� �� �������� 
--(1) ���� �� ���������� ���� 
--     - ���ø���Ʈ���� �� �̸��̳� �׷��Լ��� �����ϰ�, ���� �� �� �����ڿ��� IN,  
--ANY, ALL�� �ִ�.
-- 
--SELECT    ���ø���Ʈ1 
--FROM       ���̺� �̸�1 
--WHERE     ǥ���� ������񱳿����� 
--                         (SELECT    ���ø���Ʈ2 
--                          FROM       ���̺� �̸�2) ;
--
--? ���� �� �������� 
--(1) ���� �� ���������� ���� 
--���������� ��ȯ�� �ΰ� �̻��� ���� �Ѳ����� ���ϱ� ���ؼ�, �ݵ�� IN ������ 
--�� ����ؾ� �Ѵ�. =�� ��밡���ϴ�.
-- 
--SELECT    ���ø���Ʈ1 
--FROM       ���̺� �̸�1 
--WHERE     (���̸�1, ���̸�2, ....) IN 
--                         (SELECT (���̸�1, ���̸�2, ....)
--                          FROM       ���̺� �̸�2 
--                          WHERE     ����) ;     

SELECT employee_id,first_name,job_id,salary
from employees
--FRIST_NAME�� BRUCE�� ���� manager_id,job_id �� �����Ѵ�.
where(manager_id,job_id) in (select manager_id,job_id
                            from employees
                            where first_name='Bruce')
--^=�� <>�� !=�� �����ϴ� �� �����ʴ�.
--���⼭ AND ������ EMPLOYESS ���̺��� 
--FRIST_NAME�� Bruce�� �ƴ� ����
and first_name <> 'Bruce';
--���������� ����Ʈ ���� �������� �÷��� �˻��Ѵ�
--�ݵ�� �񱳴�� �÷��� 1:1�����Ǿ� �Ѵ�
--��) IN ������ ������ ���� SELECT ���� ���� �÷��� ���� ���ƾ� �Ѵ�.
--��罺�� ������ ����̸鼭 ���� ������ ����� �˻��Ѱ��̴�



select manager_id,job_id
from employees
where first_name='Bruce';
--���������� ���� �˻����ǿ� ����ϴ� �÷����� 1:1�����Ͽ� 
--��� ���ƾ� �˻��ȴ�
--�˻������� ���ÿ� �˻��� �� ���� �÷��� �� �ɶ� ���� �� ���������� �̿��Ѵ�

SELECT employee_id,first_name,job_id,salary
from employees
where manager_id in 
(select manager_id from employees where first_name='Bruce')
and job_id in 
(select job_id from employees where first_name = 'Bruce')
and first_name <> 'bruce';

--�׷��Լ��� �̿��Ͽ� �� �μ����� �ּұ޿��� �޴� ����� ������ ���϶�
--������ �� �μ��� ��ȣ�� �ּұ޿��� �� �� ��ġ�ϴ� ����� ã�¹����ε�
SELECT department_id,employee_id,first_name,job_id,salary
from employees
where(department_id,salary) in 
(select department_id,min(salary)
from employees
group by department_id)
order by department_id;
--���
--10   200  Jennifer AD ASST   4400
--20   202  PAT      MK REP    6000
--12���� ���� �����Եȴ�
--��������
--110  206  William AC ACCOUNT 8300



--------------------------22-02-24 ����---------------------------

/*view*/-- ������ ���������� �����
drop view v_emp;

--view�� ����ǵ� �̸��� v_emp�̴�.
--���⼭ ���� �÷��� �Ʒ� ������ 5���� �ִ�. 
--�ٵ� ��ȣ �ȿ� �̷��� ���� �÷��� ���� �ʾƵ��ȴ�.
--as �ڿ� select���� ��� �÷����� �������� ���� ������ 
create view v_emp
(emp_id, first_name, job_id, hiredate, dept_id) 
as
select employee_id, first_name, job_id, hire_date, department_id
--employees ���̺��� ��������
--job_id�� ST_CLERK�� ������ �����´�.
from employees
where job_id = 'ST_CLERK';
-- �빮������ id// as ���������� ������ ���վȿ��� �����ü��մ�

select * from v_emp;

--������ �Ȱ��� ������� �̹�����
--JOB_ID�� SH_CLERK�� EMPLOYEES ���̺��� ������ �����´�. 
create view v_emp1(emp_id, first_name, job_id, hiredate, dept_id) as
select employee_id, first_name, job_id, hire_date, department_id
from employees
where job_id = 'SH_CLERK';-- �빮�ڷ� id

select * from v_emp1;


drop view v_emp1;

--�����Ҷ� �ϴº��ɾ�
--�⺻�並 �����ϰ� ���� �����. ( ���� �䰡 ��� ���� ���� ����)
--CREATE VIEW�� �ƴ� CREATE OR REPLACE VIEW ��ɾ �־��ش�.
--�ڵ带 ���캸�� ó�� ������ V_EMP�� ������ �ٸ��� �ʱ⿡ ���� ��°�! 
create or replace view v_emp(emp_id, first_name, job_id, hiredate, dept_id) as
select employee_id, first_name, job_id, hire_date, department_id
from employees
where job_id = 'ST_CLERK';

select * from v_emp;

--�Ի����� �������� �������� �������� rownum�÷� ����ϱ�
--ROWNUM
--���� �Լ��� �ƴ����� ���� ���Ǵ� �����̴�.
--����Ŭ���� ���������� �����Ǵ� ���� �÷��� SQL ��ȸ ����� ������ ��Ÿ����.
--�ڷḦ �Ϻκи� Ȯ���Ͽ� ó���� �� ������
--ROWNUM : ��ȸ�� �����Ƿ� ������ �ű��.
--������ �並 �ҷ����µ�, ROWNUM�� �߰��ؼ� ���� �÷��� ����ߴ�.
--������ ������ HIREDATE�� ����⿡ ������ ���׹���! 
--������� ���� ���� ���� ������ ��� 
SELECT ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
FROM v_emp
ORDER BY hiredate;

--���� ���� ROWNUM�� ���׹��� �Ǵ� ������ ���� ���� ��������̱� �����̴�. 
--FROM - WHERE - (GROUP BY) - SELECT - ORDER BY ������ ������ ����ȴ�. 
--������ SELECT�� ����Ǿ��� �� �̹� ROWNUM�� �Ű��� �����̰� 
--�� ���¿��� ORDER BY�� ���� ������ �߻��ϴ� ���� ���� ����� ������ ���̴�.

/*
���� 
���� FROM ������ SEE_INFO TABLE�� ���̼����� ���Ľ�Ų �� �� ���� ���� ROWNUM�� �ٿ��ִ� ���̴�, 
����� Ȯ���غ��� ���̼����� ���ĵʰ� ���ÿ� ROWNUM�� ���̿� ���� ������� �ο��� ���� Ȯ���� �� �ִ�.

*/

select rownum, sl1.* from(select * from v_emp order by hiredate) sl1;


--�Ի����� ���� 9���� ������ rownum where������ �־�غ���
--emp_id, first_name, job_id, hiredate, dept_id

--select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
--from v_emp
--where rownum<=9
--order by hiredate;

select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
from v_emp
where rownum<=9;

--���� �������� �׳� �ϸ� ���׹��� 
--�̸� �Ű��� rownum���� �Ի��� �������� ������ �ʴµ�
--�̷��� �Ʒ� �������� �ϸ� ����� �������� ���´�.! 
select rownum, sl1.* from(select * from v_emp order by hiredate) sl1
where rownum<=9;


select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
from v_emp;

--�� ���� �� ������ CREATE OR REPLACE VIEW��� ����صνø� �˴ϴ�. 
--CREATE�� ����, REPLACE�� �����ε� CREATE OR REPLACE��� ������������ 
--�� Ÿ�� ���̸��� ������� CREATE�� �ϰ� ������� REPLACE�� �մϴ�.
--v_emp3�丸��� ���̵�� �۽�Ʈ������ ���̸� ��ó�����ֱ�
--emp_id, first_name, job_id, hiredate, dept_id
--job_id = 'SH_CLERK'
--nvl�Լ����̿��ϸ� null�̸� �����Ҽ������� �Լ��� �̿��ϴ°��̴�--��������
create or replace view v_emp3(emp_id,first_name,job_id,hiredate,dept_id) as
--NVL �Լ��� �̿��ؼ� ���� NULL �̸� �ڿ� ������ ��ü�Ǿ� ��µǴµ�
--���⼭ NULL�� �����ߴ�. 
select nvl(employee_id, null), nvl(first_name,null), 
           job_id, hire_date, department_id
from employees --nvl�Լ��� employee_id�� null�̸� �η�ó���ϰٴ�
where job_id = 'SH_CLERK';


desc v_emp3;
select * from v_emp3;

--�����Ϸ��������� <�Լ����̿��ؼ� ����>�� �������̾ȵȴ�
--��) V_EMP3�� FIRST_NAME�� NVL �Լ��� �̿��� ������ ���.
--�̷��� VIEW�� ������ �� ������ �� �÷��� ������ �Ұ����ϴ�.
update v_emp3 set first_name = 'kim'
where first_name = 'Julia';
--<�Լ��������ϸ�> ������ �ȴ�
update v_emp set first_name = 'kim'
where first_name = 'Julia';

select * from v_emp;

--(salary + nvl(commission_pct,0))*12 �������ϱ⿬���
--v_emp_salary(emp_id, last_name, annual_sal)

--emplyees���̺�κ��� ���ϱ�
--V_ENP_SALARY �並 ����µ�,,
--���⼭ SALARY ���� �׳� ���� �ʰ� ������ ���� �־���. 
create view v_emp_salary(emp_id, last_name, annual_sal) as
select employee_id, last_name, (salary+nvl(commission_pct, 0))*12
--commision_pct �׸��� ���̸� 0���� ó���ϰٴ�<�������걸�ϱ�>
from employees;
--nvl�Լ��� commission_pct�� ���̸� 0����ó���ϰٴ�

select * from v_emp_salary;

--WITH READ ONLY �ɼ��� �並 ���ؼ��� �⺻ ���̺��� � �÷��� ���ؼ��� ������
--���� ������ �� ������ �ϴ� ��
create view v_emp_readonly(emp_id, last_name, annual_sal) as
select employee_id, last_name, (salary+nvl(commission_pct, 0))*12 
from employees
with read only;-- �����͸� �����Ҽ��������ϴ� ���ϳ��� ���

desc v_emp_readonly;

select * from v_emp_readonly;

update v_emp_readonly set last_name = 'kim'
where last_name = 'Grant';--�����Ҽ����� 

--��ǻ�Ϳ��� �ν��ϴ� ��¥�� ù��° ��¥�� 1900�� 1�� 1���Դϴ�.
--�̰� ���ڷ� ��ȯ�ϸ� 0�̵Ǳ���.�׷��� ��¥�� ����ó�� ���
--���� ���ó�¥���� 3���� ��¥�� ���ϰ��� �Ѵٸ� SYSDATE - 3 ��밡��

--�����ϴ�view���̺��ɾ� create or replace view�� ����Ѵ�
--���4���̳Ѱ�,�μ���50,����̵��ST_CLERK �̰� 5���̻�ٹ��ؾ��Ѵ�
--employees ���̺�κ���employee_id, last_name, department_id,
--hire_date,job_id�� ���غ��� v_samp1�� ���弼��
--���ǵ��� AND�� �̿��ؼ� ���� ������ �־���. 
create or REPLACE view v_samp1 as
select employee_id, last_name, department_id, hire_date,job_id
from employees
where (salary + nvl(commission_pct,0))*12 > 40000
and department_id = 50
and job_id ='ST_CLERK'
--5�� �̻� �ٹ��Ѵٴ� �ڵ�
and sysdate - 365 * 5> hire_date;

select * from v_samp1;





--------------------------22-02-25 ����---------------------------
--���⼭���� �����غ��� 



--�����Ҷ� �ϴº��ɾ�
--�⺻�並 �����ϰ� ���� �����. ( ���� �䰡 ��� ���� ���� ����)
--CREATE VIEW�� �ƴ� CREATE OR REPLACE VIEW ��ɾ �־��ش�.
--�ڵ带 ���캸�� ó�� ������ V_EMP�� ������ �ٸ��� �ʱ⿡ ���� ��°�! 
create or replace view v_emp(emp_id, first_name, job_id, hiredate, dept_id) as
select employee_id, first_name, job_id, hire_date, department_id
from employees
where job_id = 'ST_CLERK';

select * from v_emp;

--�Ի����� �������� �������� �������� rownum�÷� ����ϱ�
--ROWNUM
--���� �Լ��� �ƴ����� ���� ���Ǵ� �����̴�.
--����Ŭ���� ���������� �����Ǵ� ���� �÷��� SQL ��ȸ ����� ������ ��Ÿ����.
--�ڷḦ �Ϻκи� Ȯ���Ͽ� ó���� �� ������
--ROWNUM : ��ȸ�� �����Ƿ� ������ �ű��.
--������ �並 �ҷ����µ�, ROWNUM�� �߰��ؼ� ���� �÷��� ����ߴ�.
--������ ������ HIREDATE�� ����⿡ ������ ���׹���! 
--������� ���� ���� ���� ������ ��� 
SELECT ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
FROM v_emp
ORDER BY hiredate;

--���� ���� ROWNUM�� ���׹��� �Ǵ� ������ ���� ���� ��������̱� �����̴�. 
--FROM - WHERE - (GROUP BY) - SELECT - ORDER BY ������ ������ ����ȴ�. 
--������ SELECT�� ����Ǿ��� �� �̹� ROWNUM�� �Ű��� �����̰� 
--�� ���¿��� ORDER BY�� ���� ������ �߻��ϴ� ���� ���� ����� ������ ���̴�.

/*
���� 
���� FROM ������ SEE_INFO TABLE�� ���̼����� ���Ľ�Ų �� �� ���� ���� ROWNUM�� �ٿ��ִ� ���̴�, 
����� Ȯ���غ��� ���̼����� ���ĵʰ� ���ÿ� ROWNUM�� ���̿� ���� ������� �ο��� ���� Ȯ���� �� �ִ�.

*/

select rownum, sl1.* from(select * from v_emp order by hiredate) sl1;


--�Ի����� ���� 9���� ������ rownum where������ �־�غ���
--emp_id, first_name, job_id, hiredate, dept_id

--select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
--from v_emp
--where rownum<=9
--order by hiredate;

select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
from v_emp
where rownum<=9;

--���� �������� �׳� �ϸ� ���׹��� 
--�̸� �Ű��� rownum���� �Ի��� �������� ������ �ʴµ�
--�̷��� �Ʒ� �������� �ϸ� ����� �������� ���´�.! 
select rownum, sl1.* from(select * from v_emp order by hiredate) sl1
where rownum<=9;


select ROWNUM,emp_id, first_name, job_id, hiredate, dept_id
from v_emp;




--view ��� (���, �̸�, �μ���ȣ, �Ի���)���ϰ�,�μ���ȣ�� 50 �� �����
--�۽�Ʈ���Ӱ� ��Ʈ���ӻ��̸� ����ּ���<���ڿ�����>
--||'���� '||���ڿ�����
create view ��� (���, �̸�, �μ���ȣ, �Ի���) as
select employee_id, first_name||' '||last_name, department_id, hire_date
from employees
where department_id = 50;

select * from ���;

drop view v_join;

--v_join �並 �����ϴµ� �÷� ���� () ��ȣ �ȿ� ������� �����Ѵ�.
--as �� ���ؼ� �Ʒ� select�� ���̺��� �����͸� �����Ѵ�.
--������ �÷��� emp�� emp_id, emp�� name emp�� dp_id
-- dept�� dp_name emp�� hiredate
--���⼭�� employoees ���̺�� departments ���̺��� ���ν��Ѽ�
--�� ���̺��� department_id ���� ���� ������ �����ϴ� ������ ���.
create view v_join(���, �̸�, �μ���ȣ, �μ���, �Ի���) as
select emp.employee_id, emp.first_name||' '||emp.last_name, 
       emp.department_id, --�μ���ȣ
--||'���� '||���ڿ�����
dept.department_name, emp.hire_date
from employees emp, departments dept
where emp.department_id = dept.department_id;
--�������� �μ���ȣ�� �������

select * from v_join;


--------------------------22-02-25 ����---------------------------

/*������ ����*/
--bom ������� �������� �θ��� �ڽĳ�� ����(������)���
--bom_sphone ���̺��� �����ϴµ�
--item_id �÷��� ������������ pk�� nn�� ���. 
create table bom_sphone(
  item_id number(3) not null,
  parent_id number(3),
  item_name varchar2(20) not null,
  primary key (item_id)
);

--���̺��� ������ ���� insert�� �� �־��ֱ� 
������ item_id, parent_id , item_name
insert into bom_sphone values(100, null, '����Ʈ��');--�θ�����ֻ�����Ʈ
insert into bom_sphone values(101, 100, '����pcb');--100�θ�
insert into bom_sphone values(102, 100, '���͸�');
insert into bom_sphone values(103, 101, 'CPU');--101�θ�
insert into bom_sphone values(104, 101, '�޸�');--101�θ�
insert into bom_sphone values(105, 101, '�������');

select * from bom_sphone;

--bom_sphone ���̺��� AS�� S1, S2 ���� �����ߴ�.
--S1�� ������ �̸�, S1�� ������ ���̵� S2�� ������ �̸��� AS�� parent_name���� ����
--���⼭ S2�� ������ �̸���!! 
--S1�� �θ� �̸��� S2�� ������ �̸��� ���ٸ� S2�� ������ �̸��� ����ϴ� �Ŵϱ�
--��)) S1�� �θ� ���̺��� NUMBER�� �ش��ϴ� �̸��� ����ϴ� ��.! 
select s1.ITEM_NAME, s1.item_id, s2.ITEM_NAME parent_name --self���������ش�
from bom_sphone s1, bom_sphone s2
WHERE s1.PARENT_ID = s2.ITEM_ID (+) --�ܺ�����(+)�� �̿��ؼ� ���γ��������ش�
order by s1.ITEM_ID;
-- ���������� �������ȴ´� ����pcb�ؿ� cpu������ ���;��ϹǷ� �׷��� �ؿ�����������ش�



/* start with, connect by ���� �̿��ؼ� ������ ������ �� �� �ִ�.*/
--LPAD �Լ��� ������ ���� ��ŭ ���ʺ��� Ư�����ڷ� ä���ش�.
-- �Լ�  :  LPAD("��", "�� ���ڱ���", "ä����")
--���⼱ LEVEL�� ������ ������ ����
--��) ����Ʈ���� 1��° ����Ʈ���� �ڽĵ��� ���� PCB�� ���͸�
--����Ʈ���� �ڽ��� ���� PCB�� �ڽ��� CPU,�޸�,������� 
--���� �̿� �°� 1���� 3���� LEVEL�� �־�����. 
-- ��|| �� �̿��ؼ� ����� ITEM_NAME �÷��� ���� ���δ�
--||�� ���� ���϶� �̿��ϴ� ������ 
select LEVEL,lpad(' ', 2*(level-1)) || item_name itemnames --��Īitemnames���� ���
from bom_sphone             
--lpad('����', 2*(level-1) ���������� �����ַ��°��� ���⼭ 2�� �������� 3����� 2�����ش�
--LEVEL�� ������ ������ ��) �ֻ��� ������ PARENT_ID�� �����ϴµ�
--PARENT_ID�� �θ� �����ϱ� ���� NULL�� ���� 
start with parent_id is null  --�ֻ��� �θ� ��Ʈ�� ���ΰ���������
/*connect by prior item_id = parent_id*/
--item_id�� �θ���̵� ������ �θ������� ã�Ƽ� �����Ű�ٴٶ���ǹ�
connect by  parent_id = prior item_id;--prior �� �θ��� ���� ã�°Ŵ�
--����item id�� �θ��� ���� ã�Ƽ� ������ ���� parent_id���� �ְٴ� ����ǹ��̴�


--���� ������ ����ϰ� �̹��� EMPLOYEES ���̺��� 
--MANAGER_ID�� EMPLOYEE)ID�� �������� ������ ���� ������ �����ؼ�
--�� 5�����̹Ƿ� ���� ���� ���޺��� LEVEL�� �����Ѵ�.
--��� ������ 4�� �����ϰ� LEVEL-1 ����ŭ ���ʿ��� ����� ���
select level,
       lpad(' ', 4*(level-1)) || first_name || ' ' || last_name "�̸�" 
       --5�����̸� 4�����ش�
from employees
start with manager_id is null
connect by manager_id = prior employee_id;


--FROM ������ ������ �̿��ϴµ�
--EMPLOYEES ���̺��� ���� �̸��� JOBS ���̺��� ������ ����Ѵ�. 
--����) EMP ���̺��� JOB_ID�� JOB ���̺��� JOB_ID�� ���� ������ �鸸
--����ϰ� �����.! 
select LEVEL, jb.job_title "����", --������ ����ؼ� ������������ ���ش�
       lpad(' ', 4*(level-1)) || emp.first_name || ' ' || emp.last_name "�̸�"
from employees emp, jobs jb
where emp.job_id = jb.job_id
start with emp.manager_id is null
connect by emp.manager_id = prior emp.employee_id;






--------------------------22-02-28 ����---------------------------

/*������(sequence): �������� ��ȣ�� ������ִ� ��� 
 �������� 
create sequence ������ �̸�
   increment by n <- n: �������� ���� 2: 2�� ���� / �⺻��: 1 ����   
   start with n <- ���۰� ���� / �⺻���� 1
   maxvalue n | nomaxvalue <- ������ �ִ밪�� ����
   minvalue n | nominvalue <- ������ �ּҰ��� ���� : 
                              cycle �ɼ��ϰ�� ���۰�
   cycle | nocycle <-�������� ��ȯ ��������� ����
   cache n | nocache <- �������� �ӵ��� �����ϱ����� ĳ�̿��� ����
   ������ ������ ������ �� �� �ֵ��� �̷��� ��û�� ����� �����͸� 
             ������ �δ� �ӽ� ��Ҹ� ���Ѵ�
*/

/* ������ ���� : ��ǰ��ȣ �����ϴ� ������ �����*/
--seq_serial_no ������ ����µ�
--1�� �����ϸ� ���۰��� 100�̰� max�� 110 min�� 99�� ��ȯ�ϸ� ĳ�ð��� 2�� ������ �����

create sequence seq_serial_no  --�� �̸����� ���� �ְԵȴ�
increment by 1  --1������
start with 100  --100���ν���
maxvalue 110   --�ִ밪��������
minvalue 99    --�ٽ� �ּҰ����� 
cycle         --��ȯ
cache 2;

--���� ������ �� Ȯ���غ��� 100! 
SELECT seq_serial_no.NEXTVAL FROM dual;
SELECT seq_serial_no.CURRVAL FROM DUAL;

-- ���ο� ���̺��� ����� 
create table good(
  good_no number(3),
  good_name varchar2(10)
);
drop table good; --�����ϰ� �ٽ��ص� seq ��ȣ�� �����Ѵ�

--good_no �����ٰ� seq_serial_no.nextval�� �Է��ؼ� �����ϸ�
--�ڵ����� ���� ���� �־��� �� no�� �ö󰡰� �ȴ�. 
insert into good 
values(seq_serial_no.nextval, '��ǰ1'); /*nextval: ������*/

select sequence_name, min_value, max_value,
         increment_by, cycle_flag
from user_sequences;

select * from good;

--good ���̺� ���� �ִµ� �̹��� nextval�� �ƴ�
--currval�� �־��⿡ ���� ���̺� ���Եƴ� good_no�� ���� ���� ����.
--���� nextval ���ָ� 102�� �Ǵ� ��! 
insert into good 
values(seq_serial_no.currval, '��ǰ2'); /*currval:���簪*/

select seq_serial_no.currval from dual; -- ���簪�� Ȯ���ϴ�
--13���� nextval�Լ� �����͸� �־��,12��° 110�̳Ѿ��
--�ٽ� 99��°�� ��ȯ�Ѵ� �״� 100 101..

select * from good;
drop sequence seq_serial_no2;
drop table good2;

--���ο� ���̺� good2�� �����Ѵ�.
create table good2(
  good_no number(3),
  good_name varchar2(10)
);

select * from good2;

--�������� �����ϴµ� ���� ���� 1 ���۰��� 100
--�ִ밪�� 105 ĳ�ô� 2�� �����Ѵ�. 
--�̷��� �ּҰ� �����ϰ� cycle ��ȯ���� ���� �������� ������
--�ִ밪�� ������ �ٴ޾��� �� ������ ���� �� ������ �ߴܵȴ�.
--�ּҰ� �Է��ϰ� cycle ���൵ �Ȱ���.! 
--���� cycle�� �ְ� �ּҰ��� �Է� ���Ѵٸ� ���� ���µ�
--�ٽ� �����ϴ� ���� 1�� �����ǰ� �ȴ�.!!!! 
create sequence seq_serial_no2 --�������� �ٽ� ����
increment by 1
start with 100
maxvalue 105     --minvalue�� ����
cache 2;

create sequence seq_serial_no2 --�������� �ٽ� ����
increment by 1
start with 100
maxvalue 105--minvalue�� ����
minvalue 99
cycle
cache 2;



--���� ���� �� ������ nextval�� ���� �Է��ؾ� �ȴ� �տ��� �߾���.!
--�׷��⿡ ���⼭�� ������ ���� ��. ������ ù ��° ���� nextval�� ����.
insert into good2
values(seq_serial_no2.currval,'��ǰ1');

--nextval�� �־ ���۰��� 100�� ���� �ȴ�. 
insert into good2
values(seq_serial_no2.nextval,'��ǰ1');
insert into good2
values(seq_serial_no2.nextval,'��ǰ2');
insert into good2
values(seq_serial_no2.nextval,'��ǰ3');
insert into good2
values(seq_serial_no2.nextval,'��ǰ4');
insert into good2
values(seq_serial_no2.nextval,'��ǰ5');
insert into good2
values(seq_serial_no2.nextval,'��ǰ6');
--cycle�� �������� �ʰ� �ּ� ���� �������� �ʾұ⿡
--105�� �����ص� �ִ밪�� �Ѿ�� ������ ����. 
insert into good2
values(seq_serial_no2.nextval,'��ǰ7');



select seq_serial_no2.currval from dual;

commit;

select * from good2;

drop sequence seq_serial_no2;

/* ������ ���� 
drop sequence seq_serial_no2;   =>��������
*/
--sqlplus���� �����ͺ��̽� �����ϴ¸�ɾ� startup; 
--�������� shutdown abort;
--shutdown abort�������ᰡ �߻��ϴ��� �ٽ������ؼ�
--seq�����ϸ鼭 ����value�� ������ cache�� ���Ѽ����Ϸ���




