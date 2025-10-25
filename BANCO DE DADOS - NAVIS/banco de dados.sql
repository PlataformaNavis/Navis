CREATE DATABASE IF NOT EXISTS navis;
USE navis;

CREATE TABLE usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200),
email VARCHAR(200),
senha VARCHAR(200),
telefone CHAR(11),
tipo_usuario VARCHAR(100),
status_usuario BOOLEAN);

CREATE TABLE endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
bairro VARCHAR(200),
cidade VARCHAR(200),
data_registro DATETIME,
logradouro VARCHAR(200),
risco_nivel VARCHAR(100),
CEP VARCHAR(9),
id_usuario INT,
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE rota(
id_rota INT PRIMARY KEY AUTO_INCREMENT,
origem INT,
destino INT,
distancia FLOAT,
tempo_estimado DATETIME, 
nivel_seguranca VARCHAR(100),
data_criacao DATETIME,
id_usuario INT,
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (origem) REFERENCES endereco (id_endereco) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (destino) REFERENCES endereco (id_endereco) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE avaliacao(
id_avaliacao INT PRIMARY KEY AUTO_INCREMENT, 
tipo_avaliacao VARCHAR(100),
descricao_avaliacao VARCHAR(200),
nota INT,
comentario VARCHAR(200),
data DATETIME,
id_usuario INT, 
id_endereco INT,
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE denuncia(
id_denuncia INT PRIMARY KEY AUTO_INCREMENT, 
descricao_denuncia VARCHAR(200),
data_envio DATETIME,
status_verificacao VARCHAR(100),
id_usuario INT, 
id_endereco INT,
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE boletim(
id_boletim INT PRIMARY KEY AUTO_INCREMENT,
tipo_ocorrencia VARCHAR(100),
descricao_boletim VARCHAR (200),
data_ocorrencia DATETIME,
status_boletim VARCHAR(100),
id_usuario INT, 
id_endereco INT,
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE alerta(
id_alerta INT PRIMARY KEY AUTO_INCREMENT,
tipo_alerta VARCHAR(200),
descricao_alerta VARCHAR(200),
data_envio DATETIME,
ativo BOOLEAN, 
id_endereco INT,
FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco) ON DELETE CASCADE ON UPDATE CASCADE
);


