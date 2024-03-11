CREATE DATABASE IF NOT EXISTS libreria;
USE libreria;

CREATE TABLE Autores(
autor_id INT PRIMARY KEY,
nombre_autor VARCHAR(50) NOT NULL,
nacionalidad VARCHAR (50)
);

CREATE TABLE Libros(
libro_id INT PRIMARY KEY,
titulo_libro VARCHAR(50) NOT NULL,
autor_id INT, --FOREIGN KEY (autor_id) REFERENCES Autores(autor_id),--
anio_publicacion INT
);
￼
CREATE TABLE Ventas(
venta_id INT AUTO_INCREMENT PRIMARY KEY,
libro_id INT, --FOREIGN KEY (libro_id) REFERENCES Libros(libro_id),--
fecha_venta DATETIME,
cantidad INT
);

ALTER TABLE Libros
ADD CONSTRAINT fk_autor_id FOREIGN KEY (autor_id) REFERENCES Autores(autor_id);

ALTER TABLE Ventas
ADD CONSTRAINT fk_libro_id FOREIGN KEY (libro_id) REFERENCES Libros(libro_id);

INSERT INTO Autores
(autor_id, nombre_autor, nacionalidad)
VALUES
(1, 'Gabriel García Márquez', 'Colombia'),
(2, 'J.K. Rowling', 'Reino Unido'),
(3, 'Haruki Murakami', 'Japón'),
(4, 'Elisabet Benavent','España');

INSERT INTO Libros
(libro_id, titulo_libro, autor_id, anio_publicacion)
VALUES
(1, 'Cien años de soledad', 1, 1967),
(2, 'Harry Potter y la Piedra Filosofal', 2, 1997),
(3, 'Norwegian Wood', 3, 1987),
(4,'El amor en los tiempos del cólera', 1, 1985),
(5,'Crónica de una muerte anunciada', 1, 1981),
(6,'El Coronel no tiene quien le escriba', 1, 1961),
(7,'Doce cuentos peregrinos', 1, 1992),
(8,'Memoria de mis putas tristes', 1, 2004),
(9,'Harry Potter y la cámara secreta', 2, 1998),
(11,'Harry Potter y el cáliz de fuego', 2, 2000),
(12,'Harry Potter y la Orden del Fénix', 2, 2003),
(13,'Harry Potter y el misterio del príncipe', 2, 2005),
(14,'Tokio Blues', 3, 1987),
(15,'Kafka en la orilla', 3, 2002),
(16,'1Q84', 3, 2009),
(17,'Al sur de la frontera, al oeste del sol', 3, 1992),
(18,'Los años de peregrinación del chico sin color', 3, 2013);

INSERT INTO Ventas
(venta_id, libro_id, fecha_venta, cantidad)
VALUES
(1, 1, '2023-01-15', 10),
(2, 2, '2023-02-20', 15),
(3, 3, '2023-03-10', 5),
(4, 4, '2024-01-31', 23),
(5, 6, '2024-02-15', 43),
(6, 5, '2022-03-10', 21);