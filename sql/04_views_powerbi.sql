CREATE VIEW vw_matriculas_detalhadas AS
SELECT
    m.id_matricula,
    a.id_aluno,
    a.nome AS aluno,
    a.cidade,
    a.estado,
    c.id_curso,
    c.nome_curso,
    c.categoria,
    c.carga_horaria,
    c.valor_base,
    m.data_matricula,
    m.status AS status_matricula,
    m.desconto_percentual,
    m.valor_contrato
FROM matriculas m
INNER JOIN alunos a
    ON m.id_aluno = a.id_aluno
INNER JOIN cursos c
    ON m.id_curso = c.id_curso;

    CREATE VIEW vw_financeiro AS
SELECT
    p.id_pagamento,
    p.id_matricula,
    a.nome AS aluno,
    c.nome_curso,
    c.categoria,
    m.status AS status_matricula,
    p.data_vencimento,
    p.data_pagamento,
    p.valor_previsto,
    p.valor_pago,
    p.status_pagamento,
    COALESCE(p.valor_pago, 0) AS valor_pago_tratado,
    p.valor_previsto - COALESCE(p.valor_pago, 0) AS saldo_pendente
FROM pagamentos p
INNER JOIN matriculas m
    ON p.id_matricula = m.id_matricula
INNER JOIN alunos a
    ON m.id_aluno = a.id_aluno
INNER JOIN cursos c
    ON m.id_curso = c.id_curso;

    CREATE VIEW vw_resumo_cursos AS
SELECT
    c.id_curso,
    c.nome_curso,
    c.categoria,
    COUNT(DISTINCT m.id_matricula) AS total_matriculas,
    SUM(COALESCE(p.valor_previsto, 0)) AS receita_prevista,
    SUM(COALESCE(p.valor_pago, 0)) AS receita_recebida,
    SUM(COALESCE(p.valor_previsto, 0))
        - SUM(COALESCE(p.valor_pago, 0)) AS saldo_pendente
FROM cursos c
LEFT JOIN matriculas m
    ON c.id_curso = m.id_curso
LEFT JOIN pagamentos p
    ON m.id_matricula = p.id_matricula
GROUP BY
    c.id_curso,
    c.nome_curso,
    c.categoria;