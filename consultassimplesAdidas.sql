USE adidas;
-- tabla categoria 
-- 1-Seleccionar todos los nombres de las categorías existentes y su genero.
SELECT nombre, genero FROM categoria;
-- 2- Seleccionar todas las categorías de género para hombres.
SELECT * FROM categoria WHERE genero = 'H';
-- 3- Seleccionar todas las categorías de género para mujer.
SELECT * FROM categoria WHERE genero = 'M';

-- tabla producto 
-- 1-Seleccionar todos los productos que valgan más de 100 euros
SELECT * FROM producto WHERE precio >100;
-- 2-Selecciona todos los productos que sean de algodón
SELECT * FROM producto WHERE material = 'algodon';
-- 3-Muestra el precio y nombre de los productos que su id es par 
SELECT nombre, precio FROM producto WHERE cod_producto %2=0;

-- tabla producto_cliente 
-- 1-Muestra todo lo que haya comprado el cliente 4.
SELECT * FROM producto_cliente WHERE ID_cliente = 4;
-- 2-Muestra todos los  registro de los productos  que se hayan comprado en 2024.
SELECT cod_producto FROM producto_cliente WHERE YEAR(fecha_compra) = '2024'; 
-- 3-Muestra todo donde se haya comprado el producto 2.
SELECT * FROM producto_cliente WHERE cod_producto=2; 

-- tabla cliente 
-- 1-Muestra todos los clientes que su dni acabe por la letra A.
SELECT * FROM cliente WHERE DNI LIKE '%A';
-- 2-Muestra todos los clientes que su nombre empiece por A.
SELECT * FROM cliente WHERE nombre LIKE 'A%';
-- 3- Muestra el nombre de usuario o los nombres de pepe martínez herrero.
 SELECT usuario FROM cliente WHERE nombre= 'pepe' AND apellidos ='martinez herrero'; 
 
 -- tabla cliente_cupon 
-- 1-Muestra los id de los clientes que tienen el cupón 6.
SELECT id_cliente FROM cliente_cupon WHERE id_cupon = 6;
-- 2-Muestra los id de los cupones y clientes que lo han obtenido en 2021. 
SELECT id_cupon, id_cliente FROM cliente_cupon WHERE YEAR(fecha_obtencion) = '2021';
-- 3-Muestra todos los cupones que tiene el cliente 3.

-- Tabla cupon 
-- 1- Muestra los cupones y su descuento de aquellos id de los cupones sean pares.
SELECT * FROM cupon WHERE id_cupon %2=0;
-- 2-Muestra el cupón que más descuenta.
SELECT * FROM cupon  ORDER BY descuento_porciento DESC LIMIT 1;
-- 3-Muestra los tres cupones que menos descuentan.
SELECT  * FROM cupon ORDER BY descuento_porciento ASC LIMIT 3;



