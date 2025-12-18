/* LogicoAtividadeAvaliativa: */

CREATE TABLE Pagamento (
    ID_Pagamento Number(3) PRIMARY KEY,
    Data Number(8),
    Metodo String(15)
);

CREATE TABLE Usuario (
    ID_Usuario Number(3) PRIMARY KEY,
    Nome String(15),
    Email_Registrado String(150),
    CPF Number(11),
    Endereco String(15),
    Periodo_Duracao Number(2),
    Usuario_TIPO INT
);

CREATE TABLE Visualizacao_Usuario_Conteudo (
    ID_Visualizacao Number(3) PRIMARY KEY,
    fk_Conteudo_ID_Conteudo Number(3),
    fk_Usuario_ID_Usuario Number(3)
);

CREATE TABLE Conteudo (
    ID_Conteudo Number(3) PRIMARY KEY,
    Quantidade String(15)
);

CREATE TABLE Playlist_usuario_Conteudo (
    ID_Playlist Number(3) PRIMARY KEY,
    fk_Conteudo_ID_Conteudo Number(3),
    fk_Usuario_ID_Usuario Number(3)
);

CREATE TABLE Avaliacao_Usuario_Conteudo (
    ID_Avaliacao Number(3) PRIMARY KEY,
    fk_Conteudo_ID_Conteudo Number(3),
    fk_Usuario_ID_Usuario Number(3)
);

CREATE TABLE Musica (
    ID_Musica Number(3) PRIMARY KEY,
    Idioma String(15)
);

CREATE TABLE Artista (
    ID_Artista Number(3) PRIMARY KEY,
    Nome String(15),
    Email String(150),
    CPF Number(11)
);

CREATE TABLE Estilo (
    Nome String(15),
    ID_Estilo Number(3) PRIMARY KEY
);

CREATE TABLE tem (
    fk_Usuario_ID_Usuario Number(3),
    fk_Pagamento_ID_Pagamento Number(3)
);

CREATE TABLE tem (
    fk_Conteudo_ID_Conteudo Number(3),
    fk_Musica_ID_Musica Number(3)
);

CREATE TABLE tem (
    fk_Artista_ID_Artista Number(3),
    fk_Conteudo_ID_Conteudo Number(3)
);

CREATE TABLE tem (
    fk_Conteudo_ID_Conteudo Number(3),
    fk_Estilo_ID_Estilo Number(3)
);
 
ALTER TABLE Visualizacao_Usuario_Conteudo ADD CONSTRAINT FK_Visualizacao_Usuario_Conteudo_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Visualizacao_Usuario_Conteudo ADD CONSTRAINT FK_Visualizacao_Usuario_Conteudo_3
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Playlist_usuario_Conteudo ADD CONSTRAINT FK_Playlist_usuario_Conteudo_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Playlist_usuario_Conteudo ADD CONSTRAINT FK_Playlist_usuario_Conteudo_3
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Avaliacao_Usuario_Conteudo ADD CONSTRAINT FK_Avaliacao_Usuario_Conteudo_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Avaliacao_Usuario_Conteudo ADD CONSTRAINT FK_Avaliacao_Usuario_Conteudo_3
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Pagamento_ID_Pagamento)
    REFERENCES Pagamento (ID_Pagamento)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Musica_ID_Musica)
    REFERENCES Musica (ID_Musica)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Artista_ID_Artista)
    REFERENCES Artista (ID_Artista)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Estilo_ID_Estilo)
    REFERENCES Estilo (ID_Estilo)
    ON DELETE SET NULL;