CREATE TABLE cart(
cartno                         int  NOT NULL  PRIMARY KEY auto_increment, -- 장바구니 fk   
id		varchar(20) not null,
contentsno                   int  NOT NULL ,                        -- 상품번호(F)
quantity                     int  NOT NULL,                     -- 수량
pname                       VARCHAR(50)  NOT NULL,        -- 상품이름
size                           varchar(3)  NOT null,               -- 사이즈
price int not null,
filename VARCHAR(100) NULL,
FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

select * from cart;
drop table cart;

       SELECT count(*)
        FROM cart
        where id = 'admin';
        
        SELECT contentsno, quantity, pname, size
        FROM cart
        where cartno = 1;

insert into cart(
mname , contentsno, quantity,   pname, size , price, filename)
values('이름',1,2,'상품이름', 'M',1200,'사진.jpg' );


delete from cart
where cartno = 17;