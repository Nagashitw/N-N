CREATE or replace VIEW detalhe_produto AS
	SELECT p.id_produto, 
	v.nomevendedor,
	v.id_vendedor,
   p.NOME_PRODUTO,
   p.PRECO,
   p.DESCRICAO,
   p.STOCK,
   p.CATEGORIA,
   f.id_fornecedor,
   f.nome_fornecedor
FROM produto p, vendedor v, fornecedor f
where v.id_vendedor=p.id_produtovendedor and f.id_fornecedor=p.id_produtofornecedor;

create or replace view vista_carrinho as
  select p.id_produto,
	p.nome_produto,
	p.preco,
	v.nomevendedor,
	ca.quantidade_produto,
	ca.idcarrinho,
	cli.id_cliente
	from produto p, vendedor v, carrinho ca, cliente cli
where p.id_produto=ca.id_carrinhoproduto and v.id_vendedor=p.ID_PRODUTOVENDEDOR and ca.ID_CARRINHOCLIENTE=cli.id_cliente;


create or replace view items_por_pagar as
	select id_item,
	id_produto, 
	nome_produto, 
	quantidade_item, 
	preco_item, 
	id_venda, 
	id_vendedor,
	id_cliente,
	data_venda
	from produto, ITEMSVENDA, venda, vendedor, cliente 
	where ITEMSVENDA.ID_ITEMVENDA=id_venda and ITEMSVENDA.ID_ITEMPRODUTO = produto.ID_PRODUTO and produto.ID_PRODUTOVENDEDOR = vendedor.id_vendedor and id_cliente=id_vendacliente and id_vendatipoestado = 1;
	
create or replace view items_pagos as
	select id_item,
	id_produto, 
	nome_produto, 
	quantidade_item, 
	preco_item, 
	id_venda, 
	id_vendedor,
	id_cliente,
	data_venda
	from produto, ITEMSVENDA, venda, vendedor, cliente  
	where ITEMSVENDA.ID_ITEMVENDA=id_venda and ITEMSVENDA.ID_ITEMPRODUTO = produto.ID_PRODUTO and produto.ID_PRODUTOVENDEDOR = vendedor.id_vendedor and id_cliente=id_vendacliente and id_vendatipoestado = 2;
	
create or replace view items_cancelados as
	select id_item,
	id_produto, 
	nome_produto, 
	quantidade_item, 
	preco_item, 
	id_venda, 
	id_vendedor,
	id_cliente,
	data_Venda
	from produto, ITEMSVENDA, venda, vendedor, cliente 
	where ITEMSVENDA.ID_ITEMVENDA=id_venda and ITEMSVENDA.ID_ITEMPRODUTO = produto.ID_PRODUTO and produto.ID_PRODUTOVENDEDOR = vendedor.id_vendedor and id_cliente=id_vendacliente and id_vendatipoestado = 3;
	