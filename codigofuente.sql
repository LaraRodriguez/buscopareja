CREATE DATABASE IF NOT EXISTS Buscopareja CHARACTER SET utf8 COLLATE utf8_spanish_ci;
/*TODO: table users, information schema
        table dates, this doesn't work...
        table preferences, this works, don't touch!!!*/
use Buscopareja;
/*Change databaseeeee*/
/*---------------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE IF NOT EXISTS usuarios(
cod_usuario INT AUTO_INCREMENT, /*vamoh a veh, esto es lo que marca a la persona, así que tiene que quedarse autoincrementable, tambien es PRIMARY KEY*/
nombre VARCHAR(20),             /*bueno, esto no se si deberia ser PRIMARY KEY, xq ya está el codigo...*/
apellido1 VARCHAR(20) NOT NULL, /*esto me la suda*/
apellido2 VARCHAR(20) NOT NULL, /*esto tambien, ¿a quien le importa el segundo apellido?*/
edad INT NOT NULL,              /*esto no se si cambiarlo por la fecha de nacimiento... TODO: cambiar por DATE*/
sexo ENUM("Mujer", "Hombre", "No binario") NOT NULL,    /*TODO: pongo mas o lo dejo así?*/
orientacion ENUM("Heterosexual", "Homosexual", "Bisexual", "Asexual") NOT NULL, /*TODO: mas temas peliagudos, no quiero que me ataque la gente*/
pais VARCHAR(30) NOT NULL,      /*esto que no falte, pero tampoco es muy importante*/
ciudad VARCHAR(30) NOT NULL,    /*lo mismo*/
calle VARCHAR(30),
numero INT,
email VARCHAR(50) NOT NULL,
contrasena VARCHAR(16) NOT NULL,
foto VARCHAR(10),
PRIMARY KEY(cod_usuario, nombre)) /*mmm, sigo con la duda existencial... TODO: probar a ver si funciona solo con cod_usuario*/
ENGINE=InnoDB;
/*Tabla usuarios*/
/*----------------------------------------------------------------------------------------------------------------------------------------*/
/*DON'T FUCKING TOUCH THIS, THIS WORKS AND THIS IS HOW IT WILL REMAIN*/
CREATE TABLE IF NOT EXISTS preferencias(
cod_usuario INT,
nombre VARCHAR(20),
tipo ENUM("Lectura", "Deportes", "Cine", "Cocina"),
fecha DATE,
obligacion SET("Si", "No"),
CONSTRAINT FK_USUARIO_PREF FOREIGN KEY (cod_usuario, nombre) REFERENCES usuarios (cod_usuario, nombre) ON UPDATE CASCADE ON DELETE CASCADE)
ENGINE=InnoDB;
/*DON'TTTTTTT TOUUUUUUUCH*/
/*-----------------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE IF NOT EXISTS citas(
cod_cita INT AUTO_INCREMENT PRIMARY KEY, /*esto deberia funcionar xq el otro funciona, PORQUE NO FUNCIONA???!!!*/
persona1 VARCHAR(20),                    /*a ver, en teoria habria que sacar los datos de la tabla usuarios... TODO: poner solo el codigo*/
cod_persona1 INT,
persona2 VARCHAR(20),
cod_persona2 INT,
ubicacion VARCHAR(50) NOT NULL,         
fecha DATETIME NOT NULL,
resultado SET("Bien", "Mal"),   /*he cambiado esto para que solo sean los codigos, por si luego sigue sin funcionar*/
CONSTRAINT FK_USUARIO1 FOREIGN KEY (cod_persona1) REFERENCES usuarios (cod_usuario) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FK_USUARIO2 FOREIGN KEY (cod_persona2) REFERENCES usuarios (cod_usuario) ON UPDATE CASCADE ON DELETE CASCADE)
ENGINE=InnoDB;
/*TODO:No estoy muy segura, ¿esto funciona? Esto no funciona, lo confirmamos*/
/*-----------------------------------------------------------------------------------------------------------------------------------------*/