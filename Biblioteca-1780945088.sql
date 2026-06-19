
CREATE TABLE IF NOT EXISTS `Autores` (
	`id_autor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(50) NOT NULL,
	`data_nasc` date NOT NULL,
	`nacionalidade` varchar(50) NOT NULL,
	`sexo` varchar(1) NOT NULL,
	`email` varchar(50) NOT NULL,
	PRIMARY KEY (`id_autor`)
);
CREATE TABLE IF NOT EXISTS `Editoras` (
	`id_editora` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(50) NOT NULL,
	`cnpj` varchar(255) NOT NULL,
	`cidade` varchar(50) NOT NULL,
	`estado` varchar(2) NOT NULL,
	`pais` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	PRIMARY KEY (`id_editora`)
);
CREATE TABLE IF NOT EXISTS `Categorias` (
	`id_categoria` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_categoria` varchar(50) NOT NULL,
	PRIMARY KEY (`id_categoria`)
);
CREATE TABLE IF NOT EXISTS `Livros` (
	`ISBN` decimal NOT NULL UNIQUE,
	`titulo` varchar(50) NOT NULL,
	`data_publicacao` date NOT NULL,
	`id_autor` int NOT NULL,
	`id_editora` int NOT NULL,
	`id_categoria` int NOT NULL,
	PRIMARY KEY (`ISBN`)
);
CREATE TABLE IF NOT EXISTS `Cadastros` (
	`cpf` int NOT NULL UNIQUE,
	`nome` varchar(50) NOT NULL,
	`sexo` varchar(1) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`email` varchar(50) NOT NULL,
	PRIMARY KEY (`cpf`)
);
CREATE TABLE IF NOT EXISTS `Emprestimo` (
	`id_emprestimo` int AUTO_INCREMENT NOT NULL UNIQUE,
	`data_emprestimo` date NOT NULL,
	`data_entrega` date NOT NULL,
	`ISBN` decimal NOT NULL,
	`cpf` int NOT NULL,
	PRIMARY KEY (`id_emprestimo`)
);
ALTER TABLE `Livros` ADD CONSTRAINT `Livros_fk3` FOREIGN KEY (`id_autor`) REFERENCES `Autores`(`id_autor`);
ALTER TABLE `Livros` ADD CONSTRAINT `Livros_fk4` FOREIGN KEY (`id_editora`) REFERENCES `Editoras`(`id_editora`);
ALTER TABLE `Livros` ADD CONSTRAINT `Livros_fk5` FOREIGN KEY (`id_categoria`) REFERENCES `Categorias`(`id_categoria`);
ALTER TABLE `Emprestimo` ADD CONSTRAINT `Emprestimo_fk3` FOREIGN KEY (`ISBN`) REFERENCES `Livros`(`ISBN`);
ALTER TABLE `Emprestimo` ADD CONSTRAINT `Emprestimo_fk4` FOREIGN KEY (`cpf`) REFERENCES `Cadastros`(`cpf`);

INSERT INTO `Autores` VALUES
('Marina Castelo', '1985-04-12', 'Brasileira', 'F', 'marina.castelo@email.com'),
('Thiago Almeida', '1978-09-30', 'Brasileiro', 'M', 'thiago.almeida@email.com'),
('Carla Mendonça', '1992-01-21', 'Brasileira', 'F', 'carla.mendonca@email.com');


INSERT INTO `Editoras` VALUES
('Editora Lumen Azul', '12.345.678/0001-90', 'São Paulo', 'SP', 'Brasil', 'contato@lumenazul.com.br', '(11) 4002-8922'),
('Editora Vento Norte', '23.456.789/0001-01', 'Curitiba', 'PR', 'Brasil', 'contato@ventonorte.com.br', '(41) 3015-7733'),
('Editora Pedra Verde', '34.567.890/0001-12', 'Recife', 'PE', 'Brasil', 'contato@pedraverde.com.br', '(81) 3221-4455');

INSERT INTO `Categorias` VALUES
('Romance')
('Terror')
('Aventura')

INSERT INTO `Livros` VALUES
(9788512345678, 'O Eco das Marés', '2015-03-10', 1, 3, 2),
(9788523456789, 'Sombras de Concreto', '2019-07-22', 3, 2, 1),
(9788534567890, 'A Última Página', '2021-11-05', 2, 1, 3);


INSERT INTO `Cadastros` VALUES
(94367305007, 'Bruno Ferreira', 'M', '(11) 98765-4321', 'bruno.ferreira@email.com'),
(78066120095, 'Juliana Souza', 'F', '(21) 99876-5432', 'juliana.souza@email.com'),
(57365390042, 'Rafael Lima', 'M', '(31) 97654-3210', 'rafael.lima@email.com');

INSERT INTO `Emprestimo` VALUES
('2024-02-10', '2024-02-24', 9788512345678, 94367305007),
('2024-03-05', '2024-03-19', 9788523456789, 78066120095),
('2024-04-18', '2024-05-02', 9788534567890, 57365390042);




