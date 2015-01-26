
insert into DISCIPLINA values ('SBD','Sistemas de Bases de Dados');
insert into DISCIPLINA values ('ICD','Infraestuturas Computacionais Distribuídos');
insert into DISCIPLINA values ('TI', 'Tecnologias de Informação');
insert into DISCIPLINA values ('FSO', 'Fundamentos de Sistemas Operativos');
insert into DISCIPLINA values ('SMI', 'Sistemas Multimédia para a Internet');

insert into ALUNO values (1,'ABEL ALVES BOTELHO','M','19801020');
insert into ALUNO values (2,'Abel Alves da Costa Pina ','M','19710504');
insert into ALUNO values (3,'ABILIO DOS SANTOS PINTO ','M','19640114');
insert into ALUNO values (4,'Abílio Pires dos Santos ','M','19750106');
insert into ALUNO values (5,'ACACIO CARDOSO DA ROCHA ','M','19771216');
insert into ALUNO values (6,'Acácio Cardoso do Nascimento ','M','19670201');
insert into ALUNO values (7,'Adalberto Luís Marques Rabaça ','M','19661227');
insert into ALUNO values (8,'ADALBERTO LUIS MARTINHO DE MELO ','M','19661215');
insert into ALUNO values (9,'ADAO DE ALMEIDA SILVARES ','M','19740228');
insert into ALUNO values (10,'Adao de Almeida Vasconcelos ','M','19680608');
insert into ALUNO values (11,'ADAO FINO DA COSTA ','M','19650930');
insert into ALUNO values (12,'Adélia Oliveira Pereira ','F','19650730');
insert into ALUNO values (13,'ADELIA MARIA VAZ PESTANA DIAS ','F','19731030');
insert into ALUNO values (14,'ADERITO AUGUSTO FERREIRINHA ','M','19630318');
insert into ALUNO values (15,'Adérito Augusto Figueira ','M','19720707');
insert into ALUNO values (16,'ZACARIAS MACHADO FERREIRA ','M','19730407');
insert into ALUNO values (17,'ZACARIAS MAGALHAES FERNANDES ','M','19720416');
insert into ALUNO values (18,'Zélia Maria Lima da Costa ','F','19710702');
insert into ALUNO values (19,'Zélia Maria Lopes Dias Moreira ','F','19570807');
insert into ALUNO values (20,'Álvaro Silva d''Almeida','M','19580907');
insert into ALUNO values (21,'António Fagundes Fraga ','M','19591107');
insert into ALUNO values (22,'Abreu Oliveira Antunes','M','19600107');

insert into ALUNO values (23,'Jorge Miguel Santos Fernandes','M','19940507');


insert into INSCRICAO (numero, ano, nota, codigo) values (1, 2011, NULL, 'SBD');


insert into INSCRICAO (numero, ano, nota, codigo) values (2, 2011, 10.0, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (3, 2012, 15.0, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (4, 2012, 10.0, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (6, 2012, NULL, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (7, 2012, 18.0, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (8, 2012, 15.0, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (9, 2012, 13.0, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (10,2012, NULL, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (11,2012, 14.2, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (12,2012, 18.0, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (13,2013, 16.0, 'SBD');
insert into INSCRICAO (numero, ano, nota, codigo) values (14,2012, 14.0, 'ICD');
insert into INSCRICAO (numero, ano, nota, codigo) values (15,2011, 15.0, 'ICD');
insert into INSCRICAO (numero, ano, nota, codigo) values (16,2012, 11.0, 'ICD');
insert into INSCRICAO (numero, ano, nota, codigo) values (18,2012, 11.0, 'ICD');
insert into INSCRICAO (numero, ano, nota, codigo) values (19,2012, 13.1, 'ICD');
insert into INSCRICAO (numero, ano, nota, codigo) values (20,2011, 16.0, 'ICD');
insert into INSCRICAO (numero, ano, nota, codigo) values (21,2012, 17.0, 'ICD');
insert into INSCRICAO (numero, ano, nota, codigo) values (22,2011, 13.0, 'ICD');
insert into INSCRICAO (numero, ano, nota, codigo) values (23, 2014, NULL, 'SBD');


/* 
#APAGAR A MINHA INSCRICAO
delete from INSCRICAO where numero= 23 and codigo= 'SBD';
*/


# LANÇAR NOTA
UPDATE INSCRICAO SET nota = 18 WHERE numero = 10 AND  codigo = 'SBD';

# TENTAR INSCREVER DE NOVO NA CADEIRA
insert into INSCRICAO (numero, ano, nota, codigo) values (23, 2015, NULL, 'SBD');

#ALTERAÇAO PRIMARY KEY P PERMITIR 1 INSCRICAO DE ALUNO A UC POR ANO
ALTER TABLE INSCRICAO DROP PRIMARY KEY, ADD PRIMARY KEY(numero, codigo, ano);

# TENTAR INSCREVER DE NOVO NA CADEIRA
insert into INSCRICAO (numero, ano, nota, codigo) values (23, 2015, NULL, 'SBD');



UPDATE ALUNO SET nome = UPPER(nome) ;


