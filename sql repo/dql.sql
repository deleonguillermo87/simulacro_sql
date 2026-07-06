SELECT
    p.sku,
    p.name,
    m.stock_after
FROM rm_movements m
INNER JOIN rm_products p ON p.product_id = m.product_id;

SELECT
    p.sku,
    p.name,
    m.stock_after
FROM rm_movements m
INNER JOIN rm_products p ON p.product_id = m.product_id
WHERE m.movement_date = (
    SELECT MAX(m2.movement_date)
    FROM rm_movements m2
    WHERE m2.product_id = m.product_id
);

USE guillermo;

SET NAMES utf8mb4;

SELECT
    w.name        AS bodega,
    ci.city_name  AS ciudad,
    p.name        AS producto,
    SUM(
        CASE
            WHEN m.movement_type IN ('IN','ADJUSTMENT_IN')   THEN  m.quantity
            WHEN m.movement_type IN ('OUT','ADJUSTMENT_OUT') THEN -m.quantity
        END
    )             AS cantidad_en_bodega
FROM rm_movements m
INNER JOIN rm_warehouses w ON w.warehouse_id = m.warehouse_id
INNER JOIN rm_products p   ON p.product_id   = m.product_id
INNER JOIN rm_cities ci    ON ci.city_id      = w.city_id
GROUP BY w.warehouse_id, w.name, ci.city_name, p.product_id, p.name
HAVING cantidad_en_bodega > 0
ORDER BY w.name, p.name;

SELECT
	s.name                           as proveedor,
    ci.city_name                     as ciudad,
	COUNT(DISTINCT p.purchase_id )   as total_orden,
    SUM(pi.quantity * pi.unit_price) as total_invertido
FROM rm_suppliers as s
INNER JOIN rm_cities as ci ON ci.city_id = s.city_id
INNER JOIN rm_purchases as p ON p.supplier_id  = s.supplier_id
INNER JOIN rm_purchase_items as pi ON pi.purchase_id = p.purchase_id
GROUP BY s.supplier_id, s.name, ci.city_name 
ORDER BY total_invertido DESC;

SELECT
	p.name        as productos,
    c.name        as categoria,
    m.stock_after as cantida
FROM rm_products as p
INNER JOIN rm_movements as m ON m.product_id = p.product_id
INNER JOIN rm_categories as c ON c.category_id = p.category_id
WHERE m.movement_date = (
    SELECT MAX(m2.movement_date)
    FROM rm_movements as m2
    WHERE m2.product_id = m.product_id
) ORDER BY m.stock_after ASC;

USE guillermo;

SELECT
	p.name            as nombre,
    SUM(pi.quantity)  as cantidad
FROM rm_products as p
INNER JOIN rm_purchase_items as pi ON pi.product_id = p.product_id
GROUP BY p.product_id, p.name  
ORDER BY cantidad DESC LIMIT 5;

SELECT
    ci.city_name                        AS ciudad,
    SUM(stock.cantidad * p.unit_price)  AS valor_total_inventario
FROM (
    SELECT
        m.warehouse_id,
        m.product_id,
        SUM(
            CASE
                WHEN m.movement_type IN ('IN','ADJUSTMENT_IN')   THEN  m.quantity
                WHEN m.movement_type IN ('OUT','ADJUSTMENT_OUT') THEN -m.quantity
            END
        ) AS cantidad
    FROM rm_movements m
    GROUP BY m.warehouse_id, m.product_id
    HAVING cantidad > 0
) AS stock
INNER JOIN rm_warehouses w ON w.warehouse_id = stock.warehouse_id
INNER JOIN rm_products p   ON p.product_id   = stock.product_id
INNER JOIN rm_cities ci    ON ci.city_id      = w.city_id
GROUP BY ci.city_id, ci.city_name
ORDER BY valor_total_inventario DESC;