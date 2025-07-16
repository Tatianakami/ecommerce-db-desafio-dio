-- Clientes
INSERT INTO cliente (email, telefone, tipo) VALUES ('ana@email.com', '1199999999', 'PF');
INSERT INTO cliente (email, telefone, tipo) VALUES ('empresa@empresa.com', '1122223333', 'PJ');

INSERT INTO cliente_pf (id, nome, cpf) VALUES (1, 'Ana Silva', '12345678901');
INSERT INTO cliente_pj (id, razao_social, cnpj) VALUES (2, 'Empresa SA', '12345678000199');

-- Fornecedor
INSERT INTO fornecedor (nome, cnpj) VALUES ('Fornecedor 1', '11111111000191');

-- Vendedor
INSERT INTO vendedor (nome, cpf) VALUES ('Carlos Vendedor', '22233344455');

-- Produto
INSERT INTO produto (nome, preco, id_fornecedor) VALUES ('Mouse', 50.00, 1);

-- Estoque
INSERT INTO estoque (id_produto, quantidade) VALUES (1, 100);

-- Pedido
INSERT INTO pedido (id_cliente, data_pedido, status) VALUES (1, NOW(), 'Processando');

-- Pedido_Produto
INSERT INTO pedido_produto (id_pedido, id_produto, quantidade) VALUES (1, 1, 2);

-- Pagamento
INSERT INTO pagamento (id_pedido, forma_pagamento, valor) VALUES (1, 'Cartão de Crédito', 100.00);

-- Entrega
INSERT INTO entrega (id_pedido, codigo_rastreio, status_entrega) VALUES (1, 'BR123456789', 'Em transporte');
