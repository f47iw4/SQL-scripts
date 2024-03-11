--1. Ejecutar libreria.sql 
--2. Obtener todos los libros junto con sus autores 

SELECT 
L.titulo_libro AS 'Libro',
A.nombre_autor AS 'Autor'
FROM Libros L
JOIN Autores A 
ON L.autor_id = A.autor_id;


--3.Obtener el total de ventas por libro 

SELECT L.titulo_libro AS 'Libro', SUM(V.cantidad) AS 'Total de Ventas'
FROM Libros L
JOIN Ventas V ON L.libro_id = V.libro_id
GROUP BY L.titulo_libro;




--
SELECT 
L.titulo_libro AS 'Libro',
V.cantidad AS 'Ventas'
FROM Libros L
JOIN Ventas V
ON L.libro_id = V.cantidad;
--

--4.Obtener los libros publicados después de 1980

SELECT L.titulo_libro, L.anio_publicacion
FROM Libros L
INNER JOIN Autores A ON

--5.Obtener los libros vendidos por el autor colombiano después del año 2000
--(título, autor, cantidad de libros vendidos)

SELECT titulo_libro, nombre_autor, cantidad
FROM Libros, Autores, Ventas
WHERE nacionalidad LIKE 'Colombia' AND anio_publicacion > 2000 AND nacionalidad IN
(SELECT libro_id FROM Ventas WHERE cantidad IS NOT NULL);


--6.Obtener los autores que tienen más de dos libros publicados y la cantidad total de ventas de sus libros

SELECT 
    Autores.autor_id,
    Autores.nombre_autor,
   COUNT(Libros.libro_id) AS total_libros_publicados,
   SUM(Ventas.cantidad) AS total_ventas
FROM 
    Autores
INNER JOIN Libros ON Autores.autor_id = Libros.autor_id
LEFT JOIN Ventas ON Libros.libro_id = Ventas.libro_id
GROUP BY 
    Autores.autor_id, Autores.nombre_autor
HAVING 
    COUNT(Libros.libro_id) > 2;
    
    
--7. Obtener los libros vendidos en la última semana junto con su autor y cantidad vendida 
-- (si no sale ninguno, modifica un registro para que la fecha de venta sea en la última semana)
-- * doble join: usamos dos joins porque hay 3 tablas
 SELECT 
 Libros.titulo_libro,
 Autores.nombre_autor,
 Ventas.cantidad
FROM Ventas
JOIN Libros ON Ventas.libro_id = Libros.libro_id
JOIN Autores ON Libros.autor_id = Autores.autor_id
WHERE 
Ventas.fecha_venta BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 WEEK) AND CURDATE();

--8. Introduce 2 libros para los autores que no tengan ninguno registrado.

--Identificar a los autores que no tienen libros registrados:
SELECT autor_id, nombre_autor
FROM Autores
WHERE autor_id NOT IN (SELECT DISTINCT autor_id FROM Libros);

-- Añade también registros en la tabla ventas para cada uno de ellos.

INSERT INTO Libros (libro_id, titulo_libro, autor_id, anio_publicacion)
VALUES 
    (28, 'Un Cuento Perfecto', 4, 2024);

     
--9. Añade un nuevo campo a la tabla de libros que almacene el precio unitario de cada libro y asigna valores a cada uno de ellos. 

ALTER TABLE Ventas
ADD precio_unitario 
DOUBLE AFTER cantidad;

--Asignar precios distintos:
UPDATE Ventas SET precio_unitario = 11.95 WHERE libro_id='1';
UPDATE Ventas SET precio_unitario = 12.95 WHERE libro_id='2';
UPDATE Ventas SET precio_unitario = 13.95 WHERE libro_id='3';
UPDATE Ventas SET precio_unitario = 14.95 WHERE libro_id='4';
UPDATE Ventas SET precio_unitario = 15.95 WHERE libro_id='5';
UPDATE Ventas SET precio_unitario = 16.95 WHERE libro_id='6';
UPDATE Ventas SET precio_unitario = 17.95 WHERE libro_id='7';
UPDATE Ventas SET precio_unitario = 18.95 WHERE libro_id='8';



--10. Añade un nuevo campo a la tabla ventas que almacene el total recaudado con las ventas de cada libro registrado. 


ALTER TABLE Ventas
ADD total_recaudo DOUBLE 
AFTER precio_unitario; 

UPDATE Ventas 
SET total_recaudo = cantidad*precio_unitario;





