select 
    U.nome, 
    B.data_emissao, 
    A.numero_assento, 
    V.numero_voo,
    V.horario_partida, 
    AERO.nome as aeroporto_origem
from Usuario U
join Reserva R on U.id_usuario = R.id_usuario  
join Bilhete B on B.id_reserva = R.id_reserva 
join Assento A on B.id_assento = A.id_assento  
join Voo V on A.id_voo = V.id_voo  
join Aeroporto AERO on V.id_aeroporto_origem = AERO.id_aeroporto  
where R.status like 'confirmada'
order by U.nome;
