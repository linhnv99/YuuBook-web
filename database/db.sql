create database yuubook;
use yuubook;

create table category(
	cate_id int not null auto_increment,
    cate_name varchar(100),
    primary key(cate_id)
);
create table product(
	product_id int not null auto_increment,
    product_name text not null,
    image varchar(50),
    price decimal(9) not null,
    quantity int,
    cate_id int not null,
	des text,
    discount int,
    primary key(product_id),
    constraint Fk_cate foreign key(cate_id) references category(cate_id)
);
drop table product;
create table user(
	user_id int not null auto_increment,
    name varchar(50) not null,
    username varchar(50)  not null unique ,
    password varchar(50) not null,
    image varchar(50),
    email varchar(80) not null,
    level int not null,
    location text,
    phone varchar(20),
    primary key(user_id)
);

create table cart(
	cart_id varchar(80) not null,
    user_id int not null,
    c_name varchar(50) not null,
    c_email varchar(80) not null,
    c_address text,
    c_phone varchar(20),
    buy_date varchar(80),
    status int,
	primary key(cart_id),
    constraint Fk_user_cart foreign key(user_id) references user(user_id)
);
drop table cart;
create table cartItem(
	id varchar(80) not null,
    quantity int,
    unit_price decimal(9,1),
    product_id int not null,
    cart_id varchar(80) not null,
    primary key(id),
    constraint Fk_cartI_P foreign key(product_id) references product(product_id),
	constraint Fk_cartI_C foreign key(cart_id) references cart(cart_id)
);
drop table cartItem;

use yuubook;
select * from cart;
select * from cartitem;
insert into cart values("123",1,"12-2-2020",0);
select * from cart inner join cartItem on cart.cart_id = cartItem.cart_id;
select cart.cart_id,c_name,c_email,c_address,c_phone,buy_date, status, user.user_id from cart inner join user on cart.user_id = user.user_id WHERE status = 0 order by buy_date ASC limit 0,5;
select cartItem.id, quantity, unit_price, product_id, cart.cart_id from cartItem inner join cart on cartItem.cart_id = cart.cart_id where cart.cart_id = "53d38827-a7f2-4255-8060-f2b77ad4977e";


select * from category;
select category.cate_id, count(*) as"sosanpham" from category inner join product on category.cate_id = product.cate_id group by category.cate_id;
select *  from category inner join product on category.cate_id = product.cate_id where category.cate_id = 2;
select * from product where cate_id = 2;
insert into product values(1,"Doremon tập 54", "Yuming5.jpg", 50000, 20, 2, "Mô tả sản phẩm",10);
select * from product where product_name Like '%%' and cate_id = 2 order by product_name ASC;
SELECT * FROM product WHERE product.cate_id = 2;
	
ALTER table product add discount int;
alter table user add phone varchar(20);
select* from product where product_name Like '%conan%' limit 0,2;
SELECT COUNT(*) FROM product WHERE product_name LIKE '%conan%';
select * from cart;
select * from user;
drop table user;
-- drop table cart;
-- drop table product;
-- insert into user values(1, "Nguyễn Viết Linh", "Yuming", "yuu55","Yuming6.jpg", "nvlk12haui@gmail.com", 1, "Bắc Ninh");
-- insert into user values(3, "LinhLinh", "admin", "123","Yuming5.jpg", "demo1@gmail.com", 1, "Hà Nội");
-- insert into user values(2, "Linh", "linhnguyen", "123","", "demo@gmail.com", 2, "Hà Nội");
