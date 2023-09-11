CREATE DATABASE webapp;
USE webapp;

DROP TABLE IF EXISTS `Categorias`;
CREATE TABLE `Categorias`(
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100) NOT NULL,
    `descrpcion` text,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Reactivos`;
CREATE TABLE `Reactivos`(
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(200)NOT NULL,
    `opcion_1` varchar(200)NOT NULL,
    `opcion_2` varchar(200)NOT NULL,
    `opcion_3` varchar(200)NOT NULL,
    `correcta` varchar(200)NOT NULL,
    `idCategoria` INT NOT NULL,
    PRIMARY KEY(`id`),
    KEY `fk_reactivos_categorias1_idx` (`idCategoria`),
    CONSTRAINT `fk_reactivos_categorias1` FOREIGN KEY(`idCategoria`)
    REFERENCES `Categorias` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

DROP TABLE IF EXISTS `USUARIOS`;

CREATE TABLE `USUARIOS`(
   `id` INT (11) NOT NULL AUTO_INCREMENT,
   `nombre` VARCHAR(45) NOT NULL,
   `email` VARCHAR(100) NOT NULL,
   `username` VARCHAR(45) NOT NULL,
   `password` VARCHAR(100) NOT NULL,
   `estatus` INT(11) NOT NULL DEFAULT '1',
   `fechaRegisto` DATE DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `username_UNIQUE`(`username`),
   UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;