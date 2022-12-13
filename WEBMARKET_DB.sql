select * from products;

delete from products where pname='111';



create table users (
	id varchar2(20) not null,
	pass varchar2(20) not null,
	name varchar2(20) not null,
	nickname varchar2(10) not null,
	address varchar2(100),
	email varchar2(20) not null,
	phoneNum varchar2(13) not null,
	admin number default 0 not null,
	CONSTRAINT overrap_pk primary key(id, nickname)
);

insert into users (id, pass, name, nickname, email, phoneNum, admin )values
('webmarket','1234','�賲��', '������','lotlapis@gmail.com','010-3795-3028', '1');

insert into users (id, pass, name, nickname, email, phoneNum, admin )values
('thdnjs0946','1234','�ڼҿ�','������1','th@naver.com','010-1234-5678', '1');

delete from users where name='�ڼҿ�';

select * from users;


create table board(
num number not null, -- �Խñ� ��ȣ
title VARCHAR2(200) not null, -- �Խñ� ����
content varchar2(2000) not null, -- �Խñ� ����
nickname varchar2(10) not null, -- �ۼ��� nickname
imagename varchar2(200), --�̹��� ÷�� ���� �̸�
postdate date default sysdate not null, --�Խ��� ��ϳ�¥, �ۼ���
CONSTRAINT board_pk primary key(num, nickname)
);

select * from board;

SELECT B.*, M.id FROM users M INNER JOIN board B
ON M.nickname=B.nickname WHERE num=6;

select * from board;

    
select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints
where table_name = 'BOARD';

--������ ����
create sequence seq_board_num
increment by 1  --����ġ
--START WITH 1
minvalue 1
nomaxvalue
nocycle
nocache;

insert into board (num, title, content, nickname)
    values(seq_board_num.nextval,'�Խ��� �׽�Ʈ','�Խ��� �׽�Ʈ �Դϴ٤�.' , '�ڼҿ�');
insert into board (num, title, content, nickname)
    values(seq_board_num.nextval, '��ǰ ���ǵ帳�ϴ�.' , '��ǰ�� ������ �־�� ��ȯ �ǳ���?' , '�̼���');
    

delete from board where nickname='������1';


---------------------------------------------------
-- ���� �ٽ� 

create table products (
	productId varchar2(20) primary key, -- ��ǰ ���̵�
	pname varchar2(20) not null, -- ��ǰ��
	unitPrice number not null, -- ��ǰ ����
	description varchar2(100) not null, -- ��ǰ ����
	manufacturer varchar2(20) not null, -- ������
	category varchar2(20) not null, -- �з�, ���ǥ(����Ʈ)
	unitsInStock number default 0 not null, -- ����
	condition varchar2(20) not null, -- �Ż�ǰ or �߰�ǰ or ���ǰ
	filename varchar2(100) default 0
);

select * from products;
select * from users;
select * from board order by num;
select * from carts;



select * from board order by num;

select * from board_comment order by comment_num ;







delete from board_comment where comment_num='31';

commit;




----------------------------------------------------


select * from users;
select *  from products;
select * from carts;
select * from shippingInfo;
select * from board order by num;
select * from board_comment order by comment_num;

SELECT COUNT(*) FROM board;

delete from products where productid = 'P1241';
COMMIT;

delete from shippingInfo where userid ='lee';

delete from users where id = 'lee';
delete from users where id='test1';

select count(*) from users 
where nickname='4';

select count(*) from board
where title like '%���%';

SELECT * FROM( SELECT Tb.*, ROWNUM rNum 
		FROM (  SELECT * FROM board WHERE title LIKE '%���%'
        ORDER BY num DESC ) Tb )
		WHERE rNum BETWEEN 1 AND 10 ;
        
select * from seq_board_num;  
SELECT * FROM USER_SEQUENCES;
SELECT seq_comment_num.CURRVAL FROM DUAL;
SELECT seq_comment_num.NEXTVAL FROM DUAL;



        


