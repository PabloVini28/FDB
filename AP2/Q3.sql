select U.nome, U.email
from Usuario U left join Reserva R on R.id_usuario = U.id_usuario
where R.id_reserva is null
