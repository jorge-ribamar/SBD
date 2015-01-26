-- ranking dos carros, por matricula
/*
select matricula, opiniao, (sum(opiniao='Adorei')*3 + sum(opiniao='Gostei')*1 + sum(opiniao='Não vou voltar')*-2) as Pontuacao
from aluguer
GROUP BY matricula
order by pontuacao desc;
*/

-- ranking dos carros por modelo
/*
select V_M.id_modelo, (sum(V_M.opiniao='Adorei')*3 + sum(V_M.opiniao='Gostei')*1 + sum(V_M.opiniao='Não vou voltar')*-2) as Pontuacao
from (
	select aluguer.matricula, opiniao, id_modelo
	from aluguer, veiculo
	where aluguer.matricula = veiculo.matricula) as V_M
GROUP by V_M.id_modelo
order by pontuacao desc;
*/


-- aluguer, com opiniao, modelo e marca
select id_aluguer, opiniao, veiculo.matricula, veiculo.id_modelo, id_marca
from aluguer, veiculo, modelo
where aluguer.matricula = veiculo.matricula and veiculo.id_modelo = modelo.id_modelo;

-- ranking dos carros por id_marca

select V_M.id_marca, (sum(V_M.opiniao='Adorei')*3 + sum(V_M.opiniao='Gostei')*1 + sum(V_M.opiniao='Não vou voltar')*-2) as Pontuacao
from (
	select id_aluguer, opiniao, veiculo.matricula, veiculo.id_modelo, id_marca
	from aluguer, veiculo, modelo
	where aluguer.matricula = veiculo.matricula and veiculo.id_modelo = modelo.id_modelo) as V_M
GROUP by V_M.id_modelo
order by pontuacao desc;

-- ranking dos carros por nome_marca

select V_M.id_marca, marca.nome_marca , (sum(V_M.opiniao='Adorei')*3 + sum(V_M.opiniao='Gostei')*1 + sum(V_M.opiniao='Não vou voltar')*-2) as Pontuacao
from (
	select id_aluguer, opiniao, veiculo.matricula, veiculo.id_modelo, id_marca
	from aluguer, veiculo, modelo
	where aluguer.matricula = veiculo.matricula and veiculo.id_modelo = modelo.id_modelo) as V_M, marca
where marca.id_marca = V_M.id_marca
GROUP by V_M.id_modelo
order by pontuacao desc;
