

DROP database IF EXISTS Guia_1;

CREATE DATABASE IF NOT EXISTS Guia_1;

USE Guia_1;

create table IF NOT EXISTS INSCRICAO (
	numero int not null,
	codigo char(4) not null,
	ano int not null,
	nota numeric(3,1) null,
	constraint pk_inscricao primary key (numero, codigo));

create table IF NOT EXISTS ALUNO (
	numero int not null,
	nome varchar(100) not null,
	genero char(1) not null,
	nascido datetime not null,
	constraint pk_aluno primary key (numero));

alter table INSCRICAO add constraint fk_aluno foreign key (numero) references ALUNO (numero);

create table IF NOT EXISTS DISCIPLINA (
	codigo char(4) not null,
	designacao varchar(100) not null,
	constraint pk_aluno primary key (codigo));
 

alter table INSCRICAO add constraint fk_disciplina foreign key (codigo) references DISCIPLINA (codigo);




