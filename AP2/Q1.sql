select V.numero_voo, Aero.nome, Aero.cidade, Aero.pais
from Voo V 
join Aeroporto Aero on V.id_aeroporto_origem = Aero.id_aeroporto
where Aero.pais like 'Brasil'
order by Aero.nome asc;
