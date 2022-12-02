--Select * fROM FACTURA;
--select nombre from vendedor;
--CASO 1
SELECT
    f.numfactura AS "NRO.FACTURA",
    s.nombre AS "VENDEDOR",
    TO_CHAR(f.total, '$99G999G999') AS "MONTO FACTURA",
    ROUND(f.total*s.comision) AS "COMISIÓN_VENTA"
FROM factura f
    JOIN vendedor s ON f.rutvendedor = s.rutvendedor
ORDER BY f.numfactura, s.nombre
        ,TO_CHAR(f.total, '$99G999G999'), ROUND(f.total*s.comision)
;

--INFORME 2
SELECT
    f.numfactura AS "NRO.FACTURA",
    s.nombre AS "VENDEDOR",
    s.rutvendedor AS "rut VENDEDOR",
    TO_CHAR(f.fecha, 'dd "de" Month" del" yyyy') AS "FECHA",
    TO_CHAR(f.total, '$99G999G999') AS "MONTO FACTURA",
    df.cantidad AS "CANTIDAD PRODUCTOS",
    b.descripcion AS "BANCO"
FROM factura f
    JOIN vendedor s ON f.rutvendedor = s.rutvendedor
    JOIN detalle_factura df ON f.numfactura = df.numfactura
    JOIN banco b ON f.codbanco = b.codbanco
WHERE EXTRACT(YEAR FROM f.fecha) =  EXTRACT(YEAR FROM SYSDATE)-1
GROUP BY f.numfactura
        ,s.nombre, s.rutvendedor
        ,TO_CHAR(f.fecha, 'dd "de" Month" del" yyyy'), TO_CHAR(f.total, '$99G999G999')
        ,df.cantidad, b.descripcion
ORDER BY "MONTO FACTURA" ASC
;

--CASO N°2:
--select * from cliente
SELECT
    nvl(c.rutcliente, 'sin cliente') AS "RUT_CLIENTE",
    nvl(c.nombre,'sin cliente') AS "NOMBRE_CLIENTE",
    nvl(com.descripcion, 'no aplica') AS "COMUNA",
    df.cantidad AS "CANTIDAD_FACTURAS",
    nvl(TO_CHAR(c.credito, '$99G999G999'),'no aplica') AS "CREDITO"
FROM cliente c
    JOIN comuna com ON c.codcomuna = com.codcomuna
    JOIN factura f ON c.rutcliente = f.rutcliente
    JOIN detalle_factura df ON f.numfactura = df.numfactura
GROUP BY c.rutcliente, c.nombre
        ,com.descripcion, df.cantidad
        ,TO_CHAR(c.credito, '$99G999G999')
;
        
    
