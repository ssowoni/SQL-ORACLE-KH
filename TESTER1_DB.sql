--�ǽ��� ������ �������.

Select round(180.125,2) from dual;
Select nvl(mgr, 0) from emp;

select * from emp;

select date_format(sysdate, '%Y-%m-%d') from dual;


SELECT MONTHS_BETWEEN(TRUNC(SYSDATE,'YEAR'),
                      TRUNC(TO_DATE('971023','YYYYMMDD'),'YEAR')) /12 +1 FROM DUAL;



--------------------------22-02-16 ��������---------------------------
--����Ŭ�� ��ҹ��� �������� �ʴ´�.
--��) �ο뱸������ ����
select * from tab;
--�ۼ��� ���̺� ��� Ȯ�� 
--DAUL ���̺��̶�?
--DUAL ���̺��� �ٷ� ��� ������ ����� �� �ٷ� ��� ���ؼ� ����Ŭ���� �����ϴ� ���̺��̴�.
SELECT * FROM DUAL;
--dual ���̺��� ����ڰ� �Լ�(���)�� ������ �� �ӽ÷� ����ϴµ� �����ϴ�
--�Լ��� ���� ������ �˰� ���� �� Ư�� ���̺��� ������ �ʿ���� dual ���̺��� �̿��Ͽ� �Լ��� ���� return ���� �� �ִ�.
SELECT 24*60 FROM DUAL;
--dual ���̺��� �̿��Ͽ� 24*60�� ����


desc emp;

--���̺� ���� 
--������ ����� �� delete drop�� ���̺� ��ü�� ����⿡ �����ؾ� �Ѵ�.
--�����Ͱ� ��ų �� �ֱ⿡ drop���� �� �� ����������.
-- �μ� ���̺� �����ϱ�
DROP TABLE EMP;
-- ��� ���̺� �����ϱ�
DROP TABLE DEPT;
-- �޿� ���̺� �����ϱ�
DROP TABLE SALGRADE;

DROP TABLE EMPLOYEE;

DROP TABLE DEPARTMENT;

DROP TABLE SALGRADE;

-- �μ�(DEPARTMENT) ���̺� �����ϱ�
CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC   VARCHAR2(13) ) ;

-- ���(EMPLOYEE) ���̺� �����ϱ�
CREATE TABLE EMP( 
    --EMPNO �÷��� ���ڴ� 4�ڸ����� �����ϰ� ���������� �̸��� PK_EMP�̸�
    --�ʼ� ���� �������� PRIMARY KEY�� �����ߴ�. 
      EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
    ENAME VARCHAR2(10),
     JOB   VARCHAR2(9),
    MGR  NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),--�ڸ����� 7�̰� �Ҽ��� 2�ڸ� ����
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);

 -- �޿� ���̺� �����ϱ�
CREATE TABLE SALGRADE(
    GRADE NUMBER,
    LOSAL NUMBER,
    HISAL NUMBER );

-- �μ� ���̺� ���� ������ �߰��ϱ�
INSERT INTO DEPT VALUES(10, '�渮��', '����');
INSERT INTO DEPT VALUES(20, '�λ��', '��õ');
INSERT INTO DEPT VALUES(30, '������', '����'); 
INSERT INTO DEPT VALUES(40, '�����', '����');

-- ��� ���̺� ���� ������ �߰��ϱ�
INSERT INTO EMP VALUES(1001, '����', '���', 1013, to_date('2007-03-01','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1002, '�ѿ���', '�븮', 1005, to_date('2007-04-02','yyyy-mm-dd'), 250,   80, 30);
INSERT INTO EMP VALUES(1003, '����ȣ', '����', 1005, to_date('2005-02-10','yyyy-mm-dd'), 500,  100, 30);
INSERT INTO EMP VALUES(1004, '�̺���', '����', 1008, to_date('2003-09-02','yyyy-mm-dd'), 600, NULL, 20);
INSERT INTO EMP VALUES(1005, '�ŵ���', '����', 1005, to_date('2005-04-07','yyyy-mm-dd'), 450,  200, 30);
INSERT INTO EMP VALUES(1006, '�嵿��', '����', 1008, to_date('2003-10-09','yyyy-mm-dd'), 480, NULL, 30);
INSERT INTO EMP VALUES(1007, '�̹���', '����', 1008, to_date('2004-01-08','yyyy-mm-dd'), 520, NULL, 10);
INSERT INTO EMP VALUES(1008, '���켺', '����', 1003, to_date('2004-03-08','yyyy-mm-dd'), 500,    0, 30);
INSERT INTO EMP VALUES(1009, '�ȼ���', '����', NULL, to_date('1996-10-04','yyyy-mm-dd'),1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '�̺���', '����', 1003, to_date('2005-04-07','yyyy-mm-dd'), 500, NULL, 10);
INSERT INTO EMP VALUES(1011, '�����', '���', 1007, to_date('2007-03-01','yyyy-mm-dd'), 280, NULL, 30);
INSERT INTO EMP VALUES(1012, '������', '���', 1006, to_date('2007-08-09','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1013, '������', '����', 1003, to_date('2002-10-09','yyyy-mm-dd'), 560, NULL, 20);
INSERT INTO EMP VALUES(1014, '���μ�', '���', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);

-- �޿� ���̺� ���� ������ �߰��ϱ�
INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);
--��Ŀ������ �Ϸ���� �ؾ��Ѵ�.
COMMIT;


desc emp;
--���̺� ���� 


--SELECT�� ������ ���̽� ���� ����Ǿ��ִ� ���̺��� ��ȸ�ϱ� ���� ��ɾ�
--SELECT �������� ������ �ϴ� ����� �÷����� ����Ѵ�.
--SELECT ������ *�� ����ϸ� ������ ���̺��� ��� �÷��� ��ȸ�Ѵ�.
--FROM �������� ������ �ϴ� ����� ���̺� �̸��� ����Ѵ�.

SELECT * FROM emp; --��ü ǥ�� �����ش�.
SELECT empno,ename FROM emp; -- empno,ename�� �����ش�.

select * from dept;


--AS�� �÷��� ��Ī �ο��ϱ�, �÷��� ��� ��Ī�� ����ϰ��� �ϸ� �÷��� ����� �ٷ� �ڿ� �ִ� AS��� Ű���带 �� �� ��Ī�� ����Ѵ�.
--EMP ���̺�κ��� ename, sal ���� ���ϱ�
SELECT ename,sal*12 AS ���� FROM emp;
SELECT ename,sal*12 ���� FROM emp; --as�� �����Ǿ� �ִ�.
SELECT ename,sal annual FROM EMP; --as�� �����Ǿ� �ִ�.
SELECT ename,sal*12+nvl(comm,0) "Annsal" FROM emp; --as ���� ��� "" ���

--�÷� �̸��� ��Ī �����ؼ� ����ϱ� from dept
SELECT deptno as "�μ���ȣ", dname"�μ���" from dept; --as�� �����Ǿ��ִ�.

SELECT ename,sal*12+nvl(comm,0) as ���� from emp; --�������� ������? commit -> comm���� �ٲ��ش�.

SELECT ename,sal,job,sal*12,sal*12+comm,comm,deptno FROM emp;

--NVL �Լ�
--NVL("��","��ü��")
--NVL ó���� ���� �Լ��� �ش� �÷��� ���� NULL�� ��� �ٸ� ������ ��ü�Ͽ� ���


SELECT DEPTNO FROM EMP;
--�ߺ��� �����͸� �� ������ ����ϰ� �ϴ� DISTINCT
--EMP���̺��� DEPTNO �÷��� ������ �ҷ����µ� �ߺ��� ���� �����Ѵ�
SELECT distinct DEPTNO FROM EMP;


--����Ŭ���� �������� �÷��� ������ �� ����ϱ� ���ؼ� Concatenation
--�����ڸ� �������ݴϴ�. �� ����ó�� ���̵��� �ϱ� ���ؼ� "||"�� �÷���
--���ڿ� ���̿� ����Ͽ� �ϳ��� �����Ͽ� ����ϸ� �ȴ�. 
SELECT ename || '�� ������ ' ||job||'�Դϴ�.' as ���� FROM emp;

SELECT * FROM emp WHERE sal >=500;
--emp ���̺��� ���� sal>=500�� ��ȸ
SELECT * FROM emp WHERE sal ^=500;
--emp ���̺��� ^=�� <>�� !=�� �����ϴ� �� �����ʴ�.

SELECT * FROM emp WHERE ename='�̹���';
--�� invalid identifier : �������� �ĺ���
SELECT * FROM emp WHERE ename="�̹���";

--Ư�� ������ �����͸� ��ȸ�ϴ� WHERE ����
--���ϴ� �ο츸 �������� �ο츦 �����ϴ� ������ SELECT ����
--WHERE ���� �߰��Ͽ� �����ؾ� �Ѵ�. 

--�Ի����� 2005/03/20 ����
SELECT *
FROM emp
where hiredate <to_date('2005/03/20','YYYY/MM/DD');

--��) EMP ���̺�κ��� ���������� �μ���ȣ�� 10�� �μ��� ��ȸ�ϼ���

SELECT * FROM emp WHERE DEPTNO=10;

--��) ��������(AND, OR, NOT) �� ����Ͽ� 10�� �μ��̰�, ������ ������ ����� ��ȸ�غ�����
SELECT * FROM emp WHERE DEPTNO=10 AND JOB='����';

--BETWEEN AND ������
--Ư�� ���� ���� ���ϴ� ���������� �˾ƺ��� ���ؼ� 
--�񱳿����ڿ� �������ڸ� �����Ͽ� ǥ���� �� �ִ�.
--COLUMN_NAME BETWEEN a AND b;

--��) �޿��� 400~500 ��� ����ϱ�
select * from emp WHERE sal BETWEEN 400 and 500;

--IN������ 
--Ư�� �ʵ��� ���� A�̰ų� B�̰ų� C�߿� ��� �ϳ��� �����ϴ���
--����ϵ��� �ϴ� ǥ���� IN �����ڸ� ����Ͽ� �� �� �ִ�.
--COLUMN_NAME IN(A,B,C);
--��) IN �����ڸ� ����Ͽ� Ŀ�̼��� 80�̰ų� 100�̰ų� 200�� ��� ��ȸ�ϱ�
SELECT * FROM EMP WHERE COMM IN(80,100,200);

--��) hiredate�� between�� ����Ͽ� 2003�⿡ �Ի��� ������ ����ϼ���.

select * from emp where hiredate BETWEEN to_date('2003/01/01','YYYY/MM/DD') 
and to_date('2003/12/31','YYYY/MM/DD');



select * from emp
where comm !=80 and comm <> 100 and comm ^=200;
--���� ���� ����� ���� IN �����ڸ� ����Ͽ� ����غ�����
SELECT *FROM EMP
WHERE COMM NOT IN(80,100,200); -- �����ϰ� NOT�� �ٿ��� �Ѵ�. 

--LIKE �����ڿ� ���ϵ�ī��
--column_name Like pattern
--LIKE �������� PATTERN�� ����ؾ� �ϴµ� PATTERN�� 
--������ ���� �ΰ��� ���ϵ� ī�尡 ���ȴ�.
--% : ���ڰ� ���ų�, �ϳ��̻��� ���ڰ� ����� �͵� �������
--_: �ϳ��� ���ڰ� � ���� �͵� ��� ����.

--��) �̾����� like�� �̿��Ͽ� �̸��� ����غ�����
select * from emp
where ename like '��%';

--��) ���� �ƹ����� ���⸸ �ص� �Ǵ� �̸��� ��ȸ�غ�����
select * from emp
where ename like '%��%';

--��) ���� ����� ���� �̸��� ����غ�����
select * from emp where ename like '_��_';

--��) ��� �̸��� ���� �ȵ��� �̸��� ����غ�����.
select * from emp where ename not like '_��_';

--NULL�� ���� ã�� ���� IS NULL
--��� �÷� IS(������) NULL(�񱳰�);
SELECT * FROM EMP WHERE COMM = NULL;

--��) Ŀ�̼��� NULL�� ����� ��ȸ�غ�����
SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE COMM IS NOT NULL;

--������ ���� ORDER BY
--����
--SELECT * [�÷�1, �÷�2 ...]
--FROM [���̺��]
--WHERE [����]
--ORDER BY [�÷���] [SORTING];
--ORDER BY �� �������� � Į���� �������� ������ ��������
--�����ؾ� �ϱ⿡ �÷� �̸��� ����ؾ� �Ѵ�.
--�� �������� ������������ ����(ASC)����, ��������(DESC)���� ���Ĺ���� ����ؾ� �Ѵ�.
--���� : ���������� ����
--���� : ���� ������ ����
--��¥ : ���� ��¥ ������ ����
--NULL : ���� ������
--���������� ���� �ö󰣴� (���� �� -> ���� ��)
--���������� ���󿡼� �����´� ��� �����ϸ� ���Ѵ�. (���� �� -> ���� ��)

SELECT * FROM EMP WHERE COMM IS NULL ORDER BY JOB ASC; 
--COMM���� NULL�� ���� �߿� JOB�� ������������ �����Ѵ�.

--��) �޿��� ���� �޴� ������ ���, �޿��� ������ �̸������� ���

SELECT * FROM EMP ORDER BY SAL DESC, ENAME ASC;

--��) �Ի糯¥�� �ֱټ�, ��¥�� ������ �̸���
SELECT * FROM EMP ORDER BY HIREDATE DESC, ENAME ASC;

--��1) �޿��� 300������ ����� �����ȣ, ����̸�, �޿� ����ϱ�
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL <300;

--��2) �̸��� "����ȣ"�� ����� �����ȣ, �����, �޿� ����ϱ�
SELECT EMPNO, ENAME, SAL FROM EMP 
WHERE ENAME='����ȣ';

--��3) �޿��� 250�̰ų� 300�̰ų� 500�� ������� �����ȣ�� �����, �޿��� �˻��ϱ� 
SELECT EMPNO, ENAME, SAL FROM EMP
WHERE SAL IN(250,300,500);

--��4) �޿��� 250�̰ų� 300�̰ų� 500�� �ƴ� ����� �˻��ϱ�
SELECT * FROM EMP WHERE SAL NOT IN(250,300,500);

--�� 5) LIKE �����ڿ� ���ϵ� ī�带 ����Ͽ� �̸��߿� "��"���� �����ϴ� ����� 
--�̸��߿� "��"�� �����ϴ� ����� �����ȣ�� ����̸� ����ϱ�

SELECT EMPNO,ENAME FROM EMP 
WHERE ENAME LIKE '��%' OR ENAME LIKE '%��%';

SELECT EMPNO,ENAME FROM EMP WHERE ENAME NOT LIKE '��%' AND ENAME NOT LIKE '%��%';

--�� 6) ���(�� ���)�� ���� ����� ����ϱ� 
SELECT * FROM EMP WHERE JOB='����';
SELECT * FROM EMP WHERE JOB='���';
SELECT * FROM EMP WHERE MGR IS NULL;


--�� 7) ��� ���̺��� �ֱ� �Ի��� ���� ������ �����ȣ, �����, ����, �Ի��� �÷��� ����ϱ�
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP ORDER BY HIREDATE DESC, JOB DESC;

--�� 8) �μ� ��ȣ�� ���� ������� ����ϵ� ���� �μ����� ����� ����� ��� �Ի����� ���� ������ ������� ����ϱ� 

SELECT * FROM EMP ORDER BY DEPTNO ASC, HIREDATE ASC;

SELECT * FROM EMP ORDER BY JOB ASC;



------------------------- 22-02-17 �������� --------------------------------------

--���տ�����
--UNION(������) , DIFFERENCE(������), INTERSECT (������) ������
--�Է� ���̺�� ��� ���̺��� �ߺ� ���ڵ尡 ����
--UNION ALL(������), DIFFERENCE ALL(������), INTERSECT ALL(������) ������
--�Է� ���̺�� ���̺� �ߺ��� ���ڵ尡 ���
--����
--<����1> ���տ����� 1 <����2> ���տ�����2 <����n> 


--
DROP TABLE GROUP_STAR;
DROP TABLE SINGLE_STAR;
-- ���̺� ����
CREATE TABLE GROUP_STAR(
   NAME      VARCHAR2(50)
);
--
CREATE TABLE SINGLE_STAR(
   NAME      VARCHAR2(50)
);

--���̺��� �� �ֱ�
INSERT INTO GROUP_STAR VALUES('�¿�');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('ȿ��');
INSERT INTO GROUP_STAR VALUES('Ƽ�Ĵ�');
INSERT INTO GROUP_STAR VALUES('����ī');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('���');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('ž');
INSERT INTO GROUP_STAR VALUES('���巡��');
INSERT INTO GROUP_STAR VALUES('�뼺');
INSERT INTO GROUP_STAR VALUES('�¸�');
INSERT INTO GROUP_STAR VALUES('�¾�');

INSERT INTO SINGLE_STAR VALUES('�¿�');
INSERT INTO SINGLE_STAR VALUES('���巡��');
INSERT INTO SINGLE_STAR VALUES('�뼺');
INSERT INTO SINGLE_STAR VALUES('�¾�');
INSERT INTO SINGLE_STAR VALUES('������');
INSERT INTO SINGLE_STAR VALUES('������');
INSERT INTO SINGLE_STAR VALUES('������');
COMMIT;


--�׷�Ȱ���� �̱�Ȱ���� �ϴ� ���� �̸��� �ߺ��Ͽ� ����ϱ�
select * from group_star 
union all select * from single_star;

--�ߺ��� ���ڵ尡 ������
--��) �׷�Ȱ���� �̱�Ȱ���� �ϴ� ���� �̸� ����ϱ�
select * from group_star 
union select * from single_star;


