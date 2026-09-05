-- Subqueries
-- São consultas inseridas dentro de outras consultas
-- Servem para utilizar o resultado de uma consulta em outra consulta

-- Tipos
-- Subquery no Where
-- Subquery com With
-- Subquery no From
-- Subquery no Select

-- Exemplos
-- Exemplo 1 — Subquery no Where
-- Informe qual é o veículo mais barato da tabela products

select *
from sales.products
where price = (select min(price) from sales.products)

-- Exemplo 2 — Subquery com With
-- Calcule a idade média dos clientes por status profissional

with alguma_tabela as (
select
	professional_status,
	(current_date - birth_date)/365 as idade
from sales.customers
)

select
	professional_status,
	avg(idade) as idade_media
from alguma_tabela
group by professional_status

-- Exemplo 3 — Subquery no From
-- Calcule a média de idades dos clientes por status profissional
select
	professional_status,
	avg(idade) as idade_media
from (
		select
			professional_status,
			(current_date - birth_date)/365 as idade
		from sales.customers
	 ) as alguma_tabela
group by professional_status


-- Exemplo 4 — Subquery no Select
-- Na tabela sales.funnel, crie uma coluna que informe o nº de visitas acumuladas
-- que a loja visitada recebeu até o momento

select
	fun.visit_id,
	fun.visit_page_date,
	sto.store_name,
	(
		select count(*)
		from sales.funnel as fun2
		where fun2.visit_page_date <= fun.visit_page_date
			and fun2.store_id = fun.store_id
	) as visitas_acumuladas
from sales.funnel as fun
left join sales.stores as sto
	on fun.store_id = sto.store_id
order by sto.store_name, fun.visit_page_date


-- Outros exemplos de subqueries

-- Exemplo 5
-- Calcule o volume de visitas por dia ao site separado por 1ª visita e demais visitas

with primeira_visita as (

	select customer_id, min(visit_page_date) as visita_1
	from sales.funnel
	group by customer_id

)

select
	fun.visit_page_date,
	(fun.visit_page_date <> primeira_visita.visita_1) as lead_recorrente,
	count(*)

from sales.funnel as fun
left join primeira_visita
	on fun.customer_id = primeira_visita.customer_id
group by fun.visit_page_date, lead_recorrente
order by fun.visit_page_date desc, lead_recorrente


-- Exemplo 6
-- Análise do preço em relação ao preço médio
-- Calcule, para cada visita ao site, quanto o preço de um veículo visitado pelo cliente
-- estava acima ou abaixo do preço médio dos veículos daquela marca
-- Leve em consideração o desconto dado no veículo

with preco_medio as (

	select brand, avg(price) as preco_medio_da_marca
	from sales.products
	group by brand

)

select
	fun.visit_id,
	fun.visit_page_date,
	pro.brand,
	(pro.price * (1+fun.discount)) as preco_final,
	preco_medio.preco_medio_da_marca,
	((pro.price * (1+fun.discount)) - preco_medio.preco_medio_da_marca) as preco_vs_media

from sales.funnel as fun
left join sales.products as pro
	on fun.product_id = pro.product_id
left join preco_medio
	on pro.brand = preco_medio.brand
