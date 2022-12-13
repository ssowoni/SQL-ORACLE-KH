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
('webmarket','1234','김남일', '관리자','lotlapis@gmail.com','010-3795-3028', '1');

insert into users (id, pass, name, nickname, email, phoneNum, admin )values
('thdnjs0946','1234','박소원','관리자1','th@naver.com','010-1234-5678', '1');

delete from users where name='박소원';

select * from users;


create table board(
num number not null, -- 게시글 번호
title VARCHAR2(200) not null, -- 게시글 제목
content varchar2(2000) not null, -- 게시글 내용
nickname varchar2(10) not null, -- 작성자 nickname
imagename varchar2(200), --이미지 첨부 파일 이름
postdate date default sysdate not null, --게시판 등록날짜, 작성일
CONSTRAINT board_pk primary key(num, nickname)
);

select * from board;

SELECT B.*, M.id FROM users M INNER JOIN board B
ON M.nickname=B.nickname WHERE num=6;

select * from board;

    
select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
from user_constraints
where table_name = 'BOARD';

--시퀀스 설정
create sequence seq_board_num
increment by 1  --증가치
--START WITH 1
minvalue 1
nomaxvalue
nocycle
nocache;

insert into board (num, title, content, nickname)
    values(seq_board_num.nextval,'게시판 테스트','게시판 테스트 입니다ㅏ.' , '박소원');
insert into board (num, title, content, nickname)
    values(seq_board_num.nextval, '상품 문의드립니다.' , '상품에 흠집이 있어요 교환 되나요?' , '이순신');
    

delete from board where nickname='관리자1';


---------------------------------------------------
-- 새로 다시 

create table products (
	productId varchar2(20) primary key, -- 상품 아이디
	pname varchar2(20) not null, -- 상품명
	unitPrice number not null, -- 상품 가격
	description varchar2(100) not null, -- 상품 설명
	manufacturer varchar2(20) not null, -- 제조사
	category varchar2(20) not null, -- 분류, 목록표(리스트)
	unitsInStock number default 0 not null, -- 재고수
	condition varchar2(20) not null, -- 신상품 or 중고품 or 재생품
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
where title like '%배송%';

SELECT * FROM( SELECT Tb.*, ROWNUM rNum 
		FROM (  SELECT * FROM board WHERE title LIKE '%배송%'
        ORDER BY num DESC ) Tb )
		WHERE rNum BETWEEN 1 AND 10 ;
        
select * from seq_board_num;  
SELECT * FROM USER_SEQUENCES;
SELECT seq_comment_num.CURRVAL FROM DUAL;
SELECT seq_comment_num.NEXTVAL FROM DUAL;



        


