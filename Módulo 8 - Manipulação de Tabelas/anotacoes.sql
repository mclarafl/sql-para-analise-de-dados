-- Manipulação de Tabelas
-- Criação e exclusão

-- Exemplos

-- Exemplo 1 - Criação de tabela a partir de uma query
-- Crie uma tabela chamada customers_age com o id e a idade dos clientes
-- Chame-a de temp_tables.customers_age
-- Utiliza a função datediff criada no módulo anterior

select
	customer_id,
	datediff('years', birth_date, current_date) as idade_cliente
into temp_tables.customers_age
from sales.customers

select *
from temp_tables.customers_age

-- Exemplo 2 - Criação de tabela a partir do zero
-- Crie uma tabela com a tradução dos status profissionais dos clientes
-- Chame-a de temp_tables.profissoes

create table temp_tables.profissoes (
	professional_status varchar,
	status_profissional varchar
)

insert into temp_tables.profissoes (
	professional_status,
	status_profissional
)

values
	('freelancer', 'freelancer'),
	('retired', 'aposentado'),
	('clt', 'clt'),
	('self_employed', 'autônomo(a)'),
	('other', 'outro'),
	('businessman', 'empresário(a)'),
	('civil_servant', 'funcionário público(a)'),
	('student', 'estudante')

select *
from temp_tables.profissoes


-- Manipulação de Linhas
-- Inserção, atualização e exclusão

-- Exemplos

-- Exemplo 1 - Inserção de linhas
-- Insira as linhas referentes aos status 'desempregado(a)' e 'estagiário(a)'
-- na tabela temp_tables.profissoes

insert into temp_tables.profissoes (
	professional_status,
	status_profissional
)

values
	('unemployed', 'desempregado(a)'),
	('trainee', 'estagiário(a)')

select *
from temp_tables.profissoes

-- Exemplo 2 - Atualização de linhas
-- Altere o código do status 'estagiário(a)' de 'trainee' para 'intern'

update temp_tables.profissoes
set professional_status = 'intern'
where status_profissional = 'estagiário(a)'

-- Exemplo 3 - Exclusão de linhas
-- Exclua as linhas dos status 'desempregado(a)' e 'estagiário(a)'

delete from temp_tables.profissoes
where status_profissional = 'estagiário(a)'
or status_profissional = 'desempregado(a)'


-- Manipulação de Colunas
-- Inserção, alteração e exclusão

-- Exemplos

-- Exemplo 1 - Inserção de coluna
-- Insira uma coluna na tabela sales.customers com a idade do cliente
-- Utiliza a função datediff criada no módulo anterior

alter table sales.customers
add customer_age int

select *
from sales.customers

update sales.customers
set customer_age = datediff('years', birth_date, current_date)
where true

-- Exemplo 2 - Alteração do tipo da coluna
-- Altere o tipo da coluna customer_age de inteiro para varchar

alter table sales.customers
alter customer_age type varchar

-- Exemplo 3 - Alteração do nome da coluna
-- Renomeie a coluna customer_age para age

alter table sales.customers
rename column customer_age to age

-- Exemplo 4 - Exclusão de coluna
-- Exclua a coluna age

alter table sales.customers
drop column age


-- Exclusão de Tabelas

-- Exemplo 1
-- Exclua a tabela temp_tables.profissoes após a conclusão dos exemplos

drop table temp_tables.profissoes