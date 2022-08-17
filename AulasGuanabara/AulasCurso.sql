
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



-- 		AULA 11 BANCO DE DADOS

use cadastro;
select * from cursos;
select * from gafanhotos;

-- ordena por campos
select * from gafanhotos
order by nome; 

-- ordenar por campo mais decrecente 
select * from gafanhotos
order by nome desc;

-- filtrar colunas para não exibir todas e não ter infomações desnecessárias na tela 
select nome, profissao from gafanhotos
order by nome;

-- filtrar linhas
select nome, profissao from gafanhotos
where profissao = "programador"
order by nome;

-- filtrando por linhas e colocando um segundo parametro de ordem de dados
select nome, profissao, sexo from gafanhotos
where profissao = "programador"
order by sexo, nome; -- ordena por sexo e logo depois ordena por nome

select nome, profissao, altura from gafanhotos
where altura < '1.6' -- posso usar os operadores = < > != between and in
order by altura, nome;

select nome, altura from gafanhotos
where altura between '1.6' and '1.7' -- obs: a ordem que ponho os argumentos importa 
order by altura;

select nome, altura from gafanhotos
where altura in ('1.55', '1.65') -- eu escolho faixas especificas de valores
order by altura;

-- filtrando linhas com operadores logicos

select nome, altura from gafanhotos
where altura between '1.7' and '1.8' and sexo = 'F' 
order by altura;

select nome, altura from gafanhotos
where altura between '1.7' and '1.8' and sexo = 'M' 
order by altura;

--		AULA 12 DE BANCO DE DADOS 

-- operador LIKE ele pega elelementos parecidos com o argumento dado
use cadastro;

select nome, altura from gafanhotos
where altura like '2.%'; --  % é um caracter coringa no qual pode ser substituido por qualquer coisa inclusive nada

select nome, profissao from gafanhotos
where nome like 'A%'; -- começa com A 	*OBS; não importa se é maiúsculo ou minúsculo 

select nome, profissao from gafanhotos
where nome like '%á'; -- termina com a		*OBS; não importa os acéntos 

select nome, profissao from gafanhotos
where nome like '%b%'; -- pega os nomes que tem A em qualquer lugar, seja no começo, final ou meio.

select nome, profissao from gafanhotos
where nome like '_a%'; -- _ obriga a ter um caracter no seu lugar ou seja, não pode ser vazio

select nome, profissao from gafanhotos
where nome like '__a%'; 

select nome from gafanhotos
where nome like '%silva%';

-- exibe todas as diferenças de determinado campo ou seja, sem repetição
select distinct profissao from gafanhotos
order by profissao;


-- count() - conta a quantidade registro
select count(*) from gafanhotos;

select count(*) from gafanhotos
where altura > '1.6'; 

select count(*) from gafanhotos
where nome like 'a%'; -- conta quantas pessoas que tem o nome começando em A

-- max() - mostra o maior elemento do campo && min() mostra o menor 
select max(altura) from gafanhotos;
select min(altura) from gafanhotos;


-- sum() - soma um campo/coluna
select * from cursos;

select sum(totaulas) from cursos;

select sum(totaulas) from cursos
where ano between '2015' and '2017';


-- avg() - calcula a média de um campo/coluna
select avg(totaulas) from cursos;

select avg(altura) from gafanhotos;

--		AULA 13 BANCO DE DADOS________

-- agrupamentos - agrupa os campos repetidos, mas sem contar não da para ver diferença entre distinct
select carga from cursos
group by carga
order by carga;

select carga, count(*) from cursos
group by carga
order by carga;

select altura, count(altura) from gafanhotos
where altura > '1.5'
group by altura
order by altura;

select altura, count(altura) from gafanhotos
where altura > '1.5'
group by altura
order by count(altura) desc; -- ordenando por quantidade de elementos no agrupamento

-- having 
select altura, count(altura) from gafanhotos
group by altura
having count(*) > 3
order by count(*) desc;


