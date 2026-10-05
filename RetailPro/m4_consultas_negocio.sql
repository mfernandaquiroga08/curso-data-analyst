USE Ventas_Tech_DB;
GO
SELECT
    MONTH(fecha_venta)                         AS mes,
    SUM(cantidad * precio_unitario)            AS total_facturado,
    COUNT(*)                                   AS cantidad_pedidos,
    ROUND(AVG(cantidad * precio_unitario), 2)  AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;
SELECT TOP 5
    id_producto,
    SUM(cantidad)                    AS unidades_vendidas,
    SUM(cantidad * precio_unitario)  AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;
SELECT
    id_cliente,
    COUNT(*)                         AS cantidad_pedidos,
    SUM(cantidad * precio_unitario)  AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;
WITH ventas_por_mes AS (
    SELECT
        MONTH(fecha_venta)               AS mes,
        SUM(cantidad * precio_unitario)  AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)
SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > (SELECT AVG(total_facturado) FROM ventas_por_mes) THEN 'Por encima'
        WHEN total_facturado < (SELECT AVG(total_facturado) FROM ventas_por_mes) THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS comparacion_promedio
FROM ventas_por_mes
ORDER BY mes;
-- === HALLAZGOS ===
-- 1. El producto 1 concentra el 55,9% de la facturación del período
--    (3.600 de 6.444). Junto con el producto 3, ambos de la categoría
--    Computación, suman el 76,8% del total.
-- 2. El producto 2 es el que más unidades vende (13), pero por su bajo
--    precio queda 5° en facturación: alto volumen no implica alto ingreso.
-- 3. Los 5 clientes son recurrentes (2 pedidos cada uno), pero los
--    clientes 1 y 5 explican el 73,6% de lo facturado (4.740 de 6.444).
--    Observación: todas las ventas son de marzo 2024, por lo que todavía
--    no es posible comparar la evolución entre meses.