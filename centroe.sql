create database CentroE;
use CentroE;

create Table user(
id int not null auto_increment,
nombre varchar(50) not null,
edad int not null,
email varchar(100) not null,
primary key (id)
);

insert into user (nombre, edad, email) values ("Juan", 25, "juan@juan.com");
insert into user (nombre, edad, email) values ("Pedro", 26, "pedro@pedro.com");
insert into user (nombre, edad, email) values ("Maria", 24, "maria@maria.com");
insert into user (nombre, edad, email) values ("Nicolas", 20, "Nico@nico.com");

select * from user; 
UPDATE user SET edad= 35 WHERE id=1;
DELETE from user where id=1;  
