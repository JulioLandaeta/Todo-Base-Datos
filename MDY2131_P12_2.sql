CREATE TABLE REQUERIMIENTO_2 AS SELECT
TO_CHAR(C.NUMRUN, '09G999G999')||'-'||C.DVRUN "RUN CLIENTE",
INITCAP(C.PNOMBRE)||' '||INITCAP(C.SNOMBRE)||' '||INITCAP(C.APPATERNO)||' '||INITCAP(C.APMATERNO) "NOMBRE CLIENTE",
TO_CHAR(C.FECHA_NACIMIENTO, 'DD "de" Month') "FECHA CUMPLEA�OS",
C.DIRECCION||'/ '||COM.NOMBRE_COMUNA "DIRECCION CLIENTE"
FROM CLIENTE_T C
    JOIN COMUNA_T COM ON C.COD_COMUNA = COM.COD_COMUNA
                        AND C.COD_PROVINCIA = COM.COD_PROVINCIA
                        AND C.COD_REGION = COM.COD_REGION
WHERE EXTRACT(MONTH FROM C.FECHA_NACIMIENTO) = EXTRACT(MONTH FROM SYSDATE)+1
ORDER BY "FECHA CUMPLEA�OS" ASC, C.APPATERNO ASC
;