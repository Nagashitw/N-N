create or replace package pack_vendas is
	
	procedure mostrar_vendas(clienteid in cliente.id_cliente%type, lista out sys_refcursor);
	procedure mostrar_items_vendas(vendaid in venda.id_venda%type, lista out sys_refcursor);
	procedure mostrar_items_pagos(vendedor in number, lista out sys_refcursor);
	procedure mostrar_items_por_pagar(vendedor in number, lista out sys_refcursor);
	procedure mostrar_items_cancelados(vendedor in number, lista out sys_refcursor);
	procedure mostrar_vendas_por_pagar(lista out sys_refcursor);
	procedure mostrar_vendas_pagas(lista out sys_refcursor);
	procedure mostrar_vendas_canceladas(lista out sys_refcursor);
	procedure alterar_estado_venda(venda number, estado number);
	
end pack_vendas;
/

create or replace package body pack_vendas is
	
	/* ---------------Procedimento mostrar_vendas inicio-------------------------------------- */
	procedure mostrar_vendas(clienteid in cliente.id_cliente%type, lista out sys_refcursor) is
    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_venda, nome_tipoestado, nome_tipopagamento, data_venda, total_venda from venda, tipoestado, tipopagamento where id_vendacliente=clienteid and id_vendatipoestado=id_tipoestado and id_vendatipopagamento = id_tipopagamento order by data_venda desc;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Venda não encontrada' , sysdate);
			commit;
			raise_application_error(-20101,'Venda não encontrada');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20102,'Nao foi possivel mostrar os dados!');
	end mostrar_vendas;
	/* ---------------Procedimento mostrar_vendas fim-------------------------------------- */
	
	
	/* ---------------Procedimento mostrar itens da venda inicio-------------------------------------- */
	procedure mostrar_items_vendas(vendaid in venda.id_venda%type, lista out sys_refcursor) is
	    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_itemproduto, nome_produto, quantidade_item, preco_item from ITEMSVENDA, produto where ID_ITEMVENDA=vendaid and id_produto = id_itemproduto;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Item não encontrado' , sysdate);
			commit;
			raise_application_error(-20103,'Item não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20104,'Nao foi possivel mostrar os dados!');
	end mostrar_items_vendas;
	/* ---------------Procedimento mostrar itens da venda fim-------------------------------------- */
	
	
	/* ---------------Procedimento mostrar itens pagos inicio-------------------------------------- */
	procedure mostrar_items_pagos(vendedor number, lista out sys_refcursor) is
	    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_produto, nome_produto, quantidade_item, preco_item, data_venda, id_cliente from items_pagos where id_vendedor=vendedor;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Item não encontrado' , sysdate);
			commit;
			raise_application_error(-20105,'Item não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20106,'Nao foi possivel mostrar os dados!');
	end mostrar_items_pagos;
	/* ---------------Procedimento mostrar itens pagos fim-------------------------------------- */
	
	
	/* ---------------Procedimento mostrar itens por pagar inicio-------------------------------------- */
	procedure mostrar_items_por_pagar(vendedor number, lista out sys_refcursor) is
	    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_produto, nome_produto, quantidade_item, preco_item, data_venda, id_cliente from items_por_pagar where id_vendedor=vendedor;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Item não encontrado' , sysdate);
			commit;
			raise_application_error(-20107,'Item não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20108,'Nao foi possivel mostrar os dados!');
	end mostrar_items_por_pagar;
	/* ---------------Procedimento mostrar itens por pagar fim-------------------------------------- */
	
	/* ---------------Procedimento mostrar itens cancelados inicio-------------------------------------- */
	procedure mostrar_items_cancelados(vendedor number, lista out sys_refcursor) is
	    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_produto, nome_produto, quantidade_item, preco_item, data_venda, id_cliente from items_cancelados where id_vendedor=vendedor;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Item não encontrado' , sysdate);
			commit;
			raise_application_error(-20109,'Item não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20110,'Nao foi possivel mostrar os dados!');
	end mostrar_items_cancelados;
	/* ---------------Procedimento mostrar itens cancelados fim-------------------------------------- */
	
	/* ---------------Procedimento mostrar_vendas_por_pagar inicio-------------------------------------- */
	procedure mostrar_vendas_por_pagar(lista out sys_refcursor) is
    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_venda, ID_VENDATIPOESTADO, nome_tipoestado, nome_tipopagamento, data_venda, total_venda from venda, tipoestado, tipopagamento where ID_VENDATIPOESTADO=1 and id_vendatipoestado=id_tipoestado and id_vendatipopagamento = id_tipopagamento order by data_venda desc;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Venda não encontrada' , sysdate);
			commit;
			raise_application_error(-20111,'Venda não encontrada');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20112,'Nao foi possivel mostrar os dados!');
	end mostrar_vendas_por_pagar;
	/* ---------------Procedimento mostrar_vendas_por_pagar fim-------------------------------------- */
	
	/* ---------------Procedimento mostrar_vendas_pagas inicio-------------------------------------- */
	procedure mostrar_vendas_pagas(lista out sys_refcursor) is
    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_venda, ID_VENDATIPOESTADO, nome_tipoestado, nome_tipopagamento, data_venda, total_venda from venda, tipoestado, tipopagamento where ID_VENDATIPOESTADO=2 and id_vendatipoestado=id_tipoestado and id_vendatipopagamento = id_tipopagamento order by data_venda desc;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Venda não encontrada' , sysdate);
			commit;
			raise_application_error(-20113,'Venda não encontrada');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20114,'Nao foi possivel mostrar os dados!');
	end mostrar_vendas_pagas;
	/* ---------------Procedimento mostrar_vendas_pagas fim-------------------------------------- */
	
	/* ---------------Procedimento mostrar_vendas_canceladas inicio-------------------------------------- */
	procedure mostrar_vendas_canceladas(lista out sys_refcursor) is
    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_venda, ID_VENDATIPOESTADO, nome_tipoestado, nome_tipopagamento, data_venda, total_venda from venda, tipoestado, tipopagamento where ID_VENDATIPOESTADO=3 and id_vendatipoestado=id_tipoestado and id_vendatipopagamento = id_tipopagamento order by data_venda desc;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Venda não encontrada' , sysdate);
			commit;
			raise_application_error(-20115,'Venda não encontrada');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20116,'Nao foi possivel mostrar os dados!');
	end mostrar_vendas_canceladas;
	/* ---------------Procedimento mostrar_vendas_canceladas fim-------------------------------------- */
	
	/* ---------------Procedimento alterar_estado_venda inicio -------------------------------------- */
	procedure alterar_estado_venda(venda number, estado number) is
	codigo_venda number;
	mensag erros.descricao%TYPE;
    codigo erros.codigo%TYPE;
	
	BEGIN
      SELECT id_venda INTO codigo_venda FROM venda WHERE id_venda=venda;
	  
	  if sql%rowcount = 1 then
        begin
			update venda set 
				id_vendatipoestado = estado
			where id_venda=venda;
			commit;
        EXCEPTION
			WHEN OTHERS THEN
				ROLLBACK;
				mensag := substr(SQLERRM, 1, 50);
				codigo := SQLCODE;
				INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
        end;
      end if;
	EXCEPTION
		When no_data_found then
			rollback;
			codigo := SQLCODE;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , 'Venda não encontrado!', sysdate);
			commit;
			RAISE_APPLICATION_ERROR( -20117, 'Venda não encontrado!');	
		WHEN OTHERS THEN
			ROLLBACK;
			mensag := substr(SQLERRM, 1, 50);
			codigo := SQLCODE;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
		
	end alterar_estado_venda;
	/* ---------------Procedimento alterar_estado_venda fim -------------------------------------- */
	
end pack_vendas;
