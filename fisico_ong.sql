
CREATE TABLE tipo_usuario (
cod_tipuser int auto_increment PRIMARY KEY,
desc_tipuser varchar(250)
);

insert into tipo_usuario () values
(1, administrador),
(2,usuario);

CREATE TABLE midia (
titulo_midia varchar(100),
caminho_midia varchar(250),
cod_midia int auto_increment PRIMARY KEY,
cod_postagem int not null
);

INSERT INTO midia ()
VALUES

('Midia 1', 'https://www.salvavidas.com', 1, 1,),
('Midia 2', 'https://www.to_sendo_obrigada_a_fazer_isso.com', 2, 2,),
('Midia 3', 'https://www.tocomfome.com', 3, 3,),
('Midia 4', 'https://www.nãoaguentoamis.com', 4, 4,),
('Midia 5', 'https://www.vidassociaisimportam.com', 5, 5,),
('Midia 6', 'https://www.tovoando.com', 6, 6,),
('Midia 7', 'https://www.estudantetambemegente.com', 7, 7,),
('Midia 8', 'https://www.teodeio.com', 8, 8,),
('Midia 9', 'https://www.falabaixo.com', 9, 9,),
('Midia 10','https://www.meduzete.com', 10, 10,);

CREATE TABLE ong (
email_ong varchar(250) not null unique,
telefone_ong varchar(14),
nome_ong varchar(100) not null unique,
cod_ong int auto_increment PRIMARY KEY
);


INSERT INTO "ongs"
VALUES
('juliasilva@gmail.com', "+559960678771", "Projeto Golfinho", 1),
('josecardoso@gmail.com', "+559960655771", "Projeto Sem noção", 2),
('sophiasantino@gmail.com', "+55900067871", "Projeto Sete Vidas de Um Gato", 3),
('catalinasoares@gmail.com', "+559960678901", "Projeto Ai Sla", 4),
('lylibloom@gmail.com', "+559440618771", "Projeto Cobra Feia", 5),
('atlascorring@gmail.com', "+559960612771", "Projeto Animais", 6),
('rhysanddasilva@gmail.com', "+559960678771", "Projeto Leão", 7),
('johnlogan@gmail.com', "+5599606787081", "Projeto Baleia ", 8),
('johntucker@gmail.com', "+559850678771", "Projeto Boto Cor Rosa", 9),
('garretperfeito@gmail.com', "+559100678101", "Projeto sarama", 10);

CREATE TABLE usuario (
idade int,
nome varchar(250) not null,
email varchar(250) not null unique,
cod_usuario int auto_increment PRIMARY KEY,
telefone varchar(14),
cod_tipuser int not null,
FOREIGN KEY(cod_tipuser) REFERENCES tipo_usuario (cod_tipuser)
);

INSERT INTO "cliente"
VALUES
(17, 'Carlos', 'carlos@gmail.com', 1, '+559934343443', 1),
(19, 'Maria', 'maria@gmail.com', 2, '+559004343443', 2),
(45, 'Antônio', 'antonio@gmail.com', 3, '+559934343443', 1),
(17, 'Julia', 'juju@gmail.com', 4, '+559934343999', 2),
(22, 'Gabrielle', 'gabi@gmail.com', 5, '+559934456443', 2),
(29, 'Caio', 'Caio@gmail.com', 6, '+559939943443', 1),
(73, 'Afonso', 'afonso@gmail.com', 7, '+559114343443', 1),
(14, 'Joana', 'joana@gmail.com', 8, '+559934348900', 2),
(26, 'Higor', 'higor@gmail.com', 9, '+559934343993', 1),
(23, 'Clara', 'clara@gmail.com', 10, '+559934343454', 2);

CREATE TABLE postagem (
titulo_postagem varchar(100),
categoria varchar(100),
cod_postagem int auto_increment PRIMARY KEY,
texto_postagem varchar(1000),
cod_usuario int not null,
cod_ong int not null,
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario),
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong)
);

