-- Script de criação do banco de dados

CREATE DATABASE IF NOT EXISTS caviar_mobile;

USE caviar_mobile;

CREATE TABLE funcionarios (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    sobrenome VARCHAR (100) NOT NULL,
    email VARCHAR (100) NOT NULL,
    senha VARCHAR (100) NOT NULL,
    cpf VARCHAR (11) NOT NULL,
    data_nascimento DATETIME NOT NULL,
    celular VARCHAR (11) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE clientes (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    sobrenome VARCHAR (100) NOT NULL,
    email VARCHAR (100) NOT NULL,
    senha VARCHAR (100) NOT NULL,
    cpf VARCHAR (11) NOT NULL,
    data_nascimento DATE NOT NULL,
    celular VARCHAR (11) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE estados (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    sigla VARCHAR (2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE cidades (
    id INT NOT NULL AUTO_INCREMENT,
    id_estado INT NOT NULL,
    nome VARCHAR (100) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_estado) REFERENCES estados (id)
);

CREATE TABLE enderecos_clientes (
    id INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_cidade INT NOT NULL,
    nome VARCHAR (100) NOT NULL,
    bairro VARCHAR (100) NOT NULL,
    cep VARCHAR (8) NOT NULL,
    endereco VARCHAR (100) NOT NULL,
    numero VARCHAR (4) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    FOREIGN KEY (id_cidade) REFERENCES cidades (id)
);

CREATE TABLE categorias (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE produtos (
    id INT NOT NULL AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    nome VARCHAR (100) NOT NULL,
    descricao VARCHAR (100) NOT NULL,
    imagem VARCHAR (100) NOT NULL,
    preco_unitario DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES categorias (id)
);

CREATE TABLE formas_pagamento (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    PRIMARY KEY (id),
);

CREATE TABLE formas_recebimento (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    PRIMARY KEY (id),
);

CREATE TABLE status_pedido (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    PRIMARY KEY (id),
);

CREATE TABLE pedidos (
    id INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_endereco_cliente INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    id_forma_recebimento INT NOT NULL,
    id_status_pedido INT NOT NULL,
    observacoes VARCHAR (100) DEFAULT NULL,
    preco_total DECIMAL (10,2) NOT NULL,
    data_hora DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    FOREIGN KEY (id_endereco_cliente) REFERENCES enderecos_clientes (id),
    FOREIGN KEY (id_forma_pagamento) REFERENCES formas_pagamento (id),
    FOREIGN KEY (id_forma_recebimento) REFERENCES formas_recebimento (id),
    FOREIGN KEY (id_status_pedido) REFERENCES status_pedido (id)
);

CREATE TABLE itens_pedidos (
    id INT NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_total DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_pedido) REFERENCES pedidos (id),
    FOREIGN KEY (id_produto) REFERENCES produtos (id)
);
