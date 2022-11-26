--CASO N°1
SELECT
    TO_CHAR(cli.numrun,'09G999G999')||'-'||INITCAP(cli.dvrun) AS "RUN CLIENTE",
    cli.pnombre||' '||cli.snombre||' '||cli.appaterno||' '||cli.apmaterno AS "NOMBRE CLIENTE",
    po.nombre_prof_ofic AS "PROFESIÓN U OFICIO",
    tc.nombre_tipo_contrato AS "TIPO CONTRATO",
    TO_CHAR(SUM(pic.monto_total_ahorrado), '$99G999G999') AS "MONTO TOTAL AHORRADO",
    CASE WHEN SUM(pic.monto_total_ahorrado) BETWEEN 0 AND 1000000 THEN 'BRONCE'
    WHEN SUM(pic.monto_total_ahorrado) BETWEEN 1000001 AND 4000000 THEN 'PLATA'
    WHEN SUM(pic.monto_total_ahorrado) BETWEEN 4000001 AND 8000000 THEN 'SILVER'
    WHEN SUM(pic.monto_total_ahorrado) BETWEEN 8000001 AND 15000000 THEN 'GOLD'
    WHEN SUM(pic.monto_total_ahorrado) > 15000000 THEN 'PLATINUM'
    END "CATEGORIA CLIENTE"
FROM mdy2131_p11_1.cliente cli
    JOIN profesion_oficio po ON cli.cod_prof_ofic = po.cod_prof_ofic
    JOIN tipo_contrato tc ON cli.cod_tipo_contrato = tc.cod_tipo_contrato
    JOIN producto_inversion_cliente pic ON cli.nro_cliente = pic.nro_cliente
GROUP BY  cli.numrun, cli.dvrun
    , cli.pnombre, cli.snombre, cli.appaterno, cli.apmaterno
    , po.nombre_prof_ofic
    , tc.nombre_tipo_contrato
ORDER BY cli.appaterno ASC, "MONTO TOTAL AHORRADO" DESC
;

--CASO N°2
SELECT
    TO_CHAR(cc.fecha_otorga_cred, 'mmyyyy') AS "MES TRANSACCIÓN",
    c.nombre_credito AS "TIPO CRÉDITO",
    SUM(monto_credito) AS "MONTO SOLICITADO CRÉDITO",
    SUM(monto_credito*(sbif.porc_entrega_sbif/100)) AS "APORTE A LA SBIF"
FROM mdy2131_p11_1.credito_cliente cc
    JOIN mdy2131_p11_1.credito c ON c.cod_credito = cc.cod_credito
    JOIN mdy2131_p11_1.aporte_a_sbif sbif ON cc.monto_credito BETWEEN sbif.monto_credito_desde AND sbif.monto_credito_hasta
WHERE EXTRACT(YEAR FROM cc.fecha_otorga_cred) = EXTRACT(YEAR FROM SYSDATE)-1
GROUP BY cc.fecha_otorga_cred, c.nombre_credito
ORDER BY "MES TRANSACCIÓN" ASC, "TIPO CRÉDITO"
;