-- minus�� Ȱ���ؼ� ������ ���ϱ�
--�ƿ� �̱�Ȱ���� �ϴ� ����
select * from single_star 
minus select * from group_star;
--�ƿ� �׷�Ȱ���� �ϴ� ����
select * from group_star 
minus select * from single_star;

-- intersect ������ ����ؼ� �������� �ǹ��Ѵ�.
--��) �ΰ��� ���̺� ��� ���ϴ� �� ������ ��� �������� ��ȯ�Ѵ�.
--�̱۰� �׷�Ȱ�� ��� �ϴ� ����
select * from group_star 
intersect select * from single_star;

--*�����Լ�*
--���밪 ���ϱ�
select -10, abs(-10) from dual;

--�Ҽ��� �Ʒ��� ������ FLOOR �Լ�
--floor(����, �Ҽ��� �ڸ���) ���ڸ� ���� �Ҽ��� �ڸ�����ŭ ������.
select 34.5678, floor(34.5678) from dual;

--������ ���ϴ� MOD �Լ�
--mod(����1, ����2) ���� ���ڸ� ���� ���ڷ� ������.
select mod(27,2) , mod(27, 5), mod(27, 7) from dual;

--Ư�� �ڸ������� �ݿø��ϴ� ROUND �Լ�
SELECT 34.5678, ROUND(34.5678) FROM DUAL;

--add_month() : ���� �� ���ϱ�
--���� ��¥�� 7���� �� 
SELECT add_months(sysdate,7) from dual;

--next_day() : ���� ��¥���� ���� �����ص� ���� ��¥�� ���´�.
select next_day(sysdate,'�Ͽ���') from dual;

--last dat() : �ش���� ������ ��¥�� ���´�
select last_day(sysdate) from dual;

--to char() : ���� ��¥�� ���Ĵ�� ������
select to_char(sysdate, 'YYYY/MM/DD') FROM DUAL;
select to_char(sysdate, 'YYYY-MM-DD') FROM DUAL;


select Substr(sysdate,1,2)+(100-Substr(9714023,1,2))  from dual;

Substr(sysdate,1,2)-Substr(eno,1,2) 

--TO_DATE() : �ش� ���ڿ��� ����� ���Ĵ�� DATE Ÿ������ ��ȯ
SELECT SYSDATE, TO_DATE('2015/03/04', 'YYYY/MM/DD') FROM DUAL;




--��) Ư�� �ڸ������� �߶󳻴� TRUNC �Լ��� ���Ͽ� ��������
--12.3456 ���� �Ʒ� ��� ����� ��Ÿ���ÿ�
-- -1�� �����ڸ����� �ڸ��� �� �ڸ��� 0���� �ٲ۴�.
SELECT 12.3456, TRUNC(12.3456,-1), TRUNC(12.3456,0) FROM DUAL;

--CONCAT(char1, char2) : ���ڿ� ��ġ�� ���
select concat('Hello','bye'), concat('������ħ','bad') from dual;
--AS�� �����Ǿ� �ִ�. ������ħ�� operators�� �� �÷��� ��Ī 
--||�� CONCAT �Ѵ� ���� ����̴�.
select concat('good','bad') ������ħ, 'good'||'bad' operators from dual;

--initcap(char) : ù���ڰ� �빮�ڷ�
--�����̳� ���ĺ��� �ƴ� ���ڸ� ���� �� ���� ù ���ĺ� ���ڸ� �빮�ڷ� ��ȯ
select initcap('good morning')from dual;
--�����ڰ� / �� �ڿ� b�� B �빮�ڷ� �ٲ�鼭 ���� ����.
select initcap('good/bad morning') from dual;

--lower(char) �ҹ���, upper(char) �빮��
--lower �Լ��� �Ű������� ������ ���ڸ� ��� �ҹ��ڷ�,
--upper �Լ��� �빮�ڷ� ��ȯ�� ��ȯ
select lower('GOOD'),upper('good') from dual;

--LPAD(), RPAD()
--LPAD : ������ ���� ��ŭ ���ʺ��� Ư�� ���ڷ� ä���ش�.
--LPAD ("��", "�� ���ڱ���", "ä����")
select rpad('good',6) "RPAD1",  -- �����ʺ��� ä���
rpad('good',7,'#')"RPAD2",
rpad('������',8,'L')"RPAD3" --��Ŭ�� 2����Ʈ �����Ѵ�.
FROM DUAL;

--���� : null�� 0�Ǵ� �ٸ� ������ ��ȯ�ϱ� ���ؼ� ����ϴ� �Լ�
--NVL(expr1, expr2) : expr1 ���� null���̸� expr2�� ��ȯ
--expr1�� expr2�� �ݵ�� ������ Ÿ���� ��ġ�ؾ� �Ѵ�.

--NVL2 �Լ�
--NVL2 �Լ��� expr1�� �˻��Ͽ� �� ����� null�� �ƴϸ� expr2�� ��ȯ�ϰ� null�̸� expr3�� ��ȯ�Ѵ�.
--NVL2(expr1, expr2, expr3)
select ename, sal, comm, nvl2(comm, sal*12, sal+12) 
from emp order by deptno;

--NULLIF( expr1, expr2) : expr1�� expr2�� ������ ��� NULL��, �������� ���� ��� expr1�� ��ȯ
select nullif('A','A'), nullif('A','a') from dual;
--Coalesce(a1, a2, ...., aN) : null�� �ƴ� ù ��° �μ��� ��ȯ


--���糯¥�� ����ȯ�������� ����ϱ�
select sysdate, to_char(sysdate,'YYYY-MM-DD') FROM DUAL;

--NUMBER <-> CHARACTER <-> DATE
--����ȯ �Լ� : ��ȯ�Լ��� �ڷ����� ��ȯ��Ű���� �� �� ����ϴ� �� ��ȯ �Լ���
--to_number, to_char, to_date�� �ִ�. 
--to_char ��¥�� Ȥ�� �������� ���������� ��ȯ
--to_date �������� ��¥������ ��ȯ
--to_number �������� ���������� ��ȯ

--���������� ��ȯ�ϴ� TO_CHAR �Լ�
--<����>
--TO_CHAR('��¥������', '�������')
--��� ����
-- YYYY : �⵵ ǥ�� 4�ڸ�
-- YY : �⵵ ǥ�� 2�ڸ�
-- MM : ���� ���ڷ� ǥ��
-- MON : ���� ���ĺ����� ǥ��
-- DAY : ������ ǥ��
-- DY : ������ ���� ǥ��

--�ð� ��� ����
--AM �Ǵ� PM : ���� ���� �ð� ǥ��
--HH �Ǵ� HH12 : �ð�(1~12)
--HH24 : 24�ð����� ǥ�� (0~23) 
--MI : �� ǥ��
--SS : �� ǥ��
--
--�������� ���������� ��ȯ�ϱ�
--0 : �ڸ���, �ڸ����� ���� ���� ��� 0���� ä���.
--9 : �ڸ���, �ڸ����� ���� �ʾƵ� ä���� �ʴ´�.
--L : �� ������ ��ȭ��ȣ�� �տ� ǥ���Ѵ�.
-- . :�Ҽ���
-- , : õ�ڸ� ����

--��¥������ ��ȯ�ϴ� TO_DATE �Լ�
--���� TO_DATE('����', 'FROMAT');
--��) EMP ���̺�κ��� 2007�� 4��2�Ͽ� �Ի��� ����� �˻��ϼ��� TO_DATE() ����Ѵ�.
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE = TO_DATE('20070402','YYYY/MM/DD');

--���������� ��ȯ�ϴ� TO_NUMBER �Լ�
--9 : �ڸ���, �ڸ����� ���� �ʾƵ� ä���� �ʴ´�.
SELECT to_number('20,000','99,999') - to_number('10,000','99,999') from dual;


select ENAME, to_char(hiredate, 'YYYY-MM') FROM EMP;
--��) �Ի��� �� �������� �߶󳻱� to_char()�� ����Ѵ�.
--ǥ ��ȸ���� hiredate�� ��ȸ�ϴµ� to_char�� ������ �������ش�.
--trunc �Լ��� �̿��ؼ� (hiredate, ''month') �ޱ��� ���ڿ��� �ڸ���.
--�� ��, ���� hiredate�� ���� ���������� dd���� �ʱⰪ 01�� �����ȴ�. 
select to_char(hiredate, 'YYYY/MM/DD') �Ի���, to_char(trunc(hiredate,'month'),'yyyy/mm/dd') ���̹�����1 
from emp;

--�� ��¥ ���� ������ month_between �Լ�
--��¥�� ��¥������ �������� ���ϴ� �Լ��̴�.
-- <����> MONTHS_BETWEEN(date1, date2)

--��) ��¥������ �������� ���غ��� ���÷κ��� �Ի����� �������� ���ϸ� �ȴ� (trunc�� ����Ѵ�.)
--������� �̸� ���� �Ի��� �ٹ��޼�
--trunc�� ���� �Ҽ��� �ڸ����� ¥���� ����ϰ� �ϸ� ������ �������. 
select ENAME �̸�, TO_CHAR(SYSDATE)����, TO_CHAR(hiredate,'yyyy/mm/dd')�Ի���,
trunc(months_between(sysdate,hiredate))�ٹ��޼� from emp;

Select ENAME ����̸�, hiredate �Ի���, 
trunc(months_between(sysdate,hiredate)) �ٹ������� from emp;


select ENAME �̸�, TO_CHAR(SYSDATE)����, TO_CHAR(hiredate,'yyyy/mm/dd')�Ի���,
trunc(months_between(sysdate,hiredate) /12) �ټӳ�
from emp;



--�������� ���ϴ� ADD_MONTHS �Լ�
--ADD_MONTH �Լ��� Ư�� �������� ���� ��¥�� ���ϴ� �Լ�
--<����> ADD_MONTH(date, number)

--��) �Ի糯¥�� 6������ �߰��غ���
--��� ename �Ի��� �Ի� 6���� �� 
select ename, to_char(hiredate, 'YYYY/MM/DD') �Ի���,
to_char(add_months(hiredate,6),'YYYY/MM/DD') �Ի�6������
from emp;

--�ش� ������ ���� ����� ��¥�� ��ȯ�ϴ� next_Day �Լ�
--�ش� ��¥�� �������� ���ʷ� �����ϴ� ���Ͽ� �ش�Ǵ� ��¥�� ��ȯ�ϴ� �Լ��̴�. 
--<����> next_day(date,����)
--1�Ͽ��� 2������ 7�����

--��) ���� �������� ���ʷ� �����ϴ� �������� �������� �˾ƺ��� , ��� ������ �ݿ���
select sysdate ����, next_day(sysdate,6) �ݿ��� from dual;
select to_char(sysdate,'yyyy/mm/dd')����, to_char(next_day(sysdate,'�ݿ���'),'yyyy/mm/dd') �ݿ��� from dual;
--�Ʒ� 2���� ���� ���� ���� ���´�.
--�� next_day(date, ����)���� ������ ���ڵ� ���ڵ� ��� ���ٴ� ��.
select sysdate ����, next_day(sysdate,4)������ from dual;
select to_char(sysdate,'yyyy/mm/dd') ����, to_char(next_day(sysdate,'������'),'yyyy/mm/dd') ������ from dual;

SELECT to_CHAR(220505, 'yyyy"��" mm"��" dd"��"') FROM DUAL;

--�� substr(���, ������ġ, ������ ����)
--substr �Լ��� ����Ͽ� 9���� �Ի��� ����� ����ϱ� emp ���̺�
select * from emp where substr(hiredate,4,2)=09;

--��1) substr �Լ��� �̿��Ͽ� 2003�⵵�� �Ի��� ����� �˻�
select * from emp where substr(hiredate,1,2)=03;

--��2) substr �Լ��� �̿��Ͽ� '��'�� ������ ��� �˻�
--�̸��� 2������ ���� �־ -1�� ���ش�.
select * from emp where substr(ename,3,1)='��';
select * from emp where substr(ename,-1,1)='��';

--��3)substr�� ����Ͽ� �Ի����� �⵵(���ڸ�), ���(���ڸ�), ��ĥ(���ڸ�)�� �����Ͽ� ��ȸ

select ename, job, to_char(hiredate,'yyyy/mm/dd'), substr(hiredate,1,2)�⵵ , substr(hiredate,4,2)��, substr(hiredate,7,2)�� from emp; 
SELECT TO_CHAR(210505, 'YYYY��MM��DD��') FROM EMP;

SELECT to_char(HIREDATE, 'yyyy') ||'��'|| to_char(HIREDATE, 'mm') ||'��'|| 
to_char(HIREDATE, 'dd') ||'��' as �Ի��� FROM EMP;

SELECT to_CHAR(hiredate, 'yyyy"��" mm"��" dd"��"') FROM EMP;

select to_date(22220505, 'yyyy/mm/dd') from dual;

SELECT LENGTH('KH����������') FROM DUAL;

SELECT RTRIM('KH����������0123456789' , '0123456789') FROM DUAL;



SELECT to_CHAR(220505, 'yyyy"��" mm"��" dd"��"') FROM DUAL;

SELECT to_CHAR(220505, 'yyyy-mm-dd') FROM DUAL;

--��4) �̸��� �ι�° ���ڰ� '��'�� �ִ� ����� �˻��ϱ�
select * from emp where substr(ename,2,1) ='��';
select * from emp where substr(ename,-2,1) ='��';

select empno,ename from emp where instr(ename, '��' ,2,1) =2;


--������ ���� DECODE �Լ�
--DECODE �Լ� �Լ��� ���α׷����� ���� ���Ǵ� SWITCH .. CASE ���� ���� ����̴�.
--<����> DECODE (ǥ����, ����1, ���1, ����2, ���2, ����3, ���3, �⺻���n)
--ǥ������ ���� ���� 1�� ���� �� ���1�� ��ȯ
--
--CASE �� 
--<����> CASE WHEN ����1 THEN ���1 ELSE ���2 END
--CASE ���� DECODE�� �������� ���ϴ� �񱳿����� ������ �ذ��Ѵ�.
--CASE �Լ��� �پ��� �� �����ڸ� �̿��Ͽ� ������ ������ �� ������ ������ ������ ���� �ִ�.
--CASE �Լ��� ���α׷��ֿ��� IF ELSE�� ������ �����̴�. 


--order by�� ���� dname�� ������������(��~��) ������ �����Ѵ�. 
select ename, deptno, decode(deptno,10,'�渮��',20,'�λ��',30,'������',40,'�����')AS DNAME
from emp order by dname;

--������ ������ �������� ���ٸ�!
select ename, deptno, decode(deptno,10,'�渮��',
                            20,'�λ��',
                            30,'������',
                            40,'�����')AS DNAME
from emp order by dname;

--��2) 1. ���޿� ���� ������ '����'�� ����� 5%, '����'�� ����� 10%, '�븮'�� ����� 15%, '���'�� ����� 20% �޿� �λ��ϱ�
--AS Upsal

select empno, ename, job, sal, decode(job, '����','5%', '����','10%','�븮','15%','���','20%') AS Upsal 
from emp order by job;

select empno, ename, job, sal, decode(job, '����',sal*1.05, '����',sal*1.10,'�븮',sal*1.15,'���',sal*1.20) AS Upsal 
from emp order by job;



--�� 3) 1. �Ի����� ������ 2�ڸ�(yy) ���� ����(mon)�� ǥ���ϰ� ������ ��� (dy)�� �����Ͽ� ����ϱ� 
select hiredate, to_char(hiredate,'yy')as ��, 
to_char(hiredate,'mon')as ��,
to_char(hiredate,'dy')as �� 
from emp;

select hiredate, to_char(hiredate, 'yy/mon/dd dy') from emp;


--�� 4) emp ���̺�κ��� Ȧ�� ������� �Ի糯¥�� ��ȸ�ϼ���.
--mod �����Լ��� �̿��ؼ� �Է� ���� ���� ���� ������ ���� ��ȯ�Ѵ�.
 
select empno, ename, hiredate from emp 
where mod(empno,2)=1;

--�� 5) �ٹ��ϼ��� ���غ��� round�� ����ϱ� 
--Ư�� �ڸ������� �ݿø��ϴ� ROUND �Լ� 
--select ename, hiredate, 

select ENAME �̸�, TO_CHAR(SYSDATE)����, TO_CHAR(hiredate,'yyyy/mm/dd')�Ի���,
round(sysdate-hiredate) as �ٹ��ϼ� from emp;


-- NVL �� ����Ͽ� ���ӻ���� ���� �ٹ��� empno,ename,���ӻ��
-- Ư�� NVL(TO_CHAR(mgr, '9999'), ' C E O ') �ؼ��Ͽ� �ּ� �޾ƿ���
--nvl �Լ��� (expr1, expr2) expr1 ���� null�̸� expr2�� ����Ѵ�.
--TO_CHAR(mgr, '9999') �� ���� null�̸� 'ceo'�� ����ϴ� �ǵ�
--to_char(mgr, '9999')
--�������� mgr�� ���������� �ٲٴµ�, 9999�� �ڸ����� ���� �ʾƵ� ä���� �ʴ� ��.
--�� �׳� ���δ� �� 0000�̸� 0���� ä���.
SELECT empno, ename, NVL(TO_CHAR(mgr, '9999'), ' C E O ') as "���� ���"
FROM emp
WHERE mgr IS NULL;

