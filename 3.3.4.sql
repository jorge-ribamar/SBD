-- Sorting por custo de reparacoes
select matricula, sum(custo)
from intervencao, registo
where intervencao.id_registo = registo.id_registo
GROUP BY matricula
order by sum(custo);