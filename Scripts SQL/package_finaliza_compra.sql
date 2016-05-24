create or replace package pack_finaliza_compra is

	procedure criar_venda(tpagamento in VENDA.ID_VENDATIPOPAGAMENTO%type, cli_id in VENDA.ID_VENDACLIENTE%type, total in VENDA.TOTAL_VENDA%type);
	procedure verifica_stock(cli_id in VENDA.ID_VENDACLIENTE%type);
	procedure insere_itens(cli_id in VENDA.ID_VENDACLIENTE%type, iddavenda in venda.id_venda%type);
	procedure limpa_carrinho(cli_id in number);

end pack_finaliza_compra;
/

create or replace package body pack_finaliza_compra is

	/* Procedimento criar venda inicio */
	procedure criar_venda(tpagamento in VENDA.ID_VENDATIPOPAGAMENTO%type, cli_id in VENDA.ID_VENDACLIENTE%type, total in VENDA.TOTAL_VENDA%type) is

		iddavenda number:=venda_seq.nextval;

		Begin
		verifica_stock(cli_id);
		insert into venda values (iddavenda,'1', tpagamento, cli_id, sysdate(), total);
		insere_itens(cli_id, iddavenda);
		limpa_carrinho(cli_id);
	end criar_venda;
	/* Procedimento criar venda fim */

	/* Procedimento verifica stock inicio */
	procedure verifica_stock(cli_id in VENDA.ID_VENDACLIENTE%type) is

		nome produto.NOME_PRODUTO%type;
		qt carrinho.quantidade_produto%type;
		st produto.stock%type;
		erro exception;
		mensag erros.descricao%TYPE;
		codigo erros.codigo%TYPE;

		cursor cr is
		select NOME_PRODUTO, quantidade_produto, stock from carrinho, produto where id_carrinhocliente=cli_id and id_produto = id_carrinhoproduto;

		Begin
			Open cr;
			Loop
			Fetch cr Into nome, qt, st;
			Exit When cr%NOTFOUND;
				If qt > st Then
					mensag:='O stock do produto '|| nome|| ' é insuficiente';
				 raise erro;
				End If;
			End Loop;
		EXCEPTION
			when erro then
				rollback;
				codigo:=sqlcode;
				INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
				commit;
				raise_application_error(-20501,mensag); 		
	end verifica_stock;
	/* Procedimento verifica stock fim */
	
	/* Procedimento insere itens inicio */
	procedure insere_itens(cli_id in VENDA.ID_VENDACLIENTE%type, iddavenda in venda.id_venda%type) is

		idprod number;
		qt number;
		prec number;
		erro exception;
		mensag erros.descricao%TYPE;
		codigo erros.codigo%TYPE;

		cursor citens is
		select id_PRODUTO, quantidade_produto, preco from vista_carrinho where id_cliente=cli_id;

		Begin
			Open citens;
			Loop
			Fetch citens Into idprod, qt, prec;
			Exit When citens%NOTFOUND;
				insert into ITEMSVENDA values(ITEMSVENDA_seq.nextval, idprod, iddavenda, qt, prec);
			End Loop;
		EXCEPTION
			when erro then
				rollback;
				codigo:=sqlcode;
				INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
				commit;
				raise_application_error(-20502,mensag); 		
	end insere_itens;
	/* Procedimento insere itens fim*/
	
	/* Procedimento limpa carrinho inicio*/
	procedure limpa_carrinho(cli_id in number) is
		Begin
		delete from carrinho where id_carrinhocliente=cli_id;
	end limpa_carrinho;
	/* Procedimento limpa carrinho fim*/
	
end pack_finaliza_compra;
