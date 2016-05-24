/*==============================================================*/
/* Table: ERROS                                         */
/*==============================================================*/

create table ERROS
(
    Id_Erro     number(10,0) constraint PK_Erros primary key,
    Codigo		number(10,0),
    Descricao	varchar(100),
    Datas       date
);


/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE  (
   ID_CLIENTE           INTEGER                         not null,
   NOME_CLIENTE         VARCHAR2(100)                   not null,
   NIF_CLIENTE          NUMBER(10)                      not null,
   TLF_CLIENTE          NUMBER(9)                       not null,
   TLM_CLIENTE          NUMBER(9)                       not null,
   EMAIL_CLIENTE        VARCHAR2(100)                   not null,
   USERNAME_CLIENTE     VARCHAR2(50)                    not null,
   PASSWORD_CLIENTE     VARCHAR2(512)                   not null,
   MORADA_CLIENTE	   VARCHAR2(300)                   not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);


/*==============================================================*/
/* Table: FORNECEDOR                                            */
/*==============================================================*/
create table FORNECEDOR  (
   ID_FORNECEDOR        INTEGER                         not null,
   NOME_FORNECEDOR      VARCHAR2(100)                   not null,
   NIF_FORNECEDOR       NUMBER(10)                      not null,
   TEL_FORNECEDOR       NUMBER(9)                       not null,
   MORADA_FORNECEDOR    VARCHAR2(300)                   not null,
   EMAIL_FORNECEDOR     VARCHAR2(100)                   not null,
   constraint PK_FORNECEDOR primary key (ID_FORNECEDOR)
);


/*==============================================================*/
/* Table: VENDEDOR                                              */
/*==============================================================*/
create table VENDEDOR  (
   ID_VENDEDOR         INTEGER                         not null,
   NOMEVENDEDOR         VARCHAR2(200)                   not null,
   NIFVENDEDOR          VARCHAR2(10)                    not null,
   TELEFONEVENDEDOR     VARCHAR2(12)                    not null,
   MORADAVENDEDOR       VARCHAR2(500)                   not null,
   TIPOVENDEDOR         VARCHAR2(20)                    not null,
   TAXA                 FLOAT(3)                        not null,
   EMAILVENDEDOR        VARCHAR2(200)                   not null,
   PASSWORDVENDEDOR     VARCHAR2(512)                   not null,
   constraint PK_VENDEDOR primary key (ID_VENDEDOR)
);

/*==============================================================*/
/* Table: PRODUTO                                               */
/*==============================================================*/
create table PRODUTO  (
   ID_PRODUTO           INTEGER                         not null,
   ID_PRODUTOVENDEDOR  	INTEGER 						not null,
   ID_PRODUTOFORNECEDOR INTEGER                         not null,
   NOME_PRODUTO         VARCHAR2(200)                   not null,
   PRECO                NUMBER(8,2)                     not null,
   DESCRICAO            VARCHAR2(400)                   not null,
   STOCK                NUMBER                          not null,
   CATEGORIA            VARCHAR2(200)                   not null,
   constraint PK_PRODUTO primary key (ID_PRODUTO),
   constraint FK_PRODUTO_RELATIONS_VENDEDOR foreign key (ID_PRODUTOVENDEDOR)
      references VENDEDOR (ID_VENDEDOR),
	constraint FK_PRODUTO_RELATIONS_FORN foreign key (ID_PRODUTOFORNECEDOR)
		references FORNECEDOR (ID_FORNECEDOR)
);


/*==============================================================*/
/* Table: CARRINHO                                              */
/*==============================================================*/
create table CARRINHO  (
   IDCARRINHO           INTEGER                         not null,
   ID_CARRINHOCLIENTE           INTEGER,
   ID_CARRINHOPRODUTO           INTEGER,
   QUANTIDADE_PRODUTO   INTEGER                         not null,
	constraint PK_CARRINHO primary key (IDCARRINHO),
	constraint FK_CARRINHO_RELATIONS_PRODUTO foreign key (ID_CARRINHOPRODUTO)
		references PRODUTO (ID_PRODUTO),
	constraint FK_CARRINHO_RELATIONS_CLIENTE foreign key (ID_CARRINHOCLIENTE)
		references CLIENTE (ID_CLIENTE)  
);


