create or replace package pack_vendedor is

	procedure inserir_vendedor(nome in vendedor.nomevendedor%type, nif in vendedor.nifvendedor%type, tlf in vendedor.telefonevendedor%type, morada in vendedor.moradavendedor%type, taxa in vendedor.taxa%type,email in vendedor.emailvendedor%type,  password in vendedor.passwordvendedor%type);
	procedure atualiza_taxa(idvendedor in vendedor.id_vendedor%type, novataxa in vendedor.taxa%type);
	procedure listar_vendedores(lista out sys_refcursor);
	
	procedure editar_vendedor(
	idvendedor in vendedor.id_vendedor%type,
	nome in vendedor.nomevendedor%type, 
	nif in vendedor.nifvendedor%type, 
	tlf in vendedor.telefonevendedor%type, 
	morada in vendedor.moradavendedor%type, 
	email in vendedor.emailvendedor%type,  
	password in vendedor.passwordvendedor%type
	);
	procedure mostrar_vendedor(idvendedor in vendedor.id_vendedor%type, lista out sys_refcursor);	
	procedure mostrar_vendedor_editar(
	vendedorid in vendedor.id_vendedor%type,
	nome out vendedor.nomevendedor%type,
	nif out vendedor.nifvendedor%type,
	tlf out vendedor.telefonevendedor%type,
	morada out vendedor.moradavendedor%type,
	email out vendedor.emailvendedor%type,
	password out vendedor.passwordvendedor%type);
	procedure remover_vendedor( idvendedor in vendedor.id_vendedor%type);
end pack_vendedor;	
/


