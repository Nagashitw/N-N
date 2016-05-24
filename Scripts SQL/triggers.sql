CREATE OR REPLACE TRIGGER atualiza_stock
After INSERT ON itemsvenda
FOR EACH ROW 

BEGIN
  if (:new.QUANTIDADE_ITEM > 0) then
    update produto set STOCK=(stock - :new.QUANTIDADE_ITEM) where ID_PRODUTO = :new.ID_ITEMPRODUTO;
  END IF;

END;
/

CREATE OR REPLACE TRIGGER atualiza_stock_venda_cancelada
After update ON venda
FOR EACH ROW 

DECLARE 
qt number;
iditem number;
idprod number;

cursor venda_cancelada is
	Select quantidade_item, id_item, ID_ITEMPRODUTO from itemsvenda where ID_ITEMVENDA = :new.id_venda;

BEGIN
  if (:new.ID_VENDATIPOESTADO = 3) then
	Open venda_cancelada;
	Loop
	Fetch venda_cancelada Into qt, iditem, idprod;
	Exit When venda_cancelada%NOTFOUND;
        update produto set STOCK=(stock + qt) where ID_PRODUTO=idprod;
	End Loop;
  END IF;
END;
/

create or replace trigger criar_encomenda_stock_baixo
after update on produto
for each row 


BEGIN
  if(:new.stock < 2) then
        insert into encomendas values(encomendas_seq.NEXTVAL, :new.id_produto, :new.id_produtofornecedor, sysdate(), sysdate()+5, '5' );
        end if;
END;


