HECHO CON 
darcy nicoll rincon alvarez

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT codigo_oficina, ciudad
FROM oficina;

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT  ciudad, telefono 
FROM oficina 
WHERE pais = 'España';
3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
jefe tiene un código de jefe igual a 7.

SELECT nombre, apellidos, email
FROM empleado
WHERE codigo_jefe = 7;
4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
empresa. 

SELECT puesto, nombre, apellidos, email 
FROM empleado 
wHERE puesto = 'Jefe de la empresa';
5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
empleados que no sean representantes de ventas. 

SELECT nombre, apellidos, puesto 
FROM empleado 
WHERE puesto <> 'Representante de ventas';

6. Devuelve un listado con el nombre de los todos los clientes españoles. 

SELECT nombre 
FROM cliente 
WHERE pais = 'España';

7. Devuelve un listado con los distintos estados por los que puede pasar un
pedido.

SELECT DISTINCT estado
FROM pedido ;
 
8. Devuelve un listado con el código de cliente de aquellos clientes que
realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

SELECT DISTINCT codigo_cliente
FROM pago
WHERE fecha_pago BETWEEN '2008-01-01' AND '2008-12-31';

9. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos que no han sido entregados a
tiempo.
 
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido 
WHERE fecha_entrega > fecha_esperada;

10. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
menos dos días antes de la fecha esperada. 

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega <= ADDDATE(fecha_esperada, INTERVAL -2 DAY);

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009. 

SELECT codigo_pedido, codigo_cliente, fecha_pedido, estado
FROM pedido
WHERE estado = 'Rechazado' AND YEAR(fecha_pedido) = 2009;

12. Devuelve un listado de todos los pedidos que han sido entregados en el
mes de enero de cualquier año.

SELECT codigo_pedido, codigo_cliente, fecha_entrega
FROM pedidos
WHERE MONTH(fecha_entrega) = 1;
 
13. Devuelve un listado con todos los pagos que se realizaron en el
año 2008 mediante Paypal. Ordene el resultado de mayor a menor. 

SELECT codigo_cliente, forma_pago, id_transaccion, fecha_pago, total
FROM pago
WHERE  forma_pago = 'Paypal' AND YEAR(fecha_pago) = 2008
ORDER BY monto DESC;

14. Devuelve un listado con todas las formas de pago que aparecen en la
tabla pago. Tenga en cuenta que no deben aparecer formas de pago
repetidas. 

SELECT DISTINCT forma_pago
FROM pago;

15. Devuelve un listado con todos los productos que pertenecen a la
gama Ornamentales y que tienen más de 100 unidades en stock. El listado
deberá estar ordenado por su precio de venta, mostrando en primer lugar
los de mayor precio.

SELECT nombre, precio_venta
FROM producto
WHERE gama = 'Ornamentales' AND stock > 100
ORDER BY precio_venta DESC;

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
cuyo representante de ventas tenga el código de empleado 11 o 30.

SELECT nombre_cliente
FROM cliente
WHERE ciudad = 'Madrid' AND codigo_empleado_rep_ventas IN (11, 30);
---Consultas multitabla (Composición interna)

1
-- Usando (SQL1):
SELECT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante, e.apellido1 AS apellidos_representante
FROM cliente c, empleado e
WHERE c.codigo_empleado_rep_ventas  = e.codigo_empleado;

-- Usando INNER JOIN (SQL2):
SELECT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante, e.apellido1 AS apellidos_representante
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado;

2
-- Usando (SQL1):
SELECT DISTINCT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante
FROM cliente c, empleado e, pago p
WHERE c.codigo_cliente = p.codigo_cliente AND c.codigo_empleado_rep_ventas = e.codigo_empleado;

-- Usando INNER JOIN (SQL2):
SELECT DISTINCT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN pago p ON c.codigo_cliente = p.codigo_cliente;

3
-- Usando (SQL1):
SELECT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante
FROM cliente c, empleado e
WHERE c.codigo_empleado_rep_ventas NOT IN (SELECT codigo_cliente FROM pago)
AND c.codigo_empleado_rep_ventas = e.codigo_empleado;

-- Usando INNER JOIN (SQL2):
SELECT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

4
-- Usando (SQL1):
SELECT DISTINCT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante, o.ciudad
FROM cliente c, empleado e, pago p, oficina o
WHERE c.codigo_cliente = p.codigo_cliente AND c.codigo_empleado_rep_ventas = e.codigo_empleado AND e.codigo_oficina = o.codigo_oficina;

-- Usando INNER JOIN (SQL2):
SELECT DISTINCT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante, o.ciudad
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN pago p ON c.codigo_cliente = p.codigo_cliente
INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;