create or replace package body pack_vendedor is

	/* ----------------------Procedimento inserir_vendedor inicio--------------------------------------- */
	procedure inserir_vendedor(
	nome in vendedor.nomevendedor%type, 
	nif in vendedor.nifvendedor%type, 
	tlf in vendedor.telefonevendedor%type, 
	morada in vendedor.moradavendedor%type, 
	taxa in vendedor.taxa%type,
	email in vendedor.emailvendedor%type,  
	password in vendedor.passwordvendedor%type
	) is
	
	mensag erros.descricao%TYPE;
    codigo erros.codigo%TYPE;
		
	BEGIN
		insert into vendedor values(vendedor_seq.NEXTVAL, nome, nif, tlf, morada, 'parceiro', taxa, email, password);
		commit;		
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
            mensag := substr(SQLERRM, 1, 50);
            codigo := SQLCODE;
            INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
	End inserir_vendedor;
	/* ----------------------Procedimento inserir_vendedor fim--------------------------------------- */
	
	
	/* ----------------------Procedimento editar_vendedor inicio--------------------------------------- */
	procedure editar_vendedor(
	idvendedor in vendedor.id_vendedor%type,
	nome in vendedor.nomevendedor%type, 
	nif in vendedor.nifvendedor%type, 
	tlf in vendedor.telefonevendedor%type, 
	morada in vendedor.moradavendedor%type, 
	email in vendedor.emailvendedor%type,  
	password in vendedor.passwordvendedor%type
	) is
	
	codigo_vendedor vendedor.id_vendedor%type;
	mensag erros.descricao%TYPE;
    codigo erros.codigo%TYPE;
	erro exception;
	pragma exception_init(erro,-54);
	
	BEGIN
      SELECT id_vendedor INTO codigo_vendedor FROM vendedor WHERE id_vendedor=idvendedor for update nowait;
	  
	  if sql%rowcount = 1 then
        begin
			update vendedor set 
				nomevendedor = nome,
				nifvendedor = nif,
				telefonevendedor = tlf,
				moradavendedor = morada,
				emailvendedor = email,
				passwordvendedor = password
			where id_vendedor=idvendedor;
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
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , 'vendedor não encontrado', sysdate);
			commit;
			RAISE_APPLICATION_ERROR( -20301, 'vendedor não encontrado!');
		when erro then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , 'Registo ocupado, tente mais tarde.', sysdate);
			commit;
			raise_application_error(-20302,'Registo ocupado, tente mais tarde.'); 
		WHEN OTHERS THEN
			ROLLBACK;
			mensag := substr(SQLERRM, 1, 50);
			codigo := SQLCODE;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
	End editar_vendedor;
	/* ---------------Procedimento editar_vendedor fim-------------------------------------- */
	
	
	/* ---------------Procedimento mostrar_vendedor inicio-------------------------------------- */
	procedure mostrar_vendedor(idvendedor in vendedor.id_vendedor%type, lista out sys_refcursor) is
    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_vendedor, nomevendedor, nifvendedor, telefonevendedor, moradavendedor, tipovendedor, taxa, emailvendedor, passwordvendedor from vendedor where id_vendedor=idvendedor;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Vendedor não encontrado' , sysdate);
			commit;
			raise_application_error(-20303,'vendedor não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20304,'Nao foi possivel mostrar os dados!');
	end mostrar_vendedor;
	/* ---------------Procedimento mostrar_vendedor fim-------------------------------------- */
	
	/* ---------------Procedimento listar_vendedores inicio-------------------------------------- */
	procedure listar_vendedores(lista out sys_refcursor) is
    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_vendedor, nomevendedor, nifvendedor, telefonevendedor, moradavendedor, tipovendedor, taxa, emailvendedor from vendedor order by id_vendedor;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Nenhum vendedor encontrado' , sysdate);
			commit;
			raise_application_error(-20305,'Nenhum vendedor encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20306,'Nao foi possivel mostrar os dados!');
	end listar_vendedores;
	/* ---------------Procedimento listar_vendedores fim-------------------------------------- */	
	

  /* ---------------Procedimento mostrar_vendedor_editar inicio-------------------------------------- */
	procedure mostrar_vendedor_editar(
	vendedorid in vendedor.id_vendedor%type,
	nome out vendedor.nomevendedor%type,
	nif out vendedor.nifvendedor%type,
	tlf out vendedor.telefonevendedor%type,
	morada out vendedor.moradavendedor%type,
	email out vendedor.emailvendedor%type,
	password out vendedor.passwordvendedor%type
	) is
  
	codigo erros.codigo%TYPE;
	erro exception;
	pragma exception_init(erro,-54);
	
	begin
		select nomevendedor, nifvendedor, telefonevendedor, moradavendedor, emailvendedor, passwordvendedor into nome, nif, tlf, morada, email, password from vendedor where id_vendedor=vendedorid for update nowait;

	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Vendedor não encontrado' , sysdate);
			commit;
			raise_application_error(-20307,'Vendedor não encontrado');
		when erro then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , 'Registo ocupado, tente mais tarde.', sysdate);
			commit;
			raise_application_error(-20308,'Registo ocupado, tente mais tarde.'); 
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20309,'Nao foi possivel mostrar os dados!');
	end mostrar_vendedor_editar;
	/* ---------------Procedimento mostrar_vendedor_editar fim-------------------------------------- */
	
	/* Procedimento para atualizar a taxa do vendedor*/
	procedure atualiza_taxa(idvendedor in vendedor.id_vendedor%type, novataxa in vendedor.taxa%type) is
	mensag erros.descricao%TYPE;
    codigo erros.codigo%TYPE;
	
	BEGIN
		update vendedor set taxa = novataxa where id_vendedor = idvendedor;

	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Vendedor não encontrado' , sysdate);
			commit;
			raise_application_error(-20310,'Vendedor não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20311,'Nao foi possivel mostrar os dados!');
			
	End atualiza_taxa;
  
  procedure remover_vendedor( idvendedor in vendedor.id_vendedor%type) is
    mensag erros.descricao%type;
    codigo erros.codigo%type;
    
    BEGIN
    Delete from Vendedor where id_vendedor = idvendedor;
    Exception
    when no_data_found then
    rollback;
    codigo:=SQLCODE;
    INSERT INTO ERROS Values (erros_seq.NEXTVAL,codigo,'Vendedor não encontrado',sysdate);
    commit;
    Raise_application_error(-20312,'Não foi possivel remover o vendedor');
    
    
    end remover_vendedor;
    
end pack_vendedor;
