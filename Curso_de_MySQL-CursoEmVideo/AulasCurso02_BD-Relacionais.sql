


/* 			AULA 15 BANCO DE DADOS________
Assunto: _Banco de dados relacionais_
*/
use cadastro;
-- 			Criar relação de Gafanhotos n-Prefere-1 Curso, relação de um para muitos, respectivamente.
describe gafanhotos;

alter table gafanhotos
add column cursoPreferido int;

alter table gafanhotos
add foreign key (cursoPreferido) -- add uma chave estrangeira na entidade gafanhotos
references cursos(idcurso); -- e referenciamos ela com a chave primária da entidade que vamos criar a relação


-- Relacionando gafanhotos com cursos:
select * from gafanhotos order by nome;
select * from cursos;

update gafanhotos set cursoPreferido = '4'
where id = '1';

update gafanhotos set cursoPreferido = '2'
where id = 7;


-- Exibir os gafanhotos relacionados com os cursos - inner join
select gafanhotos.nome, gafanhotos.cursoPreferido, cursos.nome, cursos.ano 
from gafanhotos inner join cursos -- join = junta as entidades | inner join = junta todos os dados que tem relações (somente que tem relações)
on gafanhotos.cursoPreferido = cursos.idcurso;

select gafanhotos.nome, cursos.nome, cursos.totaulas, cursos.ano
from gafanhotos inner join cursos 
on gafanhotos.cursoPreferido = cursos.idcurso
order by gafanhotos.nome;


-- outer join
select gafanhotos.nome, gafanhotos.profissao, cursos.nome
from gafanhotos left outer join cursos -- outer da preferência a uma das entidades, exibindo todasas linhas inclusive aqueles que não tem relação, escolhendo com left ou right, qual será a preferência
on gafanhotos.cursoPreferido = cursos.idcurso
order by gafanhotos.nome;

select gafanhotos.nome, cursos.nome, cursos.ano
from gafanhotos right outer join cursos
on gafanhotos.cursoPreferido = cursos.idcurso
order by cursos.nome;


-- Apelidos de entidades
select g.nome, g.nascimento, c.nome, c.totaulas, c.ano
from gafanhotos as g inner join cursos as c -- usando 'as' eu consigo por um apelido na entidade
on g.cursoPreferido = c.idcurso
order by g.nascimento desc;

select p.nome, p.profissao, c.nome, c.totaulas
from gafanhotos as p 	left outer join 	cursos as c -- OBS; posso esconder o outer ('left join' ou 'right join')
on p.cursoPreferido = c.idcurso
order by p.nome;


-- 			AULA 16 BANCO DE DADOS________ última aula

-- criando relação de muitos para muitos, nessa relação é necessário criar uma nova tabela com as chaves estrangeiras das entidades que irão se relacionar
create table gafanhotos_assiste_cursos(
	id int not null auto_increment,
    dia date,
    idGafanhoto int not null,
    idCurso int not null,
    primary key (id),
    foreign key (idCurso) references cursos(idcurso),
    foreign key (idGafanhoto) references gafanhotos(id)
    
) default charset = utf8mb4;

show tables;

-- add relação - Basta inserir registro
insert into gafanhotos_assiste_cursos values
(default, '2022-01-03', '1', '11');


select * from gafanhotos_assiste_cursos;


