select U.nome, V.numero_voo, Aero.nome
from Usuario U 
join Reserva R on R.id_usuario = U.id_usuario
join Voo v on R.id_voo = V.id_voo
join Aeroporto Aero on V.id_aeroporto_destino = Aero.id_aeroporto
where R.status like 'confirmada'
order by U.nome asc, V.numero_voo asc;
