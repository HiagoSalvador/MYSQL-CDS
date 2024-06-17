CREATE DATABASE Db_CDs;

USE Db_CDs;

-- Tabela de Artista
CREATE TABLE Tb_Artista (
    id_Artista INT AUTO_INCREMENT NOT NULL, 
    Cod_Artista INT NOT NULL, 
    Nome_Artista VARCHAR(100) NOT NULL UNIQUE, 
    CONSTRAINT pk_id_Artista PRIMARY KEY (id_Artista) 
);



DESCRIBE Tb_Artista;

-- Tabela de Gravadora
CREATE TABLE Tb_Gravadora (
    id_Gravadora INT AUTO_INCREMENT NOT NULL, 
    Cod_Gravadora INT NOT NULL, 
    Nome_Gravadora VARCHAR(50) NOT NULL UNIQUE, 
    CONSTRAINT pk_id_Gravadora PRIMARY KEY (id_Gravadora)  
);



DESCRIBE Gravadora;

-- Tabela de Categoria
CREATE TABLE Tb_Categoria (
    id_Categoria INT AUTO_INCREMENT NOT NULL, 
    Cod_Categoria INT NOT NULL, 
    Nome_Categoria VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT pk_id_Categoria PRIMARY KEY (id_Categoria)  
);



DESCRIBE Categoria;

-- Tabela de Estado
CREATE TABLE Tb_Estado (
    id_Estado INT AUTO_INCREMENT NOT NULL, 
    Sigla_Estado CHAR(2) NOT NULL,
    Nome_Estado VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT pk_id_Estado PRIMARY KEY (id_Estado)  
);




DESCRIBE Tb_Estado;

CREATE INDEX idx_Sigla_Estado ON Tb_Estado(Sigla_Estado);

-- Tabela de Cidade
CREATE TABLE Tb_Cidade (
    id_Cidade INT AUTO_INCREMENT NOT NULL, 
    Cod_Cidade INT NOT NULL, 
    Sigla_Estado CHAR(2) NOT NULL,
    Nome_Cidade VARCHAR(100) NOT NULL,
    fk_id_Estado INT NOT NULL,
    
    CONSTRAINT pk_id_Cidade PRIMARY KEY (id_Cidade),
    CONSTRAINT fk_id_Estado FOREIGN KEY (fk_id_Estado) REFERENCES Tb_Estado(id_Estado)
);

DESCRIBE Tb_Cidade;

-- Tabela de Cliente
CREATE TABLE Tb_Cliente (
    id_Cliente INT AUTO_INCREMENT NOT NULL, 
    Cod_Cli INT NOT NULL, 
    Cod_Cid INT NOT NULL, 
    Nome_Cli VARCHAR(100) NOT NULL, 
    End_Cli VARCHAR(200) NOT NULL, 
    Renda_Cli DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (Renda_Cli >= 0), 
    Sexo_Cli CHAR(1) NOT NULL DEFAULT 'F' CHECK (Sexo_Cli IN ('F', 'M')), 
    fk_id_cidade INT NOT NULL,
    CONSTRAINT pk_id_Cliente PRIMARY KEY (id_Cliente), 
    CONSTRAINT fk_id_Cidade FOREIGN KEY (fk_id_Cidade) REFERENCES Tb_Cidade(id_Cidade)
);

describe Tb_Cliente;

CREATE TABLE Tb_Conjuge (
    id_Conjuge INT AUTO_INCREMENT NOT NULL, 
    Cod_Cli INT NOT NULL, 
    Nome_Conj VARCHAR(100) NOT NULL, 
    Renda_Conj DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (Renda_Conj >= 0), 
    Sexo_Conj CHAR(1) NOT NULL DEFAULT 'M' CHECK (Sexo_Conj IN ('F', 'M')), 
    fk_id_Cliente INT NOT NULL,
    CONSTRAINT pk_id_Conjuge PRIMARY KEY (id_Conjuge), 
    CONSTRAINT fk_id_Cliente FOREIGN KEY (fk_id_Cliente) REFERENCES Tb_Cliente(id_Cliente)
);


describe Tb_Conjuge;


CREATE TABLE Tb_Funcionario (
    id_Funcionario INT AUTO_INCREMENT NOT NULL, 
    Cod_Func INT NOT NULL, 
    Nome_Func VARCHAR(100) NOT NULL, 
    End_Func VARCHAR(200) NOT NULL, 
    Sal_Func DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (Sal_Func >= 0), 
    Sexo_Func CHAR(1) NOT NULL DEFAULT 'M' CHECK (Sexo_Func IN ('F', 'M')), 
    CONSTRAINT pk_id_Funcionario PRIMARY KEY (id_Funcionario)

);

