-- Unions
-- Servem para unir os resultados de duas ou mais consultas em uma única tabela
-- As consultas precisam retornar a mesma quantidade de colunas
-- e as colunas correspondentes precisam ter tipos de dados compatíveis

-- Union
-- Une os resultados e remove os registros duplicados

-- Union All
-- Une os resultados e mantém os registros duplicados

-- Exemplos

-- Exemplo 1 
-- Una a tabela sales.products com a tabela temp_tables.products_2

select * from sales.products
union all
select * from temp_tables.products_2
