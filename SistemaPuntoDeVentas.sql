
CREATE DATABASE SistemaPuntoDeVentas;

USE SistemaPuntoDeVentas;

CREATE TABLE oficinas (
    id_oficina VARCHAR(10) PRIMARY KEY,
    ciudad VARCHAR(50),
    telefono VARCHAR(50),
    direccion VARCHAR(50),
    departamento VARCHAR(50),
    codigoPostal VARCHAR(15),
    continente VARCHAR(10)
);

CREATE TABLE clientes (
    id_cliente INT(11) AUTO_INCREMENT PRIMARY KEY,
    id_oficina VARCHAR(10),
    empresa VARCHAR(50),
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    telefono VARCHAR(50),
    direccion VARCHAR(50),
    ciudad VARCHAR(50),
    departamento VARCHAR(50),
    empleadoAtiende INT(11),
    limiteCredito DOUBLE,
    FOREIGN KEY (id_oficina) REFERENCES oficinas(id_oficina)
);

CREATE TABLE pais (
    codigoPostal VARCHAR(15) PRIMARY KEY,
    pais VARCHAR(50)
);

CREATE TABLE ordenes (
    id_orden INT(11) AUTO_INCREMENT PRIMARY KEY,
    fechaEntrega DATE,
    estado VARCHAR(15),
    observacion TEXT,
    fechaRecibido DATE,
    fechaLimiteEntrega DATE,
    id_cliente INT(11),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE detallesordenes (
    id_producto VARCHAR(15),
    cantidadPedida INT(11),
    valorUnitario DOUBLE,
    ordenEntrega INT(6),
    id_orden INT(11),
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden)
);

CREATE TABLE empleados (
    documento INT(11) PRIMARY KEY,
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(100),
    id_oficina VARCHAR(10),
    jefe INT(11),
    cargo VARCHAR(50),
    FOREIGN KEY (id_oficina) REFERENCES oficinas(id_oficina)
);

CREATE TABLE pagos (
    id_cliente INT(11),
    numeroFactura VARCHAR(50),
    fechaPago DATE,
    totalPago DOUBLE,
    id_orden INT(11),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden)
);

CREATE TABLE productos (
    id_producto VARCHAR(15) PRIMARY KEY,
    nombreProducto VARCHAR(70),
    id_lineaProducto INT(5),
    escala VARCHAR(10),
    cantidad INT(6),
    precioVenta DOUBLE,
    MSRP DOUBLE
);

CREATE TABLE lineasproductos (
    id_lineaProducto INT(5) PRIMARY KEY,
    nombreLinea VARCHAR(50),
    textoDescripcion VARCHAR(4000),
    htmlDescripcion VARCHAR(200),
    Imagen VARCHAR(200)
);

ALTER TABLE oficinas
ADD CLista ENUM('En01', 'En02', 'En03'),
ADD YesNoType BOOLEAN;

ALTER TABLE clientes
ADD CLista ENUM('En01', 'En02', 'En03'),
ADD YesNoType BOOLEAN;

ALTER TABLE pais
ADD CLista ENUM('En01', 'En02', 'En03'),
ADD YesNoType BOOLEAN;

ALTER TABLE ordenes
ADD CLista ENUM('En01', 'En02', 'En03'),
ADD YesNoType BOOLEAN;

ALTER TABLE detallesordenes
ADD CLista ENUM('En01', 'En02', 'En03'),
ADD YesNoType BOOLEAN;

ALTER TABLE empleados
ADD CLista ENUM('En01', 'En02', 'En03'),
ADD YesNoType BOOLEAN;

ALTER TABLE pagos
ADD CLista ENUM('En01', 'En02', 'En03'),
ADD YesNoType BOOLEAN;

ALTER TABLE productos
ADD CLista ENUM('En01', 'En02', 'En03'),
ADD YesNoType BOOLEAN;

ALTER TABLE lineasproductos
ADD CLista ENUM('En01', 'En02', 'En03'),
ADD YesNoType BOOLEAN;

INSERT INTO oficinas (id_oficina, ciudad, telefono, direccion, departamento, codigoPostal, continente, CLista, YesNoType)
VALUES ('01', 'Chitre', '2271456', 'Calle 03', 'Chitre', '1207', 'America', 'En01', 1),
       ('02', 'Penonome', '2378995', 'Ave Domingo Diaz', 'Penonome', '1306', 'America', 'En02', 0)
       ('03', 'Parita', '3389575', 'Calle SubeBaja', 'Parita', '1235', 'America', 'En03', 1),
       ('04', 'San Miguelito', '3271405', 'Paraiso', 'Victoriano Lorenzo', '1321', 'America', 'En03', 0);
       ('05', 'David', '3216894', 'Calle Norte', 'David', '1221', 'America', 'En01', 0);

INSERT INTO clientes (id_oficina, empresa, apellido, nombre, telefono, direccion, ciudad, departamento, empleadoAtiende, limiteCredito, CLista, YesNoType)
VALUES ('01', 'EPA', 'Almengor', 'Sabina', '61409853', 'Calle Norte', 'David', 'David', 5, 12000.0, 'En01', 1),
       ('02', 'CALOX', 'Sanjur', 'Nora', '62859450', 'Ave Domingo Diaz', 'Penonome', 'Penonome', 1, 800.0, 'En03', 0),
       ('03', 'BAC', 'Galvez', 'Andrea', '66375284', 'Calle SubeBaja', 'Parita', 'Parita', 3, 5000.0, 'En01', 0),
       ('04', 'GRUPO NOVA', 'Martinez', 'Juan', '60708413', 'Paraiso', 'San Miguelito', 'Victoriano Lorenzo', 2, 7500.0, 'En02', 1),
       ('05', 'Tigo', 'Zapata', 'Pablo', '63285705', 'Calle 03', 'Chitre', 'Chitre', 4, 2000.0, 'En03', 1);

