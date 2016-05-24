create or replace package pack_carrinho is
	procedure adicionar_carrinho(prod_id in produto.id_produto%type, cli_id in cliente.id_cliente%type);
	procedure verifica_existencia(prod_id in carrinho.id_carrinhoproduto%type, cli_id number);
	procedure incrementa_carrinho(idcar in carrinho.idcarrinho%type);
	procedure decrementa_carrinho(idcar in carrinho.idcarrinho%type);
	procedure remove_item_carrinho(idcar in carrinho.idcarrinho%type);
end pack_carrinho;
/

create or replace package body pack_carrinho is

	/* Verifica se o produto já existe no carrinho inicio */
	procedure verifica_existencia(prod_id in carrinho.id_carrinhoproduto%type, cli_id number) is

		idcar carrinho.idcarrinho%type;
		mensag erros.descricao%TYPE;
		codigo erros.codigo%TYPE;

		Begin
			select idcarrinho into idcar from carrinho where id_carrinhocliente=cli_id and id_carrinhoproduto= prod_id;
			incrementa_carrinho(idcar);
		EXCEPTION
			When no_data_found then
				adicionar_carrinho(prod_id, cli_id);
			WHEN OTHERS THEN
				ROLLBACK;
				mensag := substr(SQLERRM, 1, 50);
				codigo := SQLCODE;
				INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);		
	end verifica_existencia;
	/* Verifica se o produto já existe no carrinho fim */

	/* Adicionar um produto ao carrinho inicio */
	procedure adicionar_carrinho(prod_id in produto.id_produto%type, cli_id in cliente.id_cliente%type) is
	mensag erros.descricao%TYPE;
    codigo erros.codigo%TYPE;
		
	BEGIN
		insert into carrinho values(carrinho_seq.NEXTVAL, cli_id, prod_id,'1');
		commit;		
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
            mensag := substr(SQLERRM, 1, 50);
            codigo := SQLCODE;
            INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
	End adicionar_carrinho;
	/* Adicionar um produto ao carrinho fim */
	
	
	/* Incrementa a quatidade do carrinho em 1 unidade inicio */
	procedure incrementa_carrinho(idcar in carrinho.idcarrinho%type) is
	mensag erros.descricao%TYPE;
    codigo erros.codigo%TYPE;
	
	BEGIN
		update carrinho set quantidade_produto = (quantidade_produto + 1) where idcarrinho = idcar;
		commit;		
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
            mensag := substr(SQLERRM, 1, 50);
            codigo := SQLCODE;
            INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
	
	end incrementa_carrinho;
	/* Incrementa a quatidade do carrinho em 1 unidade fim */
	
	/* Decrementa a quatidade do carrinho em 1 unidade inicio */
	procedure decrementa_carrinho(idcar in carrinho.idcarrinho%type) is
	mensag erros.descricao%TYPE;
	codigo erros.codigo%TYPE;
	qt carrinho.quantidade_produto%type;
	ERRO EXCEPTION;
	
	BEGIN
		select quantidade_produto into qt from carrinho where idcarrinho = idcar;
		if (qt = 1) then
			raise ERRO;
		else
			update carrinho set quantidade_produto = (quantidade_produto - 1) where idcarrinho = idcar;
			commit;	
		end if;		
	EXCEPTION
		when ERRO THEN
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , 'A quantidade mínima tem de ser 1', sysdate);
			commit;
			raise_application_error(-20601,'A quantidade mínima tem de ser 1'); 
		WHEN OTHERS THEN
			ROLLBACK;
            mensag := substr(SQLERRM, 1, 50);
            codigo := SQLCODE;
            INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
	
	end decrementa_carrinho;
	/* Decrementa a quatidade do carrinho em 1 unidade fim*/
	
	/* Remove 1 item do carrinho inicio*/
	procedure remove_item_carrinho(idcar in carrinho.idcarrinho%type) is
	mensag erros.descricao%TYPE;
    codigo erros.codigo%TYPE;
	
	BEGIN
		delete from carrinho where idcarrinho = idcar;
		commit;		
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
            mensag := substr(SQLERRM, 1, 50);
            codigo := SQLCODE;
            INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
	
	end remove_item_carrinho;
	/* Remove 1 item do carrinho fim*/
	
end pack_carrinho;