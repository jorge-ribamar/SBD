-- Levantar carro


set @id_aluguer = 3;
set @matricula := (select matricula from aluguer where id_aluguer = @id_aluguer);


update aluguer 
SET data_levantamento= curdate()
where id_aluguer = @id_aluguer;



DELETE FROM lugar_veiculo where matricula = @matricula;


update veiculo 
SET estado = 'Alugado'
where matricula = @matricula;




