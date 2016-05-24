create or replace package pack_produto is
	
	procedure mostrar_produto_vendedor(nome detalhe_produto.nomevendedor%type, lista out sys_refcursor);
	procedure mostrar_produto_categoria(cat detalhe_produto.categoria%type, lista out sys_refcursor);
	procedure mostrar_produto_loja(lista out sys_refcursor);
	procedure mostrar_produto_detalhe(prod_id detalhe_produto.id_produto%type, lista out sys_refcursor);
	procedure mostrar_prod_vendedor(vend detalhe_produto.id_vendedor%type, lista out sys_refcursor);
	
	
	procedure inserir_produto(idvend in number, idforn in number, nome in produto.nome_produto%type, prec in produto.preco%type, descr in produto.descricao%type, st in produto.stock%type, cat in produto.categoria%type);
	procedure mostrar_produto_editar(idprod in number, fornecedor out detalhe_produto.nome_fornecedor%type, nome out produto.nome_produto%type, prec out produto.preco%type, descr out produto.descricao%type, st out produto.stock%type, cat out produto.categoria%type);
	procedure editar_produto(idprod in number, nome in produto.nome_produto%type, prec in produto.preco%type, descr in produto.descricao%type, st in produto.stock%type, cat in produto.categoria%type);
	procedure remover_produto(idprod in produto.id_produto%type);
end pack_produto;
/

