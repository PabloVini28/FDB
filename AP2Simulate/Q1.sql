select V.numero_voo, A.numero_assento, A.classe
from Assento A
join Voo V on A.id_voo = V.id_voo
where A.status = 'disponível'
order by V.numero_voo, A.numero_assento;
