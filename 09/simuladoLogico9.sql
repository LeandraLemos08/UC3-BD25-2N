/* simuladoLogico9: */

CREATE TABLE Usuario (
    Id Number(3),
    Nome String(250),
    Nickname String(250),
    Idade Number(2),
    Historico String(250),
    email_registrado Number(80),
    CPF Number(11),
    Duracao Number(1),
    Usuario_TIPO INT,
    PRIMARY KEY (Id, email_registrado)
);

CREATE TABLE Genero (
    ID_Genero Number(3) PRIMARY KEY,
    Roteiro String(250),
    Cliche String(250)
);

CREATE TABLE Episodio (
    Classificacao_indicativa Number(2),
    Titulo String(250),
    Roteiro String(8000),
    Numeracao Number(3),
    ID_Episodio Number(3) PRIMARY KEY
);

CREATE TABLE Stream (
    Nome String(250),
    Data_de_criacao Number(8),
    Quantidade Number(8000),
    Id Number(3) PRIMARY KEY,
    Enredo String(8000),
    Data_de_lancamento Number(8),
    Stream_TIPO INT,
    fk_Episodio_ID_Episodio Number(3)
);

CREATE TABLE Elenco (
    Nome String(250),
    Personagem String(250),
    CPF Number(11),
    ID_Elenco Number(3) PRIMARY KEY,
    fk_Stream_Id Number(3)
);

CREATE TABLE Usuario_Stream_Avaliacao (
    ID_Avalicao Number(3) PRIMARY KEY,
    Data Number(8),
    Hora Number(5),
    fk_Stream_Id Number(3),
    fk_Usuario_Id Number(3),
    fk_Usuario_email_registrado Number(80)
);

CREATE TABLE Stream_Genero_Lista_de_desejos (
    ID_Lista_Desejos Number(3) PRIMARY KEY,
    fk_Usuario_Id Number(3),
    fk_Usuario_email_registrado Number(80),
    fk_Stream_Id Number(3)
);

CREATE TABLE Legenda (
    ID_Legenda Number(3) PRIMARY KEY,
    Idioma String(25),
    Tipo_Legenda String(250)
);

CREATE TABLE Pagamento (
    ID_Pagamento Number(3) PRIMARY KEY,
    Valor Number(80),
    Data Number(8),
    Metodo String(250)
);

CREATE TABLE Usuario_Stream_Visualizacao (
    ID_Visualizacao Number(3),
    fk_Stream_Id Number(3),
    fk_Usuario_Id Number(3),
    fk_Usuario_email_registrado Number(80)
);

CREATE TABLE tem (
    fk_Stream_Id Number(3),
    fk_Genero_ID_Genero Number(3)
);

CREATE TABLE tem (
    fk_Legenda_ID_Legenda Number(3),
    fk_Stream_Id Number(3)
);

CREATE TABLE tem (
    fk_Usuario_Id Number(3),
    fk_Usuario_email_registrado Number(80),
    fk_Pagamento_ID_Pagamento Number(3)
);
 
ALTER TABLE Stream ADD CONSTRAINT FK_Stream_2
    FOREIGN KEY (fk_Episodio_ID_Episodio)
    REFERENCES Episodio (ID_Episodio)
    ON DELETE RESTRICT;
 
ALTER TABLE Elenco ADD CONSTRAINT FK_Elenco_2
    FOREIGN KEY (fk_Stream_Id)
    REFERENCES Stream (Id)
    ON DELETE RESTRICT;
 
ALTER TABLE Usuario_Stream_Avaliacao ADD CONSTRAINT FK_Usuario_Stream_Avaliacao_2
    FOREIGN KEY (fk_Stream_Id)
    REFERENCES Stream (Id);
 
ALTER TABLE Usuario_Stream_Avaliacao ADD CONSTRAINT FK_Usuario_Stream_Avaliacao_3
    FOREIGN KEY (fk_Usuario_Id, fk_Usuario_email_registrado)
    REFERENCES Usuario (Id, email_registrado);
 
ALTER TABLE Stream_Genero_Lista_de_desejos ADD CONSTRAINT FK_Stream_Genero_Lista_de_desejos_2
    FOREIGN KEY (fk_Usuario_Id, fk_Usuario_email_registrado)
    REFERENCES Usuario (Id, email_registrado);
 
ALTER TABLE Stream_Genero_Lista_de_desejos ADD CONSTRAINT FK_Stream_Genero_Lista_de_desejos_3
    FOREIGN KEY (fk_Stream_Id)
    REFERENCES Stream (Id);
 
ALTER TABLE Usuario_Stream_Visualizacao ADD CONSTRAINT FK_Usuario_Stream_Visualizacao_1
    FOREIGN KEY (fk_Stream_Id)
    REFERENCES Stream (Id);
 
ALTER TABLE Usuario_Stream_Visualizacao ADD CONSTRAINT FK_Usuario_Stream_Visualizacao_2
    FOREIGN KEY (fk_Usuario_Id, fk_Usuario_email_registrado)
    REFERENCES Usuario (Id, email_registrado);
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Stream_Id)
    REFERENCES Stream (Id)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Genero_ID_Genero)
    REFERENCES Genero (ID_Genero)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Legenda_ID_Legenda)
    REFERENCES Legenda (ID_Legenda)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Stream_Id)
    REFERENCES Stream (Id)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Usuario_Id, fk_Usuario_email_registrado)
    REFERENCES Usuario (Id, email_registrado)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Pagamento_ID_Pagamento)
    REFERENCES Pagamento (ID_Pagamento)
    ON DELETE SET NULL;