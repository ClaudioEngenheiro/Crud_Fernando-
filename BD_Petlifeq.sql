CREATE DATABASE PETLIFEQ;
USE PETLIFEQ;

CREATE TABLE ANIMAIS(
codigo INT NOT NULL,
nome VARCHAR(30) NOT NULL,
apto bool NOT NULL,
Vacina bool NOT NULL,
Sexo_M VARCHAR(6),
Sexo_F VARCHAR(6),
CONSTRAINT PK_codigo PRIMARY KEY(codigo)
);

CREATE TABLE PARCEIROS(
codigo INT NOT NULL,
CRMV VARCHAR(30) NOT NULL,
nome VARCHAR(30) NOT NULL,
CPF INT NOT NULL,
endereco VARCHAR(100) NOT NULL,
telefone CHAR(9) NOT NULL,
resposabilidade CHAR(11) NOT NULL,
especializacao VARCHAR(30) NOT NULL,

CONSTRAINT PK_Parceiros_codigo PRIMARY KEY(codigo)
);

CREATE TABLE COLABORADOR( 
nome VARCHAR(30) NOT NULL,
endereco VARCHAR(100) NOT NULL,
telefone CHAR(9) NOT NULL,
CPF CHAR(11) NOT NULL,
codigo INT NOT NULL,

CONSTRAINT PK_Colaborador_codigo PRIMARY KEY (codigo)
);

CREATE TABLE EMPRESA(
nome VARCHAR(30) NOT NULL,
endereco VARCHAR(100) NOT NULL,
telefone CHAR(9) NOT NULL,
Codigo INT NOT NULL,
CNPJ CHAR(11) NOT NULL,

CONSTRAINT PK_empresa_CNPJ PRIMARY KEY(CNPJ)
);

CREATE TABLE TERAPIA(
PARCEIRO_codigo INT NOT NULL,
ANIMAL_codigo INT NOT NULL,
codigo INT NOT NULL,
Data_Consulta DATETIME NOT NULL,
FK_Animal_codigo INT NOT NULL,
FK_PARCEIRO_codigo INT NOT NULL,

FOREIGN KEY (FK_ANIMAL_codigo) REFERENCES ANIMAIS(codigo),
FOREIGN KEY (FK_PARCEIRO_codigo) REFERENCES PARCEIROS(codigo),

CONSTRAINT PK_codigo PRIMARY KEY(codigo)
);

CREATE TABLE Agenda(
Codigo INT NOT NULL,
Data_Consulta Datetime NOT NULL,
CONSTRAINT PK_Codigo PRIMARY KEY (Codigo)
);

INSERT INTO ANIMAIS (CODIGO, NOME, APTO, VACINA, SEXO_M, SEXO_F)
VALUES
(001, CACHORRO, SIM, RAIVA, MACHO, NULL);

SELECT * FROM ANIMAIS
WHERE nome=Cachorro;

UPDATE ANIMAIS
SET APTO = NAO
WHERE codigo = 1;

DELETE FROM Animais
WHERE Sexo_M =Macho;

SELECT * FROM ANIMAIS
WHERE nome=Fifi;

UPDATE ANIMAIS
SET APTO = TRUE
WHERE codigo = 1;

DELETE FROM Animais
WHERE Sexo_M =MACHO;

INSERT INTO PARCEIROS (CODIGO, CRMV, NOME, CPF, ENDERECO, TELEFONE, RESPONSABILIDADE, ESPECIALIZACAO)
VALUES 
(010, "14156", "PEDRO_RANGEL", 12345678911, "RUA SILVIO HERTZ 54", "(43)98856-1357", "VETERINARIO", "CIRURGIA");

INSERT INTO PARCEIROS (CODIGO, CRMV, NOME, CPF, ENDERECO, TELEFONE, RESPONSABILIDADE, ESPECIALIZACAO)
VALUES 
(045, "15456", "RANGEL", 12345678911, "RUA HANZ 54", "(43)98856-1357", "VETERINARIO", "K");


UPDATE PARCEIROS
SET ESPECIALIZACAO="CONSULTA"
WHERE codigo = 10;

DELETE FROM PARCEIROS
WHERE CPF ="12345678911";

# COMENTARIO DO PROFESSOR

# simplificar diagrama conceitual exemplo entidade veterinario possuir atributos nome e telefone  tirar entidade consulta 
# colaborador interligado na agenda, .Entidade animal possuira nome, vacinação, veterinario e especie
# definir as 4 funções adicionar , remover, alterar, listar
