# Dicionário de Dados

Este documento descreve as principais tabelas utilizadas no projeto **Análise de Receita e Desempenho de Cursos**.

Os dados utilizados são fictícios.

---

## Tabela: alunos

Armazena os dados cadastrais dos alunos.

| Campo | Tipo | Descrição |
|---|---|---|
| id_aluno | SERIAL | Identificador único do aluno |
| nome | VARCHAR(120) | Nome do aluno |
| email | VARCHAR(150) | E-mail único do aluno |
| cidade | VARCHAR(100) | Cidade de residência |
| estado | CHAR(2) | Unidade federativa |
| data_cadastro | DATE | Data de cadastro do aluno |

---

## Tabela: cursos

Armazena informações dos cursos oferecidos.

| Campo | Tipo | Descrição |
|---|---|---|
| id_curso | SERIAL | Identificador único do curso |
| nome_curso | VARCHAR(120) | Nome do curso |
| categoria | VARCHAR(80) | Categoria do curso |
| carga_horaria | INTEGER | Carga horária em horas |
| valor_base | NUMERIC(10,2) | Valor padrão do curso |

---

## Tabela: matriculas

Relaciona alunos e cursos e registra as condições comerciais da matrícula.

| Campo | Tipo | Descrição |
|---|---|---|
| id_matricula | SERIAL | Identificador único da matrícula |
| id_aluno | INTEGER | Chave estrangeira para alunos |
| id_curso | INTEGER | Chave estrangeira para cursos |
| data_matricula | DATE | Data da matrícula |
| status | VARCHAR(30) | Situação da matrícula |
| desconto_percentual | NUMERIC(5,2) | Percentual de desconto concedido |
| valor_contrato | NUMERIC(10,2) | Valor final contratado |

---

## Tabela: pagamentos

Registra as informações financeiras das matrículas.

| Campo | Tipo | Descrição |
|---|---|---|
| id_pagamento | SERIAL | Identificador único do pagamento |
| id_matricula | INTEGER | Chave estrangeira para matrícula |
| data_vencimento | DATE | Data prevista para pagamento |
| data_pagamento | DATE | Data efetiva do pagamento |
| valor_previsto | NUMERIC(10,2) | Valor esperado |
| valor_pago | NUMERIC(10,2) | Valor efetivamente recebido |
| status_pagamento | VARCHAR(30) | Situação do pagamento |

---

# Views utilizadas no Power BI

## vw_matriculas_detalhadas

Combina informações de:

- alunos
- cursos
- matrículas

É utilizada para análises como:

- alunos por curso;
- matrículas;
- descontos;
- ticket médio;
- valor contratado;
- localização dos alunos.

---

## vw_financeiro

Combina:

- pagamentos;
- matrículas;
- alunos;
- cursos.

Inclui campos calculados como:

- valor pago tratado;
- saldo pendente.

É utilizada para os indicadores financeiros do dashboard.

---

## vw_resumo_cursos

Resume os principais indicadores por curso:

- total de matrículas;
- receita prevista;
- receita recebida;
- saldo pendente.

---

# Relacionamentos

A estrutura conceitual do banco é:

```text
ALUNOS
   │
   └──< MATRICULAS >── CURSOS
             │
             └──< PAGAMENTOS