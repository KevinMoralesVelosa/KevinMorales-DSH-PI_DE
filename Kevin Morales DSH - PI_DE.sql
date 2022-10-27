CREATE DATABASE IF NOT EXISTS proyecto_ETL1;
USE proyecto_ETL1;
-- Crear tabla para importar datos
-- DROP TABLE sucursal;
CREATE TABLE sucursal (
IdSucursal VARCHAR(250),
IdComercio INTEGER(250),
IdBandera INTEGER(250),
BanderaDescripcion VARCHAR(250),
ComercioRazonSocial VARCHAR(250),
Provincia VARCHAR(250),
Localidad VARCHAR(250),
Direccion VARCHAR(250),
Latitud VARCHAR(250),
Longitud VARCHAR(250),
NombreSucursal VARCHAR(250),
TipoSucursal VARCHAR(250)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- importar bases de datos dentro de la tabla creada
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sucursal.csv"
INTO TABLE sucursal
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES;

-- DROP TABLE productos;
CREATE TABLE productos(
IdProducto VARCHAR(200),
Marca VARCHAR(250),
Nombre VARCHAR(250),
Presentacion VARCHAR(250)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- importar bases de datos dentro de la tabla creada
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\productos.csv"
INTO TABLE productos
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES;

-- DROP TABLE precios;
CREATE TABLE precios(
Precio BIGINT,
IdProducto VARCHAR(250),
IdSucursal VARCHAR(250),
Semana DATE
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semana_20200413.csv"
INTO TABLE precios
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES;


LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semana_20200503.csv"
INTO TABLE precios
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES;

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semanas_20200419_20200426.csv"
INTO TABLE precios
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES;

-- Creamos relaciones entre tablas creando CLaves primarias e indices
-- Precios
ALTER TABLE precios ADD INDEX (IdProducto);
ALTER TABLE precios ADD INDEX (IdSucursal);
ALTER TABLE precios ADD INDEX (Semana);

-- Productos
ALTER TABLE productos ADD PRIMARY KEY (IdProducto);
ALTER TABLE productos ADD INDEX (Marca);
ALTER TABLE productos ADD INDEX (Nombre);
ALTER TABLE productos ADD INDEX (Presentacion);

-- sucursal
ALTER TABLE sucursal ADD INDEX (IdSucursal);
ALTER TABLE sucursal ADD INDEX (IdComercio);
ALTER TABLE sucursal ADD INDEX (IdBandera);
ALTER TABLE sucursal ADD INDEX (BanderaDescripcion);
ALTER TABLE sucursal ADD INDEX (ComercioRazonSocial);
ALTER TABLE sucursal ADD INDEX (Provincia);
ALTER TABLE sucursal ADD INDEX (Localidad);
ALTER TABLE sucursal ADD INDEX (NombreSucursal);
ALTER TABLE sucursal ADD INDEX (TipoSucursal);


SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE precios ADD CONSTRAINT precios_fk_productos FOREIGN KEY (IdProducto) REFERENCES productos (IdProducto)ON UPDATE CASCADE;
ALTER TABLE precios ADD CONSTRAINT precios_fk_sucursal FOREIGN KEY (IdSucursal) REFERENCES sucursal (IdSucursal)ON UPDATE CASCADE;



SELECT count(*) precio from precios;

-- consulta de prueba 

SELECT AVG (precio) AS PrecioPromedio
FROM precios 
WHERE IdSucursal = '9-1-688';
