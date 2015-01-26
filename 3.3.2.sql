


set @data = curdate();
set @matricula = '11-AA-11';


-- Obtenção de registo de aluguer de dado carro a dada data
/*
select * from aluguer
where data_levantamento <= @data and (data_entrega is null or data_entrega>= @data) and matricula = '11-AA-11'
*/

-- Obtenção de condutor dado n_carta_condutor
/*
select * from condutor
where n_carta = 254563
*/


-- Obtenção o condutor de dado carro a dada data
select * from condutor
where n_carta = 
	(select n_carta_condutor from aluguer
	where data_levantamento <= @data and (data_entrega is null or data_entrega>= @data) and matricula = @matricula)