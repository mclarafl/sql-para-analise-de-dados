-- Exercícios

-- Exercício 1
-- Identifique qual é o status profissional mais frequente entre os clientes
-- que compraram automóveis no site
select cus.professional_status, count(fun.paid_date)
from sales.funnel as fun inner join sales.customers as cus
on cus.customer_id = fun.customer_id
group by cus.professional_status
order by count(fun.paid_date) desc

-- Exercício 2
-- Identifique qual é o gênero mais frequente nos clientes que
-- mais compraram automóveis no site
-- Obs: Utilizar a tabela temp_tables.ibge_genders

select ibge.gender, count(fun.paid_date)
from sales.funnel as fun left join sales.customers as cus
	on fun.customer_id = cus.customer_id
left join temp_tables.ibge_genders as ibge
	on lower(cus.first_name) = ibge.first_name
group by ibge.gender
order by count(fun.paid_date) desc

-- Exercício 3
-- Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions

select reg.region, count(fun.visit_page_date) as visitas
from sales.funnel as fun left join sales.customers as cus
	on cus.customer_id = fun.customer_id
left join temp_tables.regions as reg
	on lower(reg.city) = lower(cus.city)
	and cus.state = reg.state
group by reg.region
order by visitas desc

-- Exercício 4
-- Identifique quais são as marcas de veículos mais visitadas na tabela sales.funnel

select prod.brand, count(fun.visit_page_date) as visitas
from sales.funnel as fun left join sales.products as prod
on fun.product_id = prod.product_id
group by prod.brand
order by visitas desc

-- Exercício 5
-- Identifique quais são as lojas de veículos mais visitadas na tabela sales.funnel

select str.store_name, count(fun.visit_page_date) as visitas
from sales.stores as str left join sales.funnel as fun
on str.store_id = fun.store_id
group by str.store_name
order by visitas desc

-- Exercício 6
-- Identifique quantos clientes moram em cada tamanho de cidade
-- O porte da cidade consta na coluna size da tabela temp_tables.regions

select reg.size, count(*) as contagem
from sales.customers as cus left join temp_tables.regions as reg
on lower(cus.city) = lower(reg.city)
and cus.state = reg.state
group by reg.size
order by contagem desc