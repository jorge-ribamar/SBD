
-- Criar aluguer

set @novo_ID := (select max(id_aluguer) from aluguer)+1;
set @n_carta_condutor = '125896548';
set @matricula = '56-AE-25';
set @data_inicio = '2014-12-03';
set @data_fim = '2014-12-05';

set @taxa_contratual := (
	select tarifa from categoria 
	where categoria.id_categoria = (select id_categoria from veiculo where matricula = @matricula)
); 



START TRANSACTION;
INSERT INTO `Car_Rental`.`Aluguer` (`id_aluguer`, `n_carta_condutor`, `id_cliente`, `opiniao`, `taxa_contratual`, `data_inicio`, `data_fim`, `data_levantamento`, `data_entrega`, `matricula`) VALUES 
(@novo_ID, @n_carta_condutor, 2, '', @taxa_contratual, @data_inicio, @data_fim , NULL, NULL, @matricula);

COMMIT;












