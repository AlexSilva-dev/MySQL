

/* 		

			Exercícios Guanabara Aula 12__________

Exercícios: https://youtu.be/q4hPo83-Buo?t=2003
*/

-- 1
select * from gafanhotos
where sexo = 'F'
order by nome;

-- 2
select nome, nascimento, nacionalidade from gafanhotos 
where nascimento between '2000-01-01' and '2015-12-31'
order by nascimento;

-- 3
select * from gafanhotos
where profissao = 'programador'
order by nome;

-- 4 
select * from gafanhotos 
where sexo = 'F' and nacionalidade = 'Brasil' and nome like 'j%';

-- 5
select nome, nacionalidade from gafanhotos
where sexo = 'M' and nome like '%Silva%' and nacionalidade != 'Brasil' and peso < '100'
order by nome;

-- 6
select max(altura) from gafanhotos
where sexo = 'M';

-- 7
select avg(peso) from gafanhotos;

-- 8
select min(peso) from gafanhotos
where sexo = 'F' and nacionalidade != 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

-- 9
select count(*) from gafanhotos
where sexo = 'F' and altura > '1.9';