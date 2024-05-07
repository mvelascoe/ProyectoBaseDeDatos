CREATE DATABASE GreenGardenDB;
USE GreenGardenDB;

-- -----------------------------------------------------
-- Table gama_producto
-- ----------------------------------------------------
CREATE TABLE gama_producto (
  codigo_gama INT(11) NOT NULL,
  gama VARCHAR(50) NOT NULL,
  descripcion_texto TEXT(50) NULL,
  descripcion_html TEXT(50) NULL,
  imagen VARCHAR(256) NULL,
  PRIMARY KEY (codigo_gama));


-- -----------------------------------------------------
-- Table dimensiones
-- -----------------------------------------------------
CREATE TABLE dimensiones (
  codigo_dimensiones VARCHAR(15) NOT NULL,
  largo VARCHAR(7) NULL,
  alto VARCHAR(7) NULL,
  ancho VARCHAR(7) NULL,
  peso VARCHAR(7) NULL,
  PRIMARY KEY (codigo_dimensiones));


-- -----------------------------------------------------
-- Table producto
-- -----------------------------------------------------
CREATE TABLE producto (
  codigo_producto VARCHAR(15) NOT NULL,
  nombre VARCHAR(70) NOT NULL,
  codigo_gama INT(11) NOT NULL,
  cantidad_stock SMALLINT(6) NOT NULL,
  precio_venta DECIMAL(15,2) NOT NULL,
  descripcion TEXT NULL,
  codigo_dimensiones VARCHAR(15) NOT NULL,
  PRIMARY KEY (codigo_producto),
  CONSTRAINT codigo_gama
    FOREIGN KEY (codigo_gama)
    REFERENCES gama_producto (codigo_gama),
  CONSTRAINT codigo_dimensiones
    FOREIGN KEY (codigo_dimensiones)
    REFERENCES dimensiones (codigo_dimensiones)
);


-- -----------------------------------------------------
-- Table proveedor
-- -----------------------------------------------------
CREATE TABLE proveedor (
  codigo_proveedor INT(11) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(60) NOT NULL,
  PRIMARY KEY (codigo_proveedor)
);

-- -----------------------------------------------------
-- Table producto_proveedor
-- -----------------------------------------------------
CREATE TABLE producto_proveedor (
  codigo_producto VARCHAR(15) NOT NULL,
  codigo_proveedor INT(11) NOT NULL,
  precio_proveedor DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (codigo_producto, codigo_proveedor),
  CONSTRAINT FK_cod_producto
    FOREIGN KEY (codigo_producto)
    REFERENCES producto (codigo_producto),
  CONSTRAINT FK_cod_proveedor
    FOREIGN KEY (codigo_proveedor)
    REFERENCES proveedor (codigo_proveedor)
    );


-- -----------------------------------------------------
-- Table estado
-- -----------------------------------------------------
CREATE TABLE estado (
  codigo_estado INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(25) NOT NULL,
  PRIMARY KEY (codigo_estado));


-- -----------------------------------------------------
-- Table pais
-- -----------------------------------------------------
CREATE TABLE pais (
  codigo_pais VARCHAR(5) NOT NULL,
  nombre_pais VARCHAR(50) NOT NULL,
  PRIMARY KEY (codigo_pais));


-- -----------------------------------------------------
-- Table region
-- -----------------------------------------------------
CREATE TABLE region (
  codigo_region VARCHAR(10) NOT NULL,
  nombre_region VARCHAR(50) NOT NULL,
  codigo_pais VARCHAR(5) NOT NULL,
  PRIMARY KEY (codigo_region),
  CONSTRAINT codigo_pais
    FOREIGN KEY (codigo_pais)
    REFERENCES pais (codigo_pais)
    );


-- -----------------------------------------------------
-- Table ciudad
-- -----------------------------------------------------
CREATE TABLE ciudad (
  codigo_ciudad INT(11) NOT NULL,
  nombre_ciudad VARCHAR(50) NOT NULL,
  codigo_region VARCHAR(10) NOT NULL,
  PRIMARY KEY (codigo_ciudad),
  CONSTRAINT codigo_region
    FOREIGN KEY (codigo_region)
    REFERENCES region (codigo_region)
    );


-- -----------------------------------------------------
-- Table oficina
-- -----------------------------------------------------
CREATE TABLE oficina (
  codigo_oficina INT(11) NOT NULL,
  codigo_ciudad INT(11) NOT NULL,
  codigo_postal VARCHAR(10) NOT NULL,
  PRIMARY KEY (codigo_oficina),
  CONSTRAINT FK_ofi_ciudad
    FOREIGN KEY (codigo_ciudad)
    REFERENCES ciudad (codigo_ciudad)
    );


