-- Exercícios

-- Exercício 1
-- Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers

with alguma_tabela as (
select cus.first_name, cus.customer_id, count(fun.visit_page_date) as numero_visitas
from sales.customers as cus left join sales.funnel as fun
on fun.customer_id = cus.customer_id
group by cus.customer_id
)

select first_name, customer_id, numero_visitas
from alguma_tabela
