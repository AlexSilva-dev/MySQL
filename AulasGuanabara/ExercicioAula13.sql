

/*
				Exercício Guanabara Aula 13
                
https://youtu.be/1GLwFhDHmYM
*/


-- 1
select profissao, count(profissao) from gafanhotos
group by profissao;

-- 2
select sexo, count(sexo) from gafanhotos
where nascimento > '2005-01-01'
group by sexo;

-- 3 
select nacionalidade, count(nacionalidade) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(nacionalidade) > 3;

-- 4
select altura, count(altura) from gafanhotos
where peso > '100' and altura > (select avg(altura) from gafanhotos)
group by altura;

select altura, count(altura) from gafanhotos
where peso > '100'
group by altura
having altura > (select avg(altura) from gafanhotos);






