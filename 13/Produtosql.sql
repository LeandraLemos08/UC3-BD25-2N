CREATE TABLE cliente(
ID_cliente int primary key,
nome_cliente varchar(40) not null,
sobrenome_cliente varchar (80) not null
);

CREATE TABLE produto(
ID_produto int primary key,
nome_produto varchar(30) not null,
descricao text null,
preco numeric check (preco>0) not null,
qtde_estoque smallint default 0
);

CREATE TABLE pedido(
ID_pedido serial primary key,
ID_cliente int not null references cliente(ID_cliente),
ID_produto int not null,
qtde smallint not null,
FOREIGN KEY (ID_produto) references produto(ID_produto)
);
