-- Criação da tabela Usuario
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255),
    telefone VARCHAR(20),
    tipo VARCHAR(20)  -- Define o tipo de usuário
);

-- Criação da tabela Aeroporto
CREATE TABLE Aeroporto (
    id_aeroporto SERIAL PRIMARY KEY,
    codigo_iata CHAR(3) UNIQUE,  -- Código IATA do aeroporto
    nome VARCHAR(100),
    cidade VARCHAR(100),
    pais VARCHAR(100)
);

-- Criação da tabela CompanhiaAerea
CREATE TABLE CompanhiaAerea (
    id_companhia SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    codigo_iata CHAR(2) UNIQUE  -- Código IATA da companhia
);

-- Criação da tabela Aeronave
CREATE TABLE Aeronave (
    id_aeronave SERIAL PRIMARY KEY,
    modelo VARCHAR(100),
    capacidade INT,
    id_companhia INT,
    FOREIGN KEY (id_companhia) REFERENCES CompanhiaAerea(id_companhia)
);

-- Criação da tabela Voo
CREATE TABLE Voo (
    id_voo SERIAL PRIMARY KEY,
    numero_voo VARCHAR(10) UNIQUE,
    id_aeronave INT,
    id_aeroporto_origem INT,
    id_aeroporto_destino INT,
    horario_partida TIMESTAMP,
    horario_chegada TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (id_aeronave) REFERENCES Aeronave(id_aeronave),
    FOREIGN KEY (id_aeroporto_origem) REFERENCES Aeroporto(id_aeroporto),
    FOREIGN KEY (id_aeroporto_destino) REFERENCES Aeroporto(id_aeroporto)
);

-- Criação da tabela Assento
CREATE TABLE Assento (
    id_assento SERIAL PRIMARY KEY,
    id_voo INT,
    numero_assento VARCHAR(5),
    classe VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (id_voo) REFERENCES Voo(id_voo)
);

-- Criação da tabela Reserva
CREATE TABLE Reserva (
    id_reserva SERIAL PRIMARY KEY,
    id_usuario INT,
    id_voo INT,
    data_reserva TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_voo) REFERENCES Voo(id_voo)
);

-- Criação da tabela Bilhete
CREATE TABLE Bilhete (
    id_bilhete SERIAL PRIMARY KEY,
    id_reserva INT,
    id_assento INT,
    codigo_barras VARCHAR(100) UNIQUE,
    data_emissao TIMESTAMP,
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
    FOREIGN KEY (id_assento) REFERENCES Assento(id_assento)
);

-- Criação da tabela Pagamento
CREATE TABLE Pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_reserva INT,
    metodo_pagamento VARCHAR(20),
    valor DECIMAL(10, 2),
    data_pagamento TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva)
);

INSERT INTO Usuario (nome, email, senha, telefone, tipo) VALUES
('João Silva', 'joao.silva@gmail.com', 'senha123', '555-1234', 'cliente'),
('Maria Oliveira', 'maria.oliveira@yahoo.com', 'senha123', '555-5678', 'cliente'),
('Carlos Sousa', 'carlos.sousa@hotmail.com', 'senha123', '555-8765', 'cliente'),
('Ana Costa', 'ana.costa@gmail.com', 'senha123', '555-3456', 'administrador');


INSERT INTO Aeroporto (codigo_iata, nome, cidade, pais) VALUES
('GRU', 'Aeroporto Internacional de São Paulo', 'São Paulo', 'Brasil'),
('JFK', 'John F. Kennedy International Airport', 'Nova York', 'EUA'),
('CDG', 'Aeroporto Charles de Gaulle', 'Paris', 'França'),
('HND', 'Tokyo Haneda Airport', 'Tóquio', 'Japão'),
('LHR', 'Heathrow Airport', 'Londres', 'Reino Unido'),
('EZE', 'Ministro Pistarini International Airport', 'Buenos Aires', 'Argentina');


INSERT INTO CompanhiaAerea (nome, codigo_iata) VALUES
('LATAM Airlines', 'LA'),
('American Airlines', 'AA'),
('Air France', 'AF'),
('British Airways', 'BA'),
('Japan Airlines', 'JL'),
('Aerolineas Argentinas', 'AR');


INSERT INTO Aeronave (modelo, capacidade, id_companhia) VALUES
('Boeing 737', 180, 1),  -- LATAM Airlines
('Airbus A320', 200, 2),  -- American Airlines
('Boeing 777', 300, 3),  -- Air France
('Airbus A380', 500, 4),  -- British Airways
('Boeing 787', 250, 5),  -- Japan Airlines
('Embraer E190', 100, 6); -- Aerolineas Argentinas

-- Voos para LATAM Airlines (3 voos)
INSERT INTO Voo (numero_voo, id_aeronave, id_aeroporto_origem, id_aeroporto_destino, horario_partida, horario_chegada, status) VALUES
('LA1234', 1, 1, 2, '2024-09-18 08:00:00', '2024-09-18 14:00:00', 'agendado'),  -- São Paulo -> Nova York
('LA5678', 1, 1, 3, '2024-09-19 12:00:00', '2024-09-19 18:00:00', 'agendado'),  -- São Paulo -> Paris
('LA9012', 1, 1, 6, '2024-09-20 14:00:00', '2024-09-21 04:00:00', 'agendado');  -- São Paulo -> Buenos Aires

