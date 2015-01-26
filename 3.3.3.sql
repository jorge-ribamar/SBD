set @matricula = '12-AV-56';

-- Encontrar lugar de estacionamento de dado carro
/*
select * from lugar_veiculo
where matricula = @matricula;
*/

select LUGAR.matricula, nome_parque, LUGAR.id_parque, LUGAR.id_lugar_no_parque, id_morada
from
	(select * from lugar_veiculo
	where matricula = @matricula) as LUGAR INNER JOIN parque
    ON (parque.id_parque = LUGAR.id_parque)