/*==============================================================*/
/* Table: ENCOMENDAS                                            */
/*==============================================================*/
create table ENCOMENDAS  (
   IDENCOMENDA          INTEGER                         not null,
   ID_ENCOMENDAPRODUTO           INTEGER                         not null,
   ID_ENCOMENDAFORNECEDOR        INTEGER,
   DATAENCOMENDA        DATE                            not null,
   DATARECEPCAO         DATE                            not null,
   QT_ENCOMENDADA       NUMBER                          not null,
	constraint PK_ENCOMENDAS primary key (IDENCOMENDA),
	constraint FK_ENCOMEND_RELATIONS_PRODUTO foreign key (ID_ENCOMENDAPRODUTO)
		references PRODUTO (ID_PRODUTO),
	constraint FK_ENCOMEND_RELATIONS_FORNECED foreign key (ID_ENCOMENDAFORNECEDOR)
		references FORNECEDOR (ID_FORNECEDOR)  
);
	
	
/*==============================================================*/
/* Table: TIPOESTADO                                            */
/*==============================================================*/
create table TIPOESTADO  (
   ID_TIPOESTADO        INTEGER                         not null,
   NOME_TIPOESTADO      VARCHAR2(100)                   not null,
   DESCRICAO_TIPOESTADO VARCHAR2(200),
   constraint PK_TIPOESTADO primary key (ID_TIPOESTADO)
);


/*==============================================================*/
/* Table: TIPOPAGAMENTO                                         */
/*==============================================================*/
create table TIPOPAGAMENTO  (
   ID_TIPOPAGAMENTO     INTEGER                         not null,
   NOME_TIPOPAGAMENTO   VARCHAR2(100)                   not null,
   DESCRICAO_TIPOPAGAMENTO VARCHAR2(200)                   not null,
   constraint PK_TIPOPAGAMENTO primary key (ID_TIPOPAGAMENTO)
);


/*==============================================================*/
/* Table: VENDA                                                 */
/*==============================================================*/
create table VENDA  (
   ID_VENDA             INTEGER                         not null,
   ID_VENDATIPOESTADO        INTEGER,
   ID_VENDATIPOPAGAMENTO     INTEGER,
   ID_VENDACLIENTE           INTEGER                         not null,
   DATA_VENDA           DATE                            not null,
   TOTAL_VENDA          NUMBER(8,2)                     not null,
	constraint PK_VENDA primary key (ID_VENDA),
	constraint FK_VENDA_RELATIONS_CLIENTE foreign key (ID_VENDACLIENTE)
		references CLIENTE (ID_CLIENTE),
	constraint FK_VENDA_TEM_TIPOE_TIPOESTA foreign key (ID_VENDATIPOESTADO)
		references TIPOESTADO (ID_TIPOESTADO),
	constraint FK_VENDA_TEM_TIPOP_TIPOPAGA foreign key (ID_VENDATIPOPAGAMENTO)
		references TIPOPAGAMENTO (ID_TIPOPAGAMENTO)	
);

	  
/*==============================================================*/
/* Table: ITEMSVENDA                                            */
/*==============================================================*/
create table ITEMSVENDA  (
   ID_ITEM              INTEGER                         not null,
   ID_ITEMPRODUTO           INTEGER,
   ID_ITEMVENDA             INTEGER                         not null,
   QUANTIDADE_ITEM      NUMBER                          not null,
   PRECO_ITEM           NUMBER(8,2)                     not null,
   constraint PK_ITEMSVENDA primary key (ID_ITEM),
   constraint FK_ITEMSVEN_RELATIONS_PRODUTO foreign key (ID_ITEMPRODUTO)
      references PRODUTO (ID_PRODUTO),
   constraint FK_ITEMSVEN_RELATIONS_VENDA foreign key (ID_ITEMVENDA)
      references VENDA (ID_VENDA)
);

	  
commit;