--) Pablo Vinícios da Silva Araújo - 574229

--) 1 - Recupere os nomes dos personagens que têm dragões cujo nome começa com a letra S
select p.nome as personagem
from personagens p  
join dragoes d on p.id = d.id_personagem
where d.nome like 'S%';

--) 2 - Os nomes dos dragões que não possuem dono
select nome from dragoes where id_personagem is null;

--) 3 - Os nomes dos personagens e os nomes das batalhas que eles venceram.
select p.nome as personagem,
 b.nome as batalhas
 from personagens p
 join participantes_batalhas pb on p.id = pb.id_personagem
 join batalhas b on pb.id_batalha = b.id
 where pb.resultado = 'Vitória';

--) 4 - Os nomes dos personagens, os nomes e as datas das batalhas em que participaram
-- e o resultado dessas batalhas. Ordene os resultados da batalha mais recente para a
-- mais antiga
select p.nome as personagem,
       b.data,
       pb.resultado
from personagens p
join participantes_batalhas pb on p.id = pb.id_personagem
join batalhas b on pb.id_batalha = b.id
order by b.data desc;

--) 5 - Os nomes dos personagens que participaram de batalhas, suas casas e os
-- resultados das batalhas. Ordene o resultado em ordem alfabética do nome.
select p.nome as personagem,
 b.nome as batalhas,
 p.casa as casa,
 pb.resultado as resultado
 from personagens p
 join participantes_batalhas pb on p.id = pb.id_personagem
 join batalhas b on pb.id_batalha = b.id
 order by p.nome ASC;

 --) 6 - Os nomes dos personagens e as relações que eles têm com outros personagens.
SELECT 
    p1.nome AS personagem1,
    p2.nome AS personagem2,
    rf.relacao
FROM personagens p1
JOIN relacoes_familiares rf ON p1.id = rf.id_personagem1
JOIN personagens p2 ON rf.id_personagem2 = p2.id;

--) 7 - Os ids dos personagens que participaram de batalhas e possuem dragões
select
	p.id as id_personagem1,
	b.nome as batalhas
from personagens p
join participantes_batalhas pb on p.id = pb.id_personagem
JOIN batalhas b ON pb.id_batalha = b.id
JOIN dragoes d ON d.id_personagem = p.id
ORDER BY p.id;

--) 8 - Os nomes dos personagens que participaram de batalhas e possuem dragões
select
	p.nome as nome_personagem1,
	b.nome as batalhas
from personagens p
join participantes_batalhas pb on p.id = pb.id_personagem
JOIN batalhas b ON pb.id_batalha = b.id
JOIN dragoes d ON d.id_personagem = p.id
ORDER BY p.nome;

--) 9 - Os ids dos personagens que possuem dragões, mas não participaram de nenhuma batalha
select distinct d.id_personagem as id_personagem
from dragoes d
left join participantes_batalhas pb ON d.id_personagem = pb.id_personagem
where pb.id_personagem is null;

--) 10 - Os ids dos personagens que participaram de batalhas em "King's Landing" ou 
-- nasceram antes do ano 090.
select distinct p.id as id_personagem
from personagens p 
join participantes_batalhas pb on p.id = pb.id_personagem
join batalhas b on pb.id_batalha = b.id
where b.nome = 'King\''s Landing'
   OR p.data_nascimento < '0090-01-01';

--) 11 - Os nomes dos personagens que participaram de batalhas em "King's Landing" ou
-- nasceram antes do ano 090
select distinct p.nome as id_personagem
from personagens p 
join participantes_batalhas pb on p.id = pb.id_personagem
join batalhas b on pb.id_batalha = b.id
where b.nome = 'King\''s Landing'
   OR p.data_nascimento < '0090-01-01';


 select * from batalhas;
 select * from personagens;
 select * from dragoes;
 select * from participantes_batalhas;
select * from relacoes_familiares;