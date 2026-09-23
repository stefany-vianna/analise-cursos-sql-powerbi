CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    cidade VARCHAR(100),
    estado CHAR(2),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE cursos (
    id_curso SERIAL PRIMARY KEY,
    nome_curso VARCHAR(120) UNIQUE NOT NULL,
    categoria VARCHAR(80),
    carga_horaria INTEGER,
    valor_base NUMERIC(10,2)
);

CREATE TABLE matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_aluno INTEGER NOT NULL,
    id_curso INTEGER NOT NULL,
    data_matricula DATE DEFAULT CURRENT_DATE,
    status VARCHAR(30) NOT NULL,
    desconto_percentual NUMERIC(5,2) DEFAULT 0,
    valor_contrato NUMERIC(10,2) NOT NULL,

    CONSTRAINT fk_matriculas_alunos
        FOREIGN KEY (id_aluno)
        REFERENCES alunos(id_aluno),

    CONSTRAINT fk_matriculas_cursos
        FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
);

CREATE TABLE pagamentos (
    id_pagamento SERIAL PRIMARY KEY,
    id_matricula INTEGER NOT NULL,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE,
    valor_previsto NUMERIC(10,2) NOT NULL,
    valor_pago NUMERIC(10,2),
    status_pagamento VARCHAR(30) NOT NULL,

    CONSTRAINT fk_pagamentos_matriculas
        FOREIGN KEY (id_matricula)
        REFERENCES matriculas(id_matricula)
);