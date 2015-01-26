-- Consulta carros disponiveis

SELECT * FROM veiculo, categoria
where estado='Disponivel' and 
	veiculo.id_categoria = categoria.id_categoria;
    
-- Consulta Clientes

SELECT * FROM cliente;

-- Consulta Condutor

SELECT * FROM condutor;
    
-- Consulta Moradas

SELECT * FROM morada;

-- Consulta Parques

SELECT * FROM parque join morada
	on parque.id_morada = morada.id_morada;
    