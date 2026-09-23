-- 1. Total de alunos
SELECT
    COUNT(*) AS total_alunos
FROM alunos;
-- 2. Total de cursos
SELECT
    COUNT(*) AS total_cursos
FROM cursos;
-- 3. Total de matrículas
SELECT
    COUNT(*) AS total_matriculas
FROM matriculas;
-- 4. Receita prevista
SELECT
    SUM(valor_previsto) AS receita_prevista
FROM pagamentos;

-- 5. Receita recebida
SELECT
    SUM(valor_pago) AS receita_recebida
FROM pagamentos;

-- 6. Saldo pendente
SELECT
    SUM(valor_previsto)
    - SUM(COALESCE(valor_pago, 0)) AS saldo_pendente
FROM pagamentos;

-- 7. Ticket médio dos contratos
SELECT
    AVG(valor_contrato) AS ticket_medio
FROM matriculas;

-- 8. Quantidade de alunos por curso
SELECT
    c.nome_curso,
    COUNT(m.id_matricula) AS quantidade_alunos
FROM cursos c
LEFT JOIN matriculas m
    ON c.id_curso = m.id_curso
GROUP BY c.nome_curso
ORDER BY quantidade_alunos DESC;

-- 9. Receita prevista por curso quanto de receita prevista está associado a cada curso?
SELECT
    c.nome_curso,
    SUM(p.valor_previsto) AS receita_prevista
FROM cursos c
INNER JOIN matriculas m
    ON c.id_curso = m.id_curso
INNER JOIN pagamentos p
    ON m.id_matricula = p.id_matricula
GROUP BY c.nome_curso
ORDER BY receita_prevista DESC;

-- 10. Receita recebida por curso
SELECT
    c.nome_curso,
    SUM(COALESCE(p.valor_pago, 0)) AS receita_recebida
FROM cursos c
INNER JOIN matriculas m
    ON c.id_curso = m.id_curso
INNER JOIN pagamentos p
    ON m.id_matricula = p.id_matricula
GROUP BY c.nome_curso
ORDER BY receita_recebida DESC;

-- 11. Pagamentos por status
SELECT
    status_pagamento,
    COUNT(*) AS quantidade,
    SUM(valor_previsto) AS valor_previsto
FROM pagamentos
GROUP BY status_pagamento
ORDER BY valor_previsto DESC;

-- 12. Alunos por estado
SELECT
    estado,
    COUNT(*) AS quantidade_alunos
FROM alunos
GROUP BY estado
ORDER BY quantidade_alunos DESC;