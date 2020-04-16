CREATE DATABASE IF NOT EXISTS Buscopareja CHARACTER SET utf8 COLLATE utf8_spanish_ci;
/*TODO: tabla de usuarios, con toda la información de la persona
        tabla de citas, esto sigue fallando, mirar como meter dos personas diferentes
        tabla de preferencias, esta no da para mucho, asi que ni me lo planteo */
use Buscopareja;
/*Creamos la base de datos y cambiamos a ella para poder editarla*/
CREATE TABLE IF NOT EXISTS usuarios(
cod_usuario INT AUTO_INCREMENT, 
nombre VARCHAR(20), 
apellido1 VARCHAR(20) NOT NULL,
apellido2 VARCHAR(20) NOT NULL,
edad INT NOT NULL,
sexo ENUM("Mujer", "Hombre", "No binario") NOT NULL,
orientacion ENUM("Heterosexual", "Homosexual", "Bisexual", "Asexual") NOT NULL,
pais VARCHAR(30) NOT NULL,
ciudad VARCHAR(30) NOT NULL,
calle VARCHAR(30),
numero INT,
email VARCHAR(50) NOT NULL,
contrasena VARCHAR(16) NOT NULL,
foto VARCHAR(10),
PRIMARY KEY(cod_usuario, nombre))
ENGINE=InnoDB;
/*Tabla usuarios*/
CREATE TABLE IF NOT EXISTS preferencias(
cod_usuario INT,
nombre VARCHAR(20),
tipo ENUM("Lectura", "Deportes", "Cine", "Cocina"),
fecha DATE,
obligacion SET("Si", "No"),
CONSTRAINT FK_USUARIO_PREF FOREIGN KEY (cod_usuario, nombre) REFERENCES usuarios (cod_usuario, nombre) ON UPDATE CASCADE ON DELETE CASCADE)
ENGINE=InnoDB;
/*Tabla preferencias*/
CREATE TABLE IF NOT EXISTS citas(
cod_cita INT AUTO_INCREMENT PRIMARY KEY,
persona1 VARCHAR(20),
cod_persona1 INT,
persona2 VARCHAR(20),
cod_persona2 INT,
ubicacion VARCHAR(50) NOT NULL,
fecha DATETIME NOT NULL,
resultado SET("Bien", "Mal"),
PRIMARY KEY (persona1, cod_persona1),
CONSTRAINT FK_ASISTENTE1 FOREIGN KEY (persona1, cod_persona1) REFERENCES usuarios (nombre, cod_usuario))
ENGINE=InnoDB;
/*CONSTRAINT FK_ASISTENTE2 FOREIGN KEY (persona2, cod_persona2) REFERENCES usuarios (nombre, cod_usuario))*/

/*TODO:No estoy muy segura, ¿esto funciona? Esto no funciona, lo confirmamos*/
