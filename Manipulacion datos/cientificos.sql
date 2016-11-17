/*7.1*/
SELECT c.dni, c.nomapels, p.id, p.nombre 
FROM cientificos c 
JOIN asigna_a asig
ON c.dni=asig.cientifico
JOIN proyecto p 
ON asig.proyecto=p.id;
/*7.2*/
SELECT c.dni, c.nomapels, num_proyectos
FROM cientificos c
JOIN
(SELECT cientifico AS dni_cientifico, COUNT(proyecto) AS num_proyectos FROM asignado_a GROUP BY cientifico)
ON c.dni=dni_cientifico;
/*7.3*/
SELECT p.id, p.nombre, num_cientificos
FROM proyectos p
JOIN
 (SELECT proyecto AS cod_proyecto, COUNT(cientifico) AS num_cientificos FROM asignado_a GROUP BY proyecto) 
ON p.id=cod_proyecto;
/*7.4*/
SELECT dni_cientifico, SUM(horas)
FROM
 (SELECT asig.cientifico AS dni_cientifico, p.id AS codigo_proyecto, p.horas AS horas
 FROM asignado_a asig
 JOIN proyecto p
 ON asig.proyecto=p.id)
GROUP BY dni_cientifico;
/*7.5*/
SELECT cientificos.dni, dni_c
FROM cientificos
JOIN
   (SELECT dni_cfico AS dni_c
   FROM
      (SELECT dni_cientifico AS dni_cfico, AVG(horas) AS horas_media_proyecto
      FROM
         (SELECT asig.cientifico AS dni_cientifico, asig.proyecto AS id_proyecto, p.horas AS num_horas
         FROM asignado_a asig
         JOIN proyecto p
         ON asig.proyecto=p.id)
      GROUP BY dni_cientifico)
   WHERE horas_media_proyecto > 80)
ON cientificos.dni = dni_c
JOIN
   (SELECT cientifico_dni AS c_dni
   FROM
      (SELECT cientifico AS cientifico_dni, COUNT(proyecto) AS num_proyectos
      FROM asignado_a
      GROUP BY cientifico)
    WHERE num_proyectos > 1)
ON dni_c = c_dni;


