--테이블 목록 조회
select*from tab;
SELECT * FROM PRODUCT_COMPONENT_VERSION;



drop table member;
drop table board;
drop sequence seq_board_num;

--회원 테이블 생성
create table member(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null, --회원 가입날짜
    primary key (id)
    );
    
--모델1 방식의 게시판 테이블 생성
    create table board(
    num number primary key,
    title VARCHAR2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null, --게시판 등록날짜, 작성일
    visitcount number(6)                        --게시글 조회수
    );

--외래키 설정
alter table board
    add constraint board_mem_fk foreign key(id)
    references member(id);


--시퀀스 설정
create sequence seq_board_num
increment by 1  --증가치
--START WITH 1
minvalue 1
nomaxvalue
nocycle
nocache;

--더미 데이터 입력
insert into member (id,pass,name) values ('musthave','1234','머스트해브');
insert into member(id,pass,name) values ('test','1234','테스트');

insert into board (num, title, content, id, postdate, visitcount)
    values(seq_board_num.nextval, '제목1입니다','내용1입니다','musthave',sysdate,0);
    commit;
    
select*from member;
select*from board;

select a.* from board a,  member b where a.id = b.id;

--220314 수업내용
--rNum은 rownum의 별칭이다.
--rownum이 1부터 10까지인 레코드(행)을 출력한다.
SELECT * FROM ( 
    SELECT Tb.*, rownum rNum FROM (  
        SELECT * FROM board ORDER BY num DESC ) Tb  
)
WHERE rNum BETWEEN 1 and 10;


SELECT B.*, M.name FROM member M INNER JOIN board B
ON M.id=B.id WHERE num=3;

select * from member;




--파일 업로드와 다운로드를 위한 테이블 생성
drop table myfile;
create table myfile (
    idx number primary key, --일련번호
    name varchar2(50) not null, --작성자
    title varchar2(200) not null, --제목
    cate varchar2(100), --카테고리
    ofile varchar2(100) not null, -- 원본 파일명
    sfile varchar2(30) not null, --저장된 파일명
    postdate date default sysdate not null --작성일, 등록한 날짜
);

select * from myfile;


--220325 수업내용
--모델 2 방식의 파일첨부형 게시판 테이블더미 생성
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
    values(seq_board_num.nextval, '김유신','자료실 제목1 입니다','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values(seq_board_num.nextval, '장보고','자료실 제목2 입니다','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values(seq_board_num.nextval, '이순신','자료실 제목3 입니다','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values(seq_board_num.nextval, '강감찬','자료실 제목4 입니다','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values(seq_board_num.nextval, '대조영','자료실 제목5 입니다','내용','1234');
    
commit;
select * from mvcboard;



------------------------------------------------------------------------------

select * from product;

--product table 생성
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

--product 테이블 productId 값 위한 시퀀스 설정
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









