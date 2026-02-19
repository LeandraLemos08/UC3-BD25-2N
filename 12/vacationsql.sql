CREATE TABLE usuario(
    nome_real varchar(300),
    CPF char(11),
    ID_usuario int primary key,
    email text,
    idade varchar(200),
    passaporte text
)

CREATE TABLE viagem(
    destino varchar(300),
    data_inicio date,
    data_final date,
    ID_viagem int PRIMARY KEY
)

CREATE TABLE local(
    nome char(800),
    cidade text,
    ID_local int PRIMARY KEY
)

CREATE TABLE avaliacao_usuario_local(
    ID_avaliacao int PRIMARY KEY,
    nota_avaliacao real,
    fk_local_ID_local int,
    fk_usuario_CPF varchar(111),
    fk_usuario_ID_usuario int
)

CREATE TABLE tipos_locais(
    ID_tipos_de_locais int PRIMARY KEY,
    museu text,
    praia text,
    atracoes_turisticas text,
    parques text,
    orquestras text
)

CREATE TABLE despesas(
    ID_despesa int PRIMARY KEY,
    valor money,
    data_ date,
    hora timestamp,
    descricao text,
    categoria text,
    quantidade serial
)

CREATE TABLE ha(
    fk_local_ID_local int,
    fk_tipos_locais_ID_tipos_de_locais int
)

CREATE TABLE vai(
    fk_usuario_CPF char(111),
    fk_usuario_ID_usuario int
)

CREATE TABLE na(
    fk_viagem_ID_viagem int,
    fk_local_ID_local int
)

CREATE TABLE tem(
    fk_usuario_CPF char(111),
    fk_usuario_ID_usuario int,
    fk_despesas_ID_despesa int
)

CREATE TABLE em(
    fk_despesas_ID_despesa int,
    fk_local_ID_local int
)
 
ALTER TABLE avaliacao_usuario_local ADD CONSTRAINT FK_avaliacao_usuario_local_2
    FOREIGN KEY (fk_local_ID_local)
    REFERENCES local (ID_local);
 
ALTER TABLE tem ADD CONSTRAINT FK_ha_1
    FOREIGN KEY (fk_local_ID_local)
    REFERENCES local (ID_local)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_tipos_locais_ID_tipos_de_locais)
    REFERENCES tipos_locais (ID_tipos_de_locais)
    ON DELETE RESTRICT;
 
ALTER TABLE vai ADD CONSTRAINT FK_vai_1
    FOREIGN KEY (fk_usuario_ID_usuario)
    REFERENCES usuario (ID_usuario)
    ON DELETE RESTRICT;
 
	
ALTER TABLE tem ADD CONSTRAINT FK_na_1
    FOREIGN KEY (fk_usuario_ID_usuario)
    REFERENCES usuario (ID_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_despesas_ID_despesa)
    REFERENCES despesas (ID_despesa)
    ON DELETE RESTRICT;
 
ALTER TABLE em ADD CONSTRAINT FK_em_1
    FOREIGN KEY (fk_despesas_ID_despesa)
    REFERENCES despesas (ID_despesa)
    ON DELETE RESTRICT;
 
ALTER TABLE em ADD CONSTRAINT FK_em_2
    FOREIGN KEY (fk_local_ID_local)
    REFERENCES local (ID_local)
    ON DELETE RESTRICT;