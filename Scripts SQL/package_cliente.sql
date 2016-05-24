create or replace package pack_cliente is

	procedure inserir_cliente(
	nome in cliente.nome_cliente%type, 
	nif in cliente.nif_cliente%type, 
	tlf in cliente.tlf_cliente%type, 
	tlm in cliente.tlm_cliente%type, 
	email in cliente.email_cliente%type, 
	username in cliente.username_cliente%type, 
	password in cliente.password_cliente%type,
	morada in cliente.morada_cliente%type
	);

	procedure editar_cliente(
	id_cli in cliente.id_cliente%type,
	nome in cliente.nome_cliente%type, 
	nif in cliente.nif_cliente%type, 
	tlf in cliente.tlf_cliente%type, 
	tlm in cliente.tlm_cliente%type, 
	email in cliente.email_cliente%type,  
	password in cliente.password_cliente%type,
	morada in cliente.morada_cliente%type
	);
	
	procedure mostrar_cliente(clienteid in cliente.id_cliente%type, lista out sys_refcursor);
	
	procedure mostrar_cliente_editar(
	clienteid in cliente.id_cliente%type,
	nome out cliente.nome_cliente%type,
	nif out cliente.nif_cliente%type,
	tlf out cliente.tlf_cliente%type,
	tlm out cliente.tlf_cliente%type,
	email out cliente.email_cliente%type,
	password out cliente.password_cliente%type,
	morada out cliente.morada_cliente%type
	);
	
end pack_cliente;
/

create or replace package body pack_cliente is

	/* ----------------------Procedimento inserir_cliente inicio--------------------------------------- */
	procedure inserir_cliente(
	nome in cliente.nome_cliente%type, 
	nif in cliente.nif_cliente%type, 
	tlf in cliente.tlf_cliente%type, 
	tlm in cliente.tlm_cliente%type, 
	email in cliente.email_cliente%type, 
	username in cliente.username_cliente%type, 
	password in cliente.password_cliente%type,
	morada in cliente.morada_cliente%type
	) is
	
	mensag erros.descricao%TYPE;
    codigo erros.codigo%TYPE;
		
	BEGIN
		insert into cliente values(cliente_seq.NEXTVAL, nome, nif, tlf, tlm, email, username, password, morada);
		commit;		
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
            mensag := substr(SQLERRM, 1, 50);
            codigo := SQLCODE;
            INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
	End inserir_cliente;
	/* ----------------------Procedimento inserir_cliente fim--------------------------------------- */
	
	
	/* ----------------------Procedimento editar_cliente inicio--------------------------------------- */
	procedure editar_cliente(
	id_cli in cliente.id_cliente%type,
	nome in cliente.nome_cliente%type, 
	nif in cliente.nif_cliente%type, 
	tlf in cliente.tlf_cliente%type, 
	tlm in cliente.tlm_cliente%type, 
	email in cliente.email_cliente%type,  
	password in cliente.password_cliente%type,
	morada in cliente.morada_cliente%type
	) is
	
	codigo_cliente cliente.id_cliente%type;
	mensag erros.descricao%TYPE;
    codigo erros.codigo%TYPE;
	erro exception;
	pragma exception_init(erro,-54);
	
	BEGIN
      SELECT id_cliente INTO codigo_cliente FROM cliente WHERE id_cliente=id_cli for update nowait;
	  
	  if sql%rowcount = 1 then
        begin
			update cliente set 
				nome_cliente = nome,
				nif_cliente = nif,
				tlf_cliente = tlf,
				tlm_cliente = tlm,
				email_cliente = email,
				password_cliente = password,
				morada_cliente = morada
			where id_cliente=id_cli;
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
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , 'Cliente não encontrado!', sysdate);
			commit;
			RAISE_APPLICATION_ERROR( -20401, 'Cliente não encontrado!');
		when erro then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , 'Registo ocupado, tente mais tarde.', sysdate);
			commit;
			raise_application_error(-20402,'Registo ocupado, tente mais tarde.'); 		
		WHEN OTHERS THEN
			ROLLBACK;
			mensag := substr(SQLERRM, 1, 50);
			codigo := SQLCODE;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , mensag, sysdate);
	End editar_cliente;
	/* ---------------Procedimento editar_cliente fim-------------------------------------- */
	
	
	/* ---------------Procedimento mostrar_cliente inicio-------------------------------------- */
	procedure mostrar_cliente(clienteid in cliente.id_cliente%type, lista out sys_refcursor) is
    codigo erros.codigo%TYPE;
	
	begin
		open lista for
		select id_cliente, nome_cliente, nif_cliente, tlf_cliente, tlm_cliente, email_cliente, username_cliente, password_cliente, morada_cliente from cliente where id_cliente=clienteid;
  
	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Cliente não encontrado' , sysdate);
			commit;
			raise_application_error(-20403,'Cliente não encontrado');
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20404,'Nao foi possivel mostrar os dados!');
	end mostrar_cliente;
	/* ---------------Procedimento mostrar_cliente fim-------------------------------------- */
	
	
		/* ---------------Procedimento mostrar_cliente inicio-------------------------------------- */
	procedure mostrar_cliente_editar(
	clienteid in cliente.id_cliente%type,
	nome out cliente.nome_cliente%type,
	nif out cliente.nif_cliente%type,
	tlf out cliente.tlf_cliente%type,
	tlm out cliente.tlf_cliente%type,
	email out cliente.email_cliente%type,
	password out cliente.password_cliente%type,
	morada out cliente.morada_cliente%type
	) is
    codigo erros.codigo%TYPE;
	erro exception;
	pragma exception_init(erro,-54);
	
	begin
		select nome_cliente, nif_cliente, tlf_cliente, tlm_cliente, email_cliente, password_cliente, morada_cliente into nome, nif, tlf, tlm, email, password, morada from cliente where id_cliente=clienteid for update nowait;

	exception
		when no_data_found then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo ,'Cliente não encontrado' , sysdate);
			commit;
			raise_application_error(-20405,'Cliente não encontrado');
		when erro then
			rollback;
			codigo:=sqlcode;
			INSERT INTO ERROS VALUES(erros_seq.NEXTVAL, codigo , 'Registo ocupado, tente mais tarde.', sysdate);
			commit;
			raise_application_error(-20406,'Registo ocupado, tente mais tarde.'); 
		when others then
			rollback;
			codigo:=sqlcode;
			insert into erros
			values(erros_seq.nextval,codigo,'Nao foi possivel mostrar os dados!',sysdate);
			commit;
			raise_application_error(-20407,'Nao foi possivel mostrar os dados!');
	end mostrar_cliente_editar;
	/* ---------------Procedimento mostrar_cliente fim-------------------------------------- */

end pack_cliente;

