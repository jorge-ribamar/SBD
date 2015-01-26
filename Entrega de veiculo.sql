-- Devolucao de um carro


set @data = curdate();
set @id_aluguer = 1;
set @opiniao = 'Gostei';
set @id_parque = 1;

update aluguer 
set data_entrega = @data,
	opiniao = @opiniao
where aluguer.id_aluguer = @id_aluguer;


set @a_pagar = ( 
	select IF((@periodo:=data_entrega-data_levantamento) = 0,1,@periodo) * taxa_contratual
	from aluguer
    where aluguer.id_aluguer = @id_aluguer
    );
    
/* ALTERAR RANKING DO CLIENTE */
set @id_cliente = ( 
	select id_cliente
	from aluguer
    where aluguer.id_aluguer = @id_aluguer
    );

update cliente 
set reputacao = cliente.reputacao + @a_pagar/1000
where cliente.id_cliente = @id_cliente;    


/* alterar estado do carro */ 

set @matricula = ( 
	select matricula
	from aluguer
    where aluguer.id_aluguer = @id_aluguer
    );
    
    
update veiculo 
set estado = 'Disponivel'
where veiculo.matricula = @matricula;


/* ESTACIONAR CARRO */ 

/*
-- Obtenção da lista de todos os lugares de um parque e respectivo carro
select lugar.id_parque, lugar.id_lugar_no_parque, lugar_veiculo.matricula
from lugar left outer join lugar_veiculo
on (lugar.id_parque = lugar_veiculo.id_parque and lugar.id_lugar_no_parque = lugar_veiculo.id_lugar_no_parque)
*/

-- Obtencao dos lugares livres e respectivas categorias
/*
select * 
from(
	select lugar.id_parque, lugar.id_lugar_no_parque, lugar_veiculo.matricula
	from lugar left outer join lugar_veiculo
		on (lugar.id_parque = lugar_veiculo.id_parque and lugar.id_lugar_no_parque = lugar_veiculo.id_lugar_no_parque)
		where (matricula is NULL or matricula='')) as lugares_livres
	left outer join lugar_categoria
    on (lugar_categoria.id_parque = lugares_livres.id_parque and lugar_categoria.id_lugar_no_parque = lugares_livres.id_lugar_no_parque)
*/


-- Obtencao dos lugares livres em dado parque e dada categoria
/*
select lugar_categoria.id_parque, lugar_categoria.id_lugar_no_parque, lugar_categoria.id_categoria 
from
	(select lugar.id_parque, lugar.id_lugar_no_parque, lugar_veiculo.matricula
	from lugar left outer join lugar_veiculo
		on (lugar.id_parque = lugar_veiculo.id_parque and lugar.id_lugar_no_parque = lugar_veiculo.id_lugar_no_parque)
		where (matricula is NULL or matricula='')) as lugares_livres
	left outer join lugar_categoria
	on (lugar_categoria.id_parque = lugares_livres.id_parque and lugar_categoria.id_lugar_no_parque = lugares_livres.id_lugar_no_parque)
where id_categoria = (select veiculo.id_categoria  from veiculo where veiculo.matricula = @matricula)
*/

-- Obtencao do primeiro lugar vago

set @id_lugar = (select lugar_categoria.id_lugar_no_parque
from
	(select lugar.id_parque, lugar.id_lugar_no_parque, lugar_veiculo.matricula
	from lugar left outer join lugar_veiculo
		on (lugar.id_parque = lugar_veiculo.id_parque and lugar.id_lugar_no_parque = lugar_veiculo.id_lugar_no_parque)
		where (matricula is NULL or matricula='')) as lugares_livres
	left outer join lugar_categoria
	on (lugar_categoria.id_parque = lugares_livres.id_parque and lugar_categoria.id_lugar_no_parque = lugares_livres.id_lugar_no_parque)
where id_categoria = (select veiculo.id_categoria  from veiculo where veiculo.matricula = @matricula)
limit 1);


INSERT INTO `Car_Rental`.`Lugar_Veiculo` (`id_parque`, `id_lugar_no_parque`, `matricula`) VALUES (@id_parque ,@id_lugar, @matricula);
