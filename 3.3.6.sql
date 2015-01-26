-- Obtenção de todos os registos de kilometros
/*
select ks.id_registo, n_ks, matricula, data
	from ks, registo
	where ks.id_registo = registo.id_registo;
 */ 

-- Obtenção da soma dos kilometros de cada carro
/*
select matricula, sum(n_ks)
from ks, registo
where ks.id_registo = registo.id_registo
GROUP BY matricula;
*/

-- Sorting por numero de kilometros e escolha dos primeiros 5
select matricula, sum(n_ks)
from ks, registo
where ks.id_registo = registo.id_registo
GROUP BY matricula
order by sum(n_ks) desc
LIMIT 5;