--��¥�� �����Ϳ� ���ڸ� ���ϸ� (��¥+����)
--��¥�� �����Ϳ� ���ڸ� ���� (��¥-����)
--�� ��¥�κ��� �� �Ⱓ��ŭ ���� ��¥�� ���Ѵ�.
select sysdate-1 ����, sysdate ����, sysdate+1 ����
from dual;


--Ư�� �������� �ݿø��ϴ� round �Լ�
--round �Լ��� ���ڸ� �ݿø��ϴ� �Լ��� �н��Ͽ�����
--�� �Լ��� ���� ���� �����ϸ� ���� �̿ܿ� ��¥�� ���ص� �ݿø��� �� �� �ִ�.
--<����> round(date, format);


--------------------------22-02-21 ��������---------------------------


--�׷��Լ�
--���̺��� ��ü �����Ϳ��� ������� ����� ���ϱ� ���ؼ�
--�� ���տ� �����Ͽ� �ϳ��� ����� ����
--�ϳ� �̻��� ���� ���� �׷����� ����� �����Ͽ� ����� ��Ÿ���� �Լ�
--SUM : �׷��� ���� �հ���� ��ȯ
--AVG : �׷��� ����� ���
--COUNT : �׷��� �� ������ ��ȯ
--MAX : �׷��� �ִ��� ��ȯ
--MIN : �׷��� �ּڰ��� ��ȯ
--STDDEV : �׷��� ǥ�� ������ ��ȯ
--VARIANCE : �׷��� �л��� ��ȯ

--COUNT(*) : ���̺��� ��ü �ο�(��) ������ ���Ѵ�.
--COUNT(COMM)�� COMM �÷����� NULL�� �ƴ� �ο� ������ ���Ѵ�.
--AS �÷� ���� ���� ����ؼ� �����Ϸ��� "  "( ū����ǥ�� �����ش�)
SELECT COUNT(*) "��ü ��� ��",
COUNT(COMM) "Ŀ�̼� �޴� ��� ��"
FROM EMP;

SELECT *
FROM EMP;




--Ư�� �÷��� �������� �׷� �Լ��� ����� ��� � �÷����� �������� �׷��Լ��� �� ���� ������ �� ����Ѵ�.
--GROUP BY���̶�� �Ѵ�
--<����>
--SELECT �÷���, �׷� �Լ�
--FROM ���̺��
--WHERE ���� (������)
--GROUP BY �÷���;

--��� ���̺��� �μ� ��ȣ�� �׷� �����
--��) �׷� ����, �ߺ��� �÷��� ���� �ϳ��� �����ش�.
--���� ���⼱ DEPTNO�� 10, 20, 30 ���� �ϳ��� ��ģ ��.
SELECT DEPTNO FROM EMP
GROUP BY DEPTNO;

--���� > �Ҽ� �μ��� �ִ�޿��� �ּ� �޿� ���ϱ�
--��� deptno �ִ�޿� �ּұ޿�.
select deptno, MAX(sal) �ִ�޿�, MIN(sal) �ּұ޿�
from emp 
group by deptno;

select deptno, sal
from emp
order by deptno, sal desc;

--���� �ΰ��� ��ģ �׷�� ����
select deptno, MAX(sal) �ִ�޿�, min(sal) �ּұ޿�
from emp
group by deptno
order by deptno;

--�ְ�޿�(���) ����ϱ� 
--�μ��� ��� �޿��� �� ���� �� ����ϱ� 

select MAX(AVG(sal))
from emp
group by deptno;

--�μ��� �޿� ��� ���ϱ�
select avg(sal)
from emp
group by deptno;

--select ���� ������ ����Ͽ� ����� ������ ���� where ���� ���������
--�׷��� ����� ������ ���� having ���� ����Ѵ�.
--��) �μ��� �޿� ����� 500 �̻��� �μ��� ��ȭ�� �޿� ��� ���ϱ�

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >=500;


--�������� ���� ���� �ùٸ��� ���غ��� 
--����� group by ��ϰ� ��ġ���� �ʾƼ� ���� �߻�
--��) deptno�� �׷��� �и��ϸ� ename��? ename�� ��������� �Ѵ�.
select deptno, ename, avg(sal)
from emp
group by deptno;


select deptno, ename, avg(sal)
from emp
group by deptno, ename;



--�Ʒ� ������ �׳� ���ͳݿ��� ã�ƺ� ��. ����x
-- GROUP BY���� ������ ���� �׷�ȭ�� ����� ������ ����
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP
GROUP BY DEPTNO, JOB -- �μ���ȣ�� 3��, JOB�� 3���� �� 9�� ���
HAVING AVG(SAL) >= 500 -- �� 9�� �� ��ձ޿��� 500�� �Ѵ� �ุ ���
ORDER BY DEPTNO, JOB; 


--��) having ���� ����Ͽ� ����� �����ϰ� �޿��Ѿ��� 1000�̻���
--���޺� �޿� �Ѿ� ���ϱ� 
--��� �����ϴµ� ���� ����� �ִ�. 

select job, sum(sal),count(*)
from emp
group by job
--having not job in('���');
having job != '���' and sum(sal)>=1000
ORDER by sum(sal);

select job, sum(sal), count(*)
from emp
where job ^= '���'
group by job
having sum(sal)>=1000
order by sum(sal);

select job, sum(sal), count(*)
from emp
where job not like  '%���%'
group by job
having sum(sal)>=1000
order by sum(sal);



--�� ���� �⺻ ���ø� ��� ���� ���޺� �޿� �Ѿ�
select job, sum(sal),count(*)
from emp
group by job
--having not job in('���');
having job != '���'
ORDER by sum(sal);


--��) �޿� �ְ��, ������, �Ѿ� �� ��� ����ϱ�
select Max(sal), Min(sal), sum(sal), avg(sal)
from emp;
--group by deptno;


--��) ��� ���޺� ��� ���� ����ϱ�
--count(*)�� �����൵ �ȴ�.
--group by�� job���� �༭ job�� �ߺ��� ���ļ� ���
select job, count(job)
from emp
group by job;

--��) ������ ���� ��ȸ�غ���
--job�� ������ ����� ����ϸ� �Ǳ⿡ �������� �߰�
select job, count(*)
from emp
group by job
having job = '����';

--������� ���� �ڡڡڡ�


--��) �޿� �ְ��, �޿� �������� ���� ����ϱ�
--max, min �Լ��� �̿��ؼ� �ִ�, �ּ� �޿��� ����ϰ�
--��Ģ������ �׳� �Լ� - �Լ� �̷��� �����ָ� �ȴ�. 
select deptno, max(sal), min(sal), max(sal)-min(sal)
from emp
group by deptno
order by deptno;

select max(sal), min(sal), max(sal)-min(sal)
from emp;


--��) �μ��� ����� ��� �޿��� �ݿø����� as 'number of people' ����ϱ�
--�μ��׷����İ� �μ���ȣ�� ������������ �����غ��� 

select deptno , count(*), round(avg(sal),2) as "Number of People"
from emp
group by deptno --�μ� �׷� ����
order by deptno asc; -- deptno �������� ����


select *
from emp
order by deptno;


--�μ���ȣ �̸� ������ ����� �μ����� ��� ����� ��ձ޿� ���
--decode�� switch �Լ��� ����ϴ�. 
--���� deptno���� 10�̸� �渮�η� dname�� ���´�
--���� dptno�� 10�̶�� ����� location�� ���´�. 
select deptno,decode(deptno, 10,'�渮��',
            20,'�λ��',
            30,'������',
            40,'�����') as dname ,
        decode(deptno, 10,'����',
            20,'����',
            30,'��õ',
            40,'�Ȼ�') as Location,
count(*) as "Number of People",
round(avg(sal))as Sal
from emp
--group by�� deptno���� �߱⿡ 
--�ߺ��� deptno�� ���ļ� ��Ÿ����. 
group by deptno
order by deptno;

--������ ���� DECODE �Լ�
--DECODE �Լ� �Լ��� ���α׷����� ���� ���Ǵ� SWITCH .. CASE ���� ���� ����̴�.
--<����> DECODE (ǥ����, ����1, ���1, ����2, ���2, ����3, ���3, �⺻���n)
--ǥ������ ���� ���� 1�� ���� �� ���1�� ��ȯ

--CASE �� 
--<����> CASE WHEN ����1 THEN ���1 ELSE ���2 END
--CASE ���� DECODE�� �������� ���ϴ� �񱳿����� ������ �ذ��Ѵ�.
--CASE �Լ��� �پ��� �� �����ڸ� �̿��Ͽ� ������ ������ �� ������ ������ ������ ���� �ִ�.
--CASE �Լ��� ���α׷��ֿ��� IF ELSE�� ������ �����̴�. 
        
-- % : ���ڰ����ų� �ϳ��̻��� ���ڰ� ����̿͵� ���x
-- _ : �ϳ��� ���ڰ� ����̿͵� ���x
       
       
       
       
       
            
--������ ��ųʸ�
--������ ��ųʸ��� ����ڰ� ���̺��� �����ϰų� ����ڸ� �����ϴ�
--���� �۾��� �� �� �����ͺ��̽� ������ ���� �ڵ����� ���ŵǴ� ���̺��,
-- ����ڴ� ������ ��ųʸ��� ������ ���� �����ϰų� ������ �� ����
--����ڰ� ������ �� �ִ� �����͸� ������ �� �� �յ��� �ϱ� ���ؼ�
--�б� ���� �� ���·� ������ �����Ѵ�.
--USER_ �ڽ��� ������ ������ ��ü � ���� ���� ��ȸ
--ALL_ �ڽŰ��� ���� �Ǵ� ������ �ο� ���� ��ü � ���� ���� ��ȸ
--DBA_ �����ͺ��̽� �����ڸ� ���� ������ ��ü ���� ������ȸ

--ALL_ �ڽŰ������� �Ǵ� ���Ѻο����� ��ü���� ���� ��ȸ
SELECT OWNER, TABLE_NAME from all_tables;

--dba�� �ý��� ������ ���� ����ڸ� ���� ����
--dba ������ ������ ������ �߻��Ѵ�.
select owner, table_name from dba_tables;

--���ѿ� ���� ������ ���� ��ųʸ�
--dba_ �����ͺ��̽� �����ڸ� ���� ������ ��ü ���� ������ȸ
select * from dba_sys_privs;


--���̺� ����� <<������Ʈ �߰� �����Դϴ�>>
--���̺� ������� ���� ���̺� ���� ���� �ڼ��� ����ȭ ������ �ȴ�.
--�𵨸� ������ ���̺� ���� ������ ����Ǿ� ������ ���̺� �ϳ��ϳ��� ���� ��µ� ������ �ʿ��ϴ�.

--��ǥ���� �ý��� ����
--create seesion : �����ͺ��̽��� ������ �� �ִ� ����
--create table : ���̺��� ������ �� �ִ� ����
--create any table : �ٸ� user�� �̸����� ���̺��� ������ �� �ִ� ����
--create tablespace : ���̺� �����̽��� ���� �� �ִ� ������
--unlimited tablespace : ��뷮�� ���������� ����ϴ� ����
--select any table : ��� ���̺�, ��� �˻��� �� �� �ִ� ����
--
--craete user : ���ο� ����ڸ� ����
--create view : ����� ��Ű������ �並 ������ �� �ִ� ����
--create sequence : ����� ��Ű������ �Լ��� ������ �� �ִ� ����
--drop user : ����ڸ� �����ϴ� ����
--drop any table : ������ ���̺��� ������ �� �ִ� ����
--
--�� �ܿ��� ����� ���� �ý��� ���ѵ��� �ִ�.
--���Ѻο� ��� : grant
--��ȯȸ�� ��� : revoke


--Role : ����ڿ��� �㰡 �� �� �ִ� ���ѵ��� ����
--���� �ο��� ȸ���� ���� �� �� �ִ�
--�� ���� ����ڰ� �������� role�� ������ �� �ְ�, ���� ����ڿ��� ���� role �ο� ����
--(role���� role �ο� ����)
--<Role ����>
--CREATE ROLE �� �̸�;
--<������ �ο��� ���� �������� �ο�>
--GRANT ���� to ����1, ���� 2...;
--connect ��
--resource�� : ����ڰ� ��ü(���̺�, ��, �ε���)�� ������ �� �ֵ��� �ý��� ������ ���� ����

--DDL(Data Definition language) : craete��, drop��, alter��
--create table ���̺� �̸� (���̸� �����͸�[default ǥ����])
--,[���̸� �������� ...]);
--���̺� ������ ����� create table ��

--�� ���⼭���� ���������� ���̺� ����� ���� ddl ��
--���� �Ʒ��� ppt ���� �Ϸ�  --
--drop table emp01;
--drop�� ���� ���̺� ������ �� �ִ�.

--emp01�� ���̺��� �����Ѵ�.
--�� �÷�(��)�� eno, ename, sal 
create table emp01(
    eno number(4),
    ename varchar2(14),
    sal number(7,3)
);

--desc : ���̺��� ������ �� ���̺��� ������ �� ����������� Ȯ���� �ʿ䰡 ���� �� ����ϴ� ��ɾ�
desc emp01;


--add : ��� ���̺� ��¥ Ÿ���� ������ brith �÷� �߰� 
alter table emp01 add(birth date); --date Ÿ���� birth��� �÷��� �߰��ϴ� ����
desc emp01;

--modify : ��� �̸� �÷� ũ�� �����ϱ� 
alter table emp01
modify ename varchar2(30);
desc emp01;

commit;

--drop : ������̺��� �̸��÷� �����ϱ�
alter table emp01
drop column ename;
desc emp01;

--set unuser�� �ý����� �䰡�� ���� �� �÷��� ������ �� �ֵ��� �ϳ� �̻���
--�÷��� unused�� ǥ��, �����δ� ���̺��� �÷��� ���ŵ��� �ʴ´�. 

alter table emp01
set unused(eno);
desc emp01;

--emp01 ���̺��� �����ȣ �߰��ϰ� �����ϱ�
alter table emp01
add(eno number(4));
desc emp01;
alter table emp01
drop column eno;
desc emp01;

--drop unused create columms�� ���̺��� ���� unused�� ǥ�õ� ��� �÷��� �����Ѵ�.
alter table emp01 drop unused columns;
desc emp01;

--���̺� ���� �����ϴ� rename�� ---rename old_name to new_name
rename emp01 to emp02;
--emp01 ���̺��� emp02�� �����߱⿡
--���� emp01�� �����ȴ�.
desc emp02;
desc emp01;

/*
���̺� ������ �����ϱ�� drop table ��
drop table ���� ����Ͽ� ������ ���̺�� �����͸�
��� ������ �� �ֽ��ϴ�.
������ ���̺��� �⺻ Ű�� ���� Ű�� �ٸ� ���̺��� �����ϰ� �ִ� ���
������ �Ұ����ϱ� ������ �׷� ��� ���� ���� �ڽ� ���̺��� ���� �����Ͼ߾� �մϴ�.
*/

--ROWNUM
--���� �Լ��� �ƴ����� ���� ���Ǵ� �����̴�.
--����Ŭ���� ���������� �����Ǵ� ���� �÷��� SQL ��ȸ ����� ������ ��Ÿ����.
--�ڷḦ �Ϻκи� Ȯ���Ͽ� ó���� �� ������
--ROWNUM : ��ȸ�� �����Ƿ� ������ �ű��.
SELECT ROWNUM "����", EMPNO, ENAME, SAL
FROM EMP
WHERE ROWNUM <=3;

--USER_ �ڽ��� ������ ������ ��ü� ���� ���� ��ȸ
SELECT TABLE_NAME FROM USER_TABLES;

--ALL_ �ڽŰ������� �Ǵ� ���Ѻο����� ��ü���� ���� ��ȸ
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

--DBA�� �ý��� ������ ���� ��븸 ������ �� �ִ�. 
SELECT OWNER, TABLE_NAME FROM DBA_TABLES;




/*DDL(Data Definintion Language) : Create��, Drop��, Alter��
Truncate��*/
/*<DML ��ɾ�>
SELECT : �����͸� ��ȸ�ϴ� ����
INSERT : �����͸� �����ϴ� ����
UPDATE : �����͸� �����ϴ� ����
DELETE : �����͸� �����ϴ� ���� */

--���̺� ������ �߰��ϴ� INSERT�� DML�̶�� �Ѵ�.
--������ ���� : INSERT��
--INTO ���̺��̸� [(�Ӽ� ����Ʈ)]
--VALUES(�Ӽ���_����Ʈ);
--INTO Ű����� �Բ� ������ ������ ���̺��� �̸��� �Ӽ� �̸��� ����
--�Ӽ� ����Ʈ�� �����ϸ� ���̺� ������ �� ������ �Ӽ��� ������� ���� ���Եȴ�.
--VALUES Ű����� �Բ� ������ �Ӽ� ������ ����
--INTO���� �Ӽ� �̸��� VALUES ���� �Ӽ� ���� ������� �ϴ��� �����Ǿ�� �Ѵ�.
SELECT * FROM DEPT01;
DROP TABLE DEPT01;

--DEPT01 ���̺� �����ϱ�
CREATE TABLE DEPT01(
DEPTNO NUMBER(2), --�μ���ȣ
DNAME VARCHAR2(14), --�μ��̸�
LOC VARCHAR2(13) --�μ� ��ġ
);

desc dept01;

--insert�� dept01�� �� �ֱ�

insert into dept01
values(10, '�渮��','����');
select * from dept01;

insert into dept01(deptno, loc, dname)
values(20, '��õ','�λ��');
select * from dept01;

insert into dept01
values(40, '�����',null);
select * from dept01;

insert into dept01
values(50, '��ȹ��',''); --dname �� null
select * from dept01;



