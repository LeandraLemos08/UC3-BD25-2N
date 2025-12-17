/* LogicoSimuladoAula9: */

CREATE TABLE Usuario (
    Id Number(3),
    Nome String(250),
    Nickname String(250),
    Idade Number(2),
    Historico String(250),
    email_registrado Number(80),
    CPF Number(11),
    PRIMARY KEY (Id, email_registrado)
);

CREATE TABLE Filme (
    Enredo String(250),
    Data_de_lancamento Number(8),
    fk_Stream_Id Number(3) PRIMARY KEY
);

CREATE TABLE Genero (
    Id Number(3) PRIMARY KEY,
    Roteiro String(250),
    Cliche String(250)
);

CREATE TABLE Serie (
    Enredo String(8000),
    Data_de_lancamento Number(8),
    fk_Stream_Id Number(3) PRIMARY KEY
);

CREATE TABLE Episodio (
    Classificacao_indicativa Number(2),
    Titulo String(250),
    Roteiro String(8000),
    Numeracao Number(3)
);

CREATE TABLE Stream (
    Nome String(250),
    Data_de_criacao Number(8),
    Quantidade Number(8000),
    Id Number(3) PRIMARY KEY
);

CREATE TABLE Elenco (
    Nome String(250),
    Personagem String(250),
    CPF Number(11),
    Id Number(3) PRIMARY KEY,
    fk_Stream_Id Number(3)
);

CREATE TABLE Usuario_gratuito (
    Duracao Number(1),
    fk_Usuario_Id Number(3),
    fk_Usuario_email_registrado Number(80),
    PRIMARY KEY (fk_Usuario_Id, fk_Usuario_email_registrado)
);

CREATE TABLE Usuario_assinante (
    Duracao Number(3),
    fk_Usuario_Id Number(3),
    fk_Usuario_email_registrado Number(80),
    PRIMARY KEY (fk_Usuario_Id, fk_Usuario_email_registrado)
);

CREATE TABLE Usuario_Stream_Avaliacao (
    fk_Stream_Id Number(3),
    fk_Usuario_Id Number(3),
    fk_Usuario_email_registrado Number(80)
);

CREATE TABLE Stream_Genero_Lista_de_desejos (
    fk_Genero_Id Number(3),
    fk_Usuario_Id Number(3),
    fk_Usuario_email_registrado Number(80)
);
 
ALTER TABLE Filme ADD CONSTRAINT FK_Filme_2
    FOREIGN KEY (fk_Stream_Id)
    REFERENCES Stream (Id)
    ON DELETE CASCADE;
 
ALTER TABLE Serie ADD CONSTRAINT FK_Serie_2
    FOREIGN KEY (fk_Stream_Id)
    REFERENCES Stream (Id)
    ON DELETE CASCADE;
 
ALTER TABLE Elenco ADD CONSTRAINT FK_Elenco_2
    FOREIGN KEY (fk_Stream_Id)
    REFERENCES Stream (Id)
    ON DELETE RESTRICT;
 
ALTER TABLE Usuario_gratuito ADD CONSTRAINT FK_Usuario_gratuito_2
    FOREIGN KEY (fk_Usuario_Id, fk_Usuario_email_registrado)
    REFERENCES Usuario (Id, email_registrado)
    ON DELETE CASCADE;
 
ALTER TABLE Usuario_assinante ADD CONSTRAINT FK_Usuario_assinante_2
    FOREIGN KEY (fk_Usuario_Id, fk_Usuario_email_registrado)
    REFERENCES Usuario (Id, email_registrado)
    ON DELETE CASCADE;
 
ALTER TABLE Usuario_Stream_Avaliacao ADD CONSTRAINT FK_Usuario_Stream_Avaliacao_1
    FOREIGN KEY (fk_Stream_Id)
    REFERENCES Stream (Id);
 
ALTER TABLE Usuario_Stream_Avaliacao ADD CONSTRAINT FK_Usuario_Stream_Avaliacao_2
    FOREIGN KEY (fk_Usuario_Id, fk_Usuario_email_registrado)
    REFERENCES Usuario (Id, email_registrado);
 
ALTER TABLE Stream_Genero_Lista_de_desejos ADD CONSTRAINT FK_Stream_Genero_Lista_de_desejos_1
    FOREIGN KEY (fk_Genero_Id)
    REFERENCES Genero (Id);
 
ALTER TABLE Stream_Genero_Lista_de_desejos ADD CONSTRAINT FK_Stream_Genero_Lista_de_desejos_2
    FOREIGN KEY (fk_Usuario_Id, fk_Usuario_email_registrado)
    REFERENCES Usuario (Id, email_registrado);