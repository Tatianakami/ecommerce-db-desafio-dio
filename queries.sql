-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT c.id, c.email, COUNT(p.id) AS total_pedidos
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
GROUP BY c.id, c.email;

-- 2. Algum vendedor também é fornecedor?
SELECT v.nome
FROM vendedor v
JOIN fornecedor f ON v.nome = f.nome;

-- 3. Relação de produtos, fornecedores e estoques
SELECT p.nome AS produto, f.nome AS fornecedor, e.quantidade
FROM produto p
JOIN fornecedor f ON p.id_fornecedor = f.id
JOIN estoque e ON p.id = e.id_produto;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT f.nome AS fornecedor, p.nome AS produto
FROM fornecedor f
JOIN produto p ON f.id = p.id_fornecedor;

-- 5. Total de valor pago por cliente
SELECT c.email, SUM(pg.valor) AS total_pago
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
JOIN pagamento pg ON p.id = pg.id_pedido
GROUP BY c.email
HAVING total_pago > 0;

-- 6. Produtos com estoque menor que 10 unidades
SELECT p.nome, e.quantidade
FROM produto p
JOIN estoque e ON p.id = e.id_produto
WHERE e.quantidade < 10
ORDER BY e.quantidade ASC;