--���⼭���� �Ϸ� 
--emp02 ���̺� �����
drop table emp02;

create table emp02(
empno number(4),
ename varchar2(10),
job varchar2(9),
hiredate date,
deptno number(2)
);

--insert������ emp02 ���̺� ���� �߰��Ѵ�.
--�� ������ �������� �ʴ´ٸ�
--create �� �� ������ �� ���� �״�� ������ �ȴ�.
insert into emp02
values (1001, '����', '���', '2015/03/01',20);
select * from emp02;

--���� ���� �� ������ ���� ������ �����ϴ�
--���⼱ date�� ���� �� to_date�� 
--���� ������ ������ �ش�. 
insert into emp02
values(1002,'�ѿ���','�븮',
to_date('2014, 05, 01','YYYY,MM,DD'),20);
select * from emp02;

--sysdate : ���� ��¥
insert into emp02
values(1003,'����ȣ','����',sysdate,30);
select * from emp02;


--�� dept01 ���̺��� 10�� �μ����� ����θ� ������Ʈ�غ���
select * from dept01;
update dept01
set dname = '�����'
where deptno =10;
select * from dept01;

update dept01
set dname ='�����2', loc='�λ�'
where deptno = 20;
select * from dept01;

commit;
--�� ) ��� dname�� �����3���� �����غ���
update dept01
set dname = '�����3';
select * from dept01;
--rollback�� commit �� �������� �ǵ�����.
--��) �����3���� �ٲٱ� ���� commit�� ���ѵΰ�
--�����3�� �ٲ۴����� rollback�� ���� ��Ű��
--�ٽ� �����3 �ٲٱ� ���� commit �� �κ����� �ѹ�, �ǵ��ư���.
rollback;


--delete��
--���̺� �ִ� ���� Ʃ���� �����ϴ� ���
--<����>
--from ���̺� �̸�
--[where �˻�����];
--where ���� �����ϸ� ���̺� �ִ� ��� ���� �����ȴ�. 
--�Ʒ��� �μ���ȣ 10�� ��ȣ�� �����ȴ�. 
--�� 10�� �μ��� Ư�� �ο츸 �����ϱ� 
delete dept01
where deptno=10;
select * from dept01;

commit;

--delete���� where ���� ���� 
--dname, deptno, loc ,,,, � ���̵� ��� ����.
delete dept01
where dname='�渮��';
select * from dept01;
rollback;


--employee03 ���̺� �����ϱ�
create table employee03(
empno number(4),
ename varchar(20),
job varchar(20),
sal number(7,3)
);
desc employee03;

insert into employee03 values(1000, '�ѿ��', '�·�' , 100);
insert into employee03 values(1010, '����', '�ܰ�' , 150);
insert into employee03 values(1020, '�ֽð�', '��������' , 250);
insert into employee03 values(1030, '���', null , 250);
insert into employee03 values(1040, '��������', '' , 200);
select * from employee03;
commit;
--�޿��� 200�� �ȵǴ� ������� 50�� �λ��ض�
update employee03 set sal = sal +50
where sal <200;
select * from employee03;
rollback;

--���̺� ������ null �� ����� ����������� �����ϼ���
delete employee03
where job is null;
select * from employee03;



--------------------------22-02-22 ��������---------------------------


--purge recyclebin; �� ���� �Ǹ� ������ ���̺��� �����Ѵ�.
--��) ��Ȯ�ϰԴ� �������� ����ش�. 
--���� ��ɾ� ���̺� ���� ������ �����. 
purge recyclebin;

desc employees2;
desc employees3;

--employees2 ���̺� ����
create table employees2(
employee_id number(10),
name varchar2(20), --���� ������� ������
salary number(7,2) --7�ڸ� �ȿ� 5�ڸ��� ��� ���ڸ��� �Ҽ����ڸ�
);

desc employees2;

--employees2 ���̺��ϰ� �����ϰ� �������
--�Ʒ� ���ø��� �̿��Ѵ�. 
create table employees3 
as
select * from employees2;
desc employees3;


drop table dept02;
--���̺� dept02�� �����Ǵµ�
--where 1=0;
--dept ���̺��� �����ʹ� �������� �ʴ´�.  
create table dept02
as select * from dept where 1=0;

--where 1=1;
--dept ���̺��� �����ͱ��� �����ȴ�. 
create table dept02
as select * from dept where 1=1;
desc dept02;

--�� ) ���� false�� ������ �����ǰ�
-- ���� true�̸� �������� ������� �����ȴ�. 
create table dept02
as select * from dept where 5=4;

select * from dept02;



desc employees2;
--���̺� ������ �Ŵ������̵� �ʵ� �׸��� �߰��Ѵ�.
alter table employees2 add(
manager_id varchar2(10)
);
desc employees2;

alter table employees2 modify(
--���̺� ������ �Ŵ������̵� �ʵ� �׸��� �����Ѵ�.
manager_id varchar2(20)
);
desc employees2;

--�÷��� �����Ѵ�.
alter table employees2 drop column manager_id; 
desc employees2;

--������ ������
--char, varchar, nchar �����ڵ� ������ ������,
--nvarchar �����ڵ� �������� ������������, long(2GB) ��������


/*
������ ���Ἲ �������� (Date Integrity Constraint Rule)�̶�?
���̺� �������� �ڷᰡ �ԷµǴ°��� �����ϱ� ���ؼ� ���̺��� ������ ��
�� �÷��� ���ؼ� �����ϴ� �������� ��Ģ�� ���Ѵ�.

���Ἲ ���������� ����
NOT NULL : NULL�� ������� �ʴ´�.
UNIQUE : �ߺ��� ���� ������� �ʴ´�. �׻� ������ ���� ������ �Ѵ�.
PRIMARY KEY : NULL�� ������� �ʰ� �ߺ��� ���� ������� �ʴ´�.
(NOT NULL + UNIQYE ������ ������ �����̴�)
FORIGN KEY : �����Ǵ� ���̺��� �÷��� ���� �����ϸ� ����Ѵ�. 
CHECK : ���� ������ ������ ���� ������ ������ �����Ͽ�, ������ ������ ����Ѵ�.

�������� Ȯ���ϱ�
����Ŭ USER_CONSTRAINTS ������ ��ųʸ��� �������ǿ� ���� �������� �˷��ش�
USER_CONSTRAINTS ������ ��ųʸ��� ��ȸ�ϸ�
���� ���� ���������� �������� ��ȸ�� �� �ִ�. 
*/

desc user_constraints;
--�ش� ������ ������ �������� ��ȸ
select * from user_constraints; 

--Ư�� �÷��� ��ȸ�Ѵ�.
select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints;

select owner, constraint_name, constraint_type, table_name
from user_constraints;

/* 
user_constraints ������ ��ųʸ��� ���� ���Ǵ� �÷�
owner : ���������� �ҿ��� ����
constraint_name : �������� ��
constraint_type : �������� ����
table_name : ���������� ���� ���̺��
search_condition : check ������ ��쿡�� � ������ �������� ���Ǿ����� ����
r_constraint_name : foreign key �� ��� primary key �����ߴ����� ���� ����

constraint_type�� ���� ���� ������ �����ϴ� �÷��̴�
�� �����δ� : p, r, u, c�� �ִ�.
p : primary key
r : foreign key
u : unique
c : check, not null

���Ἲ ������ �� 
�л��� �ϳ��� �а��� �Ҽ��Ѵ�
�ϳ��� ���´� �Ѹ��� ��米���� �����ȴ�
�ϳ��� �������� �� �б⸶�� �� ���� ���ϸ� ������ �� �ִ�
�л��� �� �б⿡ 20���� �̻� ������ �� ����.

�⺻�� ���Ἲ ����
�ǹ� : ������ ������ �𵨿��� ������ ���Ἲ ����
�⺻Ű ���Ἲ ����, ���� ���Ἲ ����

���̺� ���Ἲ ����
�ǹ� : ���̺��� �����ϰų� ���� �������� ���� ������ ���Ἲ ����
not null, unique, check, default


��Ÿ ���Ἲ ����
���� �ش� �ȵǴ� �����
����, Ʈ���� ���

�⺻Ű ���Ἲ ����(primary key)
���̺��� ���ڵ���� �ݵ�� �����ϰ� �ĺ��� �� �־�� �Ѵٴ� ����
���� : �⺻Ű ���Ἲ ����
�⺻Ű null ���� ���� �� ������
�⺻Ű�� ���� ������ ���ڵ尡 �ϳ��� ���̺� ���ÿ� �� �� �̻� ������ �� ����

����
constraint <����ĸ�> primary key(<�ʵ帮��Ʈ>)
<����ĸ�>
�⺻Ű�� �����ϴ� ����Ŀ� �־��� �̸��̰�
<�ʵ帮��Ʈ>
�⺻Ű�� ������ �ʵ���� ����Ʈ 

not null
Ʋ�� �ʵ忡 ���ؼ� null ���� �Է��� ������� �ʴ´�
�⺻Ű�� ���ǵ� �ʵ忡 ���ؼ��� ��������� not null ������ �������� �ʾƵ� �ȴ�.

����
�÷��� �ڷ��� not null
�÷� �����θ� ������ �� �ִ�.
*/

drop table emp01;
desc emp01;
create table emp01(
empno number(4),
ename varchar2(10),
job varchar2(9),
deptno number(2));

insert into emp01 values(null, null, '���', 30);
select * from emp01;

--�� emp01 ���̺� ���� �������� ��ȸ�ϱ� 

--Ư�� �÷��� ��ȸ�Ѵ�.
--where �������� � ���̺��� ���������� Ȯ������ �����Ѵ�. 
--���� emp01 ���̺��� ���������� ���� �ʾ����Ƿ� ��ȸ ����� ����. 
select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints
where table_name = 'emp01';

--�̹��� ���������� �ִ� emp01 ���̺��� ���� ����� ���ؼ�
--�ٽ� drop ���� ������ ���� ���̺��� �����ϰ� ���� �����.
drop table emp01;

create table emp01(
empno number(4) not null, --�÷��� �ڷ��� not null
ename varchar2(10) not null,
job varchar2(9),
deptno number(2));
desc emp01;

select constraint_name, constraint_type, table_name
from user_constraints;
select * from user_constraints; --�ش� ������ ������ �������� ��ȸ

--�Ʒ� ������ ������ �ߴµ� �� ������?
--���̺� ������ �� ���� ������ not null�� ��������� ������
-- null���� ������ �� ����.
insert into emp01 values(null, null, '���', 10);

insert into emp01 values(1000,'����','���',30);
commit;
select * from emp01;

insert into emp01 values(1000,'ȫ�浿','����',20);
select * from emp01;

/*
������ ���� ����ϴ� �������� unique
Ư�� �÷��� ���� �ڷᰡ �ߺ����� �ʰ� �ϴ� ��������
������ �÷����� ������ ���� ���ϵǰ� �ϴ� ���̴�
null ���� ����
���� null���� �Էµ��� �ʰ� �Ϸ���
���̺� ������ not null �������ǵ� ����ؾ��Ѵ�.
����
constraint ����� uniqye (�ʵ帮��Ʈ)
*/

create table emp03(
empno number(4) unique, --unique ��������, �ߺ��� ���� ������� ����
ename varchar2(10) not null,
job varchar2(9),
deptno number(2));

desc emp03;


insert into emp03 values(1000,'����','���',30);
commit;
select * from emp03;

--�̰� �� �ȵ���? 
--ù ��° �÷� (empno)�� unique ���������̱� ������ �ߺ��� ���� ������� �ʴ´�.
insert into emp03 values(1000,'ȫ�浿','����',20);
select * from emp03;

--�� ���� ���� ������
--ù ��° �÷��� unique ������������ null���� ���� �� �ֱ� �����̴�.
insert into emp03 values(null,'���߱�','����',20);

insert into emp03 values(null,'�̼���','����',20);
select * from emp03;

--�÷� ���� �������� �����ϱ�
--<����>
--column_name date_type constraint constraint_name constraint_type
--�������� ���� ��� ��Ģ�� �ؼ��ؾ��Ѵ�.
--<����<
--[���̺��]_[�÷���]_[�������� ����]

drop table emp04;
create table emp04(
empno number(4) constraint emp04_empno_uk unique,
ename varchar2(10) constraint emp04_ename_nn not null,
job varchar2(9),
deptno number(2)
);
desc emp04;

--��) ���̺��� ���������� ���캸��
--�̰� �� �ȳ��ñ�??
--���̺��� DB�� ����� �� ������ �빮�ڷ� ����Ǳ� ������ ��ȸ�� ���� ���������� �빮�ڷ� ��ȸ�Ѵ�

select constraint_name, constraint_type, table_name
from user_constraints
--where table_name = 'emp01';
where table_name in('EMP04');

select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints
where table_name = 'EMP04';

insert into emp04 values(1000,'����','���',30);
select * from emp04;

--�̰� �� �ȵ���? unique ������������ ���� empno�� �ߺ����� ������ �ʴ´�.
insert into emp04 values(1000,'ȫ�浿','����',20);

--������ ������ ���� �������� primary key
--unique �������ǰ� not null ���������� ��� ���� �ִ�.

create table EMP05(
empno number(4) constraint emp05_empno_pk primary key,
ename varchar2(10) constraint emp05_ename_nn not null,
job varchar2(9),
deptno number(2));
desc emp05;

select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints
where table_name = 'EMP05';

insert into emp05 values(1000,'����','���',30);
select * from emp05;

--primary key �������� ������ �ߺ� , null�� ������ �ʴ´�.
insert into emp05 values(null,'�̼���','����',20);

/*
���� ���Ἲ�� ���� �������� forign key
�ڽ� ���̺��� ��� ���̺�(emp)�� �μ���ȣ (deptno) �÷���
�θ� ���̺��� �μ� ���̺�(dept)�� �μ���ȣ (deptno)�� �θ� Ű�� �����ϴ� ���̴�
�� ���̺��� ���ڵ尡 �ٸ� ���̺��� ���� 
�����Ǵ� ���̺� �ش� ���ڵ尡 �ݵ�� �����ϰų� null ���� ������
�� ������ �������� �ʴ´ٸ� �����ϴ� ���ڵ�� 
������ �������� �ʴ� ���ڵ带 �����ϰ� �Ǵ� ������ �߻��Ѵ�. 
���� �������� �ʴ� �߸��� ���� ������� �ʵ��� �����ϴ� �����̴� 

<����>
constraint ����� foreign key(�ʵ帮��Ʈ1)
references ���̺��(�ʵ帮��Ʈ2)
�ʵ帮��Ʈ 1: �ܷ�Ű�� �����ϴ� �ʵ���� ����Ʈ
���̺�� : ���� ����� ���̺� �̸�
ƿ�帮��Ʈ 2 : ���� ��� ���̺��� �⺻Ű
contraint emp_empno_fk foreign key (deptno)
references dept (deptno)
���� ���Ἲ ������ �ܷ�Ű ���ǿ� ���� dbms���� �ڵ������� ����
dbms�� �� ������ �����ϰ� �Ǵ� ������ ������ �ź��Ѵ�.

alter table���� �̿��Ͽ� �ܷ�Ű�� ������ ����
ex) alter table student
add constraint fk_dept foreign key(dept_id) references department(dept_id)
�л� ���̺��� �μ����̺��� �μ����̵带 �����ϴ� �ܷ�Ű�� fk_dept�� �߰��Ѵ�.
�ܷ�Ű ���� >>
��) alter table student drop constraint fk_dept;
--student ���̺��� fk_dept ���������� ���ش�. 
*/

select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints
where table_name = 'EMP01';
--sys_c007000 c emp01 not null�� �ɷ��ִ�. 

--���������� ������ �÷� ���캸�� 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP01';

COMMIT;

--�������� �߰��ϱ� 
ALTER TABLE EMP01
ADD CONSTRAINT EMP01_EMPNO_FK FOREIGN KEY(DEPTNO)
REFERENCES DEPT(DEPTNO);
DESC EMP01;

--�ڡ��߰��� �������� EMP01_EMPNO_FK �����ϱ� �ڡ�
ALTER TABLE EMP01 DROP CONSTRAINT EMP01_EMPNO_FK;


SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('EMP01');


--�������� ���캸��
select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'DEPT';

--���������� ������ �÷� ���캸�� 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'DEPT';


SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM EMP01;

commit;

--������ ���µ� ������
--ù ��° �÷�(empno)�� primary key ���������̹Ƿ�
--������ ���� �������Ѵ�.
--1010���� �̹� �����ϹǷ� �����͸� ������ �� ����. 
--���� emp �⺻ ���̺��� �� ���� �ʴ� ���� ������
--�� ���� �� Ȯ���Ϸ��� ���⼭ �׳� Ȯ���غ� ��.
insert into emp(empno, ename, job, deptno)
values (1010,'ȫ�浿','���',50);


--�������� ���캸��
select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'EMP';

--���������� ������ �÷� ���캸�� 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP';


--DEPT ���̺� �� �߰��ϱ�
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(50, '��ȹ��','LA');
SELECT * FROM DEPT;

--IN �����ڸ� ����Ͽ� �� ���� ���̺� ���� ���� ������� �������� ��ȸ��
SELECT * FROM USER_CONSTRAINTS
WHERE table_name IN('EMP','DEPT');

--������ ����� 
SELECT * FROM EMP05;
--EMPNO = 1010���� ���� ������ 0�� ���� �����Ǿ��ٴ� ���� ���
DELETE EMP05 WHERE EMPNO = 1010;

--���Ӱ� ���� �߰����ָ� ���� ����������.
--�ϴ� �߰��� ���ֱ� 
INSERT INTO EMP05
VALUES(1010,'ȫ�浿','���',50);
SELECT * FROM EMP05;

