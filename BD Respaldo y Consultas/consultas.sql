-- ID de los clientes de la Ciudad de Monterrey
-- SELECT CLIENTE_ID
-- FROM CLIENTES
-- WHERE MUNICIPIO = 'MONTERREY';

-- ID y descripción de los productos que cuesten menos de 15 pesos.
-- SELECT productos_id, descripcion
-- FROM productos
-- WHERE precio < 15;

-- ID y nombre de los clientes, cantidad vendida, y descripción del 
-- producto, en las ventas en las cuales se vendieron más de 10 unidades.
-- SELECT c.cliente_id, c.nombre AS nombre_cliente, v.cantidad_productos, p.descripcion AS descripcion_producto
-- FROM ventas v
-- JOIN clientes c ON v.fk_cliente = c.cliente_id
-- JOIN productos p ON v.fk_producto = p.productos_id
-- WHERE v.cantidad_productos > 10;

-- ID y nombre de los clientes que no aparecen en la tabla de ventas (Clientes que no han comprado productos)
-- SELECT cliente_id, nombre
-- FROM clientes
-- WHERE cliente_id NOT IN (SELECT DISTINCT fk_cliente FROM ventas);

-- ID y nombre de los clientes que han comprado todos los productos de la empresa.
-- SELECT c.cliente_id, c.nombre
-- FROM clientes c
-- WHERE NOT EXISTS (
--   SELECT p.productos_id
--   FROM productos p
--   WHERE p.productos_id NOT IN (
--     SELECT DISTINCT v.fk_producto
--     FROM ventas v
--     WHERE v.fk_cliente = c.cliente_id
--   )
-- );

-- ID y nombre de cada cliente y la suma total (suma de cantidad) de los productos
-- que ha comprado.
-- SELECT c.cliente_id, c.nombre, SUM(v.cantidad_productos) AS total_comprado
-- FROM clientes c
-- JOIN ventas v ON c.cliente_id = v.fk_cliente
-- GROUP BY c.cliente_id, c.nombre;

-- ID de los productos que no han sido comprados por clientes de Guadalajara.
-- SELECT p.productos_id
-- FROM productos p
-- WHERE p.productos_id NOT IN (
--   SELECT DISTINCT v.fk_producto
--   FROM ventas v
--   JOIN clientes c ON v.fk_cliente = c.cliente_id
--   WHERE c.municipio = 'Guadalajara'
-- );

-- ID de los productos que se han vendido a clientes de Monterrey y que también 
-- se han vendido a clientes de Cancún.
-- SELECT DISTINCT v1.fk_producto
-- FROM ventas v1
-- JOIN clientes c1 ON v1.fk_cliente = c1.cliente_id
-- WHERE c1.municipio = 'Monterrey' AND v1.fk_producto IN (
--   SELECT DISTINCT v2.fk_producto
--   FROM ventas v2
--   JOIN clientes c2 ON v2.fk_cliente = c2.cliente_id
--   WHERE c2.municipio = 'Cancún'
-- );

-- Nombre de las ciudades en las que se han vendido todos los productos.
-- SELECT DISTINCT c.municipio
-- FROM clientes c
-- WHERE NOT EXISTS (
--   SELECT p.productos_id
--   FROM productos p
--   WHERE p.productos_id NOT IN (
--     SELECT DISTINCT v.fk_producto
--     FROM ventas v
--     WHERE v.fk_cliente = c.cliente_id
--   )
-- );
