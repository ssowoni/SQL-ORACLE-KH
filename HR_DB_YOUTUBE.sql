select * from EMPLOYEES;
select * from departments;

--�������� ����غ���
select * from EMPLOYEES A
where a.department_id = (  -- ������ ��������
                           -- equal�� ��⿡ �������� ��ȸ ���� 1���� ���;� �Ѵ�.
                           -- ���� b.location_id = 1700���� �ָ� �������� �տ� =�ƴ� IN�� �����.
                            SELECT B.department_id
                            FROM departments B
                            where b.location_id =1800);
                            
select * from EMPLOYEES A
where a.department_id IN (  
                            SELECT B.department_id
                            FROM departments B
                            where b.location_id =1700);          
                            
-- ���� ������ �������� ����غ��� 
-- ũ�� �ӵ����� ���̰� ����. 
SELECT * 
    FROM employees A,
        departments B
    WHERE a.department_id = b.department_id
    AND b.location_id = 1700;
 
 --���������� ���� �ȵǴ� ���� �ֱ� �ϴ� ������?
 
 
 
 
 -----------------------------------------------------------------------------


select * from EMPLOYEES; 
 
-- ����� �޿� ��� �˻� 


select avg(salary) , round( avg(salary)), count(*) ��ü�ο�
from EMPLOYEES;

 
 
                            
                           