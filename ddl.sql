DROP DATABASE IF EXISTS garden;

CREATE DATABASE garden;

USE DATABASE garden;



DROP TABLE IF EXISTS gama_producto;

CREATE TABLE gama_producto(
    gama VARCHAR(50),
    descripcion_texto TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256),

    CONSTRAINT PK_id_gamaProducto PRIMARY KEY (gama)
);

DROP TABLE IF EXISTS oficina;

CREATE TABLE oficina(
    codigo_oficina VARCHAR(10),
    ciudad VARCHAR(30),
    pais VARCHAR(50),
    region VARCHAR(50),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(15),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),
    
    CONSTRAINT PK_id_oficina PRIMARY KEY (codigo_oficina)
);


DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente(
    codigo_cliente INT,
    nombre_cliente VARCHAR(50),
    nombre_contacto VARCHAR(30),
    telefono VARCHAR(15),
    fax VARCHAR(15),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),
    ciudad VARCHAR(50),
    region VARCHAR(50),
    pais VARCHAR(50),
    codigo_postal VARCHAR(10),
    codigo_empleado_rep_ventas INT(11),
    limite_credito DECIMAL(15,2),
    
    CONSTRAINT PK_id_cliente PRIMARY KEY (codigo_cliente)
);




DROP TABLE IF EXISTS pago;

CREATE TABLE pago(
    id_transaccion VARCHAR(50),
    id_cliente INT,
    forma_de_pago VARCHAR(40),
    fecha_de_pago DATE,
    total DECIMAL,

    CONSTRAINT PK_id_pago PRIMARY KEY (id_transaccion),
    CONSTRAINT FK_idCliente_pago FOREIGN KEY (id_cliente) REFERENCES cliente (codigo_cliente)
);


DROP TABLE IF EXISTS producto;

CREATE TABLE producto(
    codigo_producto VARCHAR(15),
    nombre  VARCHAR(70),
    gama VARCHAR(50),
    dimensiones VARCHAR(25),
    proveedor VARCHAR(50),
    descripcion TEXT,
    cantidad_en_stock SMALLINT(6),
    precio_venta DECIMAL(15,2),
    precio_proveedor DECIMAL(15,2),

    CONSTRAINT PK_id_producto PRIMARY KEY (codigo_producto),
    CONSTRAINT  FK_gama_producto FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);



DROP TABLE IF EXISTS pedido;

CREATE TABLE pedido(
    codigo_pedido INT(11),
    fecha_pedido DATE,
    fecha_esperada DATE,
    fecha__entrega DATE,
    estado VARCHAR(15),
    comentarios TEXT,
    codigo_cliente INT(11),

    CONSTRAINT PK_id_pedido PRIMARY KEY (codigo_pedido),
    CONSTRAINT FK_codigoCliente_pedido FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);



DROP TABLE IF EXISTS detalle_pedido;

CREATE TABLE detalle_pedido(
    codigo_pedido INT(11),
    codigo_producto VARCHAR(15),
    cantidad  INT(11),
    precio_unidad DECIMAL(15,2),
    numero_linea SMALLINT(6),
    
    CONSTRAINT PK_id_detallePedido PRIMARY KEY (codigo_pedido,codigo_producto),
    CONSTRAINT FK_codigoProducto_detallePedido FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto),
    CONSTRAINT FK_codigoPedido_detallePedido FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido)
);



DROP TABLE IF EXISTS empleado;

CREATE TABLE empleado(
    codigo_empleado INT(11),
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    extension VARCHAR(10),

    email VARCHAR(100),
    codigo_oficina VARCHAR(10),
    codigo_jefe INT(11),
    puesto VARCHAR(50),

    
    CONSTRAINT PK_id_empleado PRIMARY KEY (codigo_empleado),
    CONSTRAINT FK_codigoOficina_empleado FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina),
    CONSTRAINT FK_codigoJefe_empleado FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado)
);


