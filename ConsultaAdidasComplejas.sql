--  1- Muestra el nombre ,apellidos y cantidad de cupones  de los clientes que tienen 2 o más cupones.
SELECT cl.nombre, cl.apellidos, COUNT(cc.id_cupon) AS num_cupones FROM cliente cl
JOIN cliente_cupon cc ON cl.ID_cliente= cc.ID_cliente GROUP BY cl.ID_cliente
HAVING num_cupones >=2;

-- 2- Muestra el nombre,apellidos, dni y productos comprados del cliente que mas productos ha comprado, en caso de empate se ordenara por el nombre de A-Z
SELECT cl.nombre, cl.apellidos, cl.DNI, COUNT(pc.cod_producto) AS productos_comprados FROM cliente cl 
JOIN producto_cliente pc ON cl.ID_cliente = pc.ID_cliente
GROUP BY cl.ID_cliente 
HAVING COUNT(pc.cod_producto) ORDER BY productos_comprados DESC, nombre ASC LIMIT 1  ;

-- 3-Muestra el nombre,precio del producto más vendido aparte del nombre a la categoría que pertenece.
SELECT p.nombre,p.precio,c.nombre AS categoria FROM producto p 
JOIN categoria c ON c.ID_categoria = p.ID_categoria
JOIN producto_cliente pc ON p.cod_producto = pc.cod_producto
GROUP BY p.cod_producto
ORDER BY COUNT(pc.cod_producto) DESC LIMIT 1 ;

-- 4- Muestra el nombre y el ID de la categoria donde mas productos hay.
SELECT c.nombre, p.ID_categoria FROM producto p  
JOIN categoria c ON c.ID_categoria = p.ID_categoria
GROUP BY p.ID_categoria
ORDER BY COUNT(p.ID_categoria) DESC LIMIT 1;

-- 5- Muestra el nombre ,apellidos  de los clientes que tienen 1 cupon o mas de un 50%.
SELECT cl.nombre, cl.apellidos FROM cliente cl
JOIN cliente_cupon cc ON cl.ID_cliente= cc.ID_cliente 
JOIN cupon c ON c.ID_cupon = cc.ID_cliente
WHERE cc.id_cupon =5
GROUP BY cl.ID_cliente;

-- 6- Muestra el dni, nombre y apellidos de los clientes que hayan comprado una prenda de algodón.
SELECT cl.DNI,cl.nombre,cl.apellidos FROM cliente cl 
JOIN producto_cliente pc ON cl.ID_cliente= pc.ID_cliente
JOIN producto p ON p.cod_producto= pc.cod_producto
WHERE p.material = 'algodon';

-- 7-Muestra los  descuentos que tiene el cliente con ID 3
SELECT c.descuento_porciento FROM cupon c 
JOIN cliente_cupon cc ON c.ID_cupon = cc.ID_cupon 
WHERE cc.ID_cliente= 3;

-- 8- Muestra los clientes que tienen al menos 1 cupon
SELECT cl.nombre AS Nombre_Cliente, COUNT(cc.ID_cupon) AS Cantidad_Cupones
FROM cliente cl
JOIN cliente_cupon cc ON cl.ID_cliente = cc.ID_cliente
GROUP BY cl.nombre
HAVING COUNT(cc.ID_cupon) > 1;

-- 9- Muestrame el nombre de la categoria y cuantos productos hay en ella 
SELECT c.nombre AS Categoria, COUNT(p.cod_producto) AS Cantidad_Productos
FROM categoria c
LEFT JOIN Producto p ON c.ID_categoria = p.ID_categoria
GROUP BY c.nombre
HAVING COUNT(p.cod_producto);

-- 10-Muestra el nombre del producto, la categoria, el nombre del cliente y la fecha compra de cada producto que haya comprado alguien
SELECT p.nombre AS Nombre_Producto, c.nombre AS Categoria, cl.nombre AS Nombre_Cliente, pc.fecha_compra
FROM Producto p
JOIN categoria c ON p.ID_categoria = c.ID_categoria
JOIN producto_cliente pc ON p.cod_producto = pc.cod_producto
JOIN cliente cl ON pc.ID_cliente = cl.ID_cliente;

