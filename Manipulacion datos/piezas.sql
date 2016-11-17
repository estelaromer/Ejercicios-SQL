/*6.1*/
SELECT nombre FROM piezas;
/*6.2*/
SELECT * FROM proveedores;
/*6.3*/
SELECT AVG(precio) FROM suministra
/*6.4*/
SELECT nombre FROM proveedores WHERE id IN (SELECT idproveedor FROM suministra WHERE codigopieza=1);
/*6.5*/
SELECT nombre FROM piezas WHERE codigo IN (SELECT codigopieza FROM suministra WHERE idproveedor='HAL');
/*6.6*/
INSERT INTO suministra VALUES(1, 'TNBC', 7);
/*6.7*/
UPDATE suministra SET precio=precio+1;
/*6.8*/
DELETE * FROM suministra WHERE idproveedor='RBT';
/*6.9*/
DELETE * FROM suministra WHERE (idproveedor='RBT' AND codigopieza=4);
