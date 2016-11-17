/*8.1*/
SELECT producto, COUNT(producto) FROM venta GROUP BY producto ORDER BY COUNT(producto) DESC;
/*8.2*/
SELECT nom_caj AS nombre_cajero, id_caj AS id_cajero, cod_maq AS codigo_maquina, piso_maq AS piso_maquina, p.codigo AS cod_producto, p.nombre AS nom_producto, p.precio AS precio_producto
FROM productos p
JOIN
   (SELECT nom_caj, id_caj, mr.codigo AS cod_maq, mr.piso AS piso_maq, prod
   FROM
      (SELECT c.nomapels AS nom_caj, v.cajero AS id_caj, v.maquina AS maq, v.producto AS prod
      FROM cajeros c
      JOIN venta v
      ON c.codigo = v.cajero)
   JOIN maquinas_registradoras mr
   ON maq = mr.codigo)
ON p.codigo = prod;