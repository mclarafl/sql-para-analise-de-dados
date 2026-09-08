# SQL para Análise de Dados

Este repositório reúne minhas anotações e exercícios desenvolvidos durante o curso **SQL para Análise de Dados: Do básico ao avançado**, utilizando PostgreSQL.

O objetivo é registrar minha evolução nos estudos e praticar a aplicação de SQL na consulta, organização e análise de dados.

## Sobre o curso

- **Curso:** SQL para Análise de Dados: Do básico ao avançado
- **Instrutora:** Midori Toyota
- **Plataforma:** Udemy
- **Link:** [Acessar o curso](https://www.udemy.com/course/sql-para-analise-de-dados/)

## Conteúdos

### Módulo 1 — Fundamentos de SQL

- Estrutura básica de uma consulta;
- `SELECT`;
- `DISTINCT`;
- `WHERE`;
- `ORDER BY`;
- `LIMIT`;
- Tratamento de valores `NULL`;
- Filtros com datas;
- Exercícios práticos.

### Módulo 2 — Operadores

- Operadores aritméticos;
- Criação de colunas calculadas;
- Concatenação de textos;
- Operadores de comparação;
- Operadores lógicos;
- `AND`, `OR` e `NOT`;
- `BETWEEN`;
- `IN`;
- `LIKE` e `ILIKE`;
- `IS NULL`;
- Exercícios práticos.

### Módulo 3 — Funções Agregadas

- Funções de agregação;
- `COUNT`;
- `SUM`;
- `AVG`;
- `MIN` e `MAX`;
- Agrupamento de resultados com `GROUP BY`;
- Filtros de agrupamentos com `HAVING`;
- Exercícios práticos.

### Módulo 4 — Joins

- Combinação de dados de diferentes tabelas;
- `INNER JOIN`;
- `LEFT JOIN`;
- `RIGHT JOIN`;
- `FULL JOIN`;
- Junções utilizando mais de uma coluna;
- Exercícios práticos.

### Módulo 5 — Unions

- União dos resultados de consultas;
- `UNION`;
- `UNION ALL`;
- Diferenças no tratamento de registros duplicados;
- Compatibilidade entre as colunas das consultas;
- Exemplos práticos.

### Módulo 6 — Subqueries

- Consultas inseridas em outras consultas;
- Subqueries no `WHERE`;
- Organização de consultas com `WITH` e CTEs;
- Subqueries no `FROM`;
- Subqueries no `SELECT`;
- Exemplos e exercícios práticos.

### Módulo 7 — Tratamento de Dados

- Conversão de tipos de dados;
- Tratamento de textos;
- Tratamento de datas;
- Tratamento de valores nulos;
- Criação de condições com `CASE WHEN`;
- Exemplos práticos.

### Módulo 8 — Manipulação de Tabelas

- Criação e exclusão de tabelas;
- Inserção de registros;
- Atualização de registros;
- Exclusão de registros;
- Adição, alteração e remoção de colunas;
- Exemplos práticos.

## Organização do repositório

Os conteúdos estão separados em pastas por módulo:

| Pasta | Conteúdo |
|---|---|
| `Módulo 1 - Fundamentos` | Estrutura e comandos básicos das consultas |
| `Módulo 2 - Operadores` | Operadores aritméticos, de comparação e lógicos |
| `Módulo 3 - Funções Agregadas` | Agregações, agrupamentos e filtros |
| `Módulo 4 - Joins` | Combinação de dados de diferentes tabelas |
| `Módulo 5 - Unions` | União dos resultados de consultas |
| `Módulo 6 - Subqueries` | Subconsultas e CTEs |
| `Módulo 7 - Tratamento de Dados` | Transformação e tratamento dos dados |
| `Módulo 8 - Manipulação de Tabelas` | Manipulação de tabelas, colunas e registros |

Dentro das pastas, os arquivos seguem o padrão:

- `anotacoes.sql`: conceitos e exemplos estudados durante as aulas;
- `exercicios-resolvidos.sql`: exercícios propostos e minhas soluções, quando houver.

## Tecnologias utilizadas

- **SQL:** linguagem utilizada nas consultas e na manipulação dos dados;
- **PostgreSQL:** sistema de gerenciamento do banco de dados;
- **pgAdmin:** ferramenta utilizada para acessar o banco e executar as consultas.

## Banco de dados

As atividades utilizam a base disponibilizada durante o curso.

Nas consultas, são utilizados schemas como:

- `sales`: tabelas relacionadas a clientes, produtos, lojas, visitas e vendas;
- `temp_tables`: tabelas auxiliares utilizadas nos exemplos e exercícios.

Os arquivos deste repositório registram as consultas e anotações dos estudos. A base de dados e sua instalação não estão incluídas.

Para executar os exemplos, é necessário ter acesso à base utilizada no curso ou a uma estrutura compatível com as tabelas e colunas referenciadas.

## Como utilizar

1. Abra a pasta do módulo que deseja consultar;
2. Acesse o arquivo de anotações ou exercícios;
3. Leia os comentários que acompanham as consultas;
4. Para praticar, abra o arquivo no pgAdmin conectado à base correspondente;
5. Selecione e execute uma consulta por vez.

Os arquivos foram organizados para estudo por trechos, sem ponto e vírgula entre as consultas.

Nos exemplos de manipulação de tabelas, observe a ordem das operações, pois alguns comandos dependem de estruturas criadas anteriormente.

## Projetos práticos

Os projetos do curso possuem repositórios próprios, com as consultas, os resultados e a documentação de cada análise.

### Projeto 1 — Dashboard de Acompanhamento de Vendas

**Concluído.**

Projeto desenvolvido com PostgreSQL e Microsoft Excel para acompanhar:

- Receita e ticket médio;
- Volume de visitas e vendas;
- Conversão mensal;
- Vendas por estado;
- Marcas e lojas com mais vendas;
- Visitas por dia da semana.

[Acessar o repositório do projeto](https://github.com/mclarafl/dashboard-acompanhamento-vendas)

### Projeto 2 — Análise de Perfil dos Clientes

**Ainda não iniciado.**

O link será adicionado após a publicação do projeto.

## Progresso

- [x] Módulo 1 — Fundamentos de SQL
- [x] Módulo 2 — Operadores
- [x] Módulo 3 — Funções Agregadas
- [x] Módulo 4 — Joins
- [x] Módulo 5 — Unions
- [x] Módulo 6 — Subqueries
- [x] Módulo 7 — Tratamento de Dados
- [x] Módulo 8 — Manipulação de Tabelas
- [x] Projeto 1 — Dashboard de Acompanhamento de Vendas
- [ ] Projeto 2 — Análise de Perfil dos Clientes

## Autora

**Maria Clara Ferreira Lima**

[GitHub](https://github.com/mclarafl) · [LinkedIn](https://www.linkedin.com/in/mariacfl/)

> Repositório criado para registrar meus aprendizados e acompanhar minha evolução em SQL e análise de dados.
