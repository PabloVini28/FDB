select V.numero_voo, V.horario_partida
from Voo V
join Aeronave A on A.id_aeronave = V.id_aeronave
where A.id_companhia not in (5,3)
order by V.numero_voo asc
