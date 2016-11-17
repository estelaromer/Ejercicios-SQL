CREATE TABLE empleados
(dni NUMBER(8)  NOT NULL CONSTRAINT emp_PK PRIMARY KEY,
 nombre VARCHAR2(10) NOT NULL,
 apellido1 VARCHAR2(15) NOT NULL,
 apellido2 VARCHAR2(15),
 direcc1 VARCHAR2(25),
 direcc2 VARCHAR2(20),
 ciudad VARCHAR2(20),
 provincia VARCHAR2(20),
 cod_postal VARCHAR2(5),
 sexo VARCHAR2(1) CONSTRAINT valor CHECK(sexo="H" OR sexo="M"),
 fecha_nac DATE
);

CREATE TABLE departamentos
(dpto_cod NUMBER(5) NOT NULL CONSTRAINT dpto_PK PRIMARY KEY,
 nombre_dpto VARCHAR2(30) NOT NULL CONSTRAINT dpto_UK UNIQUE,
 dpto_padre NUMBER(5),
 presupuesto NUMBER NOT NULL,
 pres_actual NUMBER
);

CREATE TABLE estudios
(empleado_dni NUMBER(8) NOT NULL CONSTRAINT est_FK REFERENCES empleados(dni),
 universidad NUMBER(5) NOT NULL CONSTRAINT est_FK2 REFERENCES universidades(univ_code),
 año NUMBER,
 grado VARCHAR2(3),
 especialidad VARCHAR2(20),
 CONSTRAINT est_PK PRIMARY KEY(empleado_dni,universidad,especialidad)
);

CREATE TABLE historial_laboral
(empleado_dni NUMBER(8) NOT NULL CONSTRAINT hl_FK REFERENCES empleados(dni),
 trabajo_cod NUMBER(5) NOT NULL CONSTRAINT hl_FK2 REFERENCES trabajos,
 fecha_inicio DATE NOT NULL,
 fecha_fin DATE NOT NULL,
 dpto_code NUMBER(5) NOT NULL CONSTRAINT hl_FK3 REFERENCES departamentos, 
 supervisor_dni NUMBER(8) NOT NULL CONSTRAINT hl_FK4 REFERENCES empleados(dni),
 CONSTRAINT hl_PK PRIMARY KEY(empleado_dni,trabajo_cod,fecha_inicio,fecha_fin)
);

CREATE TABLE universidades
(univ_cod NUMBER(5) NOT NULL CONSTRAINT univ_PK PRIMARY KEY,
 nombre_univ VARCHAR2(25) NOT NULL,
 ciudad VARCHAR2(20),
 municipio VARCHAR2(2),
 cod_postal VARCHAR2(5)
);

CREATE TABLE historial_salarial
(empleado_dni NUMBER(8) NOT NULL CONSTRAINT hs REFERENCES empleados(dni),
 salario NUMBER NOT NULL,
 fecha_comienzo DATE NOT NULL,
 fecha_fin DATE NOT NULL,
 CONSTRAINT hs_PK PRIMARY KEY (empleado_dni, salario,fecha_comienzo,fecha_fin)
);

CREATE TABLE trabajos
(trabajo_cod NUMBER(5) NOT NULL CONSTRAINT trab_PK PRIMARY KEY,
 nombre_trab VARCHAR2(20) NOT NULL CONSTRAINT trab_UK UNIQUE,
 salario_min NUMBER(2) NOT NULL,
 salario_max NUMBER(2) NOT NULL
);

INSERT INTO empleados VALUES (12345678,'Marcos','Perez','Martin','Calle Alberique','25 1ºIzq','Madrid','Madrid','28027','H','1982/04/24');
INSERT INTO empleados VALUES (12345679,'Patricia','Sanz','Arjona','Calle Amposta','3 1ºIzq','Madrid','Madrid','28037','M','1977/04/05');
INSERT INTO departamentos VALUES(12345,'Preventa',54321,400000,243000);
INSERT INTO departamentos VALUES(54321,'Marketing y Ventas',13579,1000000,875000);
INSERT INTO estudios VALUES(12345678,98765,2004,'ITT','Sistemas Telecomunicacion');


No permite asignar un supervisor que no aparece en la tabla empleados

ALTER TABLE estudios MODIFY universidad NUMBER(5) NOT NULL CONSTRAINT est_FK2 REFERENCES universidades(univ_code);