5
-- Usando (SQL1):
SELECT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante, o.ciudad
FROM cliente c, empleado e, oficina o
WHERE c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)
AND c.codigo_empleado_rep_ventas = e.codigo_empleado
AND e.codigo_oficina = o.codigo_oficina;

-- Usando INNER JOIN (SQL2):
SELECT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante, o.ciudad
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

6
-- Usando (SQL1):
SELECT DISTINCT o.linea_direccion1, o.linea_direccion2
FROM oficina o
INNER JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
INNER JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.ciudad = 'Fuenlabrada';

7
-- Usando (SQL1):
SELECT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante, o.ciudad
FROM cliente c, empleado e, oficina o
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
AND e.codigo_oficina = o.codigo_oficina;

-- Usando INNER JOIN (SQL2):
SELECT c.nombre_cliente AS nombreCliente, e.nombre AS nombre_representante, o.ciudad
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;

10
-- Usando (SQL1):
SELECT DISTINCT c.nombre
FROM clientes c
INNER JOIN pedidos p ON c.codigo_cliente = p.codigo_cliente
WHERE p.fecha_entrega > p.fecha_esperada;

11
-- Usando (SQL1):
SELECT DISTINCT c.nombre_cliente AS nombreCliente, pr.gama
FROM cliente c
INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
INNER JOIN producto pr ON dp.codigo_producto = pr.codigo_producto;

----Consultas multitabla (Composición externa)

1
SELECT c.nombre
FROM cliente c
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

2
SELECT c.nombre
FROM cliente c
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

3
SELECT c.nombre
FROM cliente c
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pedido pd ON c.codigo_cliente = pd.codigo_cliente
WHERE p.codigo_cliente IS NULL OR pd.codigo_cliente IS NULL;

4
SELECT e.nombre
FROM empleado e
LEFT JOIN oficinas o ON e.codigo_oficina = o.codigo_oficina
WHERE o.codigo_oficina IS NULL;

5
SELECT e.nombre
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.codigo_cliente IS NULL;

6
SELECT e.nombre, o.*
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE c.codigo_cliente IS NULL;

7
SELECT e.nombre
FROM empleado e
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE o.codigo_oficina IS NULL OR c.codigo_cliente IS NULL;

8
SELECT pr.*
FROM producto pr
LEFT JOIN detalle_pedido dp ON pr.codigo_producto = dp.codigo_producto
WHERE dp.codigo_producto IS NULL;

9
SELECT pr.nombre, pr.descripcion, pr.imagen
FROM productos pr
LEFT JOIN detalles_pedido dp ON pr.codigo_producto = dp.codigo_producto
WHERE dp.codigo_producto IS NULL;

10
SELECT o.*
FROM oficina o
LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
LEFT JOIN producto pr ON dp.codigo_producto = pr.codigo_producto AND pr.gama = 'Frutales'
WHERE pr.codigo_producto IS NULL;

11
SELECT DISTINCT c.nombre_cliente
FROM cliente c
INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pago pg ON c.codigo_cliente = pg.codigo_cliente
WHERE pg.codigo_cliente IS NULL;




-- CONSULTAS resumen 

1
SELECT COUNT(e.codigo_empleado) as "Cantidad de empleados" from empleado e;

------------------------------------
2
 SELECT COUNT(c.codigo_cliente), c.pais AS "empleado por pais" FROM cliente c GROUP BY c.pais;


------------------------------------
3
SELECT AVG(p.total) AS pago_promedio FROM pago p WHERE p.fecha_de_pago LIKE "2019%";

---------------------------
4
SELECT COUNT(p.codigo_pedido), p.estado as Cantidad_de_pedidos FROM pedido p GROUP BY p.estado 
ORDER BY COUNT(p.codigo_pedido) DESC;


--------------------------------
5

SELECT MAX(p.precio_venta) AS precio_maximo, MIN(p.precio_venta) AS precioMinimo FROM producto p ;

--------------------------------
6
SELECT COUNT(c.codigo_cliente) FROM cliente c WHERE c.ciudad ="Madrid";


--------------------------------
7
SELECT COUNT(c.codigo_cliente),c.ciudad FROM cliente c 
GROUP BY (SELECT COUNT(c2.codigo_cliente) FROM cliente c2)
WHERE c.ciudad LIKE "M%";




------------------------------
8

SELECT e.nombre, COUNT(c.codigo_cliente) FROM empleado e
JOIN cliente c ON c.codigo_empleado_rep_ventas = e.codigo_empleado
GROUP BY e.nombre;

------------------------------------------
9
SELECT COUNT(c.codigo_cliente) FROM empleado e
JOIN cliente c ON c.codigo_empleado_rep_ventas = e.codigo_empleado;


------------------------------------------





