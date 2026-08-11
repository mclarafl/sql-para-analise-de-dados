-- Operadores aritméticos
-- Servem para executar operações matemáticas

-- TIPOS 
-- +
-- -
-- *
-- /
-- ^
-- %
-- || --> não é um operador aritmético


-- EXEMPLOS 

-- (Exemplo 1) Criação de coluna calculada
-- Crie uma coluna contendo a idade do cliente da tabela sales.customers
select
	email,
	birth_date,
	(current_date - birth_date) / 365 as idade_do_cliente
from sales.customers


-- (Exemplo 2) Utilização da coluna calculada nas queries
-- Liste os 10 clientes mais novos da tabela customers

select
	email,
	birth_date,
	(current_date - birth_date) / 365 as "idade do cliente"
from sales.customers
order by "idade do cliente"
limit 10

-- (Exemplo 3) Criação de coluna calculada com strings 
-- Crie a coluna "nome_completo" contendo o nome completo do cliente
select
	first_name || ' ' || last_name as nome_completo
from sales.customers


-- Operadores de comparação
-- Servem para comparar dois valores retornando TRUE ou FALSE

-- TIPOS
-- =
-- >
-- <
-- >=
-- <=
-- <>

-- EXEMPLOS 

-- (Exemplo 1) Uso de operadores como flag
-- Crie uma coluna que retorne TRUE sempre que um cliente for um profissional clt 
select
    customer_id,
	first_name,
    professional_status,
	(professional_status = 'clt') as cliente_clt
from sales.customers


-- Operadores Lógicos
-- Usados para unir expressões simples em uma composta

-- TIPOS 
-- AND
-- OR
-- NOT
-- BETWEEN
-- IN
-- LIKE
-- ILIKE
-- IS NULL


-- EXEMPLOS 

-- (Exemplo 1) Uso do comando BETWEEN 
-- Selecione veículos que custam entre 100k e 200k na tabela products
select *
from sales.products
where price between 100000 and 200000


-- (Exemplo 2)  Uso do comando NOT
-- Selecione veículos que custam abaixo de 100k ou acima 200k 
select *
from sales.products
where price not between 100000 and 200000


-- (Exemplo 3) Uso do comando IN
-- Selecionar produtos que sejam da marca HONDA, TOYOTA ou RENAULT
select *
from sales.products
where brand in ('HONDA', 'TOYOTA', 'RENAULT')


-- (Exemplo 4) Uso do comando LIKE 
-- Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ANA
select distinct first_name
from sales.customers
where first_name like 'ANA%'


-- (Exemplo 5) Uso do comando ILIKE (ignora letras maiúsculas e minúsculas)
-- Selecione os primeiros nomes distintos com iniciais 'ana'
select distinct first_name
from sales.customers
where first_name ilike 'ana%'


-- (Exemplo 6) Uso do comando IS NULL
-- Selecionar apenas as linhas que contém nulo no campo "population" na tabela
-- temp_tables.regions
select *
from temp_tables.regions
where population is null