-- Inserindo usuários
INSERT INTO usuario (email, senha, pontuacao, role) VALUES
('user1@email.com', 'senha123', 10, 'regular'),
('user2@email.com', 'senha123', 20, 'regular'),
('user3@email.com', 'senha123', 15, 'admin'),
('user4@email.com', 'senha123', 25, 'regular'),
('user5@email.com', 'senha123', 30, 'regular'),
('user6@email.com', 'senha123', 5, 'regular'),
('user7@email.com', 'senha123', 40, 'admin'),
('user8@email.com', 'senha123', 50, 'regular'),
('user9@email.com', 'senha123', 60, 'regular'),
('user10@email.com', 'senha123', 70, 'regular');

-- Inserindo endereços
INSERT INTO endereco (cep, rua, bairro, cidade, numero) VALUES
('12345-678', 'Rua A', 'Centro', 'Cidade X', 10),
('23456-789', 'Rua B', 'Bairro Y', 'Cidade X', 20),
('34567-890', 'Rua C', 'Bairro Z', 'Cidade X', 30),
('45678-901', 'Rua D', 'Bairro W', 'Cidade X', 40),
('56789-012', 'Rua E', 'Bairro V', 'Cidade X', 50),
('67890-123', 'Rua F', 'Bairro U', 'Cidade X', 60),
('78901-234', 'Rua G', 'Bairro T', 'Cidade X', 70),
('89012-345', 'Rua H', 'Bairro S', 'Cidade X', 80),
('90123-456', 'Rua I', 'Bairro R', 'Cidade X', 90),
('01234-567', 'Rua J', 'Bairro Q', 'Cidade X', 100);

-- Inserindo localizações
INSERT INTO localizacao (status_verificado, endereco_id) VALUES
(TRUE, 1), (FALSE, 2), (TRUE, 3), (FALSE, 4), (TRUE, 5),
(TRUE, 6), (FALSE, 7), (TRUE, 8), (FALSE, 9), (TRUE, 10);

-- Inserindo denúncias de locais
INSERT INTO denuncia_local (descricao, usuario_id, localizacao_id) VALUES
('Local sujo e mal iluminado', 1, 1),
('Estrutura comprometida', 2, 2),
('Problemas de acesso', 3, 3),
('Risco de desabamento', 4, 4),
('Infestação de pragas', 5, 5),
('Mal cheiro constante', 6, 6),
('Acúmulo de lixo', 7, 7),
('Água parada e riscos sanitários', 8, 8),
('Muito barulho à noite', 9, 9),
('Atividades suspeitas no local', 10, 10);

-- Inserindo locais favoritos
INSERT INTO favorita_local (descricao, usuario_id, localizacao_id) VALUES
('Ótimo para passeios', 1, 1),
('Local agradável', 2, 2),
('Excelente ambiente', 3, 3),
('Boa infraestrutura', 4, 4),
('Bem localizado', 5, 5),
('Segurança garantida', 6, 6),
('Recomendado para famílias', 7, 7),
('Bom espaço de lazer', 8, 8),
('Eventos frequentes', 9, 9),
('Fácil acesso e limpo', 10, 10);

-- Inserindo avaliações de locais
INSERT INTO avalia_local (nota, descricao, usuario_id, localizacao_id) VALUES
(5, 'Ótimo ambiente!', 1, 1),
(4, 'Muito bom, mas precisa de melhorias.', 2, 2),
(3, 'Mediano, falta manutenção.', 3, 3),
(5, 'Excelente, bem cuidado.', 4, 4),
(2, 'Poderia ser melhor.', 5, 5),
(5, 'Super recomendo!', 6, 6),
(4, 'Bem organizado.', 7, 7),
(3, 'Ambiente aceitável.', 8, 8),
(1, 'Não recomendo.', 9, 9),
(5, 'Maravilhoso, voltarei sempre!', 10, 10);
