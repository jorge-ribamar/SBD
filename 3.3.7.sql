-- Obtencao de matricula e total de faturacao
/*
select Custo_Alugueres.matricula,sum(Custo_Alugueres.Custo) as Faturacao
from(
	select matricula,
	(@periodo:=IF((@periodo:=data_entrega-data_levantamento) = 0,1,@periodo)) as Periodo,
	@periodo* taxa_contratual as Custo
	from aluguer) as Custo_Alugueres
where Custo_Alugueres.Custo is not Null
group by Custo_Alugueres.matricula;
*/

-- Faturacao total de dado modelo

select veiculo.id_modelo, sum(Faturacao) as Faturacao, marca.nome_marca,modelo.nome_modelo
from 
	(select Custo_Alugueres.matricula,sum(Custo_Alugueres.Custo) as Faturacao
	from
		(select matricula,
		(@periodo:=IF((@periodo:=data_entrega-data_levantamento) = 0,1,@periodo)) as Periodo,
		@periodo* taxa_contratual as Custo
		from aluguer) as Custo_Alugueres
	where Custo_Alugueres.Custo is not Null
	group by Custo_Alugueres.matricula ) as matricula_Faturacao,
    veiculo,
    modelo,
    marca
where veiculo.matricula = matricula_Faturacao.matricula 
	and veiculo.id_modelo=modelo.id_modelo
    and modelo.id_marca =  marca.id_marca
group by id_modelo
order by Faturacao desc
LIMIT 3;