INSERT INTO "postagem"
VALUES
('Tudo bem', 'Relevantes', 1, 'Não sei como fazer', 3, 1),
('Nada bem', 'Notícias', 2, 'Tudo indo errado', 6, 10),
('Como escreve?', 'Questões', 3, 'Estou perdido', 7, 1),
('Nunca gostei mesmo', 'Divertido', 4, 'Odeio isso', 4, 2),
('Que daora', 'Opinião', 5, 'Sim, verdade', 8, 3),
('NÃO ACREDITO NISSO!', 'Relevantes', 6, 'Chocado...', 1, 4),
('Olá amigo!', 'Novo', 7, 'Perguntei?', 2, 5),
('Cachorro é melhor', 'Divertido', 8, 'Acho que não', 9, 6),
('Tá bem triste', 'Notícias', 9, 'Caiu mesmo?', 7, 7),
('Rindo', 'Novo', 10, 'O macaco subiu pra pegar banana', 5, 9);

CREATE TABLE comenta (
cod_postagem int not null,
cod_usuario int not null,
dathora_coment timestamp default current_timestamp(),
texto_coment varchar(250),
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

INSERT INTO "comenta"
VALUES 
(1, 10, '2022-05-30 12:23:07', "nao sei o que escrever"),
(2, 2, '2022-05-30 12:23:07', "que isso"),
(3, 9, '2022-05-30 12:23:07', "que feio"),
(4, 4, '2022-05-30 12:23:07', "faz melhor"),
(5, 1, '2022-05-30 12:23:07', "fala baixo"),
(6, 5, '2022-05-30 12:23:07', "de milhares"),
(7, 7, '2022-05-30 12:23:07', "igual sua cara"),
(8, 3, '2022-05-30 12:23:07', "rato valeteiro"),
(9, 8, '2022-05-30 12:23:07', "sua mae é linda"),
(10, 6, '2022-05-30 12:23:07', "Salve salve");

CREATE TABLE curtir (
cod_postagem int not null,
cod_usuario int not null,
dathora_curtir timestamp default current_timestamp(),
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

INSERT INTO "curtir"
VALUES
(1, 10, '2022-08-27 18:23:08'),
(2, 9, '2022-08-27 18:23:08'),
(3, 8, '2022-08-27 18:23:08'),
(4, 7, '2022-08-27 18:23:08'),
(5, 6, '2022-08-27 18:23:08'),
(6, 5, '2022-08-27 18:23:08'),
(7, 4, '2022-08-27 18:23:08'),
(8, 3, '2022-08-27 18:23:08'),
(9, 2, '2022-08-27 18:23:08'),
(10, 1, '2022-08-27 18:23:08');

CREATE TABLE doacao (
cod_ong int not null,
cod_usuario int not null,
dt_doacao date,
valor_doacao decimal(10,2),
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

INSERT INTO "doacao"
VALUES
(1, 1, '2022-03-15', 976.12),
(2, 2, '2022-03-15', 976.12),
(3, 3, '2022-03-15', 976.12),
(4, 4, '2022-03-15', 976.12),
(5, 5, '2022-03-15', 976.12),
(6, 6, '2022-03-15', 976.12),
(7, 7, '2022-03-15', 976.12),
(8, 8, '2022-03-15', 976.12),
(9, 9, '2022-03-15', 976.12),
(10, 10, '2022-03-15', 976.12);

CREATE TABLE voluntario (
cod_ong int not null,
cod_usuario int not null,
dt_voluntario date,
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong),
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

INSERT INTO "voluntario"
VALUES
(1, 1, '2022-12-18'),
(2, 2, '2022-12-18'),
(3, 3, '2022-12-18'),
(4, 4, '2022-12-18'),
(5, 5, '2022-12-18'),
(6, 6, '2022-12-18'),
(7, 7, '2022-12-18'),
(8, 8, '2022-12-18'),
(9, 9, '2022-12-18'),
(10, 10, '2022-12-18');

ALTER TABLE midia ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
