CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Cliente base
CREATE TABLE cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) NOT NULL,
  telefone VARCHAR(15),
  tipo ENUM('PF', 'PJ') NOT NULL
);

-- Cliente PF
CREATE TABLE cliente_pf (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  cpf CHAR(11) UNIQUE,
  FOREIGN KEY (id) REFERENCES cliente(id)
);

-- Cliente PJ
CREATE TABLE cliente_pj (
  id INT PRIMARY KEY,
  razao_social VARCHAR(100),
  cnpj CHAR(14) UNIQUE,
  FOREIGN KEY (id) REFERENCES cliente(id)
);

-- Fornecedor
CREATE TABLE fornecedor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  cnpj CHAR(14)
);

-- Vendedor
CREATE TABLE vendedor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  cpf CHAR(11)
);

-- Produto
CREATE TABLE produto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  preco DECIMAL(10,2),
  id_fornecedor INT,
  FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id)
);

-- Estoque
CREATE TABLE estoque (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_produto INT,
  quantidade INT,
  FOREIGN KEY (id_produto) REFERENCES produto(id)
);

-- Pedido
CREATE TABLE pedido (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  data_pedido DATETIME,
  status VARCHAR(20),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

-- Tabela de relacionamento entre pedido e produto
CREATE TABLE pedido_produto (
  id_pedido INT,
  id_produto INT,
  quantidade INT,
  PRIMARY KEY (id_pedido, id_produto),
  FOREIGN KEY (id_pedido) REFERENCES pedido(id),
  FOREIGN KEY (id_produto) REFERENCES produto(id)
);

-- Pagamento
CREATE TABLE pagamento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT,
  forma_pagamento VARCHAR(50),
  valor DECIMAL(10,2),
  FOREIGN KEY (id_pedido) REFERENCES pedido(id)
);

-- Entrega
CREATE TABLE entrega (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT,
  codigo_rastreio VARCHAR(50),
  status_entrega VARCHAR(30),
  FOREIGN KEY (id_pedido) REFERENCES pedido(id)
);
