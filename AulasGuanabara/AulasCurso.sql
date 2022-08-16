
--		AULA 3 BANCO DE DADOS ___________
use cadastro;
create table pessoas(
nome varchar(30),
idade tinyint(3),
sexo char(1),
peso float,
altura float,
nacionalidade varchar(20)
);

describe pessoas;


-- 		AULA 4 BANCO DE DADOS ____________

create database cadastro
default character set utf8
default collate utf8_general_ci;

use cadastro;
create table pessoas(
	id int not null auto_increment,
	nome varchar(30) not null,
    nascimento date,
    sexo enum( 'M', 'F'),
    altura decimal(3,2),
    peso decimal(5,2),
    nacionalidade varchar(20) default 'Brasil',
    primary key(id)
) default charset = utf8;


--		AULA 5 BANCO DE DADOS ___________

insert into pessoas
( nome, nascimento, sexo, altura, peso, nacionalidade)
values
( 'Alex da Silva', '2001-11-09', 'M', '1.70', '78', 'Brasil') ;

-- definição usando default
insert into pessoas values
(default, 'Algiza', '1997-08-02', 'F', '1.70', '70', default);

-- definição em sequencia
insert into pessoas values
(default, 'Alzaias', '1999-02-11', 'F', '1.88', '88', default),
(default, 'Malaquias', '1987-11-15', 'M', '1.77', '76', default);

-- mostra os registros criados
select * from pessoas;

--		AULA 6 BANCO DE DADOS________

use cadastro;
-- add colunas no final da tabela
alter table pessoas
add column profissao varchar(10);

-- add no inicio
alter table pessoas
add column profissao varchar(10) first;

-- add em baixo de alguma campo/coluna qualquer
alter table pessoas
add column profissao varchar(10) after nome;

-- excluir culuna da tabela
alter table pessoas
drop column profissao;

-- modificar campos/colunas da tabela
alter table pessoas
modify column profissao varchar(30);

-- modificar nome de um dos campos/colunas
alter table pessoas
change column profissao prof varchar(20);
describe pessoas;

-- mudar nome da tabela 
alter table pessoas
rename to usuarios;

describe usuarios;
select * from usuarios;

--
create table if not exists cursos(
	nome varchar(30) not null unique,
    descricao text,
    carga int unsigned, -- unsigner é para desconsiderar o sinal e economizar espaço.
    totalAulas int unsigned,
    ano year default '2022'
) default charset= utf8mb3;

-- 		AULA 7 BANCO DE DADOS

use cadastro;

alter table cursos
add column idcurso int not null auto_increment,
add primary key(idcurso);

describe cursos;
insert into cursos 
(nome, descricao, carga, totalAulas, ano)
values
 ('HTML4','Curso de HTML5','40','37','2014'),
 ('Algoritimos','Logica de Programação','20','8','2014'),
 ('Photoshop','Aulas de Photoshop CC','9','20','2014'),
 ('PGP','PHP para Iniciantes','33','40','2010'),
 ('Jarva','Intro ao Java','22','10','2000'),
 ('MySQL','Curso MySQL','21','15','2016'),
 ('World','Word Completo','40','30','2018'),
 ('Sapateado','Dança Rítimica','14','30','2018'),
 ('Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'),
 ('YouTuber','Gerar Polêmicas e Ganhar Inscritos','5','2','2010');

select * from cursos;

-- modificar as linhas dos registros/ modificar os dados da tabela, por linha
update cursos
set nome = 'HTML5'
where idcurso = '1';

--
update cursos
set nome = 'PHP', ano = '2015'
where idcurso = '4';

--
update cursos 
set nome = 'JAVA', carga = '40', ano = '2015'
where idcurso = '5'
limit 1; 

-- deletar dados
delete from cursos
where idcurso = '7';

delete from cursos
where idcurso = '8';

delete from cursos
where idcurso = '9';

delete from cursos
where idcurso = '10';
-- 		AULA 08 BANCO DE DADOS

