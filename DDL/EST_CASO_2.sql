CREATE DATABASE EXERCICIO2_DDL;
USE EXERCICIO2_DDL;

CREATE TABLE IF NOT EXISTS GRUPOS(
ID_GRUPO INT PRIMARY KEY,
NOME_GRUPO VARCHAR(100) NOT NULL,
DESCRICAO TEXT NOT NULL);

CREATE TABLE IF NOT EXISTS USUARIOS(
ID_USUARIO INT PRIMARY KEY,
NOME_USUARIO VARCHAR(30) NOT NULL,
SOBRENOME_USUARIO VARCHAR(50) NOT NULL,
EMAIL_USUARIO VARCHAR(20) NOT NULL);

CREATE TABLE IF NOT EXISTS POSTAGENS(
ID_POST INT PRIMARY KEY,
TEXTO_POST TEXT,
IMAGEM_POST BLOB,
DATAHORA_POST DATETIME NOT NULL,
USUARIO_POST INT NOT NULL,
CONSTRAINT FK_USUARIO_POST FOREIGN KEY(USUARIO_POST) REFERENCES USUARIOS(ID_USUARIO));

CREATE TABLE IF NOT EXISTS COMENTARIOS(
ID_COMENTARIO INT PRIMARY KEY,
TEXTO_COMENTARIO TEXT NOT NULL,
DATAHORA_COMENTARIO DATETIME NOT NULL,
USUARIO_COMENTARIO INT NOT NULL,
POST_COMENTARIO INT NOT NULL,
CONSTRAINT FK_USUARIO_COMM FOREIGN KEY(USUARIO_COMENTARIO) REFERENCES USUARIOS(ID_USUARIO),
CONSTRAINT FK_POST_COMM FOREIGN KEY(POST_COMENTARIO) REFERENCES POSTAGENS(ID_POST));

CREATE TABLE IF NOT EXISTS USUARIOS_GRUPOS(
UG_USUARIO INT,
UG_GRUPO INT,
PRIMARY KEY(UG_USUARIO,UG_GRUPO),
FOREIGN KEY(UG_USUARIO) REFERENCES USUARIOS(ID_USUARIO),
FOREIGN KEY(UG_GRUPO) REFERENCES GRUPOS(ID_GRUPO));

CREATE TABLE IF NOT EXISTS USUARIOS_SEGUIDORES(
US_USUARIO INT,
US_SEGUIDOR INT,
PRIMARY KEY(US_USUARIO,US_SEGUIDOR),
FOREIGN KEY(US_USUARIO) REFERENCES USUARIOS(ID_USUARIO),
FOREIGN KEY(US_SEGUIDOR) REFERENCES USUARIOS(ID_USUARIO));
