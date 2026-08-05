-- Select
-- Serve para selecionar colunas de tabelas

-- (Exemplo 1)
-- Liste os e-mails dos clientes da tabela sales.customers
select email
from sales.customers


-- (Exemplo 2)
-- Liste os emails e nomes dos clientes da tabela sales.customers
select email, first_name, last_name
from sales.customers


-- (Exemplo 3)
-- Liste todos as informações dos clientes da tabela sales.customers
select *
from sales.customers


-- Distinct
-- Serve para remover linhas duplicadas e mostrar apenas linhas distintas

-- (Exemplo 1)
-- Liste as marcas de carro distintas que constam na tabela products
select distinct brand
from sales.products

-- (Exemplo 2) 
-- Liste as marcas e anos de modelo distintos que constam na tabela products
select distinct brand, model_year
from sales.products


-- Where
-- Serve para filtrar linhas de acordo com uma condição

-- (Exemplo 1)
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
select email, state
from sales.customers
where state='SC'


-- (Exemplo 2)
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul
select email, state
from sales.customers
where state='SC' or state='MS'


-- (Exemplo 3)
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos
select email, state, birth_date
from sales.customers
where (state='SC' or state='MS') and birth_date < '1991-12-28'


-- Order by
-- Serve para ordenar a seleção de acordo com uma regra definida pelo usuário

-- (Exemplo 1) 
-- Liste produtos da tabela products na ordem crescente com base no preço
select *
from sales.products
order by price

select *
from sales.products
order by price desc -- Caso queira na ordem decrescente


-- (Exemplo 2)
-- Liste os estados distintos da tabela customers na ordem crescente
select distinct state
from sales.customers
order by state

-- Limit
-- Serve para limitar o nº de linhas da consulta.

-- (Exemplo 1) 
-- Liste as 10 primeiras linhas da tabela funnel
select *
from sales.funnel
limit 10


-- (Exemplo 2) 
-- Liste os 10 produtos mais caros da tabela products
select *
from sales.products
order by price desc
limit 10