CREATE TABLE Personagens (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    data_nascimento DATE,
    data_falecimento DATE,
    casa VARCHAR(100)
);


CREATE TABLE Relacoes_Familiares (
    id_personagem1 INT,
    id_personagem2 INT,
    relacao VARCHAR(50),
    FOREIGN KEY (id_personagem1) REFERENCES Personagens(id),
    FOREIGN KEY (id_personagem2) REFERENCES Personagens(id)
);


CREATE TABLE Dragoes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    cor VARCHAR(50),
    tamanho VARCHAR(50),
    id_personagem INT UNIQUE,
    FOREIGN KEY (id_personagem) REFERENCES Personagens(id)
);


CREATE TABLE Batalhas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    data DATE,
    localizacao VARCHAR(100)
);

CREATE TABLE Participantes_Batalhas (
    id_batalha INT,
    id_personagem INT,
    resultado VARCHAR(50),
    FOREIGN KEY (id_batalha) REFERENCES Batalhas(id),
    FOREIGN KEY (id_personagem) REFERENCES Personagens(id),
	PRIMARY KEY(id_batalha,id_personagem)
);
