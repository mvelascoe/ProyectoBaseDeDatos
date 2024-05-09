# Proyecto Base de Datos Parte I

## Contenido

- [**Archivo DDL**][Ver](https://github.com/mvelascoe/ProyectoBaseDeDatos/blob/main/DDL.sql):  Este archivo SQL establece la estructura de la base de datos, junto con las relaciones entre las diferentes entidades.
- [**Archivo DML**][Ver](https://github.com/mvelascoe/ProyectoBaseDeDatos/blob/main/DML.sql):  Este archivo SQL muestra la realización de las inserciones de datos en tablas de la base de datos.
- 
## Diagrama Entidad - Relación

![Diagrama Entidad-Relación](https://github.com/mvelascoe/ProyectoBaseDeDatos/blob/main/DER.png)


## Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```sql
   SELECT codigo_oficina as Codigo Oficina, nombre_ciudad as Ciudad
   FROM oficina
   INNER JOIN ciudad ON oficina.codigo_ciudad = ciudad.codigo_ciudad;
   
   +----------------+----------------------+
   | Codigo Oficina | Ciudad               |
   +----------------+----------------------+
   |              1 | Barcelona            |
   |              2 | Boston               |
   |              3 | Londres              |
   |              4 | Madrid               |
   |              5 | Paris                |
   |              6 | San Francisco        |
   |              7 | Sydney               |
   |              8 | Talavera de la Reina |
   |              9 | Tokyo                |
   +----------------+----------------------+
   ```

   

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```sql
   SELECT c.nombre_ciudad AS Ciudad, telefono_oficina.telefono_oficina AS Telefono
   FROM oficina AS o
   INNER JOIN ciudad AS c ON o.codigo_ciudad = c.codigo_ciudad
   INNER JOIN region AS r ON c.codigo_region = r.codigo_region
   INNER JOIN pais AS p ON r.codigo_pais = p.codigo_pais
   INNER JOIN telefono_oficina ON o.codigo_oficina = telefono_oficina.codigo_oficina
   WHERE p.codigo_pais = 'ES';
   
   +----------------------+----------------+
   | Ciudad               | Telefono       |
   +----------------------+----------------+
   | Barcelona            | +34 93 3561182 |
   | Madrid               | +34 91 7514487 |
   | Talavera de la Reina | +34 925 867231 |
   +----------------------+----------------+
   
   ```

   

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
    jefe tiene un código de jefe igual a 7.

  ```sql
  SELECT nombre_empleado AS Nombre, apellido1_empleado AS "Primer Apellido", apellido2_empleado AS "Segundo Apellido", email_empleado AS Email
  FROM empleado
  WHERE codigo_jefe = 7;
  
  +---------+-----------------+------------------+--------------------------+
  | Nombre  | Primer Apellido | Segundo Apellido | Email                    |
  +---------+-----------------+------------------+--------------------------+
  | Mariano | López           | Murcia           | mlopez@jardineria.es     |
  | Lucio   | Campoamor       | Martín           | lcampoamor@jardineria.es |
  | Hilario | Rodriguez       | Huertas          | hrodriguez@jardineria.es |
  +---------+-----------------+------------------+--------------------------+
  ```

  

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
    empresa.

  ```sql
  SELECT puesto_empleado.nombre_puesto AS "Puesto", empleado.nombre_empleado AS "Nombre", empleado.apellido1_empleado AS "Primer Apellido", empleado.apellido2_empleado AS "Segundo Apellido", empleado.email_empleado AS "Email"
  FROM empleado
  INNER JOIN puesto_empleado ON empleado.codigo_puesto_empleado = puesto_empleado.codigo_puesto_empleado
  WHERE empleado.codigo_jefe IS NULL;
  
  +------------------+--------+-----------------+------------------+----------------------+
  | Puesto           | Nombre | Primer Apellido | Segundo Apellido | Email                |
  +------------------+--------+-----------------+------------------+----------------------+
  | Director General | Marcos | Magaña          | Perez            | marcos@jardineria.es |
  +------------------+--------+-----------------+------------------+----------------------+
  ```

  

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
    empleados que no sean representantes de ventas.

  ```sql
  SELECT e.nombre_empleado AS Nombre, e.apellido1_empleado AS "Primer Apellido", e.apellido2_empleado AS "Segundo Apellido", puesto_empleado.nombre_puesto AS Puesto
  FROM empleado AS e
  INNER JOIN puesto_empleado ON e.codigo_puesto_empleado = puesto_empleado.codigo_puesto_empleado
  WHERE e.codigo_empleado NOT IN (SELECT codigo_rep_ventas FROM cliente);
  
  +----------+-----------------+------------------+-----------------------+
  | Nombre   | Primer Apellido | Segundo Apellido | Puesto                |
  +----------+-----------------+------------------+-----------------------+
  | Marcos   | Magaña          | Perez            | Director General      |
  | Ruben    | López           | Martinez         | Subdirector Marketing |
  | Alberto  | Soria           | Carrasco         | Subdirector Ventas    |
  | Maria    | Solís           | Jerez            | Secretaria            |
  | Carlos   | Soria           | Jimenez          | Director Oficina      |
  | Emmanuel | Magaña          | Perez            | Director Oficina      |
  | Francois | Fignon          |                  | Director Oficina      |
  | Michael  | Bolton          |                  | Director Oficina      |
  | Hilary   | Washington      |                  | Director Oficina      |
  | Nei      | Nishikori       |                  | Director Oficina      |
  | Amy      | Johnson         |                  | Director Oficina      |
  | Kevin    | Fallmer         |                  | Director Oficina      |
  +----------+-----------------+------------------+-----------------------+
  ```

  

6. Devuelve un listado con el nombre de los todos los clientes españoles.

   ```sql
   SELECT c.nombre_cliente
   FROM cliente AS c
   INNER JOIN ciudad ON c.codigo_ciudad = ciudad.codigo_ciudad
   INNER JOIN region ON ciudad.codigo_region = region.codigo_region
   INNER JOIN pais ON region.codigo_pais = pais.codigo_pais
   WHERE pais.nombre_pais = 'España';
   
   +----------------------------+
   | nombre_cliente             |
   +----------------------------+
   | GoldFish Garden            |
   | Gardening Associates       |
   | Gerudo Valley              |
   | Naturajardin               |
   | Vivero Humanes             |
   | Tutifruti S.A              |
   | Naturagua                  |
   | Jardineria Sara            |
   | Madrileña de riegos        |
   | Americh Golf Management SL |
   | Campohermoso               |
   | The Magic Garden           |
   +----------------------------+
   ```

   

7. Devuelve un listado con los distintos estados por los que puede pasar un
    pedido.

  ```sql
  SELECT nombre AS ESTADOS
  FROM estado;
  
  +-----------+
  | ESTADOS   |
  +-----------+
  | Entregado |
  | Pendiente |
  | Rechazado |
  +-----------+
  ```

  

8. Devuelve un listado con el código de cliente de aquellos clientes que
    realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
    aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
    • Utilizando la función YEAR de MySQL.
    • Utilizando la función DATE_FORMAT de MySQL.
    • Sin utilizar ninguna de las funciones anteriores.

  ```sql
  mysql> SELECT DISTINCT codigo_cliente
      -> FROM pago
      -> WHERE YEAR(fecha_pago) = 2008;
  +----------------+
  | codigo_cliente |
  +----------------+
  |              1 |
  |             13 |
  |             14 |
  |             26 |
  +----------------+
  4 rows in set (0.66 sec)
  
  mysql> SELECT DISTINCT codigo_cliente
      -> FROM pago
      -> WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';
  +----------------+
  | codigo_cliente |
  +----------------+
  |              1 |
  |             13 |
  |             14 |
  |             26 |
  +----------------+
  4 rows in set (0.25 sec)
  
  mysql> SELECT DISTINCT codigo_cliente
      -> FROM pago
      -> WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';
  +----------------+
  | codigo_cliente |
  +----------------+
  |              1 |
  |             13 |
  |             14 |
  |             26 |
  +----------------+
  ```

  

9. Devuelve un listado con el código de pedido, código de cliente, fecha
    esperada y fecha de entrega de los pedidos que no han sido entregados a
    tiempo.

  ```sql
  SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
  FROM pedido
  WHERE fecha_entrega > fecha_esperada;
  ```

  

10. Devuelve un listado con el código de pedido, código de cliente, fecha
    esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
    menos dos días antes de la fecha esperada.
    • Utilizando la función ADDDATE de MySQL.
    • Utilizando la función DATEDIFF de MySQL.
    • ¿Sería posible resolver esta consulta utilizando el operador de suma + o
    resta -?

    ```sql
    mysql> SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
        -> FROM pedido
        -> WHERE fecha_entrega <= ADDDATE(fecha_esperada, -2);
    Empty set (0.04 sec)
    
    mysql> SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
        -> FROM pedido
        -> WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;
    Empty set (0.02 sec)
    
    
    ```
    
    
    
11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ```sql
    SELECT codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, comentarios, codigo_cliente, codigo_estado
    FROM pedido
    WHERE codigo_estado = 3 AND YEAR(fecha_pedido) = 2009;
    
    +---------------+--------------+----------------+---------------+-----------------+----------------+---------------+
    | codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega | comentarios     | codigo_cliente | codigo_estado |
    +---------------+--------------+----------------+---------------+-----------------+----------------+---------------+
    | PED023        | 2009-02-01   | 2009-02-06     | 2009-02-06    | Sin comentarios |             23 |             3 |
    | PED026        | 2009-02-04   | 2009-02-09     | 2009-02-09    | Sin comentarios |             26 |             3 |
    | PED029        | 2009-02-07   | 2009-02-12     | 2009-02-12    | Sin comentarios |             29 |             3 |
    | PED032        | 2009-02-10   | 2009-02-15     | 2009-02-15    | Sin comentarios |             32 |             3 |
    | PED035        | 2009-02-13   | 2009-02-18     | 2009-02-18    | Sin comentarios |             35 |             3 |
    | PED038        | 2009-02-16   | 2009-02-21     | 2009-02-21    | Sin comentarios |             38 |             3 |
    +---------------+--------------+----------------+---------------+-----------------+----------------+---------------+
    
    
    ```

    

12. Devuelve un listado de todos los pedidos que han sido entregados en el
    mes de enero de cualquier año.

    ```sql
    SELECT codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, comentarios, codigo_cliente, codigo_estado
    FROM pedido
    WHERE MONTH(fecha_entrega) = 01;
    
    +---------------+--------------+----------------+---------------+-----------------+----------------+---------------+
    | codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega | comentarios     | codigo_cliente | codigo_estado |
    +---------------+--------------+----------------+---------------+-----------------+----------------+---------------+
    | PED001        | 2024-01-10   | 2024-01-15     | 2024-01-15    | Sin comentarios |              1 |             1 |
    | PED003        | 2024-01-12   | 2024-01-17     | 2024-01-17    | Sin comentarios |              3 |             3 |
    | PED005        | 2024-01-14   | 2024-01-19     | 2024-01-19    | Sin comentarios |              5 |             2 |
    | PED006        | 2024-01-15   | 2024-01-20     | 2024-01-20    | Sin comentarios |              6 |             3 |
    | PED008        | 2024-01-17   | 2024-01-22     | 2024-01-22    | Sin comentarios |              8 |             2 |
    | PED009        | 2024-01-18   | 2024-01-23     | 2024-01-23    | Sin comentarios |              9 |             3 |
    | PED011        | 2024-01-20   | 2024-01-25     | 2024-01-25    | Sin comentarios |             11 |             2 |
    | PED013        | 2024-01-22   | 2024-01-27     | 2024-01-27    | Sin comentarios |             13 |             1 |
    | PED014        | 2024-01-23   | 2024-01-28     | 2024-01-28    | Sin comentarios |             14 |             2 |
    | PED016        | 2024-01-25   | 2024-01-30     | 2024-01-30    | Sin comentarios |             16 |             1 |
    | PED017        | 2024-01-26   | 2024-01-31     | 2024-01-31    | Sin comentarios |             17 |             2 |
    +---------------+--------------+----------------+---------------+-----------------+----------------+---------------+
    ```
    
    
    
13. Devuelve un listado con todos los pagos que se realizaron en el
    año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

    ```sql
    mysql> SELECT codigo_pago, fecha_pago, total_pago, codigo_cliente, codigo_met_pago
        -> FROM pago
        -> WHERE YEAR(fecha_pago) = 2008 AND codigo_met_pago = 4
        -> ORDER BY total_pago DESC;
    Empty set (0.00 sec)
    ```
    
    
    
14. Devuelve un listado con todas las formas de pago que aparecen en la
    tabla pago. Tenga en cuenta que no deben aparecer formas de pago
    repetidas.

    ```sql
    SELECT DISTINCT codigo_metodo_pago, nombre_met_pago
    FROM metodo_pago;
    
    +--------------------+-----------------+
    | codigo_metodo_pago | nombre_met_pago |
    +--------------------+-----------------+
    |                  1 | Transfrerencia  |
    |                  2 | Cheque          |
    |                  3 | efectivo        |
    |                  4 | Paypal          |
    +--------------------+-----------------+
    
    ```
    
    
    
15. Devuelve un listado con todos los productos que pertenecen a la
    gama Ornamentales y que tienen más de 100 unidades en stock. El listado
    deberá estar ordenado por su precio de venta, mostrando en primer lugar
    los de mayor precio.

    ```sql
    SELECT p.codigo_producto, p.nombre, p.codigo_gama, p.cantidad_stock, p.precio_venta, p.descripcion, p.codigo_dimensiones
    FROM producto AS p
    WHERE codigo_gama = 5 AND cantidad_stock > 100
    ORDER BY precio_venta DESC;
    
    +-----------------+---------+-------------+----------------+--------------+--------------------------------+--------------------+
    | codigo_producto | nombre  | codigo_gama | cantidad_stock | precio_venta | descripcion                    | codigo_dimensiones |
    +-----------------+---------+-------------+----------------+--------------+--------------------------------+--------------------+
    | PRD032          | Azalea  |           5 |            160 |        28.50 | Planta de azalea para jardines | DIM004             |
    | PRD033          | Begonia |           5 |            320 |        15.75 | Flores de begonia en maceta    | DIM009             |
    +-----------------+---------+-------------+----------------+--------------+--------------------------------+--------------------+
    
    ```
    
    
    
16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
    cuyo representante de ventas tenga el código de empleado 11 o 30.

    ```sql
    SELECT c.codigo_cliente, c.nombre_cliente, c.codigo_ciudad, c.codigo_postal, c.limite_credito, c.codigo_rep_ventas
              FROM cliente AS c
              WHERE c.codigo_ciudad = (
                  SELECT codigo_ciudad
                  FROM ciudad
                  WHERE ciudad.codigo_ciudad = '004'
              )
              AND c.codigo_rep_ventas IN (11, 30);
    Empty set (0.00 sec)
    ```


    ## Consultas multitabla (Composición interna)

Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con
sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
    representante de ventas.

  ```sql
  SQL1
  SELECT c.nombre_cliente AS 'Cliente', e.nombre_empleado as 'Nombre Asesor Ventas', e.apellido1_empleado AS 'Apellido Asesor Ventas'
  FROM cliente AS c, empleado AS e
  WHERE c.codigo_rep_ventas = e.codigo_empleado;
  
  SQL2
  SELECT c.nombre_cliente AS 'Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', e.apellido1_empleado AS 'Apellido Asesor Ventas'
  FROM cliente AS c
  INNER JOIN empleado AS e ON c.codigo_rep_ventas = e.codigo_empleado;
  
  +--------------------------------+----------------------+------------------------+
  | Cliente                        | Nombre Asesor Ventas | Apellido Asesor Ventas |
  +--------------------------------+----------------------+------------------------+
  | GoldFish Garden                | Felipe               | Rosas                  |
  | Campohermoso                   | Felipe               | Rosas                  |
  | Gardening Associates           | Juan Carlos          | Ortiz                  |
  | france telecom                 | Juan Carlos          | Ortiz                  |
  | Tendo Garden                   | Mariano              | López                  |
  | The Magic Garden               | Mariano              | López                  |
  | Gerudo Valley                  | Lucio                | Campoamor              |
  | Musée du Louvre                | Lucio                | Campoamor              |
  | El Prat                        | Hilario              | Rodriguez              |
  | Jardineria Sara                | Hilario              | Rodriguez              |
  | Lasas S.A.                     | José Manuel          | Martinez               |
  | Flores S.L.                    | José Manuel          | Martinez               |
  | Beragua                        | David                | Palma                  |
  | Club Golf Puerta del hierro    | Oscar                | Palma                  |
  | Naturagua                      | Lionel               | Narvaez                |
  | DaraDistribuciones             | Lionel               | Narvaez                |
  | Sotogrande                     | Lionel               | Narvaez                |
  | Madrileña de riegos            | Laurent              | Serra                  |
  | Lasas S.A.                     | Walter Santiago      | Sanchez                |
  | Camunas Jardines S.L.          | Marcus               | Paxton                 |
  | Dardena S.A.                   | Lorena               | Paxton                 |
  | Jardin de Flores               | Narumi               | Riko                   |
  | Flores Marivi                  | Narumi               | Riko                   |
  | Vivero Humanes                 | Narumi               | Riko                   |
  | Fuenla City                    | Narumi               | Riko                   |
  | Jardinerías Matías SL          | Narumi               | Riko                   |
  | Tutifruti S.A                  | Narumi               | Riko                   |
  | El Jardin Viviente S.L         | Narumi               | Riko                   |
  | Flowers, S.A                   | Takuma               | Nomura                 |
  | Jardines y Mansiones Cactus SL | Takuma               | Nomura                 |
  | Naturajardin                   | Larry                | Westfalls              |
  | Golf S.A.                      | John                 | Walton                 |
  | Americh Golf Management SL     | Julian               | Bellinelli             |
  | Agrojardin                     | Julian               | Bellinelli             |
  | Aloha                          | Mariko               | Kishi                  |
  | Top Campo                      | Mariko               | Kishi                  |
  +--------------------------------+----------------------+------------------------+
  
  ```

  

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
    nombre de sus representantes de ventas.

  ```sql
  SQL1
  SELECT c.nombre_cliente AS 'Nombre Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', e.apellido1_empleado AS 'Apellido Asesor Ventas'
  FROM cliente AS c, empleado AS e, pago AS p
  WHERE c.codigo_rep_ventas = e.codigo_empleado AND c.codigo_cliente = p.codigo_cliente;
  
  SQL2
  SELECT c.nombre_cliente AS 'Nombre Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', e.apellido1_empleado AS 'Apellido Asesor Ventas'
  FROM cliente AS c
  INNER JOIN empleado AS e ON c.codigo_rep_ventas = e.codigo_empleado
  INNER JOIN pago AS p ON c.codigo_cliente = p.codigo_cliente;
  
  +--------------------------------+----------------------+------------------------+
  | Nombre Cliente                 | Nombre Asesor Ventas | Apellido Asesor Ventas |
  +--------------------------------+----------------------+------------------------+
  | GoldFish Garden                | Felipe               | Rosas                  |
  | GoldFish Garden                | Felipe               | Rosas                  |
  | Gardening Associates           | Juan Carlos          | Ortiz                  |
  | Gardening Associates           | Juan Carlos          | Ortiz                  |
  | Gardening Associates           | Juan Carlos          | Ortiz                  |
  | Gerudo Valley                  | Lucio                | Campoamor              |
  | Gerudo Valley                  | Lucio                | Campoamor              |
  | Gerudo Valley                  | Lucio                | Campoamor              |
  | Gerudo Valley                  | Lucio                | Campoamor              |
  | Gerudo Valley                  | Lucio                | Campoamor              |
  | Tendo Garden                   | Mariano              | López                  |
  | Beragua                        | David                | Palma                  |
  | Naturagua                      | Lionel               | Narvaez                |
  | Camunas Jardines S.L.          | Marcus               | Paxton                 |
  | Dardena S.A.                   | Lorena               | Paxton                 |
  | Jardin de Flores               | Narumi               | Riko                   |
  | Jardin de Flores               | Narumi               | Riko                   |
  | Flores Marivi                  | Narumi               | Riko                   |
  | Golf S.A.                      | John                 | Walton                 |
  | Sotogrande                     | Lionel               | Narvaez                |
  | Jardines y Mansiones Cactus SL | Takuma               | Nomura                 |
  | Jardinerías Matías SL          | Narumi               | Riko                   |
  | Agrojardin                     | Julian               | Bellinelli             |
  | Jardineria Sara                | Hilario              | Rodriguez              |
  | Tutifruti S.A                  | Narumi               | Riko                   |
  | El Jardin Viviente S.L         | Narumi               | Riko                   |
  +--------------------------------+----------------------+------------------------+
  
  ```

  

3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
    el nombre de sus representantes de ventas.

  ```sql
  SQL1
  SELECT c.nombre_cliente AS 'Nombre Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', e.apellido1_empleado AS 'Apellido Asesor Ventas'
  FROM cliente AS c, empleado AS e
  WHERE c.codigo_rep_ventas = e.codigo_empleado
  AND c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);
  
  SQL2
  SELECT c.nombre_cliente AS 'Nombre Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', e.apellido1_empleado AS 'Apellido Asesor Ventas'
  FROM cliente AS c
  INNER JOIN empleado AS e ON c.codigo_rep_ventas = e.codigo_empleado
  LEFT JOIN pago AS p ON c.codigo_cliente = p.codigo_cliente
  WHERE p.codigo_pago IS NULL;
  
  +-----------------------------+----------------------+------------------------+
  | Nombre Cliente              | Nombre Asesor Ventas | Apellido Asesor Ventas |
  +-----------------------------+----------------------+------------------------+
  | Campohermoso                | Felipe               | Rosas                  |
  | france telecom              | Juan Carlos          | Ortiz                  |
  | The Magic Garden            | Mariano              | López                  |
  | Musée du Louvre             | Lucio                | Campoamor              |
  | El Prat                     | Hilario              | Rodriguez              |
  | Lasas S.A.                  | José Manuel          | Martinez               |
  | Flores S.L.                 | José Manuel          | Martinez               |
  | Club Golf Puerta del hierro | Oscar                | Palma                  |
  | DaraDistribuciones          | Lionel               | Narvaez                |
  | Madrileña de riegos         | Laurent              | Serra                  |
  | Lasas S.A.                  | Walter Santiago      | Sanchez                |
  | Vivero Humanes              | Narumi               | Riko                   |
  | Fuenla City                 | Narumi               | Riko                   |
  | Flowers, S.A                | Takuma               | Nomura                 |
  | Naturajardin                | Larry                | Westfalls              |
  | Americh Golf Management SL  | Julian               | Bellinelli             |
  | Aloha                       | Mariko               | Kishi                  |
  | Top Campo                   | Mariko               | Kishi                  |
  +-----------------------------+----------------------+------------------------+
  ```

  

4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
    representantes junto con la ciudad de la oficina a la que pertenece el
    representante.

  ```sql
  SQL1
  SELECT c.nombre_cliente AS 'Nombre Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', ci.nombre_ciudad AS 'Ciudad Oficina'
  FROM cliente AS c, empleado AS e, pago AS p, oficina AS o, ciudad AS ci
  WHERE c.codigo_rep_ventas = e.codigo_empleado AND c.codigo_cliente = p.codigo_cliente AND e.codigo_oficina = o.codigo_oficina AND o.codigo_ciudad = ci.codigo_ciudad;
  
  SQL2
  SELECT c.nombre_cliente AS 'Nombre Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', ci.nombre_ciudad AS 'Ciudad Oficina'
  FROM cliente AS c
  INNER JOIN empleado AS e ON c.codigo_rep_ventas = e.codigo_empleado
  INNER JOIN pago AS p ON c.codigo_cliente = p.codigo_cliente
  INNER JOIN oficina AS o ON e.codigo_oficina = o.codigo_oficina
  INNER JOIN ciudad AS ci ON o.codigo_ciudad = ci.codigo_ciudad;
  
  +--------------------------------+----------------------+----------------------+
  | Nombre Cliente                 | Nombre Asesor Ventas | Ciudad Oficina       |
  +--------------------------------+----------------------+----------------------+
  | Beragua                        | David                | Barcelona            |
  | Camunas Jardines S.L.          | Marcus               | Boston               |
  | Dardena S.A.                   | Lorena               | Boston               |
  | Golf S.A.                      | John                 | Londres              |
  | Tendo Garden                   | Mariano              | Madrid               |
  | Gerudo Valley                  | Lucio                | Madrid               |
  | Gerudo Valley                  | Lucio                | Madrid               |
  | Gerudo Valley                  | Lucio                | Madrid               |
  | Gerudo Valley                  | Lucio                | Madrid               |
  | Gerudo Valley                  | Lucio                | Madrid               |
  | Jardineria Sara                | Hilario              | Madrid               |
  | Naturagua                      | Lionel               | Paris                |
  | Sotogrande                     | Lionel               | Paris                |
  | Agrojardin                     | Julian               | Sydney               |
  | GoldFish Garden                | Felipe               | Talavera de la Reina |
  | GoldFish Garden                | Felipe               | Talavera de la Reina |
  | Gardening Associates           | Juan Carlos          | Talavera de la Reina |
  | Gardening Associates           | Juan Carlos          | Talavera de la Reina |
  | Gardening Associates           | Juan Carlos          | Talavera de la Reina |
  | Jardin de Flores               | Narumi               | Tokyo                |
  | Jardin de Flores               | Narumi               | Tokyo                |
  | Flores Marivi                  | Narumi               | Tokyo                |
  | Jardinerías Matías SL          | Narumi               | Tokyo                |
  | Tutifruti S.A                  | Narumi               | Tokyo                |
  | El Jardin Viviente S.L         | Narumi               | Tokyo                |
  | Jardines y Mansiones Cactus SL | Takuma               | Tokyo                |
  +--------------------------------+----------------------+----------------------+
  ```

  

5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
    de sus representantes junto con la ciudad de la oficina a la que pertenece el
    representante.

  ```sql
  SQL1
  SELECT c.nombre_cliente AS 'Nombre Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', ci.nombre_ciudad AS 'Ciudad Oficina'
  FROM cliente AS c, empleado AS e, oficina AS o, ciudad AS ci
  WHERE c.codigo_rep_ventas = e.codigo_empleado AND e.codigo_oficina = o.codigo_oficina AND o.codigo_ciudad = ci.codigo_ciudad AND c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);
  
  SQL2
  SELECT c.nombre_cliente AS 'Nombre Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', ci.nombre_ciudad AS 'Ciudad Oficina'
  FROM cliente AS c
  INNER JOIN empleado AS e ON c.codigo_rep_ventas = e.codigo_empleado
  INNER JOIN oficina AS o ON e.codigo_oficina = o.codigo_oficina
  INNER JOIN ciudad AS ci ON o.codigo_ciudad = ci.codigo_ciudad
  LEFT JOIN pago AS p ON c.codigo_cliente = p.codigo_cliente
  WHERE p.codigo_pago IS NULL;
  
  +-----------------------------+----------------------+----------------------+
  | Nombre Cliente              | Nombre Asesor Ventas | Ciudad Oficina       |
  +-----------------------------+----------------------+----------------------+
  | Lasas S.A.                  | José Manuel          | Barcelona            |
  | Flores S.L.                 | José Manuel          | Barcelona            |
  | Club Golf Puerta del hierro | Oscar                | Barcelona            |
  | Naturajardin                | Larry                | Londres              |
  | The Magic Garden            | Mariano              | Madrid               |
  | Musée du Louvre             | Lucio                | Madrid               |
  | El Prat                     | Hilario              | Madrid               |
  | DaraDistribuciones          | Lionel               | Paris                |
  | Madrileña de riegos         | Laurent              | Paris                |
  | Lasas S.A.                  | Walter Santiago      | San Francisco        |
  | Americh Golf Management SL  | Julian               | Sydney               |
  | Aloha                       | Mariko               | Sydney               |
  | Top Campo                   | Mariko               | Sydney               |
  | Campohermoso                | Felipe               | Talavera de la Reina |
  | france telecom              | Juan Carlos          | Talavera de la Reina |
  | Vivero Humanes              | Narumi               | Tokyo                |
  | Fuenla City                 | Narumi               | Tokyo                |
  | Flowers, S.A                | Takuma               | Tokyo                |
  +-----------------------------+----------------------+----------------------+
  ```

  

6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

   ```sql
   SELECT d.nombre_calle, d.numero_direccion, d.nombre_barrio
   FROM direccion AS d
   INNER JOIN oficina as o ON o.codigo_oficina = o.codigo_oficina
   INNER JOIN ciudad as c ON o.codigo_ciudad = c.codigo_ciudad
   INNER JOIN cliente AS cli ON cli.codigo_ciudad = c.codigo_ciudad
   WHERE c.nombre_ciudad = 'Fuenlabrada';
   
   Empty set (0.17 sec)
   ```

   

7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
    con la ciudad de la oficina a la que pertenece el representante.

  ```sql
  SQL1
  SELECT c.nombre_cliente AS 'Nombre Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', e.apellido1_empleado AS 'Apellido Asesor Ventas', ci.nombre_ciudad AS 'Ciudad Oficina'
  FROM cliente AS c, empleado AS e, oficina AS o, ciudad AS ci
  WHERE c.codigo_rep_ventas = e.codigo_empleado
  AND e.codigo_oficina = o.codigo_oficina AND o.codigo_ciudad = ci.codigo_ciudad;
  
  SQL1
  SELECT c.nombre_cliente AS 'Nombre Cliente', e.nombre_empleado AS 'Nombre Asesor Ventas', e.apellido1_empleado AS 'Apellido Asesor Ventas', ci.nombre_ciudad AS 'Ciudad Oficina'
  FROM cliente AS c
  INNER JOIN empleado AS e ON c.codigo_rep_ventas = e.codigo_empleado
  INNER JOIN oficina AS o ON e.codigo_oficina = o.codigo_oficina
  INNER JOIN ciudad AS ci ON o.codigo_ciudad = ci.codigo_ciudad;
  
  +--------------------------------+----------------------+------------------------+----------------------+
  | Nombre Cliente                 | Nombre Asesor Ventas | Apellido Asesor Ventas | Ciudad Oficina       |
  +--------------------------------+----------------------+------------------------+----------------------+
  | Lasas S.A.                     | José Manuel          | Martinez               | Barcelona            |
  | Flores S.L.                    | José Manuel          | Martinez               | Barcelona            |
  | Beragua                        | David                | Palma                  | Barcelona            |
  | Club Golf Puerta del hierro    | Oscar                | Palma                  | Barcelona            |
  | Camunas Jardines S.L.          | Marcus               | Paxton                 | Boston               |
  | Dardena S.A.                   | Lorena               | Paxton                 | Boston               |
  | Naturajardin                   | Larry                | Westfalls              | Londres              |
  | Golf S.A.                      | John                 | Walton                 | Londres              |
  | Tendo Garden                   | Mariano              | López                  | Madrid               |
  | The Magic Garden               | Mariano              | López                  | Madrid               |
  | Gerudo Valley                  | Lucio                | Campoamor              | Madrid               |
  | Musée du Louvre                | Lucio                | Campoamor              | Madrid               |
  | El Prat                        | Hilario              | Rodriguez              | Madrid               |
  | Jardineria Sara                | Hilario              | Rodriguez              | Madrid               |
  | Naturagua                      | Lionel               | Narvaez                | Paris                |
  | DaraDistribuciones             | Lionel               | Narvaez                | Paris                |
  | Sotogrande                     | Lionel               | Narvaez                | Paris                |
  | Madrileña de riegos            | Laurent              | Serra                  | Paris                |
  | Lasas S.A.                     | Walter Santiago      | Sanchez                | San Francisco        |
  | Americh Golf Management SL     | Julian               | Bellinelli             | Sydney               |
  | Agrojardin                     | Julian               | Bellinelli             | Sydney               |
  | Aloha                          | Mariko               | Kishi                  | Sydney               |
  | Top Campo                      | Mariko               | Kishi                  | Sydney               |
  | GoldFish Garden                | Felipe               | Rosas                  | Talavera de la Reina |
  | Campohermoso                   | Felipe               | Rosas                  | Talavera de la Reina |
  | Gardening Associates           | Juan Carlos          | Ortiz                  | Talavera de la Reina |
  | france telecom                 | Juan Carlos          | Ortiz                  | Talavera de la Reina |
  | Jardin de Flores               | Narumi               | Riko                   | Tokyo                |
  | Flores Marivi                  | Narumi               | Riko                   | Tokyo                |
  | Vivero Humanes                 | Narumi               | Riko                   | Tokyo                |
  | Fuenla City                    | Narumi               | Riko                   | Tokyo                |
  | Jardinerías Matías SL          | Narumi               | Riko                   | Tokyo                |
  | Tutifruti S.A                  | Narumi               | Riko                   | Tokyo                |
  | El Jardin Viviente S.L         | Narumi               | Riko                   | Tokyo                |
  | Flowers, S.A                   | Takuma               | Nomura                 | Tokyo                |
  | Jardines y Mansiones Cactus SL | Takuma               | Nomura                 | Tokyo                |
  +--------------------------------+----------------------+------------------------+----------------------+
  ```

  

8. Devuelve un listado con el nombre de los empleados junto con el nombre
    de sus jefes.

  ```sql
  SQL1
  SELECT e.nombre_empleado AS 'Nombre Empleado', j.nombre_empleado AS 'Nombre Jefe'
  FROM empleado AS e, empleado AS j
  WHERE e.codigo_jefe = j.codigo_empleado;
  
  SQL2
  SELECT e.nombre_empleado AS 'Nombre Empleado', j.nombre_empleado AS 'Nombre Jefe'
  FROM empleado AS e
  INNER JOIN empleado AS j ON e.codigo_jefe = j.codigo_empleado;
  
  +-----------------+-------------+
  | Nombre Empleado | Nombre Jefe |
  +-----------------+-------------+
  | Ruben           | Marcos      |
  | Alberto         | Ruben       |
  | Maria           | Ruben       |
  | Felipe          | Alberto     |
  | Juan Carlos     | Alberto     |
  | Carlos          | Alberto     |
  | Mariano         | Carlos      |
  | Lucio           | Carlos      |
  | Hilario         | Carlos      |
  | Emmanuel        | Alberto     |
  | José Manuel     | Emmanuel    |
  | David           | Emmanuel    |
  | Oscar           | Emmanuel    |
  | Francois        | Alberto     |
  | Lionel          | Francois    |
  | Laurent         | Francois    |
  | Michael         | Alberto     |
  | Walter Santiago | Michael     |
  | Hilary          | Alberto     |
  | Marcus          | Hilary      |
  | Lorena          | Hilary      |
  | Nei             | Alberto     |
  | Narumi          | Nei         |
  | Takuma          | Nei         |
  | Amy             | Alberto     |
  | Larry           | Amy         |
  | John            | Amy         |
  | Kevin           | Alberto     |
  | Julian          | Kevin       |
  | Mariko          | Kevin       |
  +-----------------+-------------+
  ```

  

9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
    de su jefe y el nombre del jefe de sus jefe.

  ```sql
  SELECT e1.nombre_empleado AS 'Empleado', e2.nombre_empleado AS 'Jefe', e3.nombre_empleado AS 'Jefe del Jefe'
  FROM empleado AS e1
  LEFT JOIN empleado AS e2 ON e1.codigo_jefe = e2.codigo_empleado
  LEFT JOIN empleado AS e3 ON e2.codigo_jefe = e3.codigo_empleado;
  
  +-----------------+----------+---------------+
  | Empleado        | Jefe     | Jefe del Jefe |
  +-----------------+----------+---------------+
  | Marcos          | NULL     | NULL          |
  | Ruben           | Marcos   | NULL          |
  | Alberto         | Ruben    | Marcos        |
  | Maria           | Ruben    | Marcos        |
  | Felipe          | Alberto  | Ruben         |
  | Juan Carlos     | Alberto  | Ruben         |
  | Carlos          | Alberto  | Ruben         |
  | Mariano         | Carlos   | Alberto       |
  | Lucio           | Carlos   | Alberto       |
  | Hilario         | Carlos   | Alberto       |
  | Emmanuel        | Alberto  | Ruben         |
  | José Manuel     | Emmanuel | Alberto       |
  | David           | Emmanuel | Alberto       |
  | Oscar           | Emmanuel | Alberto       |
  | Francois        | Alberto  | Ruben         |
  | Lionel          | Francois | Alberto       |
  | Laurent         | Francois | Alberto       |
  | Michael         | Alberto  | Ruben         |
  | Walter Santiago | Michael  | Alberto       |
  | Hilary          | Alberto  | Ruben         |
  | Marcus          | Hilary   | Alberto       |
  | Lorena          | Hilary   | Alberto       |
  | Nei             | Alberto  | Ruben         |
  | Narumi          | Nei      | Alberto       |
  | Takuma          | Nei      | Alberto       |
  | Amy             | Alberto  | Ruben         |
  | Larry           | Amy      | Alberto       |
  | John            | Amy      | Alberto       |
  | Kevin           | Alberto  | Ruben         |
  | Julian          | Kevin    | Alberto       |
  | Mariko          | Kevin    | Alberto       |
  +-----------------+----------+---------------+
  ```

  

10. Devuelve el nombre de los clientes a los que no se les ha entregado a
    tiempo un pedido.

    ```sql
    SELECT c.nombre_cliente
    FROM cliente c
    INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    WHERE p.fecha_entrega > p.fecha_esperada;
    Empty set (0.00 sec)
    ```
    
    
    
11. Devuelve un listado de las diferentes gamas de producto que ha comprado
    cada cliente.

    ```sql
    SELECT c.nombre_cliente, gp.gama
    FROM cliente AS c
    INNER JOIN pedido AS p ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN detalle_pedido AS dp ON p.codigo_pedido = dp.codigo_pedido
    INNER JOIN producto AS prod ON dp.codigo_producto = prod.codigo_producto
    INNER JOIN gama_producto AS gp ON prod.codigo_gama = gp.codigo_gama
    GROUP BY c.nombre_cliente, gp.gama;
    
    +--------------------------------+--------------+
    | nombre_cliente                 | gama         |
    +--------------------------------+--------------+
    | GoldFish Garden                | Herbaceas    |
    | Lasas S.A.                     | Herbaceas    |
    | Beragua                        | Herbaceas    |
    | Club Golf Puerta del hierro    | Herbaceas    |
    | Naturagua                      | Herbaceas    |
    | DaraDistribuciones             | Herramientas |
    | Madrileña de riegos            | Herramientas |
    | Lasas S.A.                     | Herramientas |
    | Jardines y Mansiones Cactus SL | Herramientas |
    | france telecom                 | Herramientas |
    | Top Campo                      | Herramientas |
    | Gardening Associates           | Aromáticas   |
    | Camunas Jardines S.L.          | Aromáticas   |
    | Dardena S.A.                   | Aromáticas   |
    | Jardin de Flores               | Aromáticas   |
    | Gerudo Valley                  | Frutales     |
    | Flores Marivi                  | Frutales     |
    | Flowers, S.A                   | Frutales     |
    | Naturajardin                   | Frutales     |
    | Fuenla City                    | Frutales     |
    | Campohermoso                   | Frutales     |
    | Tendo Garden                   | Ornamentales |
    | Golf S.A.                      | Ornamentales |
    | Americh Golf Management SL     | Ornamentales |
    | Aloha                          | Ornamentales |
    | Jardinerías Matías SL          | Ornamentales |
    | Musée du Louvre                | Ornamentales |
    | Agrojardin                     | Ornamentales |
    | Jardineria Sara                | Ornamentales |
    +--------------------------------+--------------+
    ```


     ## Consultas multitabla (Composición externa)
    
    Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
    LEFT JOIN y NATURAL RIGHT JOIN.
    
    
    
1. Devuelve un listado que muestre solamente los clientes que no han
      realizado ningún pago.

   ```sql
   SELECT c.codigo_cliente, c.nombre_cliente
   FROM cliente AS c
   LEFT JOIN pago AS p ON c.codigo_cliente = p.codigo_cliente
   WHERE p.codigo_pago IS NULL;
   
   +----------------+-----------------------------+
   | codigo_cliente | nombre_cliente              |
   +----------------+-----------------------------+
   |              6 | Lasas S.A.                  |
   |              8 | Club Golf Puerta del hierro |
   |             10 | DaraDistribuciones          |
   |             11 | Madrileña de riegos         |
   |             12 | Lasas S.A.                  |
   |             17 | Flowers, S.A                |
   |             18 | Naturajardin                |
   |             20 | Americh Golf Management SL  |
   |             21 | Aloha                       |
   |             22 | El Prat                     |
   |             24 | Vivero Humanes              |
   |             25 | Fuenla City                 |
   |             29 | Top Campo                   |
   |             31 | Campohermoso                |
   |             32 | france telecom              |
   |             33 | Musée du Louvre             |
   |             36 | Flores S.L.                 |
   |             37 | The Magic Garden            |
   +----------------+-----------------------------+
   ```

   

2. Devuelve un listado que muestre solamente los clientes que no han
      realizado ningún pedido.

   ```sql
   SELECT c.codigo_cliente, c.nombre_cliente
   FROM cliente AS c
   LEFT JOIN pedido AS p ON c.codigo_cliente = p.codigo_cliente
   WHERE p.codigo_pedido IS NULL;
   
   Empty set (0.01 sec)
   ```

   

3. Devuelve un listado que muestre los clientes que no han realizado ningún
      pago y los que no han realizado ningún pedido.

   ```sql
   SELECT c.codigo_cliente, c.nombre_cliente
   FROM cliente AS c
   LEFT JOIN pago AS p ON c.codigo_cliente = p.codigo_cliente
   LEFT JOIN pedido AS pd ON c.codigo_cliente = pd.codigo_cliente
   WHERE p.codigo_pago IS NULL AND pd.codigo_pedido IS NULL;
   
   Empty set (0.18 sec)
   ```

   

4. Devuelve un listado que muestre solamente los empleados que no tienen
      una oficina asociada.

   ```sql
   SELECT e.codigo_empleado, e.nombre_empleado
   FROM empleado AS e
   LEFT JOIN oficina AS o ON e.codigo_oficina = o.codigo_oficina
   WHERE o.codigo_oficina IS NULL;
   
   Empty set (0.03 sec)
   ```

   

5. Devuelve un listado que muestre solamente los empleados que no tienen un
      cliente asociado.

   ```sql
   SELECT e.nombre_empleado AS Nombre
   FROM empleado AS e
   LEFT JOIN cliente AS c ON e.codigo_empleado = c.codigo_rep_ventas
   WHERE c.codigo_cliente IS NULL;
   
   +----------+
   | Nombre   |
   +----------+
   | Marcos   |
   | Ruben    |
   | Alberto  |
   | Maria    |
   | Carlos   |
   | Emmanuel |
   | Francois |
   | Michael  |
   | Hilary   |
   | Nei      |
   | Amy      |
   | Kevin    |
   +----------+
   ```

   

6. Devuelve un listado que muestre solamente los empleados que no tienen un
      cliente asociado junto con los datos de la oficina donde trabajan.

   ```sql
   SELECT e.codigo_empleado, e.nombre_empleado, o.codigo_oficina, o.codigo_ciudad, o.codigo_postal
   FROM empleado AS e
   LEFT JOIN cliente AS c ON e.codigo_empleado = c.codigo_rep_ventas
   LEFT JOIN oficina AS o ON e.codigo_oficina = o.codigo_oficina
   WHERE c.codigo_cliente IS NULL;
   
   +-----------------+-----------------+----------------+---------------+---------------+
   | codigo_empleado | nombre_empleado | codigo_oficina | codigo_ciudad | codigo_postal |
   +-----------------+-----------------+----------------+---------------+---------------+
   |               1 | Marcos          |              8 |             8 | 8             |
   |               2 | Ruben           |              8 |             8 | 8             |
   |               3 | Alberto         |              8 |             8 | 8             |
   |               4 | Maria           |              8 |             8 | 8             |
   |               7 | Carlos          |              4 |             4 | 4             |
   |              11 | Emmanuel        |              1 |             1 | 1             |
   |              15 | Francois        |              5 |             5 | 5             |
   |              18 | Michael         |              6 |             6 | 6             |
   |              20 | Hilary          |              2 |             2 | 2             |
   |              23 | Nei             |              9 |             9 | 9             |
   |              26 | Amy             |              3 |             3 | 3             |
   |              29 | Kevin           |              7 |             7 | 7             |
   +-----------------+-----------------+----------------+---------------+---------------+
   
   ```

   

7. Devuelve un listado que muestre los empleados que no tienen una oficina
      asociada y los que no tienen un cliente asociado.

   ```sql
   SELECT e.codigo_empleado, e.nombre_empleado
   FROM empleado AS e
   LEFT JOIN oficina AS o ON e.codigo_oficina = o.codigo_oficina
   LEFT JOIN cliente AS c ON e.codigo_empleado = c.codigo_rep_ventas
   WHERE o.codigo_oficina IS NULL AND c.codigo_cliente IS NULL;
   
   Empty set (0.00 sec)
   ```

   

8. Devuelve un listado de los productos que nunca han aparecido en un
      pedido.

   ```sql
   SELECT p.codigo_producto, p.nombre
   FROM producto AS p
   LEFT JOIN detalle_pedido AS dp ON p.codigo_producto = dp.codigo_producto
   WHERE dp.codigo_producto IS NULL;
   
   +-----------------+-----------------------+
   | codigo_producto | nombre                |
   +-----------------+-----------------------+
   | PRD002          | Caja de Rosas Blancas |
   | PRD031          | Dalia                 |
   | PRD032          | Azalea                |
   | PRD033          | Begonia               |
   +-----------------+-----------------------+
   ```

   

9. Devuelve un listado de los productos que nunca han aparecido en un
      pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
      producto.

   ```sql
   SELECT p.nombre, p.descripcion, gp.imagen
   FROM producto AS p
   LEFT JOIN detalle_pedido AS dp ON p.codigo_producto = dp.codigo_producto
   LEFT JOIN gama_producto AS gp ON p.codigo_gama = gp.codigo_gama
   WHERE dp.codigo_producto IS NULL;
   
   +-----------------------+-----------------------------------+--------+
   | nombre                | descripcion                       | imagen |
   +-----------------------+-----------------------------------+--------+
   | Caja de Rosas Blancas | Caja de rosas blancas para regalo | NULL   |
   | Dalia                 | Flores de dalia en varios colores | NULL   |
   | Azalea                | Planta de azalea para jardines    | NULL   |
   | Begonia               | Flores de begonia en maceta       | NULL   |
   +-----------------------+-----------------------------------+--------+
   ```

   

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que
    hayan sido los representantes de ventas de algún cliente que haya realizado
    la compra de algún producto de la gama Frutales.

    ```sql
    SELECT DISTINCT o.codigo_oficina, o.codigo_ciudad, o.codigo_postal
    FROM oficina o
    LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
    LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_rep_ventas
    LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    LEFT JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
    LEFT JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
    LEFT JOIN gama_producto gp ON pr.codigo_gama = gp.codigo_gama
    WHERE gp.gama = 'Frutales' AND e.codigo_empleado IS NULL;
    
    Empty set (0.01 sec)
    ```
    
    
    
11. Devuelve un listado con los clientes que han realizado algún pedido pero no
    han realizado ningún pago.

    ```sql
    SELECT c.codigo_cliente, c.nombre_cliente
    FROM cliente c
    LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    LEFT JOIN pago pa ON c.codigo_cliente = pa.codigo_cliente
    WHERE p.codigo_pedido IS NOT NULL AND pa.codigo_pago IS NULL;
    
    +----------------+-----------------------------+
    | codigo_cliente | nombre_cliente              |
    +----------------+-----------------------------+
    |              6 | Lasas S.A.                  |
    |              8 | Club Golf Puerta del hierro |
    |             10 | DaraDistribuciones          |
    |             11 | Madrileña de riegos         |
    |             12 | Lasas S.A.                  |
    |             17 | Flowers, S.A                |
    |             18 | Naturajardin                |
    |             20 | Americh Golf Management SL  |
    |             21 | Aloha                       |
    |             22 | El Prat                     |
    |             24 | Vivero Humanes              |
    |             25 | Fuenla City                 |
    |             29 | Top Campo                   |
    |             31 | Campohermoso                |
    |             32 | france telecom              |
    |             33 | Musée du Louvre             |
    |             36 | Flores S.L.                 |
    |             37 | The Magic Garden            |
    +----------------+-----------------------------+
    ```
    
    
    
12. Devuelve un listado con los datos de los empleados que no tienen clientes
    asociados y el nombre de su jefe asociado.

    ```sql
    SELECT CONCAT(e.nombre_empleado,' ', e.apellido1_empleado,' ', ifnull(e.apellido2_empleado,'')) AS nombre_empleado, e.email_empleado, e.codigo_jefe, CONCAT(j.nombre_empleado,' ', j.apellido1_empleado,' ', ifnull(j.apellido2_empleado,'')) AS nombre_jefe
    FROM empleado e
    LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_rep_ventas
    LEFT JOIN empleado j ON e.codigo_jefe = j.codigo_empleado
    WHERE c.codigo_rep_ventas IS NULL;
    
    +------------------------+---------------------------+-------------+------------------------+
    | nombre_empleado        | email_empleado            | codigo_jefe | nombre_jefe            |
    +------------------------+---------------------------+-------------+------------------------+
    | Marcos Magaña Perez    | marcos@jardineria.es      |        NULL | NULL                   |
    | Ruben López Martinez   | rlopez@jardineria.es      |           1 | Marcos Magaña Perez    |
    | Alberto Soria Carrasco | asoria@jardineria.es      |           2 | Ruben López Martinez   |
    | Maria Solís Jerez      | msolis@jardineria.es      |           2 | Ruben López Martinez   |
    | Carlos Soria Jimenez   | csoria@jardineria.es      |           3 | Alberto Soria Carrasco |
    | Emmanuel Magaña Perez  | manu@jardineria.es        |           3 | Alberto Soria Carrasco |
    | Francois Fignon        | ffignon@gardening.com     |           3 | Alberto Soria Carrasco |
    | Michael Bolton         | mbolton@gardening.com     |           3 | Alberto Soria Carrasco |
    | Hilary Washington      | hwashington@gardening.com |           3 | Alberto Soria Carrasco |
    | Nei Nishikori          | nnishikori@gardening.com  |           3 | Alberto Soria Carrasco |
    | Amy Johnson            | ajohnson@gardening.com    |           3 | Alberto Soria Carrasco |
    | Kevin Fallmer          | kfalmer@gardening.com     |           3 | Alberto Soria Carrasco |
    +------------------------+---------------------------+-------------+------------------------+
    
    
    ```


     ## Consultas resumen
    
1. ¿Cuántos empleados hay en la compañía?

    ```sql
    SELECT COUNT(codigo_empleado) AS total_empleados
    FROM empleado;
    
    +-----------------+
    | total_empleados |
    +-----------------+
    |              31 |
    +-----------------+
    ```

    

2. ¿Cuántos clientes tiene cada país?

    ```sql
    SELECT p.nombre_pais, COUNT(c.codigo_cliente) AS total_clientes
    FROM cliente c
    JOIN ciudad ci ON c.codigo_ciudad = ci.codigo_ciudad
    JOIN region r ON ci.codigo_region = r.codigo_region
    JOIN pais p ON r.codigo_pais = p.codigo_pais
    GROUP BY p.nombre_pais;
    
    +-------------+----------------+
    | nombre_pais | total_clientes |
    +-------------+----------------+
    | Australia   |              1 |
    | España      |             12 |
    | Francia     |              5 |
    | Japón       |              4 |
    | Inglaterra  |              4 |
    | EEUU        |             10 |
    +-------------+----------------+
    ```

    

3. ¿Cuál fue el pago medio en 2009?

    ```sql
    SELECT AVG(total_pago) AS pago_medio_2009
    FROM pago
    WHERE YEAR(fecha_pago) = 2009;
    
    +-----------------+
    | pago_medio_2009 |
    +-----------------+
    |     4504.076923 |
    +-----------------+
    ```

    

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
      descendente por el número de pedidos.

   ```sql
   SELECT estado.nombre AS nombre_estado, COUNT(*) AS cantidad_pedidos
   FROM pedido
   JOIN estado ON pedido.codigo_estado = estado.codigo_estado
   GROUP BY estado.nombre
   ORDER BY cantidad_pedidos DESC;
   
   +---------------+------------------+
   | nombre_estado | cantidad_pedidos |
   +---------------+------------------+
   | Entregado     |               14 |
   | Rechazado     |               12 |
   | Pendiente     |               11 |
   +---------------+------------------+
   ```

   

5. Calcula el precio de venta del producto más caro y más barato en una
      misma consulta.

   ```sql
   SELECT MAX(precio_venta) AS precio_mas_caro, MIN(precio_venta) AS precio_mas_barato
   FROM producto;
   
   +-----------------+-------------------+
   | precio_mas_caro | precio_mas_barato |
   +-----------------+-------------------+
   |           60.00 |              5.99 |
   +-----------------+-------------------+
   ```

   

6. Calcula el número de clientes que tiene la empresa.

    ```sql
    SELECT COUNT(codigo_cliente) AS total_clientes
    FROM cliente;
    
    +----------------+
    | total_clientes |
    +----------------+
    |             36 |
    +----------------+
    ```

    

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

    ```sql
    SELECT COUNT(codigo_cliente) AS total_clientes_madrid
    FROM cliente
    WHERE codigo_ciudad = 4;
    
    +-----------------------+
    | total_clientes_madrid |
    +-----------------------+
    |                     2 |
    +-----------------------+
    ```

    

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
      por M?

   ```sql
   SELECT ci.nombre_ciudad, COUNT(cl.codigo_cliente) AS total_clientes
   FROM ciudad ci
   INNER JOIN cliente cl ON ci.codigo_ciudad = cl.codigo_ciudad
   WHERE ci.nombre_ciudad LIKE 'M%'
   GROUP BY ci.nombre_ciudad;
   
   +---------------+----------------+
   | nombre_ciudad | total_clientes |
   +---------------+----------------+
   | Madrid        |              2 |
   +---------------+----------------+
   ```

   

9. Devuelve el nombre de los representantes de ventas y el número de clientes
      al que atiende cada uno.

   ```sql
   SELECT CONCAT(e.nombre_empleado, ' ', e.apellido1_empleado) AS representante_ventas,
          COUNT(c.codigo_cliente) AS num_clientes
   FROM empleado e
   LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_rep_ventas
   GROUP BY e.codigo_empleado;
   
   +-------------------------+--------------+
   | representante_ventas    | num_clientes |
   +-------------------------+--------------+
   | Marcos Magaña           |            0 |
   | Ruben López             |            0 |
   | Alberto Soria           |            0 |
   | Maria Solís             |            0 |
   | Felipe Rosas            |            2 |
   | Juan Carlos Ortiz       |            2 |
   | Carlos Soria            |            0 |
   | Mariano López           |            2 |
   | Lucio Campoamor         |            2 |
   | Hilario Rodriguez       |            2 |
   | Emmanuel Magaña         |            0 |
   | José Manuel Martinez    |            2 |
   | David Palma             |            1 |
   | Oscar Palma             |            1 |
   | Francois Fignon         |            0 |
   | Lionel Narvaez          |            3 |
   | Laurent Serra           |            1 |
   | Michael Bolton          |            0 |
   | Walter Santiago Sanchez |            1 |
   | Hilary Washington       |            0 |
   | Marcus Paxton           |            1 |
   | Lorena Paxton           |            1 |
   | Nei Nishikori           |            0 |
   | Narumi Riko             |            7 |
   | Takuma Nomura           |            2 |
   | Amy Johnson             |            0 |
   | Larry Westfalls         |            1 |
   | John Walton             |            1 |
   | Kevin Fallmer           |            0 |
   | Julian Bellinelli       |            2 |
   | Mariko Kishi            |            2 |
   +-------------------------+--------------+
   ```

   

10. Calcula el número de clientes que no tiene asignado representante de
    ventas.

    ```sql
    SELECT COUNT(codigo_cliente) AS clientes_sin_representante
    FROM cliente
    WHERE codigo_rep_ventas IS NULL OR codigo_rep_ventas = '';
    
    +-----------------------------+
    | num_clientes_sin_rep_ventas |
    +-----------------------------+
    |                           0 |
    +-----------------------------+
    ```
    
    
    
11. Calcula la fecha del primer y último pago realizado por cada uno de los
    clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

    ```sql
    SELECT cliente.nombre_cliente, MIN(pago.fecha_pago) AS primer_pago, MAX(pago.fecha_pago) AS ultimo_pago
    FROM cliente
    LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
    GROUP BY cliente.nombre_cliente;
    +--------------------------------+-------------+-------------+
    | nombre_cliente                 | primer_pago | ultimo_pago |
    +--------------------------------+-------------+-------------+
    | GoldFish Garden                | 2008-11-10  | 2008-12-10  |
    | Gardening Associates           | 2009-01-16  | 2009-02-19  |
    | Gerudo Valley                  | 2007-01-08  | 2007-01-08  |
    | Tendo Garden                   | 2006-01-18  | 2006-01-18  |
    | Lasas S.A.                     | NULL        | NULL        |
    | Beragua                        | 2009-01-13  | 2009-01-13  |
    | Club Golf Puerta del hierro    | NULL        | NULL        |
    | Naturagua                      | 2009-01-06  | 2009-01-06  |
    | DaraDistribuciones             | NULL        | NULL        |
    | Madrileña de riegos            | NULL        | NULL        |
    | Camunas Jardines S.L.          | 2008-08-04  | 2008-08-04  |
    | Dardena S.A.                   | 2008-07-15  | 2008-07-15  |
    | Jardin de Flores               | 2009-01-15  | 2009-02-15  |
    | Flores Marivi                  | 2009-02-16  | 2009-02-16  |
    | Flowers, S.A                   | NULL        | NULL        |
    | Naturajardin                   | NULL        | NULL        |
    | Golf S.A.                      | 2009-03-06  | 2009-03-06  |
    | Americh Golf Management SL     | NULL        | NULL        |
    | Aloha                          | NULL        | NULL        |
    | El Prat                        | NULL        | NULL        |
    | Sotogrande                     | 2009-03-26  | 2009-03-26  |
    | Vivero Humanes                 | NULL        | NULL        |
    | Fuenla City                    | NULL        | NULL        |
    | Jardines y Mansiones Cactus SL | 2008-03-18  | 2008-03-18  |
    | Jardinerías Matías SL          | 2009-02-08  | 2009-02-08  |
    | Agrojardin                     | 2009-01-13  | 2009-01-13  |
    | Top Campo                      | NULL        | NULL        |
    | Jardineria Sara                | 2009-01-16  | 2009-01-16  |
    | Campohermoso                   | NULL        | NULL        |
    | france telecom                 | NULL        | NULL        |
    | Musée du Louvre                | NULL        | NULL        |
    | Tutifruti S.A                  | 2007-10-06  | 2007-10-06  |
    | Flores S.L.                    | NULL        | NULL        |
    | The Magic Garden               | NULL        | NULL        |
    | El Jardin Viviente S.L         | 2006-05-26  | 2006-05-26  |
    +--------------------------------+-------------+-------------+
    ```
    
    
    
12. Calcula el número de productos diferentes que hay en cada uno de los
    pedidos.

    ```sql
    SELECT codigo_pedido, COUNT(DISTINCT codigo_producto) AS num_productos_diferentes
    FROM detalle_pedido
    GROUP BY codigo_pedido;
    
    +---------------+--------------------------+
    | codigo_pedido | num_productos_diferentes |
    +---------------+--------------------------+
    | PED001        |                        1 |
    | PED003        |                        1 |
    | PED004        |                        1 |
    | PED005        |                        1 |
    | PED006        |                        1 |
    | PED007        |                        1 |
    | PED008        |                        1 |
    | PED009        |                        1 |
    | PED010        |                        1 |
    | PED011        |                        1 |
    | PED012        |                        1 |
    | PED013        |                        1 |
    | PED014        |                        1 |
    | PED015        |                        1 |
    | PED016        |                        1 |
    | PED017        |                        1 |
    | PED018        |                        1 |
    | PED019        |                        1 |
    | PED020        |                        1 |
    | PED021        |                        1 |
    | PED025        |                        1 |
    | PED026        |                        1 |
    | PED027        |                        1 |
    | PED028        |                        1 |
    | PED029        |                        1 |
    | PED030        |                        1 |
    | PED031        |                        1 |
    | PED032        |                        1 |
    | PED033        |                        1 |
    +---------------+--------------------------+
    ```
    
    
    
13. Calcula la suma de la cantidad total de todos los productos que aparecen en
    cada uno de los pedidos.

    ```sql
    SELECT codigo_pedido, SUM(cantidad) AS cantidad_total_productos
    FROM detalle_pedido
    GROUP BY codigo_pedido;
    
    +---------------+--------------------------+
    | codigo_pedido | cantidad_total_productos |
    +---------------+--------------------------+
    | PED001        |                        5 |
    | PED003        |                        2 |
    | PED004        |                        4 |
    | PED005        |                        6 |
    | PED006        |                        1 |
    | PED007        |                        2 |
    | PED008        |                        3 |
    | PED009        |                        5 |
    | PED010        |                        2 |
    | PED011        |                        3 |
    | PED012        |                        4 |
    | PED013        |                        2 |
    | PED014        |                        1 |
    | PED015        |                        3 |
    | PED016        |                        4 |
    | PED017        |                        5 |
    | PED018        |                        3 |
    | PED019        |                        2 |
    | PED020        |                        6 |
    | PED021        |                        1 |
    | PED025        |                        3 |
    | PED026        |                        5 |
    | PED027        |                        2 |
    | PED028        |                        3 |
    | PED029        |                        4 |
    | PED030        |                        3 |
    | PED031        |                        4 |
    | PED032        |                        2 |
    | PED033        |                        3 |
    +---------------+--------------------------+
    ```
    
    
    
14. Devuelve un listado de los 20 productos más vendidos y el número total de
    unidades que se han vendido de cada uno. El listado deberá estar ordenado
    por el número total de unidades vendidas.

    ```sql
    SELECT p.nombre AS nombre_producto, SUM(dp.cantidad) AS total_unidades_vendidas
    FROM producto AS p
    JOIN detalle_pedido AS dp ON p.codigo_producto = dp.codigo_producto
    GROUP BY p.codigo_producto
    ORDER BY total_unidades_vendidas DESC
    LIMIT 20;
    
    +----------------------------+-------------------------+
    | nombre_producto            | total_unidades_vendidas |
    +----------------------------+-------------------------+
    | Kit de Plantación          |                       7 |
    | Semillas de Tomate         |                       7 |
    | Cesta de Plantas Variadas  |                       6 |
    | Azalea                     |                       6 |
    | Ramo de Rosas Rojas        |                       5 |
    | Amapolas                   |                       5 |
    | Fertilizante Orgánico      |                       5 |
    | Limón                      |                       5 |
    | Orquídea Phalaenopsis      |                       4 |
    | Kit de Jardinería Infantil |                       4 |
    | Regadera                   |                       4 |
    | Manzano                    |                       4 |
    | Set de Macetas de Cerámica |                       3 |
    | Terrario de Suculentas     |                       3 |
    | Helechos                   |                       3 |
    | Tijeras de podar           |                       3 |
    | Albahaca                   |                       3 |
    | Naranjo                    |                       3 |
    | Lavanda                    |                       2 |
    | Menta                      |                       2 |
    +----------------------------+-------------------------+
    ```
    
    
    
15. La facturación que ha tenido la empresa en toda la historia, indicando la
    base imponible, el IVA y el total facturado. La base imponible se calcula
    sumando el coste del producto por el número de unidades vendidas de la
    tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
    suma de los dos campos anteriores.

    ```sql
    SELECT 
        SUM(dp.precio_unidad * dp.cantidad) AS base_imponible,
        SUM(dp.precio_unidad * dp.cantidad * 0.21) AS iva,
        SUM(dp.precio_unidad * dp.cantidad * 1.21) AS total_facturado
    FROM detalle_pedido AS dp;
    
    +----------------+----------+-----------------+
    | base_imponible | iva      | total_facturado |
    +----------------+----------+-----------------+
    |        1737.59 | 364.8939 |       2102.4839 |
    +----------------+----------+-----------------+
    ```
    
    
    
16. La misma información que en la pregunta anterior, pero agrupada por
    código de producto.

    ```sql
    SELECT 
        dp.codigo_producto,
        SUM(dp.precio_unidad * dp.cantidad) AS base_imponible,
        SUM(dp.precio_unidad * dp.cantidad * 0.21) AS iva,
        SUM(dp.precio_unidad * dp.cantidad * 1.21) AS total_facturado
    FROM detalle_pedido AS dp
    GROUP BY dp.codigo_producto;
    
    +-----------------+----------------+---------+-----------------+
    | codigo_producto | base_imponible | iva     | total_facturado |
    +-----------------+----------------+---------+-----------------+
    | PRD001          |          62.50 | 13.1250 |         75.6250 |
    | PRD003          |          17.50 |  3.6750 |         21.1750 |
    | PRD004          |          43.96 |  9.2316 |         53.1916 |
    | PRD005          |          47.94 | 10.0674 |         58.0074 |
    | PRD006          |          18.50 |  3.8850 |         22.3850 |
    | PRD007          |          28.50 |  5.9850 |         34.4850 |
    | PRD008          |          62.97 | 13.2237 |         76.1937 |
    | PRD009          |          83.75 | 17.5875 |        101.3375 |
    | PRD010          |          23.98 |  5.0358 |         29.0158 |
    | PRD011          |          28.50 |  5.9850 |         34.4850 |
    | PRD012          |          91.00 | 19.1100 |        110.1100 |
    | PRD013          |          57.98 | 12.1758 |         70.1558 |
    | PRD014          |          32.50 |  6.8250 |         39.3250 |
    | PRD015          |          89.97 | 18.8937 |        108.8637 |
    | PRD016          |          71.96 | 15.1116 |         87.0716 |
    | PRD017          |          63.75 | 13.3875 |         77.1375 |
    | PRD018          |          64.50 | 13.5450 |         78.0450 |
    | PRD019          |          39.98 |  8.3958 |         48.3758 |
    | PRD020          |          87.00 | 18.2700 |        105.2700 |
    | PRD021          |          27.75 |  5.8275 |         33.5775 |
    | PRD025          |         180.21 | 37.8441 |        218.0541 |
    | PRD026          |         148.45 | 31.1745 |        179.6245 |
    | PRD027          |         118.97 | 24.9837 |        143.9537 |
    | PRD028          |          44.97 |  9.4437 |         54.4137 |
    | PRD029          |         127.00 | 26.6700 |        153.6700 |
    | PRD030          |          73.50 | 15.4350 |         88.9350 |
    +-----------------+----------------+---------+-----------------+
    ```
    
    
    
17. La misma información que en la pregunta anterior, pero agrupada por
    código de producto filtrada por los códigos que empiecen por OR.

    ```sql
    SELECT 
        dp.codigo_producto,
        SUM(dp.precio_unidad * dp.cantidad) AS base_imponible,
        SUM(dp.precio_unidad * dp.cantidad) * 0.21 AS iva,
        SUM(dp.precio_unidad * dp.cantidad) * 1.21 AS total_facturado
    FROM detalle_pedido dp
    JOIN producto p ON dp.codigo_producto = p.codigo_producto
    WHERE p.codigo_producto LIKE 'OR%'
    GROUP BY dp.codigo_producto;
    
    Empty set (0.02 sec)
    ```
    
    
    
18. Lista las ventas totales de los productos que hayan facturado más de 3000
    euros. Se mostrará el nombre, unidades vendidas, total facturado y total
    facturado con impuestos (21% IVA).

    ```sql
    SELECT 
        p.nombre AS nombre_producto,
        SUM(dp.cantidad) AS unidades_vendidas,
        SUM(dp.precio_unidad * dp.cantidad) AS total_facturado_sin_iva,
        SUM(dp.precio_unidad * dp.cantidad * 1.21) AS total_facturado_con_iva
    FROM detalle_pedido AS dp
    JOIN producto AS p ON dp.codigo_producto = p.codigo_producto
    GROUP BY dp.codigo_producto
    HAVING total_facturado_con_iva > 3000;
    
    Empty set (0.01 sec)
    ```
    
    
    
19. Muestre la suma total de todos los pagos que se realizaron para cada uno
    de los años que aparecen en la tabla pagos.

    ```sql
    SELECT YEAR(fecha_pago) AS año, SUM(total_pago) AS suma_total_pagos
    FROM pago
    GROUP BY YEAR(fecha_pago);
    
    +------+------------------+
    | año  | suma_total_pagos |
    +------+------------------+
    | 2008 |         29252.00 |
    | 2009 |         58553.00 |
    | 2007 |         85170.00 |
    | 2006 |         24965.00 |
    +------+------------------+
    ```


Todos los archivos SQL incluido en este repositorio, fue creado por [Maritza Velasco Esteban](https://github.com/mvelascoe). Proporciona datos de ejemplo para la base de datos del proyecto.
