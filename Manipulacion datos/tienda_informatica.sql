CREATE TABLE fabricantes
(codigo INT IDENTITY NOT NULL CONSTRAINT fab_PK PRIMARY KEY,
 nombre NVARCHAR2(100)
);

CREATE TABLE articulos
(codigo INT IDENTITY NOT NULL CONSTRAINT art_PK PRIMARY KEY,
 nombre NVARCHAR2(100),
 precio INTEGER,
 fabricante INTEGER CONSTRAINT art_FK REFERENCES fabricantes(codigo)
);

/*1.1*/ 
SELECT nombre,precio FROM articulos;
/*1.2*/ 
SELECT nombre FROM articulos WHERE (precio>=200);
/*1.3*/ 
SELECT * FROM articulos WHERE (precio>=60 AND precio>=120);
/*1.4*/ 
SELECT nombre,precio*166.386 AS precio_en_euros FROM articulos;
/*1.5*/ 
SELECT nombre, AVG(precio) AS precio_medio FROM articulos GROUP BY nombre;
/*1.6*/ 
SELECT nombre, AVG(precio) AS precio_medio FROM articulos WHERE fabricante=2 GROUP BY nombre;
/*1.7*/ 
SELECT COUNT(nombre) AS articulos_que_valen_mas_de_180 FROM articulos WHERE precio>=180;
/*1.8*/ 
SELECT nombre,precio FROM articulos WHERE (precio>= 180) ORDER BY precio DESC;
SELECT nombre,precio FROM articulos WHERE (precio>= 180) ORDER BY nombre;
/*1.9*/ 
SELECT 
   articulos.codigo, articulos.nombre, articulos.precio, fabricantes.codigo AS codigo_fabricante, fabricantes.nombre 
FROM articulos JOIN fabricantes ON articulos.fabricante=fabricantes.codigo;
/*1.10*/ 
SELECT 
   articulos.nombre AS nombre_articulo, articulos.precio, fabricantes.nombre AS nombre_fabricante 
FROM articulos JOIN fabricantes ON articulos.fabricante=fabricantes.codigo;
/*1.11*/ 
SELECT fabricante as codigo_fabricante, AVG(precio) AS precio_medio FROM articulos GROUP BY fabricante;
/*1.12*/ 
SELECT 
   fabricantes.nombre AS nombre_fabricante, AVG(articulos.precio) AS precio_medio 
FROM  articulos JOIN fabricantes ON articulos.fabricante=fabricantes.codigo GROUP BY fabricantes.nombre;
/*1.13*/
SELECT nombre
FROM fabricantes
WHERE codigo IN
(SELECT fabricante
 FROM
 (SELECT 
	fabricante, AVG(precio) AS precio_medio 
  FROM articulos GROUP BY fabricante)
 WHERE precio_medio>=150);
/*1.14*/ 
SELECT nombre, MIN(precio) FROM articulos;
/*1.15*/
SELECT nombre_articulo, precio_maximo, cod_fabricante, fabricantes.nombre AS nombre_fabricante
FROM
fabricantes
JOIN
(SELECT 
	nombre AS nombre_articulo, MAX(precio) AS precio_maximo, fabricante AS cod_fabricante
 FROM articulos
 GROUP BY fabricante)
ON cod_fabricante=fabricantes.codigo;
/*1.16*/
INSERT INTO articulos VALUES (6,'Altavoz',70,2);
/*1.17*/
UPDATE articulos SET nombre='Impresora Laser' WHERE codigo=8;
/*1.18*/
UPDATE articulos SET precio=precio*0.9;
/*1.19*/
UPDATE articulos SET precio=precio*0.9 WHERE precio>=120;
