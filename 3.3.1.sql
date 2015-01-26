-- Lista todos os carros (matricula, marca, modelo)
/*
select M.matricula, marca.nome_marca, M.nome_modelo
from  
	(select veiculo.matricula, modelo.id_marca, modelo.nome_modelo
	from veiculo, modelo
	where veiculo.id_modelo = modelo.id_modelo) as M
    , marca
    where marca.id_marca = M.id_marca 
*/


-- Retirar id de dada marca
/*
select marca.nome_marca, marca.id_marca
from marca
where marca.nome_marca = 'Citroen'
*/

-- Adquirir id de modelos de dada marca
/*
select M.nome_marca, modelo.id_modelo
from (select marca.nome_marca, marca.id_marca
	from marca
	where marca.nome_marca = 'Citroen')as M, modelo
where M.id_marca = modelo.id_marca
*/

-- Adquirir todos os veiculos de dada marca

select Modelos.nome_marca, veiculo.matricula, Modelos.id_modelo, Modelos.nome_modelo
from (select M.nome_marca, modelo.id_modelo, modelo.nome_modelo
	from (select marca.nome_marca, marca.id_marca
		from marca
		where marca.nome_marca = 'Volkswagen')as M, modelo
	where M.id_marca = modelo.id_marca) as Modelos, veiculo
where Modelos.id_modelo = veiculo.id_modelo







