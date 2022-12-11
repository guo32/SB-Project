create table review(
	num int not null auto_increment,
	id varchar(10) not null,
	name varchar(10) not null,
	b_id varchar(10) not null,
	content text not null,
	regist_day varchar(30),
	hit int,
	ip varchar(20),
	primary key (num)
)default CHARSET=utf8;