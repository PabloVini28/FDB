--) 01 - Recupere todos os nomes dos personagens 
select nome from personagens;

--) 02 - Recupere todos os nomes das batalhas.
select nome from batalhas;

--) 03 - Recupere os nomes dos personagens da casa Targaryen
select nome from personagens where casa = 'Targaryen';

--) 04 - Recupere os nomes dos dragões que são grandes
select nome from dragoes where tamanho = 'Grande';

--) 05 - Recupere as batalhas ocorridas em King's Landing
select nome from batalhas where localizacao = 'King''s Landing';

--) 06 - Recupere os nomes dos personagens que nasceram entre os anos 80 e 110
select nome from personagens where extract(year from data_nascimento) between 80 and 110;

--) 07 - Recupere os nomes dos personagens e os nomes dos dragões que eles possuem.
select p.nome as personagem, d.nome as dragao from personagens p join dragoes d on p.id = d.id_personagem;

--) 08 - Recupere os nomes dos personagens que têm dragões cujo nome começa com a letra S
select p.nome as personagem
from personagens p  
join dragoes d on p.id = d.id_personagem
where d.nome like 'S%';

--) 09 - Recupere os nomes dos dragões que não possuem dono
select nome from dragoes where id_personagem is null;

--) 10 - Recupere os nomes dos personagens e os nomes das batalhas que eles venceram.
 select p.nome as personagem,
 b.nome as batalhas
 from personagens p
 join participantes_batalhas pb on p.id = pb.id_personagem
 join batalhas b on pb.id_batalha = b.id
 where pb.resultado = 'Vitória';

--) 11 - Recupere os nomes dos personagens e as relações que eles têm com outros personagens
select p1.nome as personagem,
       rf.relacao
from personagens p1
join relacoes_familiares rf on p1.id = rf.id_personagem1
join personagens p2 on rf.id_personagem2 = p2.id;

--) 12 - Recupere os nomes dos personagens, as datas das batalhas em que participaram e o resultado dessas batalhas
select p.nome as personagem,
       b.data,
       pb.resultado
from personagens p
join participantes_batalhas pb on p.id = pb.id_personagem
join batalhas b on pb.id_batalha = b.id;

select * from dragoes;
select * from personagens;
select * from batalhas;
select * from participantes_batalhas;
select * from relacoes_familiares;