DROP PROCEDURE IF EXISTS insert_gama_producto;

DELIMITER &&

CREATE PROCEDURE insert_gama_producto(
    IN ingama VARCHAR(50),
    IN indescripcion_texto TEXT,
    IN indescripcion_html TEXT,
    IN Inimagen VARCHAR(256)
)
BEGIN

    DECLARE mensaje VARCHAR(100);
    INSERT INTO gama_producto(gama,descripcion_texto,descripcion_html,imagen) VALUES 
    (ingama,indescripcion_texto,indescripcion_html,Inimagen);

    IF (ROW_COUNT()>0) THEN
    SET mensaje = "El insert fue hecho exitosamente";
    ELSE 
    SET mensaje ="error en el inset";
    END IF;
    SELECT mensaje AS 'Mensaje';

END &&
DELIMITER ;


DROP PROCEDURE IF EXISTS insert_oficina;
DELIMITER &&

CREATE PROCEDURE insert_oficina(
    IN incodigo_oficina VARCHAR(10),
    IN inciudad VARCHAR(30),
    IN inpais VARCHAR(50),
    IN inregion VARCHAR(50),
    IN incodigo_postal VARCHAR(10),
    IN intelefono VARCHAR(15),
    IN inlinea_direccion1 VARCHAR(50),
    IN inlinea_direccion2 VARCHAR(50)
)
BEGIN

    DECLARE mensaje VARCHAR(100);
    INSERT INTO oficina(codigo_oficina,ciudad,pais,region,codigo_postal,telefono,linea_direccion1,linea_direccion2) VALUES 
    (incodigo_oficina,inciudad,inpais,inregion,incodigo_postal,intelefono,inlinea_direccion1,inlinea_direccion2);

    IF (ROW_COUNT()>0) THEN
    SET mensaje = "El insert fue hecho exitosamente";
    ELSE 
    SET mensaje ="error en el inset";
    END IF;
    SELECT mensaje AS 'Mensaje';

END &&
DELIMITER ;



DROP PROCEDURE IF EXISTS insert_cliente;
DELIMITER &&

CREATE PROCEDURE insert_cliente(
    IN incodigo_cliente INT,
    IN innombre_cliente VARCHAR(50),
    IN innombre_contacto VARCHAR(30),
    IN intelefono VARCHAR(15),
    IN infax VARCHAR(15),
    IN inlinea_direccion1 VARCHAR(50),
    IN inlinea_direccion2 VARCHAR(50),
    IN inciudad VARCHAR(50),
    IN inregion VARCHAR(50),
    IN inpais VARCHAR(50),
    IN incodigo_postal VARCHAR(10),
    IN incodigo_empleado_rep_ventas INT(11),
    IN inlimite_credito DECIMAL(15,2)
    
)
BEGIN

    DECLARE mensaje VARCHAR(100);
    INSERT INTO cliente (
        codigo_cliente,
        nombre_cliente,
        nombre_contacto,
        telefono,
        fax,
        linea_direccion1,
        linea_direccion2,
        ciudad,
        region,
        pais,
        codigo_postal,
        codigo_empleado_rep_ventas,
        limite_credito
    ) VALUES 
    (incodigo_cliente,innombre_cliente,innombre_contacto,intelefono,infax,inlinea_direccion1,inlinea_direccion2,inciudad,inregion,inpais,incodigo_postal,incodigo_empleado_rep_ventas,inlimite_credito);

    IF (ROW_COUNT()>0) THEN
    SET mensaje = "El insert fue hecho exitosamente";
    ELSE 
    SET mensaje ="error en el inset";
    END IF;
    SELECT mensaje AS 'Mensaje';

END &&
DELIMITER ;




DROP PROCEDURE IF EXISTS insert_pago;
DELIMITER &&

CREATE PROCEDURE insert_pago(
    IN inid_transaccion VARCHAR(50),
    IN inid_cliente INT,
    IN informa_de_pago VARCHAR(40),
    IN infecha_de_pago DATE,
    IN intotal DECIMAL
    
)
BEGIN

    DECLARE mensaje VARCHAR(100);
    INSERT INTO pago (
        id_transaccion,
        id_cliente ,
        forma_de_pago ,
        fecha_de_pago ,
        total

    ) VALUES 
    ( 
        inid_transaccion,
        inid_cliente ,
        informa_de_pago ,
        infecha_de_pago ,
        intotal
    );

    IF (ROW_COUNT()>0) THEN
    SET mensaje = "El insert fue hecho exitosamente";
    ELSE 
    SET mensaje ="error en el inset";
    END IF;
    SELECT mensaje AS 'Mensaje';

END &&
DELIMITER ;




