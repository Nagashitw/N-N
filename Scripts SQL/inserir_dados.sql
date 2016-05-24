/* Insert dados TipoPagamento*/
INSERT INTO tipopagamento VALUES  (tipopagamento_seq.NEXTVAL,'Multibanco', 'Pagamento através de referência e entidade Multibanco' );
INSERT INTO tipopagamento VALUES  (tipopagamento_seq.NEXTVAL,'Transferência Bancária', 'Pagamento por tranferência Bancária' );
INSERT INTO tipopagamento VALUES  (tipopagamento_seq.NEXTVAL,'VISA', 'Pagamento com cartão VISA' );
INSERT INTO tipopagamento VALUES  (tipopagamento_seq.NEXTVAL,'Paypal', 'Pagamento por Paypal' );
commit;

/* Insert dados TipoEstado*/
INSERT INTO tipoestado VALUES  (tipoestado_seq.NEXTVAL,'Aguardar pagamento', 'Compra sem pagamento efetuado' );
INSERT INTO tipoestado VALUES  (tipoestado_seq.NEXTVAL,'Pagamento efetuado', 'Compra com pagamento efetuado' );
INSERT INTO tipoestado VALUES  (tipoestado_seq.NEXTVAL,'Anulada', 'Compra anulada' );
commit;

/* Insert dados Cliente*/
INSERT INTO cliente VALUES  (cliente_seq.NEXTVAL, 'Jorge Filipe', '123456789', '232989876', '961234567', 'jorge@sapo.pt', 'jorgefms', 'passwordjorge', 'Rua da Cruz 14, Viseu' );
INSERT INTO cliente VALUES  (cliente_seq.NEXTVAL, 'Filipa Trigo', '123456000', '232986523', '961234123', 'filipa@sapo.pt', 'filipatrigo', 'passwordfilipa', 'Rua da Tapada, Coimbra' );
INSERT INTO cliente VALUES  (cliente_seq.NEXTVAL, 'Rafael Sousa', '444456789', '232111876', '969994567', 'rafa@sapo.pt', 'rafa', 'passwordrafa', 'Rua do Sol, Lisboa' );
INSERT INTO cliente VALUES  (cliente_seq.NEXTVAL, 'Tiago Nobre', '123336789', '239989896', '961234567', 'tiagonobre@sapo.pt', 'tnobre', 'passwordnobre', 'Rua sem nome, nº13, Alcabideche');
INSERT INTO cliente VALUES  (cliente_seq.NEXTVAL, 'Susana Fonseca', '100056789', '232989000', '961230007', 'susana@hotmail.pt', 'Susana', 'passwordsusana', 'Rua das Flores Abraveses' );
commit;

/* Insert dados vendedor*/
INSERT INTO vendedor VALUES  (vendedor_seq.NEXTVAL, 'N_N', '111111111', '232111111', 'Rua do volta atrás, nº1, 3500-000 Viseu', 'loja', '0', 'geral@N_N.pt','1234' );
INSERT INTO vendedor VALUES  (vendedor_seq.NEXTVAL, 'XPTO', '223311111', '232222333', 'Rua da Cruz, nº4, 3900-123 Coimbra', 'parceiro', '0,1', 'geral@xpto.pt','1234' );
INSERT INTO vendedor VALUES  (vendedor_seq.NEXTVAL, 'InfoSoft', '223311333', '232888333', 'Rua da Tapada, nº3, 3900-000 Condeixa', 'parceiro', '0,15', 'geral@infosoft.pt','1234' );
commit;

/* Insert dados Fornecedor */
INSERT INTO fornecedor VALUES  (fornecedor_seq.NEXTVAL, 'Fornecedor_1', '909090909', '213111111', 'Rua das Flores, nº1 R/C, Porto', 'fornecedor_1@sapo.pt' );
INSERT INTO fornecedor VALUES  (fornecedor_seq.NEXTVAL, 'Fornecedor_2', '222090909', '213111222', 'Rua 1º de Maio, lote 24 1ºesq, 3500 Viseu', 'fornecedor_2@sapo.pt' );
INSERT INTO fornecedor VALUES  (fornecedor_seq.NEXTVAL, 'Fornecedor_3', '333090909', '213111333', 'Rua sem nome, Aveiro', 'fornecedor_3@sapo.pt' );
INSERT INTO fornecedor VALUES  (fornecedor_seq.NEXTVAL, 'Fornecedor_4', '444090909', '213111444', 'Rua IPV nº3, 3430-271 Carregal do Sal', 'fornecedor_4@sapo.pt' );
commit;

/* Insert dados produto */
INSERT INTO produto VALUES  (produto_seq.NEXTVAL, '3', '1','Rato optico ABC', '14,99', 'Rato óptico ABC, 800dpi, cor preto', '10', 'ratos' );
INSERT INTO produto VALUES  (produto_seq.NEXTVAL, '1', '2','Rato optico Bishop', '34,99', 'Rato óptico para gamers, cor preto e vermelho', '5', 'ratos' );
INSERT INTO produto VALUES  (produto_seq.NEXTVAL, '1', '1','Teclado ABC', '10,99', 'Teclado ABC com suporte de mãos, cor preto', '10', 'teclados' );
INSERT INTO produto VALUES  (produto_seq.NEXTVAL, '1', '3','Teclado Bishop', '24,99', 'Teclado Bishop, cor vermelha', '10', 'teclados' );
INSERT INTO produto VALUES  (produto_seq.NEXTVAL, '2', '4','Computador portátil Asus N550JK', '1204,99', 'Computador portátil Asus de cor cinza, aconselhado para utilizadores intensivos', '5', 'computadores portáteis' );
INSERT INTO produto VALUES  (produto_seq.NEXTVAL, '2', '4','Computador portátil Toshiba ABC-23', '994,99', 'Computador portátil Toshiba, cor preto', '5', 'computadores portáteis' );
commit;

/* Insert dados Encomendas */
INSERT INTO encomendas VALUES  (encomendas_seq.NEXTVAL, '1', '1', '21-02-2014 16:00', '25-02-2014 16:00', '5' );
INSERT INTO encomendas VALUES  (encomendas_seq.NEXTVAL, '3', '1', '20-05-2014 16:01', '29-05-2014 16:01', '3' );
commit;

/* Insert dados Venda*/
INSERT INTO venda VALUES  (venda_seq.NEXTVAL, '1', '1', '1', '25-02-2014 16:00', '49,98' );
INSERT INTO venda VALUES  (venda_seq.NEXTVAL, '2', '2', '2', '25-02-2014 16:01', '14,99' );
commit;

/* Insert dados ItemsVenda*/
INSERT INTO itemsvenda VALUES  (itemsvenda_seq.NEXTVAL, '1', '1', '1', '14,99' );
INSERT INTO itemsvenda VALUES  (itemsvenda_seq.NEXTVAL, '2', '1', '1', '34,99' );
INSERT INTO itemsvenda VALUES  (itemsvenda_seq.NEXTVAL, '1', '2', '1', '14,99' );
commit;



