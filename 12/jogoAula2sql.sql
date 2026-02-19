CREATE TABLE jogador (
);

CREATE TABLE jogo (
);

CREATE TABLE personagens (
    Blacksmith int,
    Mysterious int,
    Crew int,
    Trevor int,
    Manager int,
    Nerd int,
    Expert int,
    Customer int,
    rip_indra int,
    Aura int,
    Mr_ int,
    Military int,
    Erin int,
    Trivia int,
    PRIMARY KEY (Blacksmith, Mysterious, Crew, Trevor, Manager, Nerd, Expert, Customer, rip_indra, Aura, Mr_, Military, Erin, Trivia)
);

CREATE TABLE habilidades (
    Combat_ int,
    Dark int,
    Electric int,
    Death int,
    God int,
    PRIMARY KEY (Combat_, Dark,Electric, Death, God)
);

CREATE TABLE poderes (
    blade_ REAL,
    spring_ REAL,
    bomb_ REAL,
    smoke_ REAL,
    spike_ REAL,
    budha_ REAL,
    rocket_ REAL,
    spin_ REAL
);

CREATE TABLE tem (
    fk_personagens_Blacksmith int,
    fk_personagens_Mysterious int,
    fk_personagens_Crew int,
    fk_personagens_Trevor int,
    fk_personagens_Manager int,
    fk_personagens_Nerd int,
    fk_personagens_Expert int,
    fk_personagens_Customer int,
    fk_personagens_rip_indra int,
    fk_personagens_Aura int,
    fk_personagens_Mr_ int,
    fk_personagens_Military int,
    fk_personagens_Erin int,
    fk_personagens_Trivia int
);

CREATE TABLE possui_jogador_habilidades_poderes (
    fk_habilidades_Combat_ int,
    fk_habilidades_Dark int,
    fk_habilidades_Electric int,
    fk_habilidades_Death int,
    fk_habilidades_God int
);
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_personagens_Blacksmith, fk_personagens_Mysterious, fk_personagens_Crew, fk_personagens_Trevor, fk_personagens_Manager, fk_personagens_Nerd, fk_personagens_Expert, fk_personagens_Customer, fk_personagens_rip_indra, fk_personagens_Aura, fk_personagens_Mr_, fk_personagens_Military,fk_personagens_Erin, fk_personagens_Trivia)
    REFERENCES personagens (Blacksmith, Mysterious, Crew, Trevor, Manager, Nerd, Expert, Customer, rip_indra, Aura, Mr_, Military, Erin, Trivia)
    ON DELETE RESTRICT;
 
ALTER TABLE possui_jogador_habilidades_poderes ADD CONSTRAINT FK_possui_jogador_habilidades_poderes_1
    FOREIGN KEY (fk_habilidades_Combat_, fk_habilidades_Dark, fk_habilidades_Electric, fk_habilidades_Death, fk_habilidades_God)
    REFERENCES habilidades (Combat_, Dark, Electric, Death, God)
    ON DELETE SET NULL;