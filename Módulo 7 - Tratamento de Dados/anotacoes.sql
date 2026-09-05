-- Conversão de Tipos
-- Serve para transformar um dado de um tipo em outro

-- Tipos
-- Operador ::
-- Cast

-- Exemplos

-- Exemplo 1 - Conversão de texto em data
-- Corrija a query abaixo utilizando o operador ::

select '2021-10-01'::date - '2021-02-01'::date

-- Exemplo 2 - Conversão de texto em número
-- Corrija a query abaixo utilizando o operador ::

select '100'::numeric - '10'::numeric

-- Exemplo 3 - Conversão de número em texto
-- Corrija a query abaixo utilizando o operador ::

select replace(112122::text, '1', 'A')

-- Exemplo 4 - Conversão de texto em data
-- Corrija a query abaixo utilizando a função CAST

select cast('2021-10-01' as date) - cast('2021-02-01' as date)


-- Tratamento Geral
-- Permite classificar dados e substituir valores nulos

-- Tipos
-- Case When
-- Coalesce()

-- Exemplos

-- Exemplo 1 - Agrupamento de dados com CASE WHEN
-- Calcule o número de clientes que ganham abaixo de 5 mil, entre 5 mil e 10 mil,
-- entre 10 mil e 15 mil e acima de 15 mil

with faixa_de_renda as (
	select
		income,
		case
			when income < 5000 then '0-5000'
			when income >= 5000 and income < 10000 then '5000-10000'
			when income >= 10000 and income < 15000 then '10000-15000'
			else '15000+'
		end as faixa_renda
	from sales.customers
)

select faixa_renda, count(*)
from faixa_de_renda
group by faixa_renda

-- Exemplo 2 - Tratamento de dados nulos com COALESCE
-- Crie uma coluna chamada populacao_ajustada na tabela
-- temp_tables.regions e preencha com os dados da coluna population
-- Caso esse campo esteja nulo, preencha com a população média
-- geral das cidades do Brasil

-- Opção 1 - Utilizando CASE WHEN

select
	*,
	case
		when population is not null then population
		else (select avg(population) from temp_tables.regions)
	end as populacao_ajustada
from temp_tables.regions

-- Opção 2 - Utilizando COALESCE

select
	*,
	coalesce(
		population,
		(select avg(population) from temp_tables.regions)
	) as populacao_ajustada
from temp_tables.regions


-- Tratamento de Texto
-- Permite padronizar e substituir valores textuais

-- Tipos
-- Lower()
-- Upper()
-- Trim()
-- Replace()

-- Exemplos

-- Exemplo 1
-- Corrija o primeiro elemento das queries abaixo utilizando os comandos
-- de tratamento de texto para que o resultado seja sempre true

select upper('São Paulo') = 'SÃO PAULO'

select lower('São Paulo') = 'são paulo'

select trim('SÃO PAULO     ') = 'SÃO PAULO'

select replace('SAO PAULO', 'SAO', 'SÃO') = 'SÃO PAULO'


-- Tratamento de Datas
-- Permite adicionar, extrair, truncar e calcular diferenças entre datas

-- Tipos
-- Interval
-- Date_trunc
-- Extract
-- Subtração entre datas
-- Datediff como função personalizada

-- Exemplos

-- Exemplo 1 - Soma de datas utilizando INTERVAL
-- Calcule a data de hoje mais 10 unidades em dias, semanas, meses e horas

select (current_date + interval '10 days')::date

select (current_date + interval '10 weeks')::date

select (current_date + interval '10 months')::date

select current_date + interval '10 hours'

-- Exemplo 2 - Truncagem de datas utilizando DATE_TRUNC
-- Calcule quantas visitas ocorreram por mês no site da empresa

select
	date_trunc('month', visit_page_date)::date as visit_page_month,
	count(*) as visitas
from sales.funnel
group by visit_page_month
order by visit_page_month desc

-- Exemplo 3 - Extração de unidades de uma data utilizando EXTRACT
-- Calcule qual dia da semana recebe mais visitas ao site

select
	extract('dow' from visit_page_date) as dia_da_semana,
	count(*) as visitas
from sales.funnel
group by dia_da_semana
order by visitas desc

-- Exemplo 4 - Diferença entre datas com o operador de subtração
-- Calcule a diferença entre hoje e 01/06/2018 em dias, semanas, meses e anos

select current_date - '2018-06-01'::date

select (current_date - '2018-06-01'::date) / 7

select (current_date - '2018-06-01'::date) / 30

select (current_date - '2018-06-01'::date) / 365


-- Funções
-- Permitem criar rotinas personalizadas para operações utilizadas com frequência

-- Exemplos

-- Exemplo 1
-- Crie uma função chamada DATEDIFF para calcular a diferença entre
-- duas datas em dias, semanas, meses e anos

create function datediff(
	unidade varchar,
	data_inicial date,
	data_final date
)
returns integer
language sql

as

$$
	select
		case
			when unidade in ('d', 'day', 'days') then data_final - data_inicial
			when unidade in ('w', 'week', 'weeks') then (data_final - data_inicial) / 7
			when unidade in ('m', 'month', 'months') then (data_final - data_inicial) / 30
			when unidade in ('y', 'year', 'years') then (data_final - data_inicial) / 365
		end as diferenca
$$

select datediff('d', '2025-09-05', current_date)

select datediff('w', '2025-09-05', current_date)

select datediff('m', '2025-09-05', current_date)

select datediff('y', '2025-09-05', current_date)

-- Exemplo 2
-- Exclua a função DATEDIFF criada no exemplo anterior

drop function datediff