select nome from aluno;

select aluno.numero, aluno.nome, disciplina.designacao, inscricao.ano, inscricao.nota
from disciplina inner join (aluno inner join inscricao on aluno.numero = inscricao.numero)
on disciplina.codigo = inscricao.codigo order by aluno.numero;

#OU, É A MESMA COISA:
select aluno.numero, aluno.nome, disciplina.designacao, inscricao.ano, inscricao.nota
from aluno, disciplina, inscricao
where aluno.numero = inscricao.numero and disciplina.codigo = inscricao.codigo
order by aluno.numero;

select designacao, nome
from aluno, disciplina, inscricao
where aluno.numero=inscricao.numero and disciplina.codigo=inscricao.codigo
order by designacao, aluno.numero;


select aluno.numero, inscricao.codigo
from aluno left join inscricao on aluno.numero = inscricao.numero;


select avg(nota) as media from inscricao;







