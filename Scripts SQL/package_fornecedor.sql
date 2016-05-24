create or replace package pack_fornecedor is
	
	procedure listar_nomes_fornecedores(lista out sys_refcursor);
  procedure inserir_fornecedor(nome in fornecedor.nome_fornecedor%type, 
  nif in fornecedor.nif_fornecedor%type, 
  tlf in fornecedor.tel_fornecedor%type, 
  morada in fornecedor.morada_fornecedor%type,
  email in fornecedor.email_fornecedor%type);
end pack_fornecedor;
/

create or replace package body pack_fornecedor is
	procedure listar_nomes_fornecedores(lista out sys_refcursor) is
	
	codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_fornecedor, nome_fornecedor from fornecedor order by nome_fornecedor;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Nenhum Fornecedor encontrado' , sysdate);
			commit;
			raise_application_error(-20001,'Nenhum Fornecedor encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20002,'Nao foi possivel mostrar os dados!');
	End listar_nomes_fornecedores;
	
procedure inserir_fornecedor(nome in fornecedor.nome_fornecedor%type, 
  nif in fornecedor.nif_fornecedor%type, 
  tlf in fornecedor.tel_fornecedor%type, 
  morada in fornecedor.morada_fornecedor%type,
  email in fornecedor.email_fornecedor%type) is
  

  mensag erros.descricao%TYPE;
  codigo erros.codigo%TYPE;
begin
		insert into fornecedor values(fornecedor_seq.NEXTVAL, nome, nif, tlf, morada,email);
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
  
  
  end inserir_fornecedor;
  
  
end pack_fornecedor;