-- Tabela Usuario
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    pontuacao INT DEFAULT 0,
    role VARCHAR(10) CHECK (role IN ('admin', 'regular')) NOT NULL
);

-- Tabela Endereco
CREATE TABLE endereco (
    id SERIAL PRIMARY KEY,
    cep VARCHAR(10) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    numero VARCHAR(255) NOT NULL
);

-- Tabela Localizacao 
CREATE TABLE localizacao (
    id SERIAL PRIMARY KEY,
    status_verificado BOOLEAN NOT NULL DEFAULT FALSE,
    endereco_id INT NOT NULL,
    CONSTRAINT fk_endereco FOREIGN KEY (endereco_id) REFERENCES endereco (id) ON DELETE CASCADE
);

-- Tabela DenunciaLocal
CREATE TABLE denuncia_local (
    id SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT NOT NULL,
    localizacao_id INT NOT NULL,
    CONSTRAINT fk_usuario_denuncia FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE CASCADE,
    CONSTRAINT fk_localizacao_denuncia FOREIGN KEY (localizacao_id) REFERENCES localizacao (id) ON DELETE CASCADE
);

-- Tabela FavoritaLocal
CREATE TABLE favorita_local (
    id SERIAL PRIMARY KEY,
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descricao TEXT,
    usuario_id INT NOT NULL,
    localizacao_id INT NOT NULL,
    CONSTRAINT fk_usuario_favorita FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE CASCADE,
    CONSTRAINT fk_localizacao_favorita FOREIGN KEY (localizacao_id) REFERENCES localizacao (id) ON DELETE CASCADE
);

-- Tabela AvaliaLocal
CREATE TABLE avalia_local (
    id SERIAL PRIMARY KEY,
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    descricao TEXT,
    usuario_id INT NOT NULL,
    localizacao_id INT NOT NULL,
    CONSTRAINT fk_usuario_avalia FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE CASCADE,
    CONSTRAINT fk_localizacao_avalia FOREIGN KEY (localizacao_id) REFERENCES localizacao (id) ON DELETE CASCADE
);

