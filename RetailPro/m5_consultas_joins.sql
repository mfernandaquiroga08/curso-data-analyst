USE Ventas_Tech_DB;
GO
SELECT
    v.id_venta,
    v.fecha_venta,
    c.nombre                          AS cliente,
    c.ciudad,
    p.nombre_producto                 AS producto,
    cat.nombre_categoria              AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario    AS total_venta
FROM ventas v
INNER JOIN clientes   c   ON v.id_cliente   = c.id_cliente
INNER JOIN productos  p   ON v.id_producto  = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;
-- Hallazgo: la vista devuelve las 10 ventas completas, así que no hay ventas
-- sin cliente o producto válido. Computación concentra el 76,8% de la
-- facturación, y los clientes de Buenos Aires y Tucumán explican el 73,6%.
SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;
-- Hallazgo: 0 de los 5 clientes registrados quedaron sin comprar; todos tienen
-- al menos una compra, así que CRM no necesita una campaña de activación por
-- ahora. Conviene volver a correrla cuando se sumen clientes nuevos.
SELECT
    p.nombre_producto,
    cat.nombre_categoria  AS categoria,
    p.precio
FROM productos p
LEFT JOIN categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas     v   ON p.id_producto  = v.id_producto
WHERE v.id_venta IS NULL;
-- Hallazgo: 0 de los 6 productos del catálogo quedaron sin ventas; todo el
-- catálogo tuvo movimiento en marzo, por lo que el área de producto no tiene
-- artículos sin rotación para revisar en este período.
SELECT
    canal,
    SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Período 1 (5 al 10 mar)'  AS canal
    FROM ventas
    WHERE fecha_venta <= '2024-03-10'
    UNION ALL
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Período 2 (11 al 15 mar)' AS canal
    FROM ventas
    WHERE fecha_venta > '2024-03-10'
) AS consolidado
GROUP BY canal
ORDER BY canal;
-- Hallazgo: el primer período facturó 3.620 (56,2% del total) y el segundo
-- 2.824, una caída del 22%. La diferencia se explica sobre todo por la venta
-- de 2 Laptop Pro 15 (2.400) del 5 de marzo.