COMMIT;

--���� ���Ἲ�� ���� FORIGN KEY ��������
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

--�������� ���캸��
select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'EMP06';

--���������� ������ �÷� ���캸�� 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP06';

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP06';


--���⼭ DEPTNO = 50 �� �ܷ�Ű�� �ɷ��ִµ� 
--DEPT ���̺��� DEPTNO 50�� ������ �����Ѵ�.
--���⼭ �� �� �ִ� �������Ÿ��� ����Ģ�̴�
--DEPT(DEPTNO) 50�� �μ� ��ȹ�ΰ� �������������� �ɸ����̴�. 
--REFERENCES DPT(DEPTNO) DEPT ���̺��� 50���μ� ��ȹ�� LA
INSERT INTO EMP06
VALUES(1010, 'ȫ�浿', '���', 50);
SELECT * FROM EMP06;

--�̰͵� ������ ���µ�
--ù��° �÷� (EMPNO)�� ���������� PRIMARY KEY�� 
--������ ���� �޴µ� 1010 ���� �̹� ���ԵǾ� �����Ƿ� ������ ����.
INSERT INTO EMP06
VALUES(1010, 'ȫ�浿', '���', 30);


--CHECK ��������
--�ԷµǴ� ���� üũ�Ͽ� ������ �� �̿��� ���� ������
--���� �޽����� �Բ� ����� ������� ���ϰ� �Ѵ�.
--�������� �������� ���� ������ Ư�� ������ ���ڳ� ���� ���� ������ �� �ִ�. 

--<����>
--CONSTRAINT ����� CHECK (���ǽ�)
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



--�������� ���캸��
select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'EMP07';

--���������� ������ �÷� ���캸�� 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP07';

insert into EMP07 VALUES(1000,'����',500,'M');
select * from EMP07;

--�̰� �� �ȵɱ�?
--�� ������ ����° �÷�(SAL)�� �׹��� �÷�(GENDER)�� ���� ������ CHECK�̱� ������
--�ش� CHECK ���ǿ� ���� �ʾ� ������ ������ ���� �ʴ´�.
--SAL CHECK ������ 500�̻� 5000������ ������
--GENDER�� CHECK ������ 'M' �Ǵ� 'F'�� ������ 
insert into EMP07 VALUES(1010,'����',200,'A');

--������ ����
--�� �ʵ��� ���� ���ǵ� �����ο� ���� ���� ����Ѵ�.

/*
DEFAULT ��������
�ƹ��� ���� �Է����� �ʾ��� �� ������ ���� �Է��� �ǵ��� �ϰ� ���� �� ����Ѵ�
�������̶�� �÷��� �ƹ��� ���� �Է����� �ʾ��� ��
����Ʈ ���� SEOUL�� ������ �ϰ� ���� ���
DEFAULT ���������� �����Ѵ�. 

���ڵ带 �����Ҷ� �ʵ忡 ���� ���� �������� �ʾ��� ���
������ ���س��� ������ �Է��ϵ��� ����
null �� ��ſ� ������ ���� �ڵ������� �Էµȴ�.
*/

COMMIT;
select * from dept01;
select * from tab;
drop table dept01;

create table dept01(
deptno number(2) primary key,
dname varchar2(14),
loc varchar(13) default '����'
);
desc dept01;
SELECT * FROM user_constraints
WHERE TABLE_NAME ='DEPT01';
SELECT * FROM DEPT01;


--�������� ���캸��
select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'DEPT01';

--���������� ������ �÷� ���캸�� 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'DEPT01';

/*
����Ʈ�� ������ ������ ���� �ִ�.
ALTER TABLE STUDENT
ALTER COLUMN YEAR SET DEFAULT 1;

����Ʈ�� ������ ���� �ִ�
ALTER TABLE STUDENT
ALTER COLUMN YEAR DROP DEFAULT;

����Ŭ�� DEFAULT�� ���� ������ ���� �� ������ SQL ǥ���� ������ �ʴ´�.
ALTER TABLE STUDENT MODIFY (YEAR INT DEFAULT 1);
ALTER TABLE STUDENT MODIFY (YEAR INT DEFAULT NULL);
*/

insert into dept01(deptno, dname) values(10,'�渮��');
SELECT * FROM DEPT01;

select * from emp01;
drop table emp01;

create table emp01(
empno number(4) primary key, -- primary key ���������� �����Ѵ�. ������ ���� ������ null ���� ������� �ʴ´�
ename varchar2(10) not null, -- not null ���������� �����Ѵ�. null���� ������� �ʴ´�.
job varchar2(9) unique, -- unique ���������� �����Ѵ�. ������ ���� ������.
deptno number(2) references dept(deptno) --forign key ���������� �����Ѵ�.
--dept ���̺��� deptno �÷��� emp01���̺��� deptno�÷��� �����Ѵ�.
);
desc emp01;

SELECT * FROM user_constraints
WHERE TABLE_NAME ='EMP01';

--DROP Table ���̺�� [casecade constraints];
/*
���ӵ� ���������� �����ȴ�.
ALTER TABLE '���̺��' DROP CONSTRAINT '�������Ǹ�'
���̺��� PK, �������� ����
ALTER TABLE '���̺��' DROP CONSTRAINT PRIMARY KEY;
�������� ��ȸ
���̺��� ������� �������� �����ϱ�
���̺� ������ �������� ������ �÷��� ��� �����ϰ� ����
���̺� ���Ǹ� ������ ���� ���� ���� ������ �÷��鿡 ���� ���������� �Ѳ����� �����ϴ� ��
����Ű�� �⺻Ű�� ������ ��� �÷������� �ȵǰ� �ݵ�� ���̺� ���� ������� ������ �ۼ��ؾ߸� �Ѵ�. 
������ �ΰ��̻��� �÷��� �ϳ��� �⺻Ű�� ������ �� �ۼ��ϴ°Ŷ�� ���� �ȴ�.
*/

SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME ='EMP01';

SELECT * FROM EMP02;
DROP TABLE EMP02;

--�÷��� �����ϰ� ���� �ٽ� ���������� ������ �����̴�.
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
-- ���̺� ���� ������� �������� �����ϱ�
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

--�������� ���캸��
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name = 'MEMBER01';

--���������� ������ �÷� ���캸�� --> (����Ű���� ���캸����)

select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'MEMBER01';

DROP TABLE EMP01;

CREATE TABLE EMP01(
empno number(4),
ename varchar2(10),
job varchar2(9),
deptno number(2));

--���������� �߰����� �ʾ� ��ȸ�� �����Ͱ� ����.
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='EMP01';

--�������� �߰��ϱ�
-- <����>
--ALTER TABLE ���̺��
--ADD CONSTRAINT ����� ��������(�÷���);

--�������� �����ϱ�
--ALTER TABLE ���� ����Ͽ� �̹� �����ϴ� ���̺�
--���������� �߰��ϰų� ������ �� �ִ�.
-- <����>
--ALTER TABLE ���̺��
--MODIFY CONSTRAINT ����� ��������(�÷���)




--------------------------22-02-24 ��������---------------------------

--ALL ������
/*
ALL ������ ���� ������ �� ������ ���� ������ �˻� �����
��� ���� ��ġ�ϸ� ���̴�. ã���� ���� ���ؼ� AND ������ �ؼ�
��� ���̸� ���� �Ǵ� ���̴�. ALL �� " ��� �񱳰� ���� ũ��"��
���� ���� �ǹǷ� �ִ밪���� �� ũ�� ���� �ȴ�.
30�� �μ��� �ִ� �޿� ���ϱ� 
*/

--30�� �μ��� �ִ�޿� ���ϱ�
SELECT MAX(SAL) "�ִ� �޿�"
FROM EMP
WHERE DEPTNO=30;

--��) �������� �����ڸ� �̿��� 30�� �μ��� �ִ�޿����� ���� �޿���� ���ϱ�
--�Ʒ� ������ ������ �����ڸ� �̿��߱⿡ �׷��Լ��� �̿��ߴ�.
--�׷����� DEPTNO�� �����ְ� HAVING���� ������ ���.
SELECT ENAME, SAL FROM EMP
WHERE SAL > (
SELECT MAX(SAL) FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 30
);


--��) �������� �����ڸ� �̿��� 30�� �μ��� �ִ�޿����� ���� �޿���� ���ϱ� ALL �����ڸ� ����Ͻÿ�
--������ �����ڸ� �̿��ϸ� �� �����ϰ� ����� �����ϴ�.

SELECT ENAME, SAL 
FROM EMP
WHERE SAL > ALL (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);


SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL(SELECT MAX(SAL) 
FROM EMP
WHERE DEPTNO=30);



SELECT ROUND(AVG(SAL)) "��ձ޿�" FROM EMP WHERE DEPTNO=30;

--��) ���������� �̿��� 30�� �μ��� ��պ��� ���� �޿���� ���ϱ� 
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL(SELECT ROUND(AVG(SAL)) 
FROM EMP
WHERE DEPTNO=30);

--30�� �μ��� �ִ�޿� ���ϱ�
SELECT MAX(SAL) "�ִ� �޿�"
FROM EMP
WHERE DEPTNO=30;


--ANY ������
/*
ANY ������ ���� ������ �� ������ ���� ������ �˻� ����� �ϳ� �̻� ��ġ�ϸ� ���̴�. 
ANY�� ã���� �� �߿��� ���� ���� �� ��, �ּҰ����� ũ�� ���̵ȴ�.
*/
--��) 30�� �μ��� �ּ� �޿����� ���� �޿��� �޴� ��� ���ϱ� ENAME, SAL
--������ �׷� �����ڸ� �̿��ؼ� �ϸ� �̷��� �ȴ�. 
SELECT ENAME, SAL FROM EMP
WHERE SAL > (
SELECT MIN(SAL) FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 30
);

--��) 30�� �μ��� �ּ� �޿����� ���� �޿��� �޴� ��� ���ϱ� ENAME, SAL
--ANY �����ڸ� �̿��Ѵ�.

select min(sal) �ּұ޿� from emp where deptno=30;

select ename, sal
from emp
where sal > any(select min(sal)
from emp
where deptno=30);

--��) ������ �񱳹������ 30�� �μ��� �ּ� �޿����� ū �޿��� ename, sal�� ��ȸ�ϼ���.
select ename, sal
from emp
where sal > any(select min(sal) from emp)
and sal > any(select sal from emp where deptno=30);

--�׳� ���Ͽ����� �񱳹�����ε�
--�ּҰ����� ū ���� ���� �� �ִ�. 
--�ֳ�? �ּҰ��� ���������� �ϳ��� ���� ������ ������ 
--���� MIN(SAL)�� ���� ������ ���Դٸ� ������ ������ ����ؾ� �Ǵ� ��.! 

select ename, sal
from emp
where sal > (select min(sal)
from emp
where deptno=30);

--exist ������ 
--EXIST �������� �������� ���������� ��ȯ�� ����� � ���� ������ ���Ѵ�.
--��� �� ���� �ϳ��� �����ϸ� �� �� 
/*
���������� ����� ���� ���� �����⸸ �ϸ� �ٷ� ���� ������ ��� ���� �����Ѵ�.
���� ������ ��� ���� �������� �ʴ´ٸ� ���� ������ � ���� ���ϵ��� �ʴ� �����̴�
���� �ӵ� �鿡���� ���� ���� ��� �� in ���ٴ� exists�� �ξ� ������.
eixists�� �ݴ븻�� not exists�� ��� �����ϴ�.
*/

select * from dept
where exists(select *
from emp
where deptno=10);

--�� ) ������ ������ ����� ���� �μ��� �μ���ȣ�� �μ���� ������ ����ϴ� sql���� �ϼ��ϼ��� in�� ����Ѵ�.
select * from emp;
select * from dept;

select * from emp where job='����';

--select d.demptno, dname, loc
--from emp e, dept d
--where job in (select job from emp
--where job='����')
--and e.deptno = d.deptno;

select * from dept 
where deptno in(select deptno from emp
where job='����');


select sal from emp where job='����';
--��) ���庸�� �޿��� ���� �޴� ������� �̸��� �޿� ������ ����ϵ� ������ �����ϰ� �ۼ��ϼ��� all
--������ �޿��� ���캸�� 500, 450�� ���´�. 
--all�� ���� �ΰ��� ���� ���� �� �����ǹǷ� �ִ밪�� 500���� ū ���� ��µȴ�. 
--���� any�� ���� �ϳ��� �����ǵ� ������ ����ǹǷ� �ּҰ��� 450 �̻��� ������� ��µȴ�.
select ename, job, sal
from emp
where sal > all(select sal from emp where job='����');



-----------------------
/*
VIEW ���� ����
��(VIEW)�� �Ѹ���� �������� ���̺��� �ٰ��� ������ ���� ���̺�
��� ������ ������ �ܼ�ȭ ��ų�� �ִ�.
��� ����ڿ��� �ʿ��� ������ �����ϵ��� ������ ������ �� �ִ�.
��� �⺻ ���̺��� �Ļ��� ��ü�μ� �⺻ ���̺� ���� �ϳ��� �������̴�.
��(VIEW)�� '����'�� �ǹ̸� ���� �ִ� ���� ������ ���� �� �� �ֵ��
���� ���̺� ����� �����͸� �並 ���ؼ� �� �� �ֵ��� �Ѵ�
����ڿ��� �־��� �並 ���ؼ� �⺻ ���̺��� ���������� ����ϰ� �ȴ�. 
��(VIEW)�� ���ǿ� Ư¡
1) ���� ���� : �ϳ� �̻��� ���̺��� �������� �κ� �������� �����Ǵ� ������ ���̺�

2) ���� Ư¡ : 
���̺�Ӹ� �ƴ϶� �ٸ� �並 ���ʷ� ���� ����
�� ��ü�� �����͸� ���� �������� ������, â�� ������ �ϴ� �並 ���ؼ� �������� �˻� �� ������ ����
�� ��Ī�� ����ؼ� ������ �信 ���ؼ��� �� ��Ī�� ����� ���۸� ����

3)�� ����� ���� : ���̺��� ���� ������� �ʰ� �並 ����ϸ� ������ ���� ������ ���� �� �ִ�. 
1. ������ ���ؼ� DB�� ���� ������ ������ �� �ִ�.
����ڴ� Ư�� ���̺��� ������ ��� ��� ���ǵ� Ư�� �κи��� ���� �ȴ�.
2. ������ ���Ǹ� �ܼ��� ���Ƿ� ��ȯ�� �� �ִ�.
���� ���̺��� �並 �����ϸ� ���̺� ������ ���ʿ��ϰ� �ȴ�.
��) �ַ� ����ϴ� �������� ������� ������ ������ ������ �� ���� 
3. ������ �������� ���
���̺��� ����Ǿ ��� �״�� ������ �� �����Ƿ�,
����ڿ� ���� ���α׷��� ���� ������ �������� ������ �� �ִ�.
4. ������ �����Ϳ� ���ؼ� �ٸ� �並 ������ �� �ִ�.
���ǿ� ���� �����Ϳ� �����ϴ� ����� �׷� �з��ؼ�, ���� ������ ���̺��� �ٸ� �並 ���ʷ� ������ ������ �� �� �ְ� �Ѵ�.

4) ���� ����
���� ������ ��� ũ�� �ܼ� ��� ���� ��� ������ �� �ִ�.
�ܼ� ��(Single View) : ���� �ϳ��� ���̺��� ���ʷ� ������ ��
ǥ���� � ���� �����Ͱ� ���۵� ��츦 �����ϸ�, �並 ���� ��� DML ������ ������ ����

���� ��(Complex or Join View) : ���� ���̺��� ���ʷ� ������ ��
������ �׷��� �Ǵ� �׷� �Լ��� ����ؼ� �� ���� ����
�並 ���� ��� DML�� �׻� ������ ���� �ƴϴ�.

5) ��(view)����
create view ��ɹ��� ���������� �̿��ؼ� �����ϰ�,
�䰡 ������ ���� �� �̸��� �����Ǵ� ������ ������ user_views ���̺� ����ȴ�.

CREATE VIEW ����� ���� ���������� �����ؼ� ������ ���鸸���� �並 �����Ѵ�.
<����>
CREATE [FORCE | NOFORCE]
VIEW ���̸�[(�� ��Ī1 [, ����Ī2, ...]) ]
AS ��������
[WITH CHECK OPTION [CONSTRAINT �����̸�]]
[WITH READ ONLY];

����Ī : ���������� ���� ���õ� ���̳� ǥ���Ŀ� ���� ��Ī�� ����
FORCE : �⺻���̺��� ���� ���ο� �����ϰ� �並 ����
NOFORCE : �⺻���̺��� ���� �� ���� �並 ����
WITH CHECK OPTION
�信 ���� ���� ������ �ุ ���� �Ǵ� ������ �� ������ ���
WITH READ ONLY
�信 ���ؼ� SELECT�� �����ϰ�, �ٸ� DML ������ �Ұ������� ��� 

*/

--EMP ���̺�� �Ȱ��� EMP_COPY ���̺��� �����Ѵ�.
--AS�� ���ؼ� ���̺� �����ϱ�
CREATE TABLE EMP_COPY
AS SELECT * FROM EMP;

select * from emp_copy;

--2. view ����
--grant select on ���̸� to ����ڸ�
--CMD ���� Grant create view to scott


--"insufficient privileges" ������ ��� ��??
--������ ������ϴٴ� �ǹ��̴�.
--grant create any view to tester1;
--�̷��� ��ɾ� �ֱ�
create view emp_view30
as
select empno, ename, deptno
from emp_copy
where deptno=30;

