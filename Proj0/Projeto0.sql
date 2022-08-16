show databases;

create database Proj0
default character set utf8mb4 
default collate utf8mb4_general_ci;

drop database Servicos;
drop database teste;


use Proj0;
show tables;

create table servicos(
	servicos varchar(30),
    valor float,
    tempoHR int
    
)default charset = utf8mb4;

describe servicos;

alter table servicos 
add column idServ int not null auto_increment first;

alter table servicos 
add primary key(idServ);

insert into servicos values
('Sombrancelha', '20', '1');

select * from servicos;

create table cliente(
	idCliente int not null auto_increment,
	nome varchar(40),
    dia date, 
    hora time,
    primary key(idCliente)
  
) default charset = utf8mb4;

describe cliente;