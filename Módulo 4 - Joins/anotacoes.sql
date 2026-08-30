-- Joins
-- Servem para combinar dados de duas ou mais tabelas por meio de uma coluna em comum

-- Tipos

-- Inner Join
-- Retorna apenas os registros que possuem correspondência nas duas tabelas

-- Left Join
-- Retorna todos os registros da tabela da esquerda e os registros
-- correspondentes da tabela da direita
-- Quando não existe correspondência, os dados da tabela da direita aparecem como null

-- Right Join
-- Retorna todos os registros da tabela da direita e os registros
-- correspondentes da tabela da esquerda
-- Quando não existe correspondência, os dados da tabela da esquerda aparecem como null

-- Full Join
-- Retorna todos os registros das duas tabelas
-- Quando não existe correspondência, os dados da outra tabela aparecem como null

-- Exemplo 1
-- Utilizando LEFT JOIN para combinar as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
select * from temp_tables.tabela_1
select * from temp_tables.tabela_2


select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 left join temp_tables.tabela_2 as t2
on t1.cpf = t2.cpf

-- Exemplo 2  
-- Utilizando INNER JOIN para combinar as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 inner join temp_tables.tabela_2 as t2
on t1.cpf = t2.cpf

-- Exemplo 3  
-- Utilizando RIGHT JOIN para combinar as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

select t2.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 right join temp_tables.tabela_2 as t2
on t1.cpf = t2.cpf

-- Exemplo 4
-- Utilizando FULL JOIN para combinar as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

select coalesce(t1.cpf, t2.cpf) as cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 full join temp_tables.tabela_2 as t2
on t1.cpf = t2.cpf