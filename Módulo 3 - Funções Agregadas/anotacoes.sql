-- Funções agregadas
-- Servem para executar operações aritméticas nos registros de uma coluna

-- Tipos
-- count()
-- sum()
-- min()
-- max()
-- avg()

-- Exemplo 1
-- Conte todas as visitas realizadas ao site da empresa fictícia
select count (*)
from sales.funnel

-- Exemplo 2
-- Conte todos os pagamentos registrados na tabela sales.funnel
select count (paid_date)
from sales.funnel

-- Exemplo 3 
-- Conte todos os produtos distintos visitados em jan/21
select count (distinct product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'

-- Outras Funções

-- Exemplo 4
-- Calcule o preço mínimo, máximo e médio dos produtos da tabela products
select min(price), max(price), avg(price)
from sales.products

-- Exemplo 5
-- Informe qual é o veículo mais caro da tabela products
select *
from sales.products
where price = (select max(price)
from sales.products)


-- Group By
-- Serve para agrupar registros semelhantes de uma coluna

-- Exemplo 1
-- Calcule o n° de clientes da tabela customers por estado
select state, count (*) as contagem
from sales.customers
group by state
order by contagem desc

-- Exemplo 2
-- Calcule o n° de clientes por estado e status profissional
select state, professional_status, count (*) as contagem
from sales.customers
group by state, professional_status
order by state, contagem desc

-- Exemplo 3 
-- Selecione os estados distintos na tabela customers utilizando group by
select state
from sales.customers
group by state


-- Having
-- Serve para filtrar linhas de seleção por uma coluna agrupada

-- Exemplo 1 
-- Calcule o n° de clientes por estado filtrando apenas estados acima de 100 clientes
select state, count (*)
from sales.customers
group by state
having count(*) > 100