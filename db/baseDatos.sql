CREATE DATABASE IF NOT EXISTS Tienda_mundoL;
USE Tienda_mundoL;

CREATE TABLE IF NOT EXISTS t_usuarios (
    id_usuario INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL,
    password VARCHAR(200) NOT NULL,
    rol VARCHAR(20),
    imagen VARCHAR(200),
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_email UNIQUE (email)
) ENGINE=InnoDB; 

INSERT INTO t_usuarios VALUES (NULL, "Admin", "Admin", "admin@admin.com", "contrasena", "admin", "imagen");


CREATE TABLE IF NOT EXISTS t_pedidos (
    id_pedido INT(11) NOT NULL AUTO_INCREMENT,
    ciudad VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    costo FLOAT(10) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    id_usuario INT (10) NOT NULL,
    CONSTRAINT pk_pedido PRIMARY KEY (id_pedido),
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES t_usuarios(id_usuario)
) ENGINE=InnoDB; 


CREATE TABLE IF NOT EXISTS t_categoria (
    id_categoria  INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
) ENGINE=InnoDB; 


CREATE TABLE IF NOT EXISTS t_lineapedidos (
    id_pedidoLinea  INT(11) NOT NULL AUTO_INCREMENT,
    unidades INT(10) NOT NULL,
    id_pedido INT (10) NOT NULL,
    CONSTRAINT pk_Lineapedido PRIMARY KEY (id_pedidoLinea),
    CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES t_pedidos(id_pedido)
) ENGINE=InnoDB;



CREATE TABLE IF NOT EXISTS t_productos (
    id_producto  INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    precio FLOAT(10) NOT NULL,
    stock INT(100) NOT NULL,
    oferta VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    imagen VARCHAR (255),
    id_categoria INT (10) NOT NULL,
    CONSTRAINT pk_productos PRIMARY KEY (id_producto),
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES t_categoria(id_categoria)
) ENGINE=InnoDB; 




