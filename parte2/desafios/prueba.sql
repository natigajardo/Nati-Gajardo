--PARTE 2 !!

--CREAR TABLAS:

CREATE TABLE categoria (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR,
  descripcion text
);

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR,
  direccion VARCHAR,
  rut TEXT
);

CREATE TABLE producto (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR,
  descripcion TEXT,
  precio_unitario INT,
  categoria_id INT,
  FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE factura (
  id SERIAL PRIMARY KEY,
  numero INT,
  fecha DATE,
  IVA INT,
  subtotal INT,
  total INT,
  cliente_id INT,
  FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE factura_producto (
  id SERIAL PRIMARY KEY,
  cantidad INT,
  factura_id INT,
  producto_id INT,
  FOREIGN KEY (factura_id) REFERENCES factura(id),
  FOREIGN KEY (producto_id) REFERENCES producto(id)
);


-- 5 Clientes:
INSERT INTO cliente (nombre, direccion, rut) VALUES
  ('Leonardo', 'Direccion Leonardo', 111),
  ('Raphael', 'Direccion Raphael', 222),
  ('Miguel angel', 'Direccion Miguel angel', 333),
  ('Donatello', 'Direccion Donatello', 444),
  ('Splinter', 'Direccion Splinter', 555);

-- 3 Categorías:
INSERT INTO categoria (nombre, descripcion) VALUES
  ('Categoria 1', 'Descripcion categoria 1'),
  ('Categoria 2', 'Descripcion categoria 2'),
  ('Categoria 3', 'Descripcion categoria 3');

-- 8 Productos:
INSERT INTO producto (nombre, descripcion, precio_unitario, categoria_id) VALUES
  ('Producto 1_1', 'Descripcion del producto 1_1', 100, 1),
  ('Producto 1_2', 'Descripcion del producto 1_2', 100, 1),
  ('Producto 1_3', 'Descripcion del producto 1_3', 100, 1),
  ('Producto 2_1', 'Descripcion del producto 2_1', 200, 2),
  ('Producto 2_2', 'Descripcion del producto 2_2', 200, 2),
  ('Producto 2_3', 'Descripcion del producto 2_3', 200, 2),
  ('Producto 3_1', 'Descripcion del producto 3_1', 300, 3),
  ('Producto 3_2', 'Descripcion del producto 3_2', 300, 3);

--INSERTAR 10 FACTURAS
--2 para el cliente 1, con 2 y 3 productos
--3 para el cliente 2, con 3, 2 y 3 productos
--1 para el cliente 3, con 1 producto
--4 para el cliente 4, con 2, 3, 4 y 1 producto

--cliente 1
INSERT INTO factura (fecha, iva, cliente_id) VALUES (CURRENT_DATE, 19, 1);
INSERT INTO factura_producto (factura_id, producto_id) VALUES (1, 1), (1, 2);

INSERT INTO factura (fecha, iva, cliente_id) VALUES (CURRENT_DATE, 19, 1);
INSERT INTO factura_producto (factura_id, producto_id) VALUES (2, 1), (2, 2), (2, 3);

--cliente 2
INSERT INTO factura (fecha, iva, cliente_id) VALUES (CURRENT_DATE, 19, 2);
INSERT INTO factura_producto (factura_id, producto_id) VALUES (3, 1), (3, 2), (3, 3);

INSERT INTO factura (fecha, iva, cliente_id) VALUES (CURRENT_DATE, 19, 2);
INSERT INTO factura_producto (factura_id, producto_id) VALUES (4, 1), (4, 2);

INSERT INTO factura (fecha, iva, cliente_id) VALUES (CURRENT_DATE, 19, 2);
INSERT INTO factura_producto (factura_id, producto_id) VALUES (5, 1), (5, 2), (5, 3);

--cliente 3
INSERT INTO factura (fecha, iva, cliente_id) VALUES (CURRENT_DATE, 19, 3);
INSERT INTO factura_producto (factura_id, producto_id) VALUES (6, 1);

--cliente 4
INSERT INTO factura (fecha, iva, cliente_id) VALUES (CURRENT_DATE, 19, 4);
INSERT INTO factura_producto (factura_id, producto_id) VALUES (7, 1), (7, 2);

INSERT INTO factura (fecha, iva, cliente_id) VALUES (CURRENT_DATE, 19, 4);
INSERT INTO factura_producto (factura_id, producto_id) VALUES (8, 1), (8, 2), (8, 3);

INSERT INTO factura (fecha, iva, cliente_id) VALUES (CURRENT_DATE, 19, 4);
INSERT INTO factura_producto (factura_id, producto_id) VALUES (9, 1), (9, 2), (9, 3), (9, 4);

INSERT INTO factura (fecha, iva, cliente_id) VALUES (CURRENT_DATE, 19, 4);
INSERT INTO factura_producto (factura_id, producto_id) VALUES (10, 1);


--PARTE 3 !

--PREGUNTA 1: ¿Que cliente realizó la compra más cara?
--Actualizar para agregar subtotales
UPDATE factura AS fa SET subtotal = ( select SUM(p.precio_unitario) FROM factura_producto AS fp INNER JOIN producto AS p ON fp.producto_id = p.id WHERE fp.factura_id = fa.id );

--Consulta:
SELECT c.nombre, c.rut, f.subtotal FROM cliente AS c INNER JOIN factura AS f ON f.cliente_id = c.id WHERE f.subtotal = (SELECT MAX(subtotal) FROM factura);

--PREGUNTA 2: ¿Que cliente pagó sobre 100 de monto?

SELECT DISTINCT c.rut, c.nombre FROM cliente AS c INNER JOIN factura AS f ON f.cliente_id = c.id WHERE f.subtotal > 100;

--PREGUNTA 3: ¿Cuantos clientes han comprado el producto 6. * PROBÉ CON EL ID=4, PORQUE NO PUSE NINGUN PRODUCTO CON ID=6, SOLO USE DEL 1 AL 4. 

SELECT nombre FROM cliente WHERE id IN ( SELECT cliente_id
  FROM factura
  INNER JOIN factura_producto
  ON factura.id = factura_producto.factura_id WHERE factura_producto.producto_id=4
);
