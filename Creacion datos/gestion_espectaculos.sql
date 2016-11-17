CREATE TABLE espectaculo
(cod_espectaculo CHAR(10) NOT NULL CONSTRAINT espectaculo_PK PRIMARY KEY,
 nombre VARCHAR(40) NOT NULL,
 tipo VARCHAR(10) CONSTRAINT tipo_esp CHECK(tipo="comedia" OR tipo="drama" OR tipo="musical"),
 fecha_inicial DATE NOT NULL,
 fecha_final DATE NOT NULL,
 interprete VARCHAR(20) NOT NULL,
 cod_recinto CHAR(15) CONSTRAINT espectaculo_FK REFERENCES recintos
);

CREATE TABLE precios_espectaculos
(cod_espectaculo CHAR(10) CONSTRAINT precios_FK REFERENCES espectaculo,
 cod_recinto CHAR(15),
 zona VARCHAR(20),
 precio NUMBER(3,2) DEFAULT 20,
 CONSTRAINT FOREIGN KEY(cod_recinto_zona) REFERENCES zonas_recintos,
 CONSTRAINT PRIMARY KEY(cod_espectaculo,cod_recinto,zona)
);

CREATE TABLE recintos
(cod_recinto CHAR(15) NOT NULL CONSTRAINT rec_PK PRIMARY KEY,
 nombre VARCHAR(30) NOT NULL,
 direccion VARCHAR(50) NOT NULL,
 ciudad VARCHAR(20) NOT NULL,
 telefono NUMBER(9) NOT NULL,
 horario CHAR(10)
 );
 
 CREATE TABLE zonas_recintos
 (cod_recinto CHAR(15) CONSTRAINT zonas_FK REFERENCES recintos,
  zona VARCHAR(20) NOT NULL,
  capacidad NUMBER(5),
  CONSTRAINT zonas_PK PRIMARY KEY(cod_recinto,zona)
 );
 
 CREATE TABLE asientos
 (cod_recinto CHAR(15),
  zona VARCHAR(20),
  fila NUMBER(2) NOT NULL,
  numero NUMBER(2) NOT NULL,
  CONSTRAINT FOREIGN KEY(cod_recinto,zona) REFERENCES zonas_asientos,
  CONSTRAINT asientos_PK PRIMARY KEY(cod_recinto,zona,fila,numero)
 );
 
 CREATE TABLE representaciones
 (cod_espectaculo CHAR(10) CONSTRAINT repr_FK REFERENCES espectaculo
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  CONSTRAINT repr_PK PRIMARY KEY(cod_espectaculo,fecha,hora)
 );
 
 CREATE TABLE entradas
 (cod_espectaculo CHAR(10),
  fecha DATE,
  hora TIME,
  cod_recinto CHAR(15),
  fila NUMBER(2),
  numero NUMBER(2),
  zona VARCHAR(20),
  dni_cliente CHAR(9) CONSTRAINT ent_FK REFERENCES espectadores,
  CONSTRAINT FOREIGN KEY(cod_espectaculo,fecha,hora) REFERENCES representaciones,
  CONSTRAINT FOREIGN KEY(cod_recinto,fila,numero,zona) REFERENCES asientos,
  CONSTRAINT entradas_PK PRIMARY KEY(cod_espectaculo,fecha,hora,cod_recinto,fila,numero,zona)
 );
 
 CREATE TABLE espectadores
 (dni_cliente CHAR(9) NOT NULL CONSTRAINT esp_PK PRIMARY KEY,
  nombre VARCHAR(35) NOT NULL,
  direccion VARCHAR(60)
  telefono NUMBER(12) NOT NULL,
  ciudad VARCHAR(20) NOT NULL,
  ntarjeta NUMBER(12) NOT NULL CONSTRAINT esp_UK UNIQUE
 );
 