CREATE TABLE Tb_Dependente (
    Cod_Dep INT NOT NULL, 
    Cod_Func INT NOT NULL, 
    Nome_Dep VARCHAR(100) NOT NULL, 
    Sexo_Dep CHAR(1) NOT NULL DEFAULT 'M' CHECK (Sexo_Dep IN ('F', 'M')), 
    fk_id_Funcionario INT NOT NULL,
    CONSTRAINT pk_Cod_Dep PRIMARY KEY (Cod_Dep), 
    CONSTRAINT fk_id_Funcionario FOREIGN KEY (fk_id_Funcionario) REFERENCES Tb_Funcionario(id_Funcionario)
);



CREATE TABLE Tb_Titulo (
    Cod_Tit INT NOT NULL, 
    Cod_Cat INT NOT NULL, 
    Cod_Grav INT NOT NULL, 
    Nome_CD VARCHAR(100) NOT NULL, 
    Val_CD DECIMAL(10,2) NOT NULL CHECK (Val_CD > 0), 
    Qtd_Estq INT NOT NULL CHECK (Qtd_Estq >= 0), 
     fk_id_Categoria INT NOT NULL,
     fk_id_Gravadora INT NOT NULL,
    CONSTRAINT pk_Cod_Tit PRIMARY KEY (Cod_Tit), 
    CONSTRAINT fk_id_Categoria FOREIGN KEY (fk_id_Categoria) REFERENCES Tb_Categoria(id_Categoria), 
    CONSTRAINT fk_id_Gravadora FOREIGN KEY (fk_id_Gravadora) REFERENCES Tb_Gravadora(id_Gravadora), 
    CONSTRAINT uk_Nome_CD UNIQUE (Nome_CD)
);


CREATE TABLE Tb_Pedido (
    id_Pedido INT AUTO_INCREMENT NOT NULL, 
    Num_Ped INT NOT NULL, 
    Cod_Cli INT NOT NULL, 
    Cod_Func INT NOT NULL, 
    Data_Ped DATETIME NOT NULL, 
    Val_Ped DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (Val_Ped >= 0), 
    fk_id_Cliente INT NOT NULL,
    fk_id_Funcionario INT NOT NULL,
    CONSTRAINT pk_id_Pedido PRIMARY KEY (id_Pedido), 
    CONSTRAINT fk_Tb_Pedido_Cliente FOREIGN KEY (fk_id_Cliente) REFERENCES Tb_Cliente(id_Cliente), 
    CONSTRAINT fk_Tb_Pedido_Funcionario FOREIGN KEY (fk_id_Funcionario) REFERENCES Tb_Funcionario(id_Funcionario)
);

CREATE TABLE Tb_Titulo_Pedido (
    id_Pedido INT NOT NULL, 
    Cod_Tit INT NOT NULL, 
    Qtd_CD INT NOT NULL CHECK (Qtd_CD >= 1), 
    Val_CD DECIMAL(10,2) NOT NULL CHECK (Val_CD > 0), 
    fk_Cod_Tit INT NOT NULL,
    fk_id_Pedido INT NOT NULL,
    CONSTRAINT pk_Titulo_Pedido PRIMARY KEY (id_Pedido, Cod_Tit), 
    CONSTRAINT fk_id_Pedido FOREIGN KEY (id_Pedido) REFERENCES Tb_Pedido(id_Pedido), 
    CONSTRAINT fk_Cod_Tit FOREIGN KEY (fk_Cod_Tit) REFERENCES Tb_Titulo(Cod_Tit)
);


CREATE TABLE Tb_Titulo_Artista (
  id_Titulo_Artista INT NOT NULL auto_increment,
  Cod_Artista INT NOT NULL,  
  fk_Cod_Tit INT NOT NULL,  
  CONSTRAINT pk_id_Titulo_Artista PRIMARY KEY (id_Titulo_Artista),  
  CONSTRAINT fk_Titulo FOREIGN KEY (fk_Cod_Tit) REFERENCES Tb_Titulo(Cod_Tit),  
  CONSTRAINT fk_Artista FOREIGN KEY (Cod_Artista) REFERENCES Tb_Artista(id_Artista)
);

describe Tb_Titulo_Artista;














