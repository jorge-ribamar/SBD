-- Criar Morada

set @localidade='Atalaia';
set @arruamento = 'Av. dos Pescadores';
set @n_porta = '13 A';
set @coordenadas = '39.750566, -8.803910';

set @novo_ID := (select max(id_morada) from morada)+1;

START TRANSACTION;
INSERT INTO `Car_Rental`.`Morada` (`id_morada`, `localidade`, `arruamento`, `n_porta`, `coordenadas`) VALUES (@novo_ID, @localidade, @arruamento, @n_porta, @coordenadas);
COMMIT;


-- Criar Contacto

set @novo_ID := (select max(id_contacto) from Contacto)+1;
set @pt = True; 
set @n_principal = 914447708;
set @n_alternativo = 261984599;
set @e_mail = 'kati@gmail.com';


START TRANSACTION;
INSERT INTO `Car_Rental`.`Contacto` (`id_contacto`, `pt`, `n_principal`, `n_alternativo`, `e_mail`) VALUES 
	(@novo_ID, @pt, @n_principal, @n_alternativo, @e_mail);
COMMIT;


-- Criar Cliente
set @id_cliente := (select max(id_cliente) from Cliente)+1;
set @nome_cliente = 'Elvira Mateus';
set @id_contacto = 1;
set @id_morada = 1;


START TRANSACTION;
INSERT INTO `Car_Rental`.`Cliente` (`id_cliente`, `nome_cliente`, `reputacao`, `id_contacto`, `id_morada`) VALUES 
	(@id_cliente, @nome_cliente, 0, @id_contacto , @id_morada);

COMMIT;



-- Criar Pessoa
set @id_pessoa := (select max(id_pessoa) from Pessoa)+1;
set @id_cliente = Null; -- Se ficar null é p a pessoa ser condutor e n cliente
set @data_nascimento = '11/10/2000';
set @n_carta = '125896549';
set @nif = 52456896;
set @pessoa_nacional = True;

START TRANSACTION;
USE `Car_Rental`;
INSERT INTO `Car_Rental`.`Pessoa` (`id_pessoa`, `id_cliente`, `data_nascimento`, `n_carta`, `nif`) VALUES 
	(@id_pessoa, @id_cliente, @data_nascimento, @n_carta, @nif);
COMMIT;


/***





Criar pessoa nacional ou internacional






***/




-- Criar Condutor
set @n_carta = '125896549'; -- é referencia de pessoa
set @nome_condutor = 'Elvira Mateus';
set @validade_carta = '2016-09-09';
set @data_emissao_carta = '2010-05-05';
set @id_morada = 1;
set @id_contacto = 1;


START TRANSACTION;
USE `Car_Rental`;
INSERT INTO `Car_Rental`.`Condutor` (`n_carta`, `nome_condutor`, `validade_carta`, `data_emissao_carta`, `id_morada`, `id_contacto`) VALUES
	(@n_carta, @nome_condutor, @validade_carta, @data_emissao_carta, 1, 1);

COMMIT;


-- Adicionar registo ks

set @id_registo := (select max(id_registo) from registo)+1;
set @matricula = '95-ES-95';

START TRANSACTION;
INSERT INTO `Car_Rental`.`Registo` (`id_registo`, `data`, `matricula`) VALUES (@id_registo, curdate(), @matricula);

INSERT INTO `Car_Rental`.`Ks` (`id_registo`, `n_ks`) VALUES (@id_registo, 200);

COMMIT;





-- Adicionar registo intrvencao

set @id_registo := (select max(id_registo) from registo)+1;
set @matricula = '95-ES-95';
set @responsavel = 'Auto-Rapair Palhagueiras.Lda';
set @descricao = 'Inspeção geral';
set @custo = 200;

START TRANSACTION;
INSERT INTO `Car_Rental`.`Registo` (`id_registo`, `data`, `matricula`) VALUES (@id_registo, curdate(), @matricula);

INSERT INTO `Car_Rental`.`Intervencao` (`id_registo`, `responsavel`, `descricao`, `custo`) VALUES 
	(@id_registo, @responsavel,@descricao ,@custo);
COMMIT;










