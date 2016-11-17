/*3.1*/
SELECT * FROM almacenes;
/*3.2*/
SELECT * FROM cajas WHERE valor > 150;
/*3.3*/
SELECT contenido FROM cajas GROUP BY contenido;
/*3.4*/
SELECT AVG(valor) FROM cajas;
/*3.5*/
SELECT almacen,AVG(valor) FROM cajas GROUP BY almacen;
/*3.6*/
SELECT almacen AS cod_almacen 
FROM (SELECT almacen, AVG(valor) AS valor_medio FROM cajas GROUP BY almacen)
WHERE valor_medio > 150;
/*3.7*/
SELECT cajas.NumReferencia, almacenes.lugar as Ciudad FROM cajas JOIN almacenes ON cajas.almacen=almacenes.codigo;
/*3.8*/
SELECT almacen, COUNT(NumReferecia) FROM cajas GROUP BY almacen;
/*3.9*/
SELECT almacenes.codigo AS codigo_almacen_saturado
FROM almacenes JOIN(SELECT almacen, COUNT(NumReferencia) AS num_cajas FROM cajas GROUP BY almacen)
ON almacenes.capacidad < num_cajas;
/*3.10*/
SELECT NumReferencia FROM cajas WHERE almacen IN (SELECT codigo FROM almacenes WHERE lugar='Bilbao');
/*3.11*/
INSERT INTO almacenes (lugar,capacidad) VALUES('Barcelona', 3);
/*3.12*/
INSERT INTO cajas VALUES ('H5RT', 'Papel', 200, 2);
/*3.13*/
UPDATE cajas SET valor=valor*0.85;
/*3.14*/
UPDATE cajas SET valor=valor*0.8 WHERE valor > (SELECT AVG(valor) FROM cajas);
/*3.15*/
DELETE * FROM cajas WHERE valor < 100;
/*3.16*/
DELETE * FROM almacenes WHERE codigo IN
(SELECT almacenes.codigo AS codigo_almacen_saturado
 FROM almacenes JOIN(SELECT almacen, COUNT(NumReferencia) AS num_cajas FROM cajas GROUP BY almacen)
 ON almacenes.capacidad < num_cajas);
