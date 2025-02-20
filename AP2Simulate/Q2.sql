select A.id_aeronave, A.modelo, count(V.numero_voo)
from Aeronave A
join Voo V on V.id_aeronave = A.id_aeronave
group by A.id_aeronave, A.modelo
order by A.id_aeronave;
