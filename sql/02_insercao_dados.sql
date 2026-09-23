INSERT INTO cursos (
    nome_curso,
    categoria,
    carga_horaria,
    valor_base
)
VALUES
('SQL para Análise de Dados', 'Dados', 30, 650.00),
('Python para Dados', 'Dados', 40, 850.00),
('Power BI', 'Business Intelligence', 35, 720.00),
('Excel Avançado', 'Produtividade', 24, 480.00),
('Gestão de Projetos', 'Gestão', 32, 790.00),
('Data Analytics', 'Dados', 60, 1200.00),
('Introdução à IA', 'Tecnologia', 25, 690.00),
('Liderança e Gestão', 'Gestão', 20, 550.00);

INSERT INTO alunos (
    nome,
    email,
    cidade,
    estado,
    data_cadastro
)
VALUES
('Ana Souza', 'ana.souza@email.com', 'Maricá', 'RJ', '2026-01-10'),
('Bruno Lima', 'bruno.lima@email.com', 'Niterói', 'RJ', '2026-01-15'),
('Carla Mendes', 'carla.mendes@email.com', 'Rio de Janeiro', 'RJ', '2026-02-03'),
('Daniel Costa', 'daniel.costa@email.com', 'São Gonçalo', 'RJ', '2026-02-18'),
('Eduarda Rocha', 'eduarda.rocha@email.com', 'Maricá', 'RJ', '2026-03-02'),
('Felipe Martins', 'felipe.martins@email.com', 'Belo Horizonte', 'MG', '2026-03-17'),
('Gabriela Alves', 'gabriela.alves@email.com', 'São Paulo', 'SP', '2026-04-05'),
('Henrique Moraes', 'henrique.moraes@email.com', 'Campinas', 'SP', '2026-04-23'),
('Isabela Nunes', 'isabela.nunes@email.com', 'Maricá', 'RJ', '2026-05-11'),
('João Ribeiro', 'joao.ribeiro@email.com', 'Niterói', 'RJ', '2026-05-29');

INSERT INTO matriculas (
    id_aluno,
    id_curso,
    data_matricula,
    status,
    desconto_percentual,
    valor_contrato
)
VALUES
(1, 1, '2026-01-12', 'Ativa', 0.00, 650.00),
(2, 2, '2026-01-20', 'Ativa', 10.00, 765.00),
(3, 3, '2026-02-05', 'Ativa', 5.00, 684.00),
(4, 4, '2026-02-20', 'Concluída', 0.00, 480.00),
(5, 1, '2026-03-05', 'Ativa', 15.00, 552.50),
(6, 5, '2026-03-20', 'Ativa', 0.00, 790.00),
(7, 6, '2026-04-08', 'Ativa', 10.00, 1080.00),
(8, 7, '2026-04-25', 'Cancelada', 0.00, 690.00),
(9, 3, '2026-05-13', 'Ativa', 0.00, 720.00),
(10, 8, '2026-06-01', 'Ativa', 5.00, 522.50);

INSERT INTO pagamentos (
    id_matricula,
    data_vencimento,
    data_pagamento,
    valor_previsto,
    valor_pago,
    status_pagamento
)
VALUES
(1, '2026-02-10', '2026-02-09', 650.00, 650.00, 'Pago'),
(2, '2026-02-15', '2026-02-16', 765.00, 765.00, 'Pago'),
(3, '2026-03-10', '2026-03-08', 684.00, 684.00, 'Pago'),
(4, '2026-03-15', '2026-03-15', 480.00, 480.00, 'Pago'),
(5, '2026-04-10', NULL, 552.50, NULL, 'Pendente'),
(6, '2026-04-15', '2026-04-14', 790.00, 790.00, 'Pago'),
(7, '2026-05-10', '2026-05-12', 1080.00, 1080.00, 'Pago'),
(8, '2026-05-15', NULL, 690.00, NULL, 'Cancelado'),
(9, '2026-06-10', NULL, 720.00, NULL, 'Atrasado'),
(10, '2026-06-15', '2026-06-15', 522.50, 522.50, 'Pago');