create or replace package pack_encomendas is
	
	procedure mostrar_encomenda_produto(idproduto encomendas.id_encomendaproduto%type ,lista out sys_refcursor);
	procedure mostrar_encomenda_fornecedor(idfornecedor encomendas.id_encomendafornecedor%type ,lista out sys_refcursor);
	procedure inserir_encomendas (
idprodutoencomenda in encomendas.id_encomendaproduto%type,
idencomenda_for in encomendas.id_encomendafornecedor%type,
data in encomendas.dataencomenda%type,
data_re in encomendas.datarecepcao%type,
quantidade in encomendas.qt_encomendada%type
);
	procedure editar_encomendas(idencomenda in encomendas.idencomenda%type,idprodutoencomenda in encomendas.id_encomendaproduto%type,idencomenda_for in encomendas.id_encomendafornecedor%type,data_enc in encomendas.dataencomenda%type,data_re in encomendas.datarecepcao%type,quantidade in encomendas.qt_encomendada%type);
	procedure remover_encomenda(idencomenda encomendas.idencomenda%type);
  procedure mostrar_encomenda_vendedor(idvendedor produto.id_produtovendedor%type ,lista out sys_refcursor);
	end pack_encomendas;
/

create or replace package body pack_encomendas is

procedure inserir_encomendas (
idprodutoencomenda in encomendas.id_encomendaproduto%type,
idencomenda_for in encomendas.id_encomendafornecedor%type,
data in encomendas.dataencomenda%type,
data_re in encomendas.datarecepcao%type,
quantidade in encomendas.qt_encomendada%type
)is

mensag erros.descricao%TYPE;
  codigo erros.codigo%TYPE;
  
 Begin
 insert into encomendas values (encomendas_seq.NEXTVAL, idprodutoencomenda, idencomenda_for, data, data_re, quantidade);
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
	End inserir_encomendas;
	
	

-- Mostrar Encomenda Produto --
procedure mostrar_encomenda_produto(idproduto encomendas.id_encomendaproduto%type ,lista out sys_refcursor)
is

codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select idencomenda, id_encomendaproduto,id_encomendafornecedor,dataencomenda,datarecepcao,qt_encomendada from Encomendas
		where id_encomendaproduto = idproduto;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Não existem encomendas para esse produto' , sysdate);
			commit;
			raise_application_error(-20801,'Produto não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
				values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20802,'Nao foi possivel mostrar os dados!');
	
	end mostrar_encomenda_produto;
-- Fim Mostrar encomenda produto --

-- Mostrar encomenda Fornecedor

procedure mostrar_encomenda_fornecedor(idfornecedor encomendas.id_encomendafornecedor%type ,lista out sys_refcursor)
is

codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select idencomenda, id_encomendaproduto,id_encomendafornecedor,dataencomenda,datarecepcao,qt_encomendada from Encomendas
		where id_encomendafornecedor = idfornecedor;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Não existem encomendas para este fornecedor' , sysdate);
			commit;
			raise_application_error(-20803,'Fornecedor não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
				values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20804,'Nao foi possivel mostrar os dados!');
	
	end mostrar_encomenda_fornecedor;
	

	
	

	
	
	-- INICO EDITAR ENCOMENDAS -- 
	
	
	procedure editar_encomendas (
idencomenda in encomendas.idencomenda%type,
idprodutoencomenda in encomendas.id_encomendaproduto%type,
idencomenda_for in encomendas.id_encomendafornecedor%type,
data_enc in encomendas.dataencomenda%type,
data_re in encomendas.datarecepcao%type,
quantidade in encomendas.qt_encomendada%type
)is
mensag erros.descricao%TYPE;
  codigo erros.codigo%TYPE;
  
 Begin
 update encomendas set
 dataencomenda = data_enc,
 datarecepcao = data_re,
 qt_encomendada = quantidade
 where idencomenda= idencomenda;
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
	End editar_encomendas;
	
	-- FIM EDITAR ENCOMENDAS´
	
	
	-- INICIO REMOVER ENCOMENDAS
procedure remover_encomenda (idencomenda encomendas.idencomenda%type) is
mensag erros.descricao%TYPE;
codigo erros.codigo%TYPE;
begin
delete from encomendas where idencomenda=idencomenda;
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
End remover_encomenda;
	-- FIM REMOVER ENCOMENDAS
	-- INICIO DO MOSTRAR ENCOMENDA VENDEDOR
  procedure mostrar_encomenda_vendedor(idvendedor produto.id_produtovendedor%type ,lista out sys_refcursor)
is

codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select idencomenda, nome_produto,nome_fornecedor,dataencomenda,datarecepcao,qt_encomendada from Encomendas, produto, fornecedor
		where encomendas.id_encomendaproduto = produto.id_produto and encomendas.id_encomendafornecedor = fornecedor.id_fornecedor and produto.id_produtovendedor = idvendedor;
    
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Não existem encomendas para este vendedor' , sysdate);
			commit;
			raise_application_error(-20805,'vendedor não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
				values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20806,'Nao foi possivel mostrar os dados!');
	
	end mostrar_encomenda_vendedor;


end pack_encomendas;