INSERT INTO pais (codigoPostal, pais, CLista, YesNoType)
VALUES ('1207', 'Panamá', 'En03', 1),
       ('1306', 'Panamá', 'En01', 1),
       ('1235', 'Panamá', 'En03', 0),
       ('1321', 'Panamá', 'En02', 0),
       ('1221', 'Panamá', 'En01', 1);

INSERT INTO ordenes (fechaEntrega, estado, observacion, fechaRecibido, fechaLimiteEntrega, id_cliente, CLista, YesNoType)
VALUES ('2023-10-18', 'Pendiente', 'Falta Una Caja', '2023-10-17', '2023-10-20', 1, 'En01', 1),
       ('2023-10-17', 'En Proceso', 'En preparación', '2023-10-16', '2023-10-19', 2, 'En03', 1),
       ('2023-10-17', 'En Proceso', 'En Camino', '2023-10-16', '2023-10-19', 3, 'En01', 0),
       ('2023-10-08', 'Completada', 'Prueba de Entrega', '2023-10-07', '2023-10-10', 4, 'En03', 0),
       ('2023-10-06', 'Completada', 'Prueba de Entrega', '2023-10-05', '2023-10-08', 5, 'En02', 1);

INSERT INTO detallesordenes (id_producto, cantidadPedida, valorUnitario, ordenEntrega, id_orden, CLista, YesNoType)
VALUES ('TV', 10, 289.99, 5, 1, 'En01', 1),
       ('Lavadora', 15, 499.99, 2, 2, 'En02', 1),
       ('Laptop', 8, 749.99, 4, 3, 'En01', 0),
       ('Bocina', 20, 78.99, 1, 4, 'En03', 1),
       ('Horno', 12, 99.99, 3, 5, 'En02', 0);

INSERT INTO empleados (documento, apellido, nombre, extension, email, id_oficina, jefe, cargo, CLista, YesNoType)
VALUES (1, 'González', 'Juan', '3007', 'juan.gonzalez@ClarkSystem.com', '01', 1, 'Gerente', 'En01', 1),
       (2, 'Pérez', 'Ana', '3250', 'ana.perez@ClarkSystem.com', '02', 5, 'Operadora', 'En01', 0),
       (3, 'Rodríguez', 'Carlos', '3070', 'carlos.rodriguez@ClarkSystem.com', '03', 1, 'Asistente de Gerente', 'En03', 1),
       (4, 'Fernández', 'Luis', '3214', 'luis.fernandez@ClarkSystem.com', '04', 3, 'Supervisor', 'En02', 1),
       (5, 'López', 'Maria', '3005', 'maria.lopez@ClarkSystem.com', '05', 3, 'Supervisor', 'En02', 0);

INSERT INTO pagos (id_cliente, numeroFactura, fechaPago, totalPago, id_orden, CLista, YesNoType)
VALUES (1, 'FAC001', '2023-10-18', 289.99, 1, 'En01', 1),
       (2, 'FAC002', '2023-10-17', 499.99, 2, 'En02', 1),
       (3, 'FAC003', '2023-10-17', 749.99, 3, 'En01', 0),
       (4, 'FAC004', '2023-10-08', 78.99, 4, 'En03', 0),
       (5, 'FAC005', '2023-10-06', 99.99, 5, 'En02', 0);

INSERT INTO productos (id_producto, nombreProducto, id_lineaProducto, escala, cantidad, precioVenta, MSRP, CLista, YesNoType)
VALUES ('TV', 'Samsung Oled 32', 1, 'ESC01', 1, 289.99, 30.0, 'En02', 1),
       ('Lavadora', 'LG', 2, 'ESC02', 2, 499.99, 35.0, 'En03', 1),
       ('Laptop', 'Dell', 1, 'ESC03', 4, 749.99, 28.0, 'En01', 0),
       ('Bocina', 'JBL', 3, 'ESC01', 10, 78.99, 22.0, 'En02', 0),
       ('Horno', 'SANKEY', 2, 'ESC02', 12, 99.99, 28.0, 'En03', 0);

INSERT INTO lineasproductos (id_lineaProducto, nombreLinea, textoDescripcion, htmlDescripcion, Imagen, CLista, YesNoType)
VALUES (1, 'L01', 'Entretenimiento', 'tvs', 'imagen01.jpg', 'En02', 1),
       (2, 'L02', 'Linea Blanca', 'Lavadoras', 'imagen02.jpg', 'En01', 1),
       (3, 'L03', 'Computo', 'notebooks', 'imagen03.jpg', 'En03', 0),
       (4, 'L03', 'Computo', 'parlantes', 'imagen04.jpg', 'En03', 1),
       (5, 'L04', 'Cocina', 'microondas', 'imagen05.jpg', 'En01', 0);

-- Mostrar la estructura de la tabla "oficinas" (incluyendo las nuevas columnas)

DESCRIBE oficinas;

DESCRIBE clientes;

DESCRIBE pais;

DESCRIBE ordenes;

DESCRIBE detallesordenes;

DESCRIBE empleados;

DESCRIBE pagos;

DESCRIBE productos;

DESCRIBE lineasproductos;













