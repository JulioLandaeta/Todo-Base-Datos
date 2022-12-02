--Creacion Y Asignacion de privilegios
CREATE USER MDY2131_P13_1 IDENTIFIED BY "MDY2131.practica_13_1"
DEFAULT TABLESPACE "TEMP";
DEFAULT TABLESPACE "DATA";
ALTER USER MDY2131_P13_1 QUOTA UNLIMITED ON DATA;

--Permisos  P13_1
GRANT CREATE SESSION TO MDY2131_P13_1;
GRANT VIEW TO MDY2131_P13_1;
GRANT MATERIALIZED VIEW TO MDY2131_P13_1;
GRANT CREATE TABLE TO MDY2131_P13_1;
GRANT SELECT ANY TABLE, INSERT ANY TABLE, UPDATE ANY TABLE, DELETE ANY TABLE TO MDY2131_P13_1;
GRANT CREATE SEQUENCE TO MDY2131_P13_1;
GRANT CREATE ANY INDEX TO MDY2131_P13_1;


CREATE USER MDY2131_P13_2 IDENTIFIED BY "MDY2131.practica_13_2"
DEFAULT TABLESPACE "DATA"
DEFAULT TABLESPACE "TEMP";
ALTER USER MDY2131_P13_2 QUOTA UNLIMITED ON DATA;

--Permisos P13_2
GRANT CREATE SESSION TO MDY2131_P13_2;
GRANT CREATE PROCEDURE TO MDY2131_P13_2;
GRANT CREATE ANY VIEW TO MDY2131_P13_2;
GRANT CREATE ANY MATERIALIZED VIEW TO MDY2131_P13_2;
GRANT CREATE ANY TRIGGER TO MDY2131_P13_2;
GRANT UPDATE, DELETE ON CLIENTE_C TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT UPDATE, DELETE ON PRODUCTO_INV_C TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT UPDATE, DELETE ON CUOTA_CRED_C TO MDY2131_P13_2 WITH GRANT OPTION;

GRANT SELECT ON MDY2131_P13_1.APORTE_A_SBIF TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.CLIENTE TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.COMUNA TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.CREDITO TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.CREDITO_CLIENTE TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.CUOTA_CREDITO_CLIENTE TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.FORMA_PAGO TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.MOVIMIENTO TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.PRODUCTO_INVERSION TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.PRODUCTO_INVERSION_CLIENTE TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.PROFESION_OFICIO TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.PROVINCIA TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.REGION TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.SUCURSAL TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.TIPO_CONTRATO TO MDY2131_P13_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.TIPO_MOVIMIENTO TO MDY2131_P13_2 WITH GRANT OPTION;

CREATE USER MDY2131_P13_3 IDENTIFIED BY "MDY2131.practica_13_3"
DEFAULT TABLESPACE "DATA"
DEFAULT TABLESPACE "TEMP";
ALTER USER MDY2131_P13_3 QUOTA UNLIMITED ON DATA;

--Permisos P13_3
GRANT CREATE SESSION TO MDY2131_P13_3;
GRANT CREATE PROCEDURE TO MDY2131_P13_3;
GRANT CREATE ANY VIEW TO MDY2131_P13_3;
GRANT CREATE ANY MATERIALIZED VIEW TO MDY2131_P13_3;
GRANT CREATE ANY TRIGGER TO MDY2131_P13_3;
GRANT UPDATE, DELETE ON MDY2131_P13_1.CREDITO_CLIENTE TO MDY2131_P13_3;
GRANT UPDATE, DELETE ON MDY2131_P13_1.PRODUCTO_INVERSION_CLIENTE TO MDY2131_P13_3;
GRANT UPDATE, DELETE ON MDY2131_P13_1.CUOTA_CREDITO_CLIENTE TO MDY2131_P13_3;

GRANT SELECT ON MDY2131_P13_1.APORTE_A_SBIF TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.CLIENTE TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.COMUNA TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.CREDITO TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.CREDITO_CLIENTE TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.CUOTA_CREDITO_CLIENTE TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.FORMA_PAGO TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.MOVIMIENTO TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.PRODUCTO_INVERSION TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.PRODUCTO_INVERSION_CLIENTE TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.PROFESION_OFICIO TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.PROVINCIA TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.REGION TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.SUCURSAL TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.TIPO_CONTRATO TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P13_1.TIPO_MOVIMIENTO TO MDY2131_P13_3 WITH GRANT OPTION;
GRANT SELECT ON REG TO MDY2131_P13_3;
GRANT SELECT ON CLIENTE_C TO MDY2131_P13_3;

CREATE USER MDY2131_P13_4 IDENTIFIED BY "MDY2131_practica_13_4"
DEFAULT TABLESPACE "DATA"
DEFAULT TABLESPACE "TEMP";
ALTER USER MDY2131_P13_3 QUOTA 100MB ON DATA;

--Permisos P13_4
GRANT CREATE SESSION TO MDY2131_P13_4;

CREATE USER MDY2131_P13_5 IDENTIFIED BY "MDY2131.practica_13_5"
DEFAULT TABLESPACE "DATA"
DEFAULT TABLESPACE "TEMP";
ALTER USER MDY2131_P13_4 QUOTA 100MB ON DATA;

--Permisos P13_5
GRANT CREATE SESSION TO MDY2131_P13_5;

CREATE USER MDY2131_P13_6 IDENTIFIED BY "MDY2131.practica_13_6"
DEFAULT TABLESPACE "DATA"
DEFAULT TABLESPACE "TEMP";
ALTER USER MDY2131_P13_6 QUOTA 100MB ON DATA;

--Permisos P13_6
GRANT CREATE SESSION TO MDY2131_P13_6;

--Creacion sinonimos
CREATE SYNONYM CREDITO_C FOR MDY2131_P13_1.CREDITO_CLIENTE;
CREATE SYNONYM PRODUCTO_INV_C FOR MDY2131_P13_1.PRODUCTO_INVERSION_CLIENTE;
CREATE SYNONYM CUOTA_CRED_C FOR MDY2131_P13_1.CUOTA_CREDITO_CLIENTE;
CREATE SYNONYM TIPO_MOV FOR MDY2131_P13_1.TIPO_MOVIMIENTO;
CREATE SYNONYM SUC FOR MDY2131_P13_1.SUCURSAL;
CREATE SYNONYM TIPO_CONTR FOR MDY2131_P13_1.TIPO_CONTRATO;
CREATE SYNONYM CLIENTEC FOR MDY2131_P13_1.CLIENTE;
CREATE SYNONYM REG FOR MDY2131_P13_1.REGION;
CREATE SYNONYM PROV FOR MDY2131_P13_1.PROVINCIA;
CREATE SYNONYM COM FOR MDY2131_P13_1.COMUNA;
