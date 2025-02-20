select A.cidade 
from Aeroporto A
join Voo V on V.id_aeroporto_destino = A.id_aeroporto
group by A.cidade
having count(V.id_voo) >= 3
order by A.cidade
