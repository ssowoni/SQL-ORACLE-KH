--���̺� ��� ��ȸ
select*from tab;
SELECT * FROM PRODUCT_COMPONENT_VERSION;



drop table member;
drop table board;
drop sequence seq_board_num;

--ȸ�� ���̺� ����
create table member(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null, --ȸ�� ���Գ�¥
    primary key (id)
    );
    
--��1 ����� �Խ��� ���̺� ����
    create table board(
    num number primary key,
    title VARCHAR2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null, --�Խ��� ��ϳ�¥, �ۼ���
    visitcount number(6)                        --�Խñ� ��ȸ��
    );

--�ܷ�Ű ����
alter table board
    add constraint board_mem_fk foreign key(id)
    references member(id);


--������ ����
create sequence seq_board_num
increment by 1  --����ġ
--START WITH 1
minvalue 1
nomaxvalue
nocycle
nocache;

--���� ������ �Է�
insert into member (id,pass,name) values ('musthave','1234','�ӽ�Ʈ�غ�');
insert into member(id,pass,name) values ('test','1234','�׽�Ʈ');

insert into board (num, title, content, id, postdate, visitcount)
    values(seq_board_num.nextval, '����1�Դϴ�','����1�Դϴ�','musthave',sysdate,0);
    commit;
    
select*from member;
select*from board;

select a.* from board a,  member b where a.id = b.id;

--220314 ��������
--rNum�� rownum�� ��Ī�̴�.
--rownum�� 1���� 10������ ���ڵ�(��)�� ����Ѵ�.
SELECT * FROM ( 
    SELECT Tb.*, rownum rNum FROM (  
        SELECT * FROM board ORDER BY num DESC ) Tb  
)
WHERE rNum BETWEEN 1 and 10;


SELECT B.*, M.name FROM member M INNER JOIN board B
ON M.id=B.id WHERE num=3;

select * from member;




--���� ���ε�� �ٿ�ε带 ���� ���̺� ����
drop table myfile;
create table myfile (
    idx number primary key, --�Ϸù�ȣ
    name varchar2(50) not null, --�ۼ���
    title varchar2(200) not null, --����
    cate varchar2(100), --ī�װ�
    ofile varchar2(100) not null, -- ���� ���ϸ�
    sfile varchar2(30) not null, --����� ���ϸ�
    postdate date default sysdate not null --�ۼ���, ����� ��¥
);

select * from myfile;


--220325 ��������
--�� 2 ����� ����÷���� �Խ��� ���̺���� ����
create table mvcboard(
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    postdate date default sysdate not null,
    ofile varchar2(200),
    sfile varchar2(30),
    downcount number(5) default 0 not null,
    pass varchar2(50) not null,
    visitcount number default 0 not null
);

commit;

insert into mvcboard (idx, name, title, content, pass)
    values(seq_board_num.nextval, '������','�ڷ�� ����1 �Դϴ�','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values(seq_board_num.nextval, '�庸��','�ڷ�� ����2 �Դϴ�','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values(seq_board_num.nextval, '�̼���','�ڷ�� ����3 �Դϴ�','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values(seq_board_num.nextval, '������','�ڷ�� ����4 �Դϴ�','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values(seq_board_num.nextval, '������','�ڷ�� ����5 �Դϴ�','����','1234');
    
commit;
select * from mvcboard;



------------------------------------------------------------------------------

select * from product;

--product table ����
create table product (
	productId varchar2(50) primary key,
	pname varchar2(50) not null,
	unitPrice number not null,
	description varchar2(2000) not null,
	manufacturer varchar2(50) not null,
	category varchar2(50) not null,
	unitsInStock number not null,
	condition varchar2(50) not null,
	filename varchar2(200),
	quantity number default 0  not null,
    postdate date default sysdate not null
);

drop table product;

--product ���̺� productId �� ���� ������ ����
create sequence seq_product_num
increment by 1 
minvalue 1
nomaxvalue
nocycle
nocache;


insert into product (productId, pname, unitPrice, description, manufacturer, category, unitsInStock, condition)
    values('P1234', 'iPhone 6s', '800000', '4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera' ,
            'apple', 'smart phone', '10', 'New');
            
            
insert into product (productId, pname, unitPrice, description, manufacturer, category, unitsInStock, condition)
    values('P1235', 'ipad air 4', '900000', '212.8*125.6*6.6mm, Super Amoled display' ,
            'apple', 'tablet', '3', 'Old');

            
insert into product (productId, pname, unitPrice, description, manufacturer, category, unitsInStock, condition)
    values('P1236', 'LG-PC', '1500000', '13.3-inch, IPS LED display,' ,
            'LG', 'Notebook', '5', 'Refurbished');
            
            
delete from product where productId='P1236';

select * from product;
SELECT * FROM product;
            
SELECT * FROM ( 
    SELECT Tb.*, rownum rNum FROM (  
        SELECT * FROM product ORDER BY postdate DESC ) Tb  
);


create table a (
num number(5)
);

create table b(
body varchar2(50)
);