-- -----------------------------------------------------
-- Table puesto_empleado
-- -----------------------------------------------------
CREATE TABLE puesto_empleado (
  codigo_puesto_empleado INT(11) NOT NULL,
  nombre_puesto VARCHAR(45) NOT NULL,
  extension VARCHAR(10) NOT NULL,
  PRIMARY KEY (codigo_puesto_empleado)
);


-- -----------------------------------------------------
-- Table empleado
-- -----------------------------------------------------
CREATE TABLE empleado (
  codigo_empleado INT(11) NOT NULL AUTO_INCREMENT,
  nombre_empleado VARCHAR(50) NOT NULL,
  apellido1_empleado VARCHAR(50) NOT NULL,
  apellido2_empleado VARCHAR(50) NULL,
  email_empleado VARCHAR(100) NOT NULL,
  codigo_oficina INT(11) NOT NULL,
  codigo_jefe INT(11) NULL,
  codigo_puesto_empleado INT(11) NOT NULL,
  PRIMARY KEY (codigo_empleado),
  CONSTRAINT FK_emple_oficina
    FOREIGN KEY (codigo_oficina)
    REFERENCES oficina (codigo_oficina),
  CONSTRAINT FK_cod_jefe
    FOREIGN KEY (codigo_jefe)
    REFERENCES empleado (codigo_empleado),
  CONSTRAINT FK_puesto_empleado
    FOREIGN KEY (codigo_puesto_empleado)
    REFERENCES puesto_empleado (codigo_puesto_empleado)
);


-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE cliente (
  codigo_cliente INT(11) NOT NULL,
  nombre_cliente VARCHAR(50) NOT NULL,
  codigo_ciudad INT(11) NOT NULL,
  codigo_postal VARCHAR(10) NOT NULL,
  limite_credito DECIMAL(15,2) NULL,
  codigo_rep_ventas INT(11) NOT NULL,
  PRIMARY KEY (codigo_cliente),
  CONSTRAINT FK_cliente_ciudad
    FOREIGN KEY (codigo_ciudad)
    REFERENCES ciudad (codigo_ciudad),
  CONSTRAINT FK_cod_rep_ventas
    FOREIGN KEY (codigo_rep_ventas)
    REFERENCES empleado (codigo_empleado)
);


-- -----------------------------------------------------
-- Table pedido
-- -----------------------------------------------------
CREATE TABLE pedido (
  codigo_pedido VARCHAR(15) NOT NULL,
  fecha_pedido DATE NOT NULL,
  fecha_esperada DATE NOT NULL,
  fecha_entrega DATE NULL,
  comentarios TEXT NULL,
  codigo_cliente INT(11) NOT NULL,
  codigo_estado INT NOT NULL,
  PRIMARY KEY (codigo_pedido),
  CONSTRAINT FK_pedido_estado
    FOREIGN KEY (codigo_estado)
    REFERENCES estado (codigo_estado),
  CONSTRAINT FK_pedido_cliente
    FOREIGN KEY (codigo_cliente)
    REFERENCES cliente (codigo_cliente)
);


-- -----------------------------------------------------
-- Table detalle_pedido
-- -----------------------------------------------------
CREATE TABLE detalle_pedido (
  codigo_producto VARCHAR(15) NOT NULL,
  codigo_pedido VARCHAR(15) NOT NULL,
  cantidad INT(11) NOT NULL,
  precio_unidad DECIMAL(15,2) NOT NULL,
  numero_linea SMALLINT(6) NOT NULL,
  PRIMARY KEY (codigo_producto, codigo_pedido),
  CONSTRAINT FK_det_ped_prod
    FOREIGN KEY (codigo_producto)
    REFERENCES producto (codigo_producto),
  CONSTRAINT FK_codigo_pedido
    FOREIGN KEY (codigo_pedido)
    REFERENCES pedido (codigo_pedido)
);


-- -----------------------------------------------------
-- Table tipo_telefono
-- -----------------------------------------------------
CREATE TABLE tipo_telefono (
  codigo_tipo_telefono INT(11) NOT NULL AUTO_INCREMENT,
  nombre_tipo_telefono VARCHAR(50) NOT NULL,
  PRIMARY KEY (codigo_tipo_telefono));


-- -----------------------------------------------------
-- Table telefono_cliente
-- -----------------------------------------------------
CREATE TABLE telefono_cliente (
  codigo_telefono_cliente INT(11) NOT NULL AUTO_INCREMENT,
  telefono_cliente VARCHAR(50) NOT NULL,
  codigo_cliente INT(11) NOT NULL,
  codigo_tipo_telefono INT(11) NULL,
  PRIMARY KEY (codigo_telefono_cliente),
  CONSTRAINT FK_tipo_tel
    FOREIGN KEY (codigo_tipo_telefono)
    REFERENCES tipo_telefono (codigo_tipo_telefono),
  CONSTRAINT FK_cliente_tel
    FOREIGN KEY (codigo_cliente)
    REFERENCES cliente (codigo_cliente)
);


