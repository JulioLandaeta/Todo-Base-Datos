SELECT
    ts.descripcion||'.'||s.descripcion AS SISTEMA_SALUD,
    COUNT(*) AS TOTAL_ATENCIONES
FROM ATENCION a
    JOIN PACIENTE p ON a.pac_run = p.pac_run
    JOIN SALUD s ON p.sal_id = s.sal_id
    JOIN TIPO_SALUD ts ON s.tipo_sal_id = ts.tipo_sal_id
WHERE EXTRACT(YEAR FROM a.fecha_atencion) = EXTRACT(YEAR FROM SYSDATE)
    AND EXTRACT(MONTH FROM a.fecha_atencion) = 9
GROUP BY ts.descripcion, s.descripcion
HAVING COUNT(*) > (SELECT AVG(COUNT(*))
    FROM ATENCION a
    JOIN PACIENTE p ON a.pac_run = p.pac_run
    JOIN SALUD s ON p.sal_id = s.sal_id
    JOIN TIPO_SALUD ts ON s.tipo_sal_id = ts.tipo_sal_id
WHERE EXTRACT(YEAR FROM a.fecha_atencion) = EXTRACT(YEAR FROM SYSDATE)
    AND EXTRACT(MONTH FROM a.fecha_atencion) = 9
GROUP BY ts.descripcion, s.descripcion)
;
--CASO 2

SELECT * from paciente

SELECT 
    TO_CHAR(PAC_RUN,'99G999G999') ||'-'||DV_RUN AS "RUT PACIENTE",
    PNOMBRE||' '||SNOMBRE||' '||APATERNO||' '||AMATERNO AS "NOMBRE PACIENTE",
    ROUND(MONTHS_BETWEEN(SYSDATE,FECHA_NACIMIENTO)/12) AS AÑOS
FROM PACIENTE


