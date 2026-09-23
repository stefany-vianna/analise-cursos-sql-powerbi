# Análise de Receita e Desempenho de Cursos

Projeto de análise de dados desenvolvido com **PostgreSQL, SQL e Power BI**, com foco no acompanhamento de matrículas, cursos e indicadores financeiros de uma instituição de ensino fictícia.

O objetivo do projeto é demonstrar um fluxo completo de análise de dados, desde a modelagem e criação do banco de dados até a construção de um dashboard interativo no Power BI.

> Todos os dados utilizados neste projeto são fictícios e foram criados exclusivamente para fins de estudo e portfólio.

---

## Objetivo

Construir uma solução capaz de responder perguntas como:

- Quantos alunos, cursos e matrículas existem?
- Qual é a receita prevista e a receita efetivamente recebida?
- Qual é o saldo pendente?
- Quais cursos concentram maior volume de matrículas?
- Quais cursos apresentam maior receita?
- Qual é o ticket médio dos contratos?
- Qual é o desconto médio concedido?
- Quais pagamentos estão pendentes ou atrasados?
- Como os alunos estão distribuídos geograficamente?

---

## Tecnologias utilizadas

- PostgreSQL
- Neon PostgreSQL
- DBeaver
- SQL
- Power BI
- Power Query
- DAX
- Visual Studio Code
- Git / GitHub

---

## Arquitetura do projeto

Fluxo principal:

PostgreSQL → Views SQL → Power BI → Dashboard

A preparação e parte da lógica dos dados foram realizadas no PostgreSQL.  
O Power BI foi utilizado para modelagem analítica, medidas DAX, filtros e visualização.

---

## Modelagem de dados

O banco foi estruturado inicialmente com quatro tabelas principais:

- `alunos`
- `cursos`
- `matriculas`
- `pagamentos`

### Relacionamentos

- Um aluno pode possuir várias matrículas.
- Um curso pode possuir várias matrículas.
- Uma matrícula pode possuir vários pagamentos.

Também foram criadas views específicas para consumo pelo Power BI:

- `vw_matriculas_detalhadas`
- `vw_financeiro`
- `vw_resumo_cursos`

### Modelo utilizado no Power BI

![Modelo de dados](imagens/modelo_dados.png)

---

## Estrutura do repositório

```text
analise-cursos-sql-powerbi/
│
├── README.md
│
├── docs/
│
├── imagens/
│   ├── dashboard_visao_geral.png
│   ├── dashboard_cursos.png
│   ├── dashboard_financeiro.png
│   └── modelo_dados.png
│
├── powerbi/
│   └── dashboard_cursos.pbix
│
└── sql/
    ├── 01_criacao_tabelas.sql
    ├── 02_insercao_dados.sql
    ├── 03_consultas_analiticas.sql
    └── 04_views_powerbi.sql