use project2;

create table review(
   rnum int not null auto_increment primary key,
   title varchar(500) not null,
   content varchar(500) not null,
   regdate date not null,
   id varchar(10) not null,
   gradepoint float null default 0.0,
   contentsno int(7) not null,
   ordersize varchar(10) not null,
   foreign key(contentsno) references contents(contentsno)
   );


drop table review;

select * from contents;
select * from review;
insert into review(content, regdate, id, bbsno) values ('의견입니다6', sysdate(),'유저6',1);

select rnum, contentsno,title ,content, regdate, id, gradepoint, ordersize
from review
 where contentsno =1;

select count(*) from review
where contentsno = 1;

INSERT INTO review(title, content ,regdate, id, gradepoint, contentsno, ordersize)
VALUES('title', 'test', sysdate() , 'id', 0.0, 1,'L');

 update contents
 set gradepoint = (select IFNULL(avg(gradepoint), 0) from review where contentsno= 1)
 where  contentsno = 1;
