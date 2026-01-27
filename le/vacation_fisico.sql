/* vacation_logic: */

CREATE TABLE usuario (
    nome_real String(8),
    CPF String(11),
    ID_usuario Number(3),
    email String(11),
    idade Number(2),
    passaporte String(11),
    PRIMARY KEY (CPF, ID_usuario)
);

CREATE TABLE viagem (
    destino String(8),
    data_inicio Number(10),
    data_final Number(10),
    ID_viagem Number(3) PRIMARY KEY
);

CREATE TABLE local (
    nome String(8),
    cidade String(11),
    ID_local Number(3) PRIMARY KEY
);

CREATE TABLE avaliacao_usuario_local (
    ID_avaliacao Number(3) PRIMARY KEY,
    nota_avaliacao Number(1),
    fk_local_ID_local Number(3),
    fk_usuario_CPF String(11),
    fk_usuario_ID_usuario Number(3)
);

CREATE TABLE tipos_locais (
    ID_tipos_de_locais Number(3) PRIMARY KEY,
    museu String(8),
    praia String(8),
    atracoes_turisticas String(8),
    parques String(8),
    orquestras String(8)
);

CREATE TABLE despesas (
    ID_despesa Number(3) PRIMARY KEY,
    valor Number(4),
    data Number(10),
    hora Number(10),
    descricao String(15),
    categoria String(8),
    quantidade Number(3)
);

CREATE TABLE tem (
    fk_local_ID_local Number(3),
    fk_tipos_locais_ID_tipos_de_locais Number(3)
);

CREATE TABLE vai (
    fk_usuario_CPF String(11),
    fk_usuario_ID_usuario Number(3),
    fk_viagem_ID_viagem Number(3)
);

CREATE TABLE tem (
    fk_viagem_ID_viagem Number(3),
    fk_local_ID_local Number(3)
);

CREATE TABLE tem (
    fk_usuario_CPF String(11),
    fk_usuario_ID_usuario Number(3),
    fk_despesas_ID_despesa Number(3)
);

CREATE TABLE no (
    fk_despesas_ID_despesa Number(3),
    fk_local_ID_local Number(3)
);
 
ALTER TABLE avaliacao_usuario_local ADD CONSTRAINT FK_avaliacao_usuario_local_2
    FOREIGN KEY (fk_local_ID_local)
    REFERENCES local (ID_local);
 
ALTER TABLE avaliacao_usuario_local ADD CONSTRAINT FK_avaliacao_usuario_local_3
    FOREIGN KEY (fk_usuario_CPF, fk_usuario_ID_usuario)
    REFERENCES usuario (CPF, ID_usuario);
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_local_ID_local)
    REFERENCES local (ID_local)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_tipos_locais_ID_tipos_de_locais)
    REFERENCES tipos_locais (ID_tipos_de_locais)
    ON DELETE RESTRICT;
 
ALTER TABLE vai ADD CONSTRAINT FK_vai_1
    FOREIGN KEY (fk_usuario_CPF, fk_usuario_ID_usuario)
    REFERENCES usuario (CPF, ID_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE vai ADD CONSTRAINT FK_vai_2
    FOREIGN KEY (fk_viagem_ID_viagem)
    REFERENCES viagem (ID_viagem)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_viagem_ID_viagem)
    REFERENCES viagem (ID_viagem)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_local_ID_local)
    REFERENCES local (ID_local)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_usuario_CPF, fk_usuario_ID_usuario)
    REFERENCES usuario (CPF, ID_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_despesas_ID_despesa)
    REFERENCES despesas (ID_despesa)
    ON DELETE RESTRICT;
 
ALTER TABLE no ADD CONSTRAINT FK_no_1
    FOREIGN KEY (fk_despesas_ID_despesa)
    REFERENCES despesas (ID_despesa)
    ON DELETE RESTRICT;
 
ALTER TABLE no ADD CONSTRAINT FK_no_2
    FOREIGN KEY (fk_local_ID_local)
    REFERENCES local (ID_local)
    ON DELETE RESTRICT;