DROP PROCEDURE IF EXISTS insert_producto;
DELIMITER &&

CREATE PROCEDURE insert_producto(
    IN incodigo_producto VARCHAR(15),
    IN innombre  VARCHAR(70),
    IN ingama VARCHAR(50),
    IN indimensiones VARCHAR(25),
    IN inproveedor VARCHAR(50),
    IN indescripcion TEXT,
    IN incantidad_en_stock SMALLINT(6),
    IN inprecio_venta DECIMAL(15,2),
    IN inprecio_proveedor DECIMAL(15,2)
    
)
BEGIN

    DECLARE mensaje VARCHAR(100);
    INSERT INTO producto (
        codigo_producto ,
        nombre  ,
        gama ,
        dimensiones ,
        proveedor ,
        descripcion ,
        cantidad_en_stock ,
        precio_venta,
        precio_proveedor 
    ) VALUES 
    ( 
        incodigo_producto ,
        innombre  ,
        ingama ,
        indimensiones ,
        inproveedor ,
        indescripcion ,
        incantidad_en_stock ,
        inprecio_venta ,
        inprecio_proveedor 
    );

    IF (ROW_COUNT()>0) THEN
    SET mensaje = "El insert fue hecho exitosamente";
    ELSE 
    SET mensaje ="error en el inset";
    END IF;
    SELECT mensaje AS 'Mensaje';

END &&
DELIMITER ;



DROP PROCEDURE IF EXISTS insert_pedido;
DELIMITER &&

CREATE PROCEDURE insert_pedido(
    IN incodigo_pedido INT(11),
    IN infecha_pedido DATE,
    IN infecha_esperada DATE,
    IN infecha__entrega DATE,
    IN inestado VARCHAR(15),
    IN incomentarios TEXT,
    IN incodigo_cliente INT(11)
    
)
BEGIN

    DECLARE mensaje VARCHAR(100);
    INSERT INTO pedido (
        codigo_pedido ,
        fecha_pedido ,
        fecha_esperada ,
        fecha__entrega ,
        estado ,
        comentarios ,
        codigo_cliente

    ) VALUES 
    ( 
        incodigo_pedido ,
        infecha_pedido ,
        infecha_esperada ,
        infecha__entrega ,
        inestado ,
        incomentarios ,
        incodigo_cliente
    );

    IF (ROW_COUNT()>0) THEN
    SET mensaje = "El insert fue hecho exitosamente";
    ELSE 
    SET mensaje ="error en el inset";
    END IF;
    SELECT mensaje AS 'Mensaje';

END &&
DELIMITER ;


DROP PROCEDURE IF EXISTS insert_detalle_pedido;
DELIMITER &&

CREATE PROCEDURE insert_detalle_pedido(
    IN incodigo_pedido INT,
    IN incodigo_producto VARCHAR(15),
    IN incantidad  INT(11),
    IN inprecio_unidad DECIMAL(15,2),
    IN innumero_linea SMALLINT(6)
    
)
BEGIN

    DECLARE mensaje VARCHAR(100);
    INSERT INTO detalle_pedido (
        codigo_pedido ,
        codigo_producto ,
        cantidad  ,
        precio_unidad ,
        numero_linea 
    ) VALUES 
    ( 
        incodigo_pedido ,
        incodigo_producto ,
        incantidad  ,
        inprecio_unidad ,
        innumero_linea 
    );

    IF (ROW_COUNT()>0) THEN
    SET mensaje = "El insert fue hecho exitosamente";
    ELSE 
    SET mensaje ="error en el inset";
    END IF;
    SELECT mensaje AS 'Mensaje';

END &&
DELIMITER ;



DROP PROCEDURE IF EXISTS insert_empleado;
DELIMITER &&

CREATE PROCEDURE insert_empleado(
    IN incodigo_empleado INT(11),
    IN innombre VARCHAR(50),
    IN inapellido1 VARCHAR(50),
    IN inapellido2 VARCHAR(50),
    IN inextension VARCHAR(10),
    IN inemail VARCHAR(100),
    IN incodigo_oficina VARCHAR(10),
    IN incodigo_jefe INT(11),
    IN inpuesto VARCHAR(50)

    
)
BEGIN

    DECLARE mensaje VARCHAR(100);
    INSERT INTO empleado (
        codigo_empleado ,
        nombre ,
        apellido1,
        apellido2,
        extension,
        email ,
        codigo_oficina ,
        codigo_jefe ,
        puesto 
    ) VALUES 
    ( 
        incodigo_empleado ,
        innombre ,
        inapellido1,
        inapellido2,
        inextension,
        inemail ,
        incodigo_oficina ,
        incodigo_jefe ,
        inpuesto 
    );

    IF (ROW_COUNT()>0) THEN
    SET mensaje = "El insert fue hecho exitosamente";
    ELSE 
    SET mensaje ="error en el inset";
    END IF;
    SELECT mensaje AS 'Mensaje';

