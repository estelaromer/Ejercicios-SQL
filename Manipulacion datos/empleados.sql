/*2.1*/
SELECT Apellidos FROM empleados;
/*2.2*/
SELECT DISTINCT Apellidos FROM empleados;
/*2.3*/
SELECT * FROM empleados WHERE Apellidos='Lopez';
/*2.4*/
SELECT * FROM empleados WHERE (Apellidos='Lopez' OR Apellidos='Perez');
/*2.5*/
SELECT * FROM empleados WHERE Departamento=14;
/*2.6*/
SELECT * FROM empleados WHERE (Departamento=37 OR Departamento=77);
/*2.7*/
SELECT * FROM empleados WHERE Apellidos LIKE 'P%';
/*2.8*/
SELECT SUM(Presupuesto) AS presupuesto_total FROM departamentos;
/*2.9*/
SELECT Departamento, COUNT(DNI) AS Num_Empleados FROM empleados GROUP BY Departamento;
/*2.10*/
SELECT * FROM empleados JOIN departamentos ON empleados.Departamento=departamentos.Codigo;
/*2.11*/
SELECT 
   empleados.Nombre, empleados.Apellidos, departamentos.Nombre AS Nombre_Departamento, departamentos.Presupuesto 
FROM empleados JOIN departamentos ON empleados.Departameto=departamentos.Codigo;
/*2.12*/
SELECT Nombre, Apellidos
FROM empleados
WHERE Departamento IN
(SELECT codigo
 FROM departamentos
 WHERE Presupuesto>60000);
 /*2.13*/
 SELECT * 
 FROM departamentos 
 WHERE Presupuesto >(SELECT AVG(Presupuesto) FROM departamentos);
 /*2.14*/
 SELECT Nombre FROM departamentos WHERE codigo IN
  (SELECT Departamento FROM
   (SELECT Departamento, COUNT(DNI) AS Num_Empleados FROM empleados GROUP BY Departamento) 
   WHERE Num_Empleados > 2
  );
/*2.15*/
INSERT INTO departamentos VALUES (11, 'Calidad', 40000);
INSERT INTO empleados VALUES(89267109, 'Ester', 'Vazquez', 11);
/*2.16*/
UPDATE departamentos SET Presupuesto=Presupuesto*0.9;
/*2.17*/
UPDATE empleados SET Departamento=14 WHERE Departamento=77;
/*2.18*/
DELETE * FROM empleados WHERE Departamento=14;
/*2.19*/
DELETE * FROM empleados WHERE Departamento IN
(SELECT Codigo FROM departamentos WHERE Presupuesto>60000);
/*2.20*/
DELETE * FROM empleados;
