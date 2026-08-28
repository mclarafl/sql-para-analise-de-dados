-- DESAFIO

-- EXERCÍCIOS
-- Exercício 1
-- Conte quantos clientes da tabela sales.customers têm menos de 30 anos
select count(*)
from sales.customers
where birth_date >= '01-01-1997'

-- Exercício 2
-- Informe a idade do cliente mais velho e mais novo da tabela sales.customers
select min(birth_date), max(birth_date)
from sales.customers

-- Exercício 3
-- Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possivelmente a resposta contém mais de um cliente)
select *
from sales.customers
where score =( select max(score) from sales.customers)

-- Exercício 4
-- Conte quantos veículos de cada marca estão registrados na tabela sales.products
-- Ordene o resultado pelo nome da marca
select brand, count (*)
from sales.products
group by brand
order by brand

-- Exercício 5
-- Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pelo nome da marca e pelo ano do veículo
select brand, model_year, count (*)
from sales.products
group by brand, model_year
order by brand, model_year

-- Exercício 6
-- Conte quantos veículos de cada marca estão registrados na tabela sales.products
-- e mostre apenas as marcas que contenham mais de 10 veículos registrados
select brand, count(*)
from sales.products
group by brand
having count(*) > 10
order by count(*)