/* Verifica login e retorna id do cliente para sessão*/
create or replace function login_cliente (user cliente.username_cliente%type, pass cliente.password_cliente%type) return cliente.id_cliente%type is	
	clienteid cliente.id_cliente%type;
	begin
		select id_cliente into clienteid from cliente where username_cliente like user and password_cliente like pass;
		return clienteid;
	exception
		when no_data_found then
			raise_application_error(-20701,'Utilizador inexistente ou password errada.');
end login_cliente;
/

/* Verifica login e retorna id do vendedor para sessão*/
create or replace function login_vendedor (user vendedor.emailvendedor%type, pass vendedor.passwordvendedor%type) return vendedor.id_vendedor%type is
		vendedorid vendedor.id_vendedor%type;
		begin
			select id_vendedor into vendedorid from vendedor where emailvendedor like user and passwordvendedor like pass;
			return vendedorid;
		exception
		when no_data_found then
			raise_application_error(-20702,'Vendedor inexistente ou password errada.');
end login_vendedor;
/

/* Calcula o valor total do carrinho */
create or replace function total_carrinho (user cliente.id_cliente%type) return number is
	
	cliente number;
	valor number;
	
	Begin
		SELECT id_carrinhocliente INTO cliente FROM carrinho WHERE id_carrinhocliente=user;	 
		Begin
			select sum(quantidade_produto*preco) into valor from vista_carrinho where id_cliente=user;	
			return valor;
		End;		
	EXCEPTION
		When no_data_found then
			valor:=0;
			return valor;
		When TOO_MANY_ROWS then
			select sum(quantidade_produto*preco) into valor from vista_carrinho where id_cliente=user;
			return valor;
end total_carrinho;
/

/* Devolve a taxa do vendedor */
create or replace function devolve_taxa (vend number) return float is

	valor_taxa float;
	BEGIN
	select taxa into valor_taxa from vendedor where id_vendedor = vend;
	return valor_taxa;
end devolve_taxa;
/

/* Calcula os ganhos taxados por vendedor */
Create or replace function ganhos_taxados(idvend number) return number is

tax number;
qt number;
prec number;
idprod number;
valor number:=0;
ganho_taxado number;


cursor teste is
select quantidade_item, preco_item, id_produto from itemsvenda, produto where ID_ITEMPRODUTO = id_produto and id_produtovendedor = idvend;

Begin
  select taxa into tax from vendedor where id_vendedor = idvend;
	Open teste;
	Loop
	Fetch teste Into qt, prec, idprod;
	Exit When teste%NOTFOUND;
       valor := valor + (qt * prec); 
	End Loop;
  ganho_taxado:=valor*tax;
  return ganho_taxado;

End;