SELECT * FROM emp_view30;



/*
���� ���ۿ���
1. ����ڰ� �信 ���ؼ� ���Ǹ� �ϸ� user_views ���� �信���� ���Ǹ� ��ȸ
2. �⺻���̺� ���� ���� ���� ������ ����
3. �信 ���� ���Ǹ� �⺻���̺� ���� ���Ƿ� ��ȯ
4. �⺻ ���̺� ���� ���Ǹ� ���� ������ �˻���
5. �˻��� ����� ������


�並 ����ϴ� ����
1. �����ϰ� �� �������� ��� �����ϸ� ������ �ܼ�ȭ ��Ų��
2. ���ȿ� �����ϴ�.

���� ���� �� ������ ���� �� ����
1. ���� ����
2. ���� ����
3. ���� �� ����

1.�� ����: �並 ������ �� ����� ����� CREATE OR REPLACE VIEW
--����� ����ؼ�, �̹� �����ϴ� �並 ��ü�����ν� �並 �����ϰ� �ȴ�.
--(1) CREATE OR REPLACE VIEW ����� ���� �̹� �����ϴ� �並 ���ְ�
--���� �̸��� �並 ���� �����Ѵ�
--��, ���� �䰡 ���� ��쿡�� ���ο� �並 �����Ѵ�.
--(2)�� ������ Ư¡
--1)�̹� ������ �並 �״�� �ΰ� �����ϴ� ���� �ƴ϶�,
--�̹� ������ �並 �����ϰ� ���ο� �並 �����ؼ� ��ü�����ν�
--�����ϴ� ȿ���� ��� �Ǵ� ��
--2)�䰡 �������� �ʴ� ��쿡�� ������ �߻����� �ʰ� �並 ���� �����ϰ� ��.

2. ���� ����
�䰡 �����ϴ� �⺻ ���̺��� ������ ���� �ʰ� �丸 ������
��) �����Ϳ� ���� �ս��� ���� �ʰ�, ������ ���̺��� �並 ������
������ �並 ������� ������ �䳪 ���ø����̼��� ��ȿȭ��
���� ������ �Ǵ� DROP ANY VEIW ������ ���� ����ڸ� ���� ����

3. ���� �� ����
CREATE VIEW ����� ����� ���� ���̺�κ��� ���� �並 ������ �� �ִ�.
CREATE VIEW ����� ���� ���������� �����ؼ� ������ ���鸸���� �並 �����Ѵ�.

<����>
CREATE [FORCE | NOFORCE]
VIEW ���̸�[(�� ��Ī1 [, ����Ī2, ...]) ]
AS ��������
[WITH CHECK OPTION [CONSTRAINT �����̸�]]
[WITH READ ONLY];

���� Ȱ��
1. ���� Ȯ��
2. �並 ���� ������ �˻�
3. �� ������ ���� ����
4. �信���� DML ���� ���� ��Ģ
5. WITH CHECK OPTION �ɼ�
6. WITH READ ONLY �ɼ�
7. �� �����ϱ� ���� OR REPLACE �ɼ�
*/

SELECT VIEW_NAME, TEXT FROM USER_VIEWS;
--���������� ������� �� ��ȸ
select * from emp_view30;

insert into emp_view30
values(1111,'aaaa',30);
--�信 ���� �־��µ� ���� EMP_COPY���̺��� ���� �߰��ȴ�.
select * from emp_copy;
select * from emp_view30;

--���� �� ����

select e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
from emp_copy e, dept d
where e.deptno = d.deptno; --�� ���̺��� join

--�� ���̺��� join�� ���������� ���� �� emp_view_dept ����
--emp_copy ���̺��� �μ���ȭ�� �μ����̺��� �μ���ȣ�� ���� emp_copy(e) ���̺�� dept(d) ���̺���
--�����ȣ, �����, �޿�, �μ���ȣ, �μ��̸�, ��ġ�� ��ȸ�ϴ� �並 �����Ѵ�.
create view emp_view_dept
as
select e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
from emp_copy e, dept d
where e.deptno = d.deptno;

--���պ� ��ȸ
--�� �ȿ� �Ȱ� ������� �����Ǿ� �ִ�.
select * from emp_view_dept;

--�� ����
create view emp_view
as select empno, ename, job, mgr, hiredate, deptno
from emp;

select * from emp_view;

--drop���� �� ����
drop view emp_view_dept;
select * from emp_view_dept;

--�� ������ ���� or replace
--create view emp_view30
--as
--select empno, ename, deptno
--from emp_copy
--where deptno=30;
--���� �̷��� ������ EMP_VIEW30�� ���Ӱ� �����Ѵ�. 

create or replace view emp_view30
as select empno, ename, sal, comm, deptno
from emp_copy
where deptno =30;
--�⺻�並 �����ϰ� ���� �����. ( ���� �䰡 ��� ���� ���� ����)
select * from emp_view30;

/*
���� ���̺� ���� �並 �����ϱ� ���� force �ɼ�
�並 �����ϴ� ��쿡 �Ϲ������� �⺻ ���̺��� �����Ѵٴ� ���� �Ͽ��� �������� �ۼ��Ѵ�.
���� �幰��� ������, �⺻ ���̺��� �������� ������ ��쿡�� �並 �����ؾ� �� ��찡 �ִ�.
�̷� ��� ����ϴ� ���� force �ɼ�, ���� �Բ� �並 �����غ��� ���̴�.
*/

create or replace force view employees_view
as select empno, ename,deptno
from employees
where deptno=30; 
--��� : ������ ������ �Բ� �䰡 �����Ǿ���.
--�Ȱ� ����� �ƴ� ���� ǥ�ÿ� �Բ� �䰡 �����ȴ�.
select * from employees_view;

drop view employees_view;

--�̰� �ƴ϶� �ؿ� �����̴�.! 
select view_name, text from user_viewsdrop view employees_view;
select view_name, text from user_views;
drop view employees_view;

drop view emp_view30;

create or replace view emp_view30
as select empno, ename,sal,comm,deptno
from emp_copy
where deptno=30;

--�������� �ʴ� �並 ������ ������ ������ �߻����� �ʴ´�.
--��? ���÷��̽��� ������ ���̺��� ������ �������ϴ��� ���� ���������


--��) EMP_VIEW30�� �޿��� 500 �̻��� ����� 20�� �μ��� �����ϱ�
SELECT * FROM EMP_VIEW30;

UPDATE EMP_VIEW30
SET DEPTNO =20
WHERE SAL >=500;

--���� �ٽ� ��ȸ�Ѵٸ� 20���� 
--SAL 500�� ������� DEPTNO�� ������ ������
--��ȸ���� �ʴ� ��.! 
SELECT * FROM EMP_VIEW30;
SELECT * FROM EMP;

--��) ����� ������� �ִ� 20�� �μ��� ��ȸ

--EMP_COPY ���̺��� ���ؼ� ! 
--���� 5���̾��� 20�� �μ� �������
--���� UPDATE ������ 500�̻��� 20�� �μ��� �����������Ƿ�
--7���� �Ǿ���.
SELECT * FROM EMP_COPY WHERE DEPTNO=20;

--���⼱ 5�� ���δ�.!
SELECT * FROM EMP WHERE DEPTNO=20;


--------------------------22-02-25 ��������---------------------------

/*
���� �÷� �� ���� ���ϰ� �ϴ� whit check option
�並 �����ϴ� ���� �������� where ���� �߰��Ͽ�
�⺻ ���̺� �� Ư�� ���ǿ� �����ϴ� �ο�(��)������ ������ �並 ������ �� �ִ�.
�並 ������ �� where ���� �߰��Ͽ� �⺻ ���̺��� ������ ����Ǵ�
������ �����ϰ� �Ǵµ� ���⼭ ���������� with check option�� ����Ͽ� 
���� ���ø� ���� ����� �÷��� ���� �並 ���ؼ� ������� ���ϵ��� �� �� �ִ�.
*/

--emp_view30�並 �����Ѵ�. 
--�������� with check option�� �������༭
--where���� ����� ������ ���� ������� ���ϰ� �������. 

drop view emp_view30;

create or replace view emp_view30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno=30 with check option;

select * from emp_view30;

update emp_copy
set deptno=30
where ename = '�ѿ���' or  ename = '�ŵ���' or  ename = '�嵿��' or  ename = '�����';



select * from emp_copy;
select *  from emp;


--ORA-01402: view WITH CHECK OPTION where-clause violation
--with check option�� �����صױ⿡ ������ �Ұ����ϴ�.
update emp_view30 set deptno=20 where sal>=200;

--emp�� �÷�, ������ �����ϴ� emp_copy2 ���̺��� �����.
create table emp_copy2
as
select * from emp;

select * from emp_copy2;

--emp_copy2�� �����ϴ�
--view_chk30�� �����. 
create or replace view view_chk30
as
select empno, ename, sal, comm, deptno
from emp_copy2
where deptno=30 with check option;

select * from EMP_COPY2;

--�������� ������ �߰��ȴ�
----with check option �ε� ��??
--with check option�� �μ� ��ȣ���� �����Ǿ� �־�
--�ٸ��� ������ �� �ִ� ��. 
--�μ���ȣ�� 30�� ����� comm�� 1000���� ���� 
update view_chk30 set comm = 1000;

--������ ��� ��?
--ORA-01402: view WITH CHECK OPTION where-clause violation
--�ֳ� ó���� �� ������ �� where deptno=30 with check option;
--deptno ���ǿ� with check option�� �����߱� ������ 
update view_chk30 set deptno=20 where sal>=200;



--�б⸸ ������ view�� �ϳ� �����Ѵ�.
create or replace view view_read30
as
select empno, ename, sal, comm, deptno
from emp_copy2
where deptno=30 with read only;

select * from view_read30;
--������ ��� ��?
--42399.0000 - "cannot perform a DML operation on a read-only view"
--�б� �������� ������ ���⿡ ������ �Ұ����ϴ�. 
--��) �б� ���� ���̱⿡ �ش� DML ����� ������ �� ����.
update view_read30 set comm=2000;


--hiredate�� ������������ �����ϴ�
--view_hire �並 �����. 

DROP VIEW view_hire;
create or replace view view_hire
as
select empno, ename, hiredate
from emp_copy
order by hiredate;

--hiredate�� �������� �������� �ʰ�
--emp_copy�� �����ϴ� �並 ����ٸ�
--empno ������� �ο�(��)�� ��µȴ�. 
--�̷��� ��� �� ���� rownum �÷��� �߰��ϰ� 
--hiredate�� ������������ �����ؼ� select �Ѵٸ�
--hiredate  ������� ������ ������� empno ������� ������ �Ű���
--rownum�� empno�� �����µ� ��µ� ������ hiredate�� ������������ �����
--���� ��) rownum�� ���׹��� ��µȴ�. 
create or replace view view_hire
as
select empno, ename, hiredate
from emp_copy;

select * from view_hire;
select * from emp_copy;

/*
ROWNUM �÷� ���� �ľ��ϱ�
ROWNUM �÷��� ����Ŭ�� ���������� �ο��Ǵµ� INSERT���� �̿��Ͽ�
�Է��ϸ� �Է��� ������ ���� 1�� �����Ǹ鼭 ���� �����ȴ�.
�����Ͱ� �Էµ� �������� �����Ǵ� ROWNUM �÷� ���� �ٲ��� �ʴ´�. 

*/

--��) �Ի����� �������� �������� ������ �� ROWNUM�÷� ����ϱ� 
--�Ի����� ���� ��� 5���� ����
select rownum, empno, ename, hiredate from view_hire
order by hiredate;

--���� ó���� �並 �������� �� hiredate�� �켱������ ���� �ʰ� �����ߴٸ�
--�̷��� from ���� ��� order by�� ���� ����ǵ��� from ���� �������
--���ϴ� �� ( �Ի��� ���� ������ ������������ ����ϰ� rownum���� ��ȣ�ű��)
--�� ���������� ��µǴ� ��.! 
select rownum , ob.* from(select * from view_hire order by hiredate) ob;

select rownum, empno, ename, hiredate from view_hire
where rownum <=5
order by hiredate;

--�Ի��� ���� 5�� ����ض� 
--where ���� rownum ������ �ָ� �ȴ�.
SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM VIEW_HIRE
WHERE ROWNUM <= 5;




--------------------------22-02-28 ��������---------------------------

--rownum�� ���� �ο��ǰ� order by�� ���� ������ �Ǳ� ������
--rownum ���� ���ĵ��� �ʴ´�.

select * from emp_copy;
select rownum, empno, ename, hiredate
from EMP_COPY
where rownum <=5
order by hiredate;

select rownum, ob.*
from (select * from emp_copy where rownum<=5
order by hiredate)ob;


--��� rownum �÷����� top-n ���ϱ�
--�Ի����� ���� ��� 5�� ���� ������ ���ؼ� �Ի��� ������ �並 �����ϰ�
--�̸� �ٽ� ���� 5���� ������ ���ؼ� �並 select ������ ��ȸ�ϸ鼭
--�並 rownum �÷��� where ���� �������� ����

--�ζ��� ��� top-no ���ϱ�
--�ζ��� ��� sql ���忡�� ����ϴ� ���������� �����̴�.
--���� from ���� ��ġ�ؼ� ���̺�ó�� ����Ѵ�. 

--����
--select ....
--from ...(select..) alias -- �ζ��κ�
--MAIN QUERY(�ٱ��� ������) SUB QUERY(���� ������) --> �ζ��� ��

--��) �ζ��� ��� �ٲ㺸�� 
select rownum, empno, ename, hiredate
from 
(select empno, ename, hiredate  
from EMP_COPY 
order by hiredate)
where rownum <=5;

--��) �μ��� �ִ�޿��� �ּұ޿��� ����ϴ� sal_view �����

create view sal_view
as select d.dname, max(e.sal) as max_sal, min(e.sal) as min_sal
from emp_copy e, dept d
where e.deptno = d. deptno
group by d.dname;

select * from sal_view;
select * from emp_copy;

--rownum�� �̿��ؼ� ��ȸ�ϱ�
--���� �μ��� ������ �ű�� 
--�� ������ �� �����س� as ��Ī���� ���� ����Ѵ�. 
select rownum, dname, max_sal, min_sal from sal_view;


-- ���� �ζ��� �並 ������� �ʰ� �Ϲ� ��������� ���� ����ϸ�?
--������ �̷��� ����ϸ� ���ϴ� rownum ���� �� �� �����Ƿ�
--�Ʒ� ������ ���� ����Ѵ�.
select rownum as ranking, empno, ename, sal
from emp_copy
order by sal desc;


--��) �޿��� ���� �޴� ������� 3�� ranking, empno, ename, sal ��ȸ�ϴ� �ζ��κ�
--emp_copy ���̺��

select rownum as ranking, empno, ename, sal
from ( select empno, ename, sal from emp_copy order by sal desc)
where sal is not null AND rownum <=3;

select rownum as ranking, empno, ename, sal
from ( select empno, ename, sal from emp_copy order by sal desc);



/*
���� ����, ����
OR REPLACE
���ο� �並 ���� �� ���� �Ӹ� �ƴ϶� �̹� ���� �並 �������� �ʰ� ���ο� ������ ��� ���� ����
FORCE
�⺻ ���̺��� ���� ���ο� ��� ���� �並 ����
WITH CHECK
�ش� �並 ���� �� �� �ִ� ���� �������� UPDATE �Ǵ� INSERT �����ϰ� �ϴ� ����
WITH READ ONLY
�並 ���ؼ��� �⺻ ���̺��� � �ʵ忡 ���ؼ��� ������ ���� ������ �� ������ �Ѵ�.

*/



/*
������ ���� 
�������� ���̺� ���� ������ ���ڸ� �ڵ����� �����ϴ� �ڵ� ��ȣ �߻��̹Ƿ�
�������� �⺻Ű�� ����ϰ� �Ǹ� ������� �δ��� ���� �� �ִ� .
����Ŭ�ϰ� MYSQL�� �ο��ϴ� ����� �� �ٸ��� 

CREATE SEQUENCE ������_�̸�
[START WITH n]
[INCREMENT BY n]
[(MAXVALUE n | NOMAXVALUE)]
[[(MINVALUE n | NOMINVALUE)]
[(CYCLE n | NOCYCLE)]
[(CACH n | NOCACHE)];

*/

DROP SEQUENCE DEPT_DEPTNO_SEQ;

--dept_deptno_seq ��� �������� �����Ǵµ�
--�������ڴ� 10���� 10�� �����ϰ�
--���� ���ڴ� 10�̴�.
--��) 10���� �����ؼ� 10�� �����ϰ� �Ǵ� ��.
create sequence dept_deptno_seq
increment by 10
start with 10;

desc user_sequences;

--�������� ������ ������ Ȯ���Ѵ�. 
select sequence_name, min_value, max_value,
increment_by, cycle_flag
from user_sequences;

select * from user_sequences; -- �ش� ������ ������ ��ȸ

/*
start with
:������ ��ȣ�� ���۰��� ������ �� ����ϰ� start with1 �̶�� ����Ѵ�.
increment by 
:�������� ������ ��ȣ�� ����ġ�� ������ �� ��� 1�� �����ϸ� increment by 1 �̶�� ���
cycle|nocycle
: cycle�� �ִ밪���� �����ϰ� ����, �Ϸ��ϰ� �ٽ� start with �ɼ��� ������ ���۰����� �ٽ� �����Ѵ�.
nocycle�� �����Ϸ�Ǹ� ������ ���߽�Ų��.
cache n | nocatch
cache(ĳ��)�� �޸𸮻��� ������ �������� ���� �⺻���� 20
nocache�� �޸𸮻󿡼� �������� �������� �ʽ��ϴ�.
*/