-- -----------------------------------------------------
-- Table tipo_direccion
-- -----------------------------------------------------
CREATE TABLE tipo_direccion (
  codigo_tipo_dir SMALLINT NOT NULL AUTO_INCREMENT,
  nombre_tipo_dir VARCHAR(50) NOT NULL,
  PRIMARY KEY (codigo_tipo_dir));


-- -----------------------------------------------------
-- Table direccion
-- -----------------------------------------------------
CREATE TABLE direccion (
  codigo_direccion INT(11) NOT NULL AUTO_INCREMENT,
  nombre_calle VARCHAR(50) NULL,
  numero_direccion VARCHAR(50) NULL,
  nombre_barrio VARCHAR(50) NULL,
  codigo_cliente INT(11) NOT NULL,
  codigo_tipo_dir SMALLINT NOT NULL,
  PRIMARY KEY (codigo_direccion),
  CONSTRAINT FK_cliente_dir
    FOREIGN KEY (codigo_cliente)
    REFERENCES cliente (codigo_cliente),
  CONSTRAINT FK_dir_tipo_dir
    FOREIGN KEY (codigo_tipo_dir)
    REFERENCES tipo_direccion (codigo_tipo_dir)
);


-- -----------------------------------------------------
-- Table contacto
-- -----------------------------------------------------
CREATE TABLE contacto (
  codigo_contacto VARCHAR(25) NOT NULL,
  primer_nombre_contacto VARCHAR(50) NOT NULL,
  primer_apellido_contacto VARCHAR(50) NOT NULL,
  email_contacto VARCHAR(50) NOT NULL,
  segundo_apellido_contacto VARCHAR(50) NULL,
  segundo_nombre_contacto VARCHAR(50) NULL,
  codigo_cliente INT(11) NOT NULL,
  PRIMARY KEY (codigo_contacto),
  CONSTRAINT FK_contact_cliente
    FOREIGN KEY (codigo_cliente)
    REFERENCES cliente (codigo_cliente)
    );


-- -----------------------------------------------------
-- Table metodo_pago
-- -----------------------------------------------------
CREATE TABLE metodo_pago (
  codigo_metodo_pago INT NOT NULL AUTO_INCREMENT,
  nombre_met_pago VARCHAR(50) NOT NULL,
  PRIMARY KEY (codigo_metodo_pago));


-- -----------------------------------------------------
-- Table pago
-- -----------------------------------------------------
CREATE TABLE pago (
  codigo_pago INT(11) NOT NULL AUTO_INCREMENT,
  fecha_pago DATE NOT NULL,
  total_pago DECIMAL(15,2) NOT NULL,
  codigo_cliente INT(11) NOT NULL,
  codigo_met_pago INT(11) NOT NULL,
  PRIMARY KEY (codigo_pago),
  CONSTRAINT FK_pago_cliente
    FOREIGN KEY (codigo_cliente)
    REFERENCES cliente (codigo_cliente),
  CONSTRAINT FK_cod_met_pago
    FOREIGN KEY (codigo_met_pago)
    REFERENCES metodo_pago (codigo_metodo_pago)
    );


-- -----------------------------------------------------
-- Table direccion_oficina
-- -----------------------------------------------------
CREATE TABLE direccion_oficina (
  codigo_direccion INT(11) NOT NULL AUTO_INCREMENT,
  nombre_calle VARCHAR(50) NULL,
  numero_direccion VARCHAR(50) NULL,
  nombre_barrio VARCHAR(50) NULL,
  codigo_oficina INT(10) NOT NULL,
  codigo_tipo_dir SMALLINT NOT NULL,
  PRIMARY KEY (codigo_direccion),
  CONSTRAINT FK_dir_oficina
    FOREIGN KEY (codigo_oficina)
    REFERENCES oficina (codigo_oficina),
  CONSTRAINT FK_tipo_dir_ofi
    FOREIGN KEY (codigo_tipo_dir)
    REFERENCES tipo_direccion (codigo_tipo_dir)
    );


-- -----------------------------------------------------
-- Table telefono_oficina
-- -----------------------------------------------------
CREATE TABLE telefono_oficina (
  codigo_telefono_oficina INT(11) NOT NULL AUTO_INCREMENT,
  telefono_oficina VARCHAR(50) NOT NULL,
  codigo_tipo_telefono INT(11) NOT NULL,
  codigo_oficina INT(11) NOT NULL,
  PRIMARY KEY (codigo_telefono_oficina),
  CONSTRAINT FK_tipo_tel_ofi
    FOREIGN KEY (codigo_tipo_telefono)
    REFERENCES tipo_telefono (codigo_tipo_telefono),
  CONSTRAINT FK_tel_oficina
    FOREIGN KEY (codigo_oficina)
    REFERENCES oficina (codigo_oficina)
    );

