


-- 			AULA 15 BANCO DE DADOS________
-- 			_Banco de dados relacionais_

use cadastro;
-- Criar relação de Gafanhotos n-Prefere-1 Curso, relação de um para muitos, respectivamente.
describe gafanhotos;

alter table gafanhotos
add column cursoPreferido int;

alter table gafanhotos
add foreign key (cursoPreferido)
references cursos(idcurso);