--dept_deptno_seq�� nextval�� currval�� ��ȸ�Ѵ�.
select dept_deptno_seq.nextval from dual; -- ���� ������Ѵ�. (10)
select dept_deptno_seq.currval from dual; -- 10
select dept_deptno_seq.nextval from dual; -- 20
select dept_deptno_seq.currval from dual; -- 20

/*
currval nextval Ȱ���
�������� ���� ���� �˾Ƴ��� ���ؼ� CURRVAL�� ����ϰ�
���� ���� �˾Ƴ��� ���ؼ��� NEXTVAL�� ����Ѵ�
CURRVAL�� CURENT VALUE�� ���μ� ���� ���� ��ȯ�Ѵ�.
NEXTVAL�� NEXT VALUE�� ���μ� ���� ���̶� �ǹ̸� ������
���� �������� ���� ���� ���� ��ȯ�Ѵ�. 

NEXTVAL, CURRVAL ����� �� �ִ� ���
1. ���������� �ƴ� SELECT ��
2. INSERT���� SELECT ��
3. UPDATE ���� SET ��

NEXTVAL, CURRVAL ����� �� ���� ���
1. VIWE�� SELECT ��
2. DISTINCT Ű���尡 �ִ� SELECT�� 
3. GROUP BY , HAVING, ORDER BY ���� �ִ� SELECT�� 
4. SELECT, DELETE, UPDATE�� ��������
5. CREATE TABLE ALTER TABLE����� DEFAULT ��
6. ������ ��ü �����ϱ� SAMPLE_SEQ
*/

--������ ��ü �����ϱ� SAMPLE_SEQ
CREATE SEQUENCE SAMPLE_SEQ;

--������� �ʴ� ���� 
SELECT SAMPLE_SEQ.CURRVAL FROM DUAL;

--NEXTVAL�� ���� ����Ǿ� �ϱ� ������,,?
--CURRVAL�� ���� �����ϸ� ������ ����.
SELECT SAMPLE_SEQ.NEXTVAL FROM DUAL;
SELECT SAMPLE_SEQ.CURRVAL FROM DUAL;

/*
������ ����
������ ���� ���������� ������ ������ �ұ�Ģ�� ������ ����� ������ �߻��Ѵ�.

1. �ѹ��� �߻��� ���
�������� ������ ������ �ѹ��ϸ� ���� �ѹ�ȴ�.
������ ������ ������ ��ȣ�� ��� �Ұ� �ǹǷ� ���� �������� ������ �߻�

2. �ý����� �ջ�� ���
CACHE �ɼ����� �̸� �������� �����ؼ�
�޸𸮿� �����ص� ��� �ý����� �ջ����� ���������� ���ᰡ �Ǹ�
�̸� ������ ������ ���� ��� �Ҿ������ �ǹǷ� ���� ������ ������ �߻��Ѵ�.

3. ������ �������� ���� ���̺��� ���� ���
���������� �ұ�Ģ������ ���� �� �ִ�. 
*/

DROP SEQUENCE SAMPLE_SEQ;

--��) ���۰��� 1, ���� 1�� �����ϰ� �ִ밪�� 100000�� ������ EMP_SEQ �����ϱ� 

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
--�������� ��� ����ϴ��� ���캸�� ���ؼ�
--EMP01 ���̺��� �����Ѵ�.
--���������� EMPNO���� ������. 
CREATE TABLE EMP01(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR(10),
HIREDATE DATE
);

--EMP01 ���̺� ���� �ִµ� EMPNO�� ������ ���� �ִ´�.
--EMP_SEQ.NEXTVAL�� �־��ִµ� EMP_SEQ�� ���۰� 1 ������ 1�̱⿡
--EMPNO�� 1 -> 2 -> 3 �̷��� �����ϰ� �ȴ�.
INSERT INTO EMP01
VALUES (EMP_SEQ.NEXTVAL, 'ȫ�浿', SYSDATE);
INSERT INTO EMP01
VALUES (EMP_SEQ.NEXTVAL, '������', SYSDATE);
INSERT INTO EMP01
VALUES (EMP_SEQ.NEXTVAL, 'JULIA', SYSDATE);

SELECT * FROM EMP01;

--������ ��ȸ�ϱ�
select sequence_name, min_value, max_value,
increment_by, cycle_flag
from user_sequences;

--�� 3�ϱ�??
--EMP_SEQ�� 1�� �����ϴµ� 
--3���� ��� ������ INSERT�� NEXTVAL ����⿡
--1�� �����ؼ� 3�� �Ǵ�. 
SELECT EMP_SEQ.CURRVAL FROM DUAL;

/*
�������� ���� 
ALTER SEQUENCE ������� �������� ����ġ, �ִ밪, �ּҰ�, ����Ŭ �� ĳ�� �ɼ��� ������ �� �ִ�.
ALTER SEQUENCE ������_�̸�
[INCREMENT BY n]
[(MAXVALUE n | NOMAXVALUE)]
[[(MINVALUE n | NOMINVALUE)]
[(CYCLE n | NOCYCLE)]
[(CACH n | NOCACHE)];
������ ���� ��ħ
������ �����ڳ� ALTER ������ ���� ����ڸ� ������ �� �ִ�.
����
�� START WITH �ɼ��� �����ϰ� �������� ������ �� ������ ���� �ɼ��� ������ �� �ִ�. 

������ ���� ��ħ
������ �����ڳ� ALTER ������ ���� ����ڸ� ������ �� �ִ�.
�������� �����ϸ� ���� ���� �����Ǵ� ������ ��ȣ���� ������ ��ģ��.
�������� ������ �� �ٸ� ���� ��ȣ���� �ٽ� �����Ϸ��� ���� �������� �����ϰ� �ٽ� �����ؾߵȴ�.
��ȿ�� �˻縦 �ڵ����� �����Ѵ�.
EX) ������ MAXVALUE�� ���� ������ ��ȣ���� ���� ���, ������ ������ �ʴ´�.
*/

DROP SEQUENCE DEPT_DEPTNO_SEQ;
--���Ӱ� DEPT_DEPTNO_SEQ�� �����ϴµ�
--alter�� �����غ��� ���� ����
--���� ���� 10 ���� ���� 10 �ִ밪�� 30���� �����Ѵ�.
CREATE SEQUENCE DEPT_DEPTNO_SEQ
START WITH 10
INCREMENT BY 10
MAXVALUE 30;

--������ ��ȸ�ϱ� 
select * from user_sequences;
select sequence_name, min_value, max_value,
increment_by, cycle_flag
from user_sequences;

--nextval ���� �������ְ� currval ��ȸ�غ��� 
select dept_deptno_seq.nextval from dual;

SELECT * FROM user_sequences
WHERE SEQUENCE_NAME = 'DEPT_DEPTNO_SEQ';

select dept_deptno_seq.currval from dual;

--������ ���� �غ��� alter �� ! 
alter sequence dept_deptno_seq
maxvalue 100 -- �ִ밪�� 100���� ����
cycle -- �ִ밪 ���� �ʱⰪ���� �����ϴ� �ɼ� �߰�
cache 2; --ĳ�� ������ 2 ���� 

drop table dept_example;
--���ο� ���̺��� �����Ѵ�.
--dept_example ���̺��� deptno ���� �⺻Ű���� ���.
--�⺻Ű���̶�? �ߺ� and null���� ���� �� ���� ��.
create table dept_example(
deptno number(2) primary key,
dname varchar2(15),
loc varchar2(15)
);

--�������� ���캸��
--�������� ���� ! 
--�� �������ǿ��� ���̺���� �빮�ڷΡ�
select constraint_name, constraint_type, table_name
from user_constraints
where table_name in('DEPT_EXAMPLE');

--���������� ������ �÷� ���캸�� 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'DEPT_EXAMPLE';



drop sequence dept_example_seq;

--dept_example_seq ������ �����ϱ�
--�ʱⰪ 10 ������ 10 �ݺ��� ���� 
create sequence dept_example_seq
increment by 10
start with 10
nocycle;

select * from user_sequences;

insert into dept_example values(dept_example_seq.nextval, ' �λ��', '����');
select * from dept_example;
select dept_example_seq.currval from dual;
insert into dept_example values(dept_example_seq.nextval, ' �渮��', '����');
insert into dept_example values(dept_example_seq.nextval, ' �ѹ���', '����');
insert into dept_example values(dept_example_seq.nextval, ' �����', '��õ');

select * from dept_example;
select dept_example_seq.currval from dual;



/*
1. �ε���(index)��?
�����͸� ����ؼ� ���� �˻��� ������ �� �ִ� DB ��ü

2. �ε����� Ư¡
���̺� �࿡ ���� �������̰� ���� �������� ������
�ε����� ����Ŭ ������ ���� �ڵ����� �����ǰų�, ����ڿ� ���� ��������� ������ �� ����
�ε����� ����Ŭ ������ ���ؼ� �ڵ����� ���ǰ� ������
�ε����� ���̺���� ����, ���������� ������
�⺻ ���̺� ���������� �ʰ� �����ϰų� ������ �� ����
�⺻ ���̺��� �����ϸ�, �ε����� �ڵ����� ���ŵȴ�.
�ε����� �ʹ� ���� �����ϸ� ������ DML ó���� ȿ���� ���Ͻ�Ű�� �ȴ�.
(���� 5�� ����,,? �� �̻��� ������ ����)

3. �ε��� ���� ���
�ε��� ���� ������� �ڵ��� ������ �� ���� ����� �ִ�.

4. �ڵ� �ε��� ����
���̺��� ������ �� Primary Key�� Unique ���� ������ ���ǵ� ���� ���ؼ�
����Ŭ ������ ������ �ε����� �ڵ����� �����Ѵ�.

5.���� �ε��� ����
�˻� �ӵ��� ����� ���� ����ڰ� CREATE INDEX ����� ����ؼ�
��������� �������� �ʴ� �ε����� ������ �� �ִ�.
�ϳ� �̻��� ���� ���ؼ� �ϳ��� �ε����� ������ �� �ִ�.

CREATE INDEX ����� ����
ON ���� � ���̺��� � ���� ���� �ε����� ������ ���� ����Ѵ�.
CREATE INDEX �ε�����
ON ���̺��(���̸�1, [�� �̸�2...]);

���� �ε��� ���� ��
EMP ���̺��� EMP_NAME ���� ���� �˻��� ����� �߻��ϹǷ�
�� �˻� �ӵ��� ��� ��ų �� �ֵ��� �ε����� �����Ѵ�.

6. �ε����� ������ ���� ���ʿ��� ��� 
<������ ���>
1)���� WHERE ���̳� ���� ���ǿ��� ���� ���Ǵ� ���
2)���� �������� ���� �����ϴ� ���
3)���� ���� ���� null ���� �����ϴ� ���
4)null ���� ���ؼ��� �ε����� �������� �����Ƿ� null ���� �������� �ε����� ũ�Ⱑ �۾�����.
5) �� �Ǵ� �� �̻��� ������ WHERE �� �Ǵ� ���� ���ǿ��� ���� �Բ� ���Ǵ� ���
6)���̺��� �����̰� ��κ��� ���ǰ� ���� 2~4% ���� ���� �о� ���� ������ ����Ǵ� ���

<���ʿ��� ���>
1) ���̺� ����� ���� ���
2)�ش� ���� ������ �������� ���� ������ �ʴ� ���
3)���̺��� ���� ���ŵǴ� ���(�ε��� ������ ���� DML ȿ���� ��������
4) ��κ� ���ǰ� ���� 2~4% �̻��� �о� ���� ������ ����Ǵ� ���
(�ε����� �����ϴ� ��� ���̺� ��ü�� �˻��ϴ� ���� ����)

7. �ε��� Ȯ��
������ ������ USER_INDEXES �� USER_IND_COLUMNS �信 ����� �ε��� ������ Ȯ���Ѵ�.
USER_INDEXES ������ ���� ��
�ε��� �̸��� �ε����� ���ϼ� ���� ���� �����Ѵ�
USER_IND_COLLUMNS ������ ���� ��
�ε��� �̸�, ���̺� �̸�, �� �̸�, �� ��ġ ���� ���� ���� �����Ѵ�.

�ε��� Ȯ�� EX)
EMP ���̺� ���� ������ �ε����� �̸��� �ε����� ������ �� �̸�, �� ��ġ , ���ϼ��� Ȯ���Ѵ�.

8.�ε��� ����
DROP INDEX ����� ����ؼ� ������ �������� �ε����� �����Ѵ�
DROP INDEX ����� ����
������ �ε��� �̸��� �����Ѵ�
DROP INDEX �ε�����;

���ǻ��� 
�ε��� �����ڳ� DROP ANY INDEX ������ ���� ����ڸ� ������ �� �ִ�.
�� �ε����� ������ �� ������ ������ �ʿ��� ��� �����ϰ� �ٽ� �����ؾ� �Ѵ�. 
�ε��� ���� EX)
������ �������� EMP_NAME_IDX �ε����� ������ ���� ����� �����Ǿ����� Ȯ���Ѵ�. 
*/

DROP TABLE DEPT01;

CREATE TABLE DEPT01
AS
SELECT * FROM DEPT WHERE 1=0;
--���̺� ������ �����´� (������ X)
--where ���� false�� ������ �������µ�
--primary key���� ���������� �������� �ʴ´�. 

SELECT * FROM DEPT;
DESC DEPT01;

SELECT * FROM DEPT01;
DESC DEPT;

--�� �������ǿ��� ���̺���� �빮�ڷΡ�
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('DEPT01');

--���������� ������ �÷� ���캸�� 
select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'DEPT01';

--������ �����ϱ�
INSERT INTO DEPT01 VALUES (10, '�λ��', '����');
INSERT INTO DEPT01 VALUES (20, '�ѹ���', '����');
INSERT INTO DEPT01 VALUES (30, '������', '����');
SELECT * FROM DEPT01;

/*
�ε����� ����
1. �����ε���
2. ����� �ε���
3. ���� �ε���
4. ���� �ε���
5. �Լ���� �ε���

���� �ε���(���� �ε���) ����Űó�� ������ ���� ���� �÷��� ���ؼ� �����ϴ� �ε���
���� �ε����� �����Ϸ��� UNIQUE �ɼ��� �����ؾ��Ѵ�.
EX) DEPTNO�� ����/����� �ε��� �Ѵ� ���� �����ϴ� 
*/

CREATE UNIQUE INDEX IDX_DEPT01_DEPTNO
ON DEPT01(DEPTNO);

/*
����� �ε���
�ߺ��� �����Ͱ� ����� �÷��� �ε����� ������ ���
����� �ε����� �����ؾ� �Ѵ�
UNIQUE �ɼ��� �����ϰ� �����Ѵ�. 

*/
--�ߺ��� �����Ͱ� �̹� �����Ƿ� �ε��� ���� �Ұ� 
CREATE UNIQUE INDEX IDX_DEPT01_LOC
ON DEPT01(LOC);

--UNIQUE �ɼ��� �����ϰ� �����Ѵ�. 
CREATE INDEX IDX_DEPT01_LOC
ON DEPT01(LOC);


--���� �ε��� �����ϱ�
--�μ���ȣ�� �μ����� �����Ͽ� �ε����� ������ �� �ִ�.
CREATE INDEX IDX_DEPT01_COM
ON DEPT01(DEPTNO, DNAME);




--���������� ������ �÷� ���캸�� 
select index_name, column_name
from user_ind_columns
where table_name = 'DEPT01';


--CREATE TABLE EMP07(
--empno number(4) constraint emp07_empno_pk primary key, --P
--ename varchar2(10) constraint emp07_ename_nn not null, --C
--sal number(7,2) constraint emp07_sal_ck check (sal between 500 and 5000),
--gender varchar2(1) constraint emp07_gender_ck check(gender in('M','F'))
--);

--�� �������ǿ��� ���̺���� �빮�ڷΡ�
select constraint_name, constraint_type, table_name
from user_constraints
where table_name in('EMP07');

SELECT * FROM EMP07;

--�Լ� ��� �ε��� �����ϱ� 
create index idx_emp01_annsal
on emp07(sal*12);

--�ε��� ���� ��ȸ
--�ε����� �⺻ Ű(primary key)�� ���� Ű(unique) ���� ������ �����ϸ� �ڵ����� �����ȴ�.
--(���Ἲ Ȯ���� ���� ���÷� ������ �˻��ϱ� ���� �뵵�� ���������� �ش� �÷��� ���Ͽ� �ε����� ������)
select index_name, column_name
from user_ind_columns
where table_name = 'EMP07';

--�ε��� ���� ��ȸ
--�̷��� 2���� ���̺��� �� ���� ��ȸ�Ҽ��� �ִ�. 
select index_name, table_name, column_name
from user_ind_columns
where table_name in('EMP07','DEPT01');

--�ε��� ���� ��ȸ
SELECT * FROM USER_IND_COLUMNS
WHERE table_name in('EMP07');

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP07';




/* ����� ����
  Create user �������̵� identified by ��й�ȣ;
  
  create user �������̵� identified by ��й�ȣ
    default tablespace appl_data
    temporary tablespace temp;
    
  create user �������̵� identified by ��й�ȣ
    default tablespace appl_data
    temporary tablespace temp;
    quota 20M on appl_data quota 10M on system;   
*/