END &&
DELIMITER ;


-- insertar gamas
CALL insert_gama_producto(
    'Herramientas de corte', 
    'Una variedad completa de herramientas para el corte de jardines.', 
    '<p>Una variedad completa de herramientas para el corte de jardines.</p>', 
    'herramientas_corte_jardineria.jpg'
);

CALL insert_gama_producto(
    'Herramientas de aseo', 
    'Una variedad completa de herramientas para el aseo de jardines.', 
    '<p>Una variedad completa de herramientas para el aseo de jardines.</p>', 
    'herramientas_aseo_jardineria.jpg'
);

CALL insert_gama_producto(
    'Semillas', 
    'Una variedad completa de semillas para jardines.', 
    '<p>Una variedad completa de semillas para jardines.</p>', 
    'Semillas_jardineria.jpg'
);

CALL insert_gama_producto(
    'Macetas', 
    'Una variedad completa de macetas para jardines.', 
    '<p>Una variedad completa de macetas para jardines.</p>', 
    'Macetas_jardineria.jpg'
);


-------------------------------------
CALL insert_oficina(
    "oficina1",
    "Bucaramanga",
    "Colombia",
    "Santander",
    "111111",
    "312234324",
    "Carrera 12 calle 11",
    "Carrera 32d calle 13"
);

CALL insert_oficina(
    "oficina2",
    "Bogota",
    "Colombia",
    "Cundinamarca",
    "111111",
    "312234324",
    "Carrera 12 calle 11",
    "Carrera 32d calle 13"
);

CALL insert_oficina(
    "oficina3",
    "Medellin",
    "Colombia",
    "Antioquia",
    "111111",
    "312234324",
    "Carrera 12 calle 11",
    "Carrera 32d calle 13"
);


---------------------------

CALL insert_cliente(
    1,
    "Juan",
    "javier",
    "12324324",
    "c123de",
    "Carrera 12 calle 11",
    "Carrera 32d calle 13",
    "Medellin",
    "Antioquia",
    "Colombia",
    "111111",
    "123243",
    1000000
);


CALL insert_cliente(
    2,
    "daniel",
    "jose",
    "12324324",
    "c123de",
    "Carrera 12 calle 11",
    "Carrera 32d calle 13",
    "Medellin",
    "Antioquia",
    "Colombia",
    "111111",
    "123243",
    2000000
);

--------------------------------------

CALL insert_pago(
    "1",
    1,
    "Efectivo",
    "2024-05-21",
    30000
);

CALL insert_pago(
    "2",
    2,
    "Efectivo",
    "2024-01-21",
    20000
);


------------------------------------------
CALL insert_producto(
    "1",
    "Maquina cortadora",
    'Herramientas de corte',
    "30cm",
    "maquinas S.A",
    "es un buen prodcuto",
    5,
    30000,
    24000
    );


    CALL insert_producto(
    "2",
    "Semilla de rosas",
    'Semillas',
    "30cm",
    "rosas S.A",
    "es un buen prodcuto",
    5,
    10000,
    5000
    );


    -------------------------



    CALL insert_pedido(
        1,
        "2024-05-21",
        "2024-05-30",
        "2024-06-05",
        "buen estado",
        "es un buen producto",
        1
    );

    
    CALL insert_pedido(
        2,
        "2024-01-21",
        "2024-01-30",
        "2024-02-05",
        "buen estado",
        "es un buen producto",
        2
    );

CALL insert_detalle_pedido(
    1,
    "1",
    1,
    30000,
    12
);


CALL insert_detalle_pedido(
    2,
    "2",
    1,
    20000,
    11
);

CALL insert_empleado(
    1,
    "Samuel",
    "sambueza",
    "martinez",
    "101",
    "samuel@gmail.com",
    "oficina1",
    1,
    "jefe"
);
CALL insert_empleado(
    2,
    "daniel",
    "villamala",
    "ruidiaz",
    "102",
    "samuel@gmail.com",
    "oficina2",
    2,
    "jefe"
);


CALL insert_empleado(
    3,
    "samara",
    "patino",
    "real",
    "102",
    "samuel@gmail.com",
    "oficina2",
    2,
    "Dispensaria"
);


CALL insert_empleado(
    4,
    "martin",
    "perez",
    "duarte",
    "101",
    "samuel@gmail.com",
    "oficina1",
    1,
    "Dispensaria"
);



