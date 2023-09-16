CREATE DATABASE bdPrototipoPi;
USE bdPrototipoPi;

CREATE TABLE cliente (
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(50),
    nomeFantasia VARCHAR(50),
    cnpj CHAR(14)
);

DESCRIBE cliente;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(50),
    emailUsuario VARCHAR(50),
    senhaUsuario VARCHAR(50),
	idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

DESCRIBE usuario;

CREATE TABLE bovino (
	idBovino INT PRIMARY KEY AUTO_INCREMENT,
    especieBovino VARCHAR(20),
    temperaturaIdealEspecie DECIMAL,
	temperaturaIdealCarneResfriamento DECIMAL,
    temperaturaIdealCarneCongelamento DECIMAL,
    idCliente INT,
    CONSTRAINT chkEspecieBovino CHECK (especieBovino IN ('Nelore', 'Angus', 'Brahman', 'Brangus', 'Senepol', 'Hereford')),
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

DESCRIBE bovino;

CREATE TABLE armazenamento (
	idArmazenamento INT PRIMARY KEY AUTO_INCREMENT,
    tipoArmazenamento VARCHAR(40),
	qtdBovino INT,
	idBovino INT,
    CONSTRAINT chkTipoArmazenamento CHECK (tipoArmazenamento IN ('Pré-abate', 'Pós-abate')),
    FOREIGN KEY (idBovino) REFERENCES bovino(idBovino)
);

DESCRIBE armazenamento;

CREATE TABLE sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    temperaturaSensor DECIMAL, 
    umidadeSensor DECIMAL,
    horario DATETIME default current_timestamp,
    idArmazenamento INT,
    FOREIGN KEY (idArmazenamento) REFERENCES armazenamento(idArmazenamento)
);

DESCRIBE sensor;

-- Inserts
	
INSERT INTO cliente VALUES 
(null, 'JBS S/A', 'Friboi', '02916265004076');
select * from cliente;

INSERT INTO usuario VALUES
(null, 'Friboi', 'friboi@gmail.com', 'rn6BQY53j5', 1);
select * from usuario;

INSERT INTO bovino VALUES
(null, 'Nelore', 21, -18, -40, 1);
select * from bovino;

INSERT INTO armazenamento VALUES
(null,'Pré-abate', 40, 1);
select * from armazenamento;

INSERT INTO sensor (idSensor, temperaturaSensor, umidadeSensor, idArmazenamento) VALUES
(null, 24, 70, 1);
select * from sensor;