--�ý��� ���� SYSTEM PRIVILEGE
--DBMS ���� ���� ���
--������ �߿伺�� ���� �������� ������ �� �ִ� ����ڿ� ���� �� �� ����
--����ڸ� �����ϱ� ���� ������ ������ �� �ִ�.
--DBA ������ ���� ����ڰ� �ý��۱����� �ο��� �� �ִ�.
--
-- ��ǥ���� �ý��� ����
-- create session : �����ͺ��̽��� ������ �� �ִ� ����
-- create table : ���̺��� ������ �� �ִ� ����
-- create any table : �ٸ� user�� �̸����� ���̺��� ������ �� ����
-- create tablespace : ���̺� �����̽��� ���� �� �ִ� ����
-- unlimited tablespace : ���뷮�� ���������� ����ϴ� ����.
-- select any table : ��� ���̺�, ��� �˻��� �� �� �ִ� ����
--
--���Ѻο� ���: grant   ����ȸ�� ���: revoke

--��Ű����? ��ü�� ������ ����ڸ� 
--TESTER1 ����� SQL ��Ű����
--DEPT ���̺��� �ҷ��´�. 
SELECT * FROM TESTER1.DEPT;


/*
 PL/SQL(Procedural language/SQL) -- ����
 : ����Ŭ���� �����ϴ� ���α׷��� ���
 : �Ϲ� ���α׷��� ������� ��Ҹ� �� ������ �ְ� ������ ���̽� ������ ó���ϱ� ���� ����ȭ�� ���
*�⺻����*
�����(Declare) : ��� ������ ����� �����ϴ� �κ� -�ɼ�
�����(Executable) : begin~end/ ���, �ݺ���, �Լ����� ���� ������ ����ϴ� �κ� - �ʼ�
����ó����(exception) : ���൵�߿� ���� �߻� �� �ذ��ϱ� ���� ��ɵ��� ����ϴ� �κ� declare, begin, exception Ű������� ;�� ������ �ʴ´�. -�ɼ�
������ ������� ;�� ó���Ѵ�.! 
�͸��� ( anonymous PL/SQL BLOCK) :�ַ� ��ȸ������ ����� ��� ���� ���ȴ�.
������ ( stored PL/SQL BLOCK) :������ ������ ���� �ֱ������� �ݺ��ؼ� ����� ��� ���ȴ�. 
*/

--��¹��� ��ũ��Ʈ ��¿��� �����ִ� ��ɾ�
set serveroutput on;

set serveroutput off; �ݴ�

/*
PL/SQL �� ORACLE'S PROCEDURAL LANGUAGE EXTENSION TO SQL�� ���ڷ�
SQL ���忡�� ��������, ����ó��(IF), �ݺ�ó��(LOOP, WHILE, FOR)���� �����ϸ�
����Ŭ ��ü�� ����Ǿ� �ִ� ������ ��� (Procedure Language)�μ� SQL�� ������ �������ݴϴ�.
*/

--��Ʈ ������ �ȵǸ� ����� ������ ����
--DBA ������ ����.!! �� ������ ���α׷� ���� �������ϸ� �ٲ�°� Ȯ�� �����ϴ�.


--  1. ���� ����Ŭ ��Ʈ��ȣ Ȯ��
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;
--  2. ��Ʈ��ȣ ���� (8080 ��9090)
EXEC DBMS_XDB.SETHTTPPORT(9090);


--<HELLO WORLD �����>
SET SERVEROUTPUT ON;
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello Word');
END;
/

/*
����
������ ���� ��Ģ
1. �ݵ�� ���ڷ� �����ؾ� �Ѵ�.
2. ���ڳ� ����, Ư�����ڸ� ���� �� �� �ִ�.
3. �������� 30bytes ���Ͽ��� �Ѵ�.
4. �����(Ű����)�� ����ϸ� �ȵȴ�.

������ ������ �����(declare)���� ����ǰ�, ������ �ʱ�ȭ�� �����ϴ�.
����ο��� ����� ��� ���� �Ҵ�ȴ�.
�������α׷��� �Ķ���ͷ� ���޵Ǳ⵵ �ϸ�, �������α׷��� ��� ����� �����ϱ⵵ �Ѵ�. 

���� ���� ��)
emp_no number(6,3) : ���ڸ� �����ϴ� ������ �� 6�ڸ��� �ǹ��ϸ�, �Ҽ��� ���� 3�ڸ��� �ǹ��Ѵ�.
emp_name varchar2(5) : ���ڸ� �����ϴ� ������ �� ����Ʈ ���̰� 5 ����Ʈ�� ������ �� �ִ�.
emp_date_date : ��¥�� �����ϴ� ���� 

���� ������ Ÿ��>
char : ���������� ���ڸ� ����, �⺻�ּҰ� 1, �ִ� 32,767 ����Ʈ�� ����
varchar2 : ���������� ���ڸ� ����, �⺻���� ����. �ִ� 32,767 ����Ʈ�� ����
number (��ü�ڸ���, �Ҽ������� �ڸ���)
:��ü�ڸ����� �Ҽ������� �ڸ� ���� ���� ���ڸ� ����
��ü�ڸ��� ������ 1~30���� �����ϰ�, �Ҽ��� �ڸ����� ������ -84~127���� ���� 

binary_double : �ε� �Ҽ��� ���� ����, 9����Ʈ �ʿ���
date : ��¥ �� �ð��� ����, �ʴ����� ����
��¥ ������ 4712B.C ~ 9999 A.D
timestamp : date Ÿ���� Ȯ��, ����, ��, ��, ��, ��, �� �� �Ҽ��� ǥ�õǴ� �ʴ����� ����
�ڸ����� ǥ���Ҷ��� 0~9 ������ ������ ���, �⺻���� 6


<��������>
���̺��.�ʵ��%Type
empNo employees.employee_id%TYPE
:employees ���̺��� employees_id�� ������ ������ Ÿ������ ���� 

emp_name employees.first_name%TYPE
:employees ���̺��� first_name�� ������ ������ Ÿ������ ���� 

empRow employees%ROWTYPE
:employees ���̺��� ��� �÷��� �Ѳ����� �����ϱ� ���� ������ ����
*/

--/(������) : �� ������ ����
--SET SERVEROUTPUT ON : ��ũ��Ʈ�� ����� ��µǰ� �����Ѵ�.
SET SERVEROUTPUT ON;
--DECLARE -- �����(�͸���)
--CNT INTEGER;
--BEGIN -- �����
--CNT := CNT+1; --�Ҵ翬����, :=(�ݷ�, ����) : 1�� ����
--IF CNT IS NULL THEN
--DBMS_OUTPUT.OUT_LINE('��� : CNT�� ���̴�');
--END IF;
--END;
--/


declare
cnt integer;
begin
cnt := cnt+1;
if cnt is null then
dbms_output.put_line('��� : cnt�� ���̴�');
end if;
end;
/

--SET SERVEROUTPUT ON; ó���� �Է����ְ�
--�����(Declare) : ��� ������ ����� �����ϴ� �κ� -�ɼ�
SET SERVEROUTPUT ON;
declare
vempno number(4); -- ������ 4�� number Ÿ�� nempno ���� ����
vename varchar2(10); -- ������ 10�� varchar2 Ÿ�� vename���� ���� 
begin
vempno :=1001; -- vempno ������ 1001����
vename :='����'; --vename ������ '����' ����
--dbms_output.put_line�� ���â�� ��µ� �κ� 
dbms_output.put_line('  ���  �̸�');
dbms_output.put_line('-----------');
--������ ������ ������ ���� ����Ѵ�. 
dbms_output.put_line(''||VEMPNO||'  '||VENAME);--�������� ���
END;
/


DECLARE
   VEMPNO     EMP.EMPNO%TYPE;    -- VEMPNO ������ EMP���̺� EMPNO �÷��� ������Ÿ���� �����Ѵ�
   VENAME     EMP.ENAME%TYPE;    -- VENAME ������ EMP���̺� ENAME �÷��� ������Ÿ���� �����Ѵ�
   VDEPTNO      EMP.DEPTNO%TYPE;   -- VDEPTNO ������ EMP���̺� DEPTNO �÷��� ������Ÿ���� �����Ѵ�
   VDNAME     VARCHAR2(20) := NULL;  -- VDNAME ������ VARCHAR2(20) ������Ÿ������ �����ϰ� NULL���� �����Ѵ�
BEGIN
   SELECT EMPNO, ENAME, DEPTNO  -- ��ȸ�� ����
   INTO VEMPNO, VENAME, VDEPTNO -- �� ������ �����Ͽ� �����Ѵ�
   FROM  EMP
   WHERE EMPNO=1001;

-- IF ���ǹ�
   IF (VDEPTNO = 10)  THEN      -- ���� VDEPTNO�� 10��
      VDNAME := 'ACCOUNTING';   -- VDNAME ������ 'ACCOUNTING' ����
   END IF;
   IF (VDEPTNO = 20)  THEN  -- ���� VDEPTNO�� 20�̸�
     VDNAME := 'RESEARCH';  -- VDNAME ������ 'RESEARCH' ����
   END IF;
   IF (VDEPTNO = 30)  THEN  -- ���� VDEPTNO�� 30�̸�
      VDNAME := 'SALES';    -- VDNAME ������ 'SALES' ����
   END IF;
   IF (VDEPTNO = 40) THEN   -- ���� VDEPTNO�� 40�̸�
      VDNAME := 'OPERATIONS';   -- VDNAME ������ 'OPERATIONS' ����
   END IF;  -- ���ǹ� ����

   DBMS_OUTPUT.PUT_LINE('   ���     �̸�      �μ���');
   DBMS_OUTPUT.PUT_LINE('--------------------------');
   DBMS_OUTPUT.PUT_LINE('' || VEMPNO||'    '
                ||VENAME||'    '||VDNAME);
END;
/



DECLARE
  VEMP EMP%ROWTYPE;    -- VEMP ������ EMP���̺��� ��� ������Ÿ���� �����Ѵ�
  ANNSAL NUMBER(7,2);  -- ANNSAL ������ NUMBER(7,2) ������Ÿ������ �����Ѵ� 
BEGIN    
  SELECT * INTO VEMP   -- ��� �����͸� VEMP ������ ����
  FROM EMP
  WHERE ENAME='����';

  IF (VEMP.COMM IS NULL) THEN   -- VEMP ������ COMM�÷����� NULL�� ���
    ANNSAL:=VEMP.SAL*12;        -- ANNSAL ������ VEMP ������ SAL �÷����� * 12�� ���� ����
  ELSE  -- ������ �����϶�
    ANNSAL:=VEMP.SAL*12+VEMP.COMM;
        -- ANNSAL ������ VEMP ������ SAL �÷����� * 12�� VEMP ���̺��� COMM �÷����� ���� ���� ����
  END IF;   -- ���ǹ� ����

  DBMS_OUTPUT.PUT_LINE('  ���    �̸�    ����'); 
  DBMS_OUTPUT.PUT_LINE('-----------------------');
  DBMS_OUTPUT.PUT_LINE(''||VEMP.EMPNO||'   '
         ||VEMP.ENAME||'   '||ANNSAL); 
END;
/

DECLARE
  VEMP EMP%ROWTYPE; --�ּ��� �޾��ּ���
  VDNAME VARCHAR2(14);
BEGIN  
  SELECT * INTO VEMP
  FROM EMP
  WHERE ENAME='����';

  IF (VEMP.DEPTNO = 10)     THEN
    VDNAME := 'ACCOUNTING';
  ELSIF (VEMP.DEPTNO = 20)  THEN
    VDNAME := 'RESEARCH';
  ELSIF (VEMP.DEPTNO = 30)  THEN
    VDNAME := 'SALES';
  ELSIF (VEMP.DEPTNO = 40)  THEN  
    VDNAME := 'OPERATIONS';
  END IF;

  DBMS_OUTPUT.PUT_LINE('  ���    �̸�     �μ���'); 
  DBMS_OUTPUT.PUT_LINE('--------------------------');

  DBMS_OUTPUT.PUT_LINE(''||VEMP.EMPNO
        ||'   '||VEMP.ENAME||'   '||VDNAME); 
END;
/

DECLARE
  N  NUMBER := 1;   -- N ������ NUMBER ������Ÿ������ ���� �� 1�� ����
BEGIN
  LOOP  -- �ݺ���
    DBMS_OUTPUT.PUT_LINE( N );  -- ���� N�� ���� ���
    N := N + 1; -- N ������ N�� ���� +1 �� ���� ����
    IF N > 5 THEN   -- ���� N�� ���� 5���� Ŭ ���
      EXIT; -- �ݺ� Ż��
    END IF; -- ���ǹ� ����
  END LOOP; -- �ݺ� ����
END;
/


DECLARE
BEGIN
  FOR N IN 1..4 LOOP
  -- ���� N�� �����ϰ� N�� ���� 1���� 4���� 1�� �����ϸ� �ݺ��Ѵ�
    DBMS_OUTPUT.PUT_LINE( N );
  END LOOP; -- �ݺ� ����
END;
/

DECLARE
  N NUMBER := 1;    -- ���� N�� NUMBER ������Ÿ������ �����ϰ� 1�� ����
BEGIN
  WHILE N <= 5 LOOP -- N�� ���� 5���� �۰ų� ������ �ݺ�
    DBMS_OUTPUT.PUT_LINE( N );
    N := N + 1; -- N�� ���� 1��ŭ ����
  END LOOP; -- �ݺ� Ż��
END;
/


drop table s_emp;
create table s_emp -- EMP ���̺��� �����Ͽ� S_EMP ���̺��� ����
as
select * from emp;

-- S_EMP ���̺��� ����̸��� '����'�� ����� �̸��� �޿��� ���
select ENAME, sal from s_emp
WHERE ENAME='����';

--��) �����̸� �޿��� 10�� �λ��ϰ� �ƴϸ� 5�� �λ��Ͻÿ�


SET SERVEROUTPUT ON;
DECLARE
   VEMP     s_emp%ROWTYPE;   -- VEMP ������ S_EMP�� ��� �÷��� �����Ѵ�
   VDEPTNO   s_emp.DEPTNO%TYPE; -- VDEPTNO ������ S_EMP ���̺��� DEPTNO �÷��� ������Ÿ���� �����Ѵ�
   VPERCENT  NUMBER(2); -- VPERCENT ������ NUMBER(2) ������Ÿ������ �����Ѵ�
BEGIN
   select deptno into vdeptno   
   -- DEPT ���̺��� ��ȸ�� DEPTNO�� �����͸� VDEPTNO ������ ����
   from dept
   where dname like '%����%';
SELECT * INTO VEMP   
   -- S_EMP ���̺��� ��ȸ�� ��� �����͸� VEMP ������ ����
   FROM s_emp
   WHERE ENAME='����';
  
   --VEMP ������ DEPTNO �÷����� VDEPTNO ������ ���� ������
   IF VEMP.deptno  =  vdeptno THEN
      VPERCENT := 10;   -- VPERCENT ������ ���� 10���� ����
   ELSE -- ������ �����϶�
      VPERCENT := 5;    -- VPERCENT ������ ���� 5�� ����
   END IF;  -- ���ǹ� ����
   
   update s_emp
   set sal = sal + sal*VPERCENT/100
   -- SAL �÷��� ���� ���� SAL���� VPERCENT������ 100���� ���� ���� ���� ������ ����
   where ENAME='����';
   commit;
   END;
/

--��� �ٲ�������� �����ּ��� �����Ͱ� �ٲ������ ��ȸ
select ENAME, sal from s_emp WHERE ENAME='����';


DECLARE
 -- %ROWTYPE�� ������θ� �����ϴ� ���۷��� ���� ���� 
  VEMP EMP%ROWTYPE; 
  ANNSAL NUMBER(7,2);
BEGIN
 -- ���� ����� ��ü ������ �� ������ VEMP�� �����Ѵ�.  
  SELECT * INTO VEMP
  FROM EMP
  WHERE ENAME='����';

 -- Ŀ�̼��� NULL�� ��� 0���� �����ؾ� �ùٸ� ���� ���
  IF (VEMP.COMM IS NULL)  THEN
   VEMP.COMM := 0;
  END IF;                      
 -- ��Į�� ������ ������ ����� ����� �����Ѵ�.
  ANNSAL:=VEMP.SAL*12+VEMP.COMM ; 

-- ��� ��� 
  DBMS_OUTPUT.PUT_LINE('��� / �̸� / ����'); 
  DBMS_OUTPUT.PUT_LINE('------------------------');
  DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||' /' 
               ||VEMP.ENAME||' /'||ANNSAL); 
END;
/

--basic loop������ ������5���� ����ϼ���
DECLARE
  DAN  NUMBER := 5; -- 5��
    I  NUMBER := 1; -- 1���� 9���� ���ϴ� ����
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE(
        DAN || ' * ' || I ||' = '|| (DAN*I) );
    I := I + 1;    -- I ������ 1�� ����
    IF I > 9 THEN  -- I�� 9���� Ŭ��
       EXIT;       -- �ݺ� Ż��
    END IF;
  END LOOP;             
END;
/

DECLARE
   VDEPT DEPT%ROWTYPE;                        
BEGIN
  DBMS_OUTPUT.PUT_LINE('�μ���ȣ / �μ��� / ������'); 
  DBMS_OUTPUT.PUT_LINE('-----------------------');
  -- CNT�� 1���� 1�� �����ϴٰ� 4�� �Ǹ� �ݺ����� ���
   FOR CNT IN 1..4 LOOP                        
    SELECT * INTO VDEPT
    FROM DEPT
    WHERE DEPTNO=10*CNT;

    DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || '      / ' 
      || VDEPT.DNAME || ' / ' || VDEPT.LOC); 
   END LOOP;
END;
/

-- '*' ��ȣ�� �Ѱ��� �߰��ϸ� ����ϱ�
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














































