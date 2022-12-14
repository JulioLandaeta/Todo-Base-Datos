--CASO 1
--P1
GRANT CREATE SESSION TO MDY2131_P12_1;
GRANT "RESOURCE" TO MDY2131__P12_1;
ALTER USER MDY2131_P12_1 DEFAULT ROLE "RESOURCE";
GRANT CREATE VIEW TO MDY2131_P12_1;
GRANT CREATE SEQUENCE TO MDY2131_P12_1;
GRANT CREATE TABLE TO MDY2131_P12_1;
GRANT DROP ANY TABLE TO MDY2131_P12_1;
GRANT CREATE ANY INDEX TO MDY2131_P12_1;

--P2
CREATE USER MDY2131_P12_2 IDENTIFIED BY "MDY2131.practica_12_2"
DEFAULT TABLESPACE "DATA"
TEMPORARY TABLESPACE "TEMP";
ALTER USER MDY2131_P12_2 QUOTA UNLIMITED ON DATA;
GRANT CREATE SESSION TO MDY2131_P12_2;
GRANT SELECT ON MDY2131_P12_1.CLIENTE TO MDY2131_P12_2;
GRANT CREATE PROCEDURE TO MDY2131_P12_2;
GRANT CREATE TRIGGER TO MDY2131_P12_2;
GRANT CREATE VIEW TO MDY2131_P12_2;
GRANT CREATE MATERIALIZED VIEW TO MDY2131_P12_2;
GRANT CREATE TABLE TO MDY2131_P12_2;
GRANT DROP ANY TABLE TO MDY2131_P12_2;

--P3
CREATE USER MDY2131_P12_3 IDENTIFIED BY "MDY2131.practica_12_3"
DEFAULT TABLESPACE "DATA"
TEMPORARY TABLESPACE "TEMP";
ALTER USER MDY2131_P12_3 QUOTA UNLIMITED ON DATA;
GRANT CREATE SESSION TO MDY2131_P12_3;

--OTORGA PERMISOS P1 
GRANT SELECT ON MDY2131_P12_1.CLIENTE TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.APORTE_A_SBIF TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.COMUNA TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.CREDITO TO MDY2131_P12_2WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.CREDITO_CLIENTE TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.CUOTA_CREDITO_CLIENTE TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.FORMA_PAGO TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.MOVIMIENTO TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.PRODUCTO_INVERSION TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.PRODUCTO_INVERSION_CLIENTE TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.PROFESION_OFICIO TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.PROVINCIA TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.REGION TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.SUCURSAL TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.TIPO_CONTRATO TO MDY2131_P12_2 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_1.TIPO_MOVIMIENTO TO MDY2131_P12_2 WITH GRANT OPTION;

--CREACION SINONIMOS
CREATE PUBLIC SYNONYM CREDITO_CLIENTE_T FOR MDY2131_P12_1.CREDITO_CLIENTE;
CREATE PUBLIC SYNONYM PRODUCTO_INVERSION_CLIENTE_T FOR MDY2131_P12_1.PRODUCTO_INVERSION_CLIENTE;
CREATE PUBLIC SYNONYM CLIENTE_T FOR MDY2131_P12_1.CLIENTE;
CREATE PUBLIC SYNONYM COMUNA_T FOR MDY2131_P12_1.COMUNA;
CREATE PUBLIC SYNONYM PROVINCIA_T FOR MDY2131_P12_1.PROVINCIA;
CREATE PUBLIC SYNONYM REGION_T FOR MDY2131_P12_1.REGION;
CREATE PUBLIC SYNONYM CUOTA_CREDITO_CLIENTE_T FOR MDY2131_P12_1.CUOTA_CREDITO_CLIENTE;
CREATE PUBLIC SYNONYM TIPO_CONTRATO_T FOR MDY2131_P12_1.TIPO_CONTRATO;
CREATE PUBLIC SYNONYM TIPO_MOVIMIENTO_T FOR MDY2131_P12_1.TIPO_MOVIMIENTO;

-- CREACION PERMISOS SINONIMOS DE P1 PARA P3

GRANT SELECT ON COMUNA_T TO MDY2131_P12_3 WITH GRANT OPTION;
GRANT SELECT ON REGION_T TO  MDY2131_P12_3 WITH GRANT OPTION;
GRANT SELECT ON PROVINCIA_T TO MDY2131_P12_3 WITH GRANT OPTION;
GRANT SELECT ON TIPO_CONTRATO_T TO MDY2131_P12_3 WITH GRANT OPTION;
GRANT SELECT ON TIPO_MOVIMIENTO_T TO MDY2131_P12_3 WITH GRANT OPTION;
GRANT SELECT ON MDY2131_P12_2.REQUERIMIENTO_2 TO MDY2131_P12_3 WITH GRANT OPTION;
-- CASO 2  
CREATE TABLE REQUERIMIENTO_2 AS SELECT
TO_CHAR(C.NUMRUN, '09G999G999')||'-'||C.DVRUN "RUN CLIENTE",
INITCAP(C.PNOMBRE)||' '||INITCAP(C.SNOMBRE)||' '||INITCAP(C.APPATERNO)||' '||INITCAP(C.APMATERNO) "NOMBRE CLIENTE",
TO_CHAR(C.FECHA_NACIMIENTO, 'DD "de" Month') "FECHA CUMPLEA?OS",
C.DIRECCION||'/ '||COM.NOMBRE_COMUNA "DIRECCION CLIENTE"
FROM CLIENTE_T C
    JOIN COMUNA_T COM ON C.COD_COMUNA = COM.COD_COMUNA
                        AND C.COD_PROVINCIA = COM.COD_PROVINCIA
                        AND C.COD_REGION = COM.COD_REGION
WHERE EXTRACT(MONTH FROM C.FECHA_NACIMIENTO) = EXTRACT(MONTH FROM SYSDATE)+1
ORDER BY "FECHA CUMPLEA?OS" ASC, C.APPATERNO ASC
;
--CASO 2 EJECUTAR TABLA USUARIO 3
SELECT * FROM MDY2131_P12_2.REQUERIMIENTO_2;
