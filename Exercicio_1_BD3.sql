use master
go

drop database Ezio_bd1
go

create database Ezio_bd1
go 

use Ezio_bd1
go

create table cod_produto(
id_pd           int identity(1,1),
nome_pd         nvarchar(100),
valor_pd        money,
marca_pd        nvarchar(50),
numero_pd       numeric(5),
cor_pd          varchar(50),
modelo_pd       varchar(50),
PRIMARY KEY (id_pd) 
);

create table cad_cliente(
id_cliente        int identity (1,1),
Primeiro_Nome	  varchar (15),
Segundo_Nome      varchar(15),
Data_Nascimento	  date,
CPF				  numeric(15) UNIQUE,
Fone              numeric(20),
PRIMARY KEY(id_cliente),
);

create table prod_carrinho(

id_pd_car        int identity(1,1),
id_cliente       int,
id_pd			 int,
qtd_pd           int,
categ_pd         varchar(30),
form_pgto        varchar(10),
qtd_parc         numeric(2),
PRIMARY KEY(id_pd_car),
CONSTRAINT erro_prod_carrinho_cod_produto
FOREIGN KEY(id_pd)REFERENCES cod_produto,
CONSTRAINT erro_nota_ved_cad_cliente            --Nome dado se por acaso existir erro, mais facíl para localizar.
FOREIGN KEY(id_cliente)REFERENCES cad_cliente,
);

create table nota_vend(
id_nota_vend     int identity(1,1),
valor_compra     money,
id_pd_car        int,
desc_valor       decimal(3,2), -- 3= numero de casas, 2 = numero de casas após a virgula.
valor_pgto       money,
data_compra      date,
PRIMARY KEY(id_nota_vend),
CONSTRAINT erro_nota_ved_prod_carrinho 
FOREIGN KEY(id_pd_car)REFERENCES prod_carrinho,   
);

-- CRIANDO REGISTROS PARA OS CAMPOS CRIADOS ACIMA.

-- CRIAÇÃO DOS REGISTROS DA TABELA CADASTRO_CLIENTE

insert into cad_cliente 

(Primeiro_Nome,Segundo_Nome, Data_Nascimento, CPF, Fone)  --Definindo nome das colunas para preeechimento.

values ('Sheila', 'Sales Pacheco', '2002-06-23', 56965478296, 11975632823), --Quando for declarado com varchar deve-se usar o texto entre ''. 
       ('Leila', 'Terezinha Silva', '1973/07/09', 14354723074, 11996893256),  -- Para inserir data deve-se estar desta forma '2020-02-28'.
       ('Matheus', 'Sales Pacheco', '2002/06/07', 55862356941, 11956923511),
       ('Lara', 'Pacheco', '2019/04/06', 86329548732, 11995632148),
       ('Rayssa', 'Heloisa Pacheco', '1998/10/10', 35669853624, 11951324898);

 --CRIAÇÃO DOS REGISTROS DA TABELA CÓDIGO_PRODUTO
       
insert into cod_produto
(nome_pd, valor_pd, marca_pd, numero_pd, cor_pd, modelo_pd) --Definindo nome das colunas para preeechimento.

values ('tenis', '458,50', 'Nike', 38, 'preto e branco', 'casual'),
       ('camiseta','39,00','Fatal', 40, 'azul','manga longa'),
       ('calça', '59,00','calvin', 40, 'jeans', 'casual'); 


insert into prod_carrinho
(id_cliente, id_pd, qtd_pd, categ_pd, form_pgto, qtd_parc)

values (2,3,3,'vestuário','crédito',3),
       (1,1,2,'calçado','débito',0),
       (5,2,1,'vestuário','crédito',1),
       (4,1,4,'calçado','débito',0),
       (3,2,5,'vestuário','crédito',2);
       
--CRIAÇÃO DOS REGISTROS DA TABELA NOTA_VENDAS
     
insert into nota_vend
(valor_compra, id_pd_car, desc_valor, valor_pgto, data_compra)

values (177.5,1,'0.1',159.30,'2020-02-28'),
	   (916,2,'0.15',778.60,'2020-02-28'),
	   (39,3,'0.1',35.10,'2020-02-28'),
	   (1832,4,'0.2',1465.60,'2020-02-28'),
	   (195,5,'0.1',175.50,'2020-02-28');


       
       