create or replace package body pack_produto is

	/* Procedimento que lista os produtos filtrados por vendedor inicio */
	procedure mostrar_produto_vendedor(nome detalhe_produto.nomevendedor%type, lista out sys_refcursor) is
	codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_produto, categoria, nome_produto, nomevendedor, preco from detalhe_produto where nomevendedor=nome;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Produto não encontrado' , sysdate);
			commit;
			raise_application_error(-20201,'Produto não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
				values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20202,'Nao foi possivel mostrar os dados!');
	
	end mostrar_produto_vendedor;
	/* Procedimento que lista os produtos filtrados por vendedor fim */
	
	/* Procedimento que lista os produtos filtrados por categoria inicio */
	procedure mostrar_produto_categoria(cat detalhe_produto.categoria%type, lista out sys_refcursor) is
	codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_produto, categoria, nome_produto, nomevendedor, preco from detalhe_produto where categoria=cat;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Produto não encontrado' , sysdate);
			commit;
			raise_application_error(-20203,'Produto não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20204,'Nao foi possivel mostrar os dados!');
	
	end mostrar_produto_categoria;
	/* Procedimento que lista os produtos filtrados por categoria fim */

	/* Procedimento que lista os dados simples do produto inicio */
	procedure mostrar_produto_loja(lista out sys_refcursor) is
	codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_produto, categoria, nome_produto, nomevendedor, preco from detalhe_produto;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Produto não encontrado' , sysdate);
			commit;
			raise_application_error(-20205,'Produto não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20206,'Nao foi possivel mostrar os dados!');
	
	end mostrar_produto_loja;
	/* Procedimento que lista os dados simples do produto fim */
	
	/* Procedimento que lista os dados em detalhe do produto inicio */
	procedure mostrar_produto_detalhe(prod_id detalhe_produto.id_produto%type, lista out sys_refcursor) is
	codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_produto, categoria, nome_produto, nomevendedor, preco, descricao, stock from detalhe_produto where id_produto=prod_id;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Produto não encontrado' , sysdate);
			commit;
			raise_application_error(-20207,'Produto não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20208,'Nao foi possivel mostrar os dados!');
	end mostrar_produto_detalhe;
	/* Procedimento que lista os dados em detalhe do produto fim */
	
	/* Procedimento que lista os dados em detalhe do produto para o vendedor inicio */
	procedure mostrar_prod_vendedor(vend detalhe_produto.id_vendedor%type, lista out sys_refcursor) is
	codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_produto, categoria, nome_produto, nome_fornecedor, preco, descricao, stock from detalhe_produto where id_vendedor=vend;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Produto não encontrado' , sysdate);
			commit;
			raise_application_error(-20209,'Produto não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20210,'Nao foi possivel mostrar os dados!');
	end mostrar_prod_vendedor;
	/* Procedimento que lista os dados em detalhe do produto para o vendedor fim */
	
	
	procedure inserir_produto(
		idvend in number, 
		idforn in number, 
		nome in produto.nome_produto%type, 
		prec in produto.preco%type, 
		descr in produto.descricao%type, 
		st in produto.stock%type, 
		cat in produto.categoria%type
	) is
	
	mensag erros.descricao%TYPE;
	codigo erros.codigo%TYPE;

	BEGIN
		insert into produto values(produto_seq.NEXTVAL, idvend, idforn, nome, prec, descr, st, cat);
		commit;		
	EXCEPTION
    WHEN NO_DATA_FOUND THEN
    mensag:= substr(SQLERRM,1,50);
    codigo:= SQLCODE;
    INSERT INTO ERROS VALUES(erros_seq.nextval,codigo,mensag,sysdate);
    ROLLBACK;
		WHEN OTHERS THEN
			ROLLBACK;
            mensag := substr(SQLERRM, 1, 50);
            codigo := SQLCODE;
            INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
	End inserir_produto;
	
	procedure mostrar_produto_editar(idprod in number, fornecedor out detalhe_produto.nome_fornecedor%type, nome out produto.nome_produto%type, prec out produto.preco%type, descr out produto.descricao%type, st out produto.stock%type, cat out produto.categoria%type) is
	codigo erros.codigo%TYPE;
	erro exception;
	pragma exception_init(erro,-54);
	
	begin
		select nome_fornecedor, nome_produto, preco, descricao, stock, categoria into fornecedor, nome, prec, descr, st, cat from detalhe_produto where id_produto=idprod for update nowait;

	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Produto não encontrado' , sysdate);
			commit;
			raise_application_error(-20211,'Produto não encontrado');
		when erro then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , 'Registo ocupado, tente mais tarde.', sysdate);
			commit;
			raise_application_error(-20212,'Registo ocupado, tente mais tarde.'); 
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20213,'Nao foi possivel mostrar os dados!');
	end mostrar_produto_editar;

	procedure editar_produto(
		idprod in number, 
		nome in produto.nome_produto%type, 
		prec in produto.preco%type, 
		descr in produto.descricao%type, 
		st in produto.stock%type, 
		cat in produto.categoria%type
	) is
	
	mensag erros.descricao%TYPE;
  codigo erros.codigo%TYPE;

	BEGIN
		update produto set 
			nome_produto = nome,
			preco = prec,
			descricao = descr,
			stock = st,
			categoria = cat
			where id_produto = idprod;
		commit;		
	EXCEPTION
    WHEN NO_DATA_FOUND THEN
    mensag:= substr(SQLERRM,1,50);
    codigo:= SQLCODE;
    INSERT INTO ERROS VALUES(erros_seq.nextval,codigo,mensag,sysdate);
    ROLLBACK;
		WHEN OTHERS THEN
			ROLLBACK;
            mensag := substr(SQLERRM, 1, 50);
            codigo := SQLCODE;
            INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
	End editar_produto;

procedure remover_produto(idprod in produto.id_produto%type)
is

mensag erros.descricao%TYPE;
codigo erros.codigo%TYPE;

BEGIN
delete from produto where id_produto = idprod;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
    mensag:= substr(SQLERRM,1,50);
    codigo:= SQLCODE;
    INSERT INTO ERROS VALUES(erros_seq.nextval,codigo,mensag,sysdate);
    ROLLBACK;
		WHEN OTHERS THEN
			ROLLBACK;
            mensag := substr(SQLERRM, 1, 50);
            codigo := SQLCODE;
            INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
End remover_produto;
	
end pack_produto;