-- Voos para American Airlines (2 voos)
INSERT INTO Voo (numero_voo, id_aeronave, id_aeroporto_origem, id_aeroporto_destino, horario_partida, horario_chegada, status) VALUES
('AA3456', 2, 2, 3, '2024-09-19 10:00:00', '2024-09-19 18:00:00', 'agendado'),  -- Nova York -> Paris
('AA7890', 2, 2, 5, '2024-09-20 09:00:00', '2024-09-20 17:00:00', 'agendado');  -- Nova York -> Londres

-- Voos para Air France (1 voo)
INSERT INTO Voo (numero_voo, id_aeronave, id_aeroporto_origem, id_aeroporto_destino, horario_partida, horario_chegada, status) VALUES
('AF1234', 3, 3, 4, '2024-09-21 08:00:00', '2024-09-21 16:00:00', 'agendado');  -- Paris -> Tóquio

-- Voos para British Airways (4 voos)
INSERT INTO Voo (numero_voo, id_aeronave, id_aeroporto_origem, id_aeroporto_destino, horario_partida, horario_chegada, status) VALUES
('BA5678', 4, 4, 5, '2024-09-22 07:00:00', '2024-09-22 11:00:00', 'agendado'),  -- Tóquio -> Londres
('BA9012', 4, 4, 3, '2024-09-23 08:00:00', '2024-09-23 18:00:00', 'agendado'),  -- Tóquio -> Paris
('BA3456', 4, 5, 2, '2024-09-24 09:00:00', '2024-09-24 19:00:00', 'agendado'),  -- Londres -> Nova York
('BA7890', 4, 5, 6, '2024-09-25 06:00:00', '2024-09-25 18:00:00', 'agendado');  -- Londres -> Buenos Aires

-- Voos para Japan Airlines (2 voos)
INSERT INTO Voo (numero_voo, id_aeronave, id_aeroporto_origem, id_aeroporto_destino, horario_partida, horario_chegada, status) VALUES
('JL1234', 5, 4, 3, '2024-09-26 10:00:00', '2024-09-26 18:00:00', 'agendado'),  -- Tóquio -> Paris
('JL5678', 5, 4, 1, '2024-09-27 12:00:00', '2024-09-28 02:00:00', 'agendado');  -- Tóquio -> São Paulo

-- Voos para Aerolineas Argentinas (3 voos)
INSERT INTO Voo (numero_voo, id_aeronave, id_aeroporto_origem, id_aeroporto_destino, horario_partida, horario_chegada, status) VALUES
('AR1234', 6, 6, 1, '2024-09-28 16:00:00', '2024-09-29 02:00:00', 'agendado'),  -- Buenos Aires -> São Paulo
('AR5678', 6, 6, 5, '2024-09-29 14:00:00', '2024-09-29 20:00:00', 'agendado'),  -- Buenos Aires -> Londres
('AR9012', 6, 6, 2, '2024-09-30 09:00:00', '2024-09-30 19:00:00', 'agendado');  -- Buenos Aires -> Nova York


INSERT INTO Assento (id_voo, numero_assento, classe, status) VALUES
(1, '1A', 'Econômica', 'disponível'),
(1, '2B', 'Econômica', 'reservado'),
(2, '1C', 'Executiva', 'disponível'),
(2, '3D', 'Executiva', 'disponível'),
(3, '4E', 'Primeira Classe', 'reservado'),
(3, '5F', 'Primeira Classe', 'disponível'),
(4, '6A', 'Econômica', 'disponível'),
(4, '7B', 'Econômica', 'reservado'),
(5, '8C', 'Executiva', 'disponível'),
(5, '9D', 'Executiva', 'disponível'),
(6, '10E', 'Econômica', 'reservado'),
(6, '11F', 'Econômica', 'disponível');


INSERT INTO Reserva (id_usuario, id_voo, data_reserva, status) VALUES
(1, 1, '2024-09-10 12:00:00', 'confirmada'),
(2, 2, '2024-09-11 14:00:00', 'confirmada'),
(3, 3, '2024-09-12 16:00:00', 'cancelada'),
(1, 4, '2024-09-13 18:00:00', 'confirmada'),
(2, 5, '2024-09-14 20:00:00', 'confirmada'),
(3, 6, '2024-09-15 22:00:00', 'confirmada');


INSERT INTO Bilhete (id_reserva, id_assento, codigo_barras, data_emissao) VALUES
(1, 2, '123456789012', '2024-09-10 12:30:00'),
(2, 4, '234567890123', '2024-09-11 14:30:00'),
(3, 6, '345678901234', '2024-09-12 16:30:00'),
(4, 8, '456789012345', '2024-09-13 18:30:00'),
(5, 10, '567890123456', '2024-09-14 20:30:00'),
(6, 12, '678901234567', '2024-09-15 22:30:00');


INSERT INTO Pagamento (id_reserva, metodo_pagamento, valor, data_pagamento, status) VALUES
(1, 'Cartão de Crédito', 1500.00, '2024-09-10 13:00:00', 'aprovado'),
(2, 'Cartão de Crédito', 2000.00, '2024-09-11 15:00:00', 'aprovado'),
(3, 'Cartão de Débito', 2500.00, '2024-09-12 17:00:00', 'rejeitado'),
(4, 'PayPal', 1800.00, '2024-09-13 19:00:00', 'aprovado'),
(5, 'Cartão de Crédito', 3000.00, '2024-09-14 21:00:00', 'aprovado'),
(6, 'Cartão de Débito', 1000.00, '2024-09-15 23:00:00', 'aprovado');
