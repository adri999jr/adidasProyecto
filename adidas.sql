DROP DATABASE IF EXISTS adidas;
CREATE DATABASE adidas;
USE adidas;
SHOW DATABASES;

CREATE TABLE categoria(
	ID_categoria INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	genero CHAR(1),
	CONSTRAINT CK_genero CHECK (genero='H' || genero='M')

);
DESCRIBE categoria;

CREATE TABLE Producto(
	cod_producto INT PRIMARY KEY AUTO_INCREMENT,
	precio DECIMAL,
	nombre VARCHAR(200),
	material VARCHAR(50),
	ID_categoria INT,
	CONSTRAINT FK_ID_categoria FOREIGN KEY (ID_categoria) REFERENCES categoria(ID_categoria)

);
DESCRIBE Producto;

CREATE TABLE cliente(
	ID_cliente INT PRIMARY KEY AUTO_INCREMENT,
	DNI CHAR(9) UNIQUE,
	nombre VARCHAR(50),
	apellidos VARCHAR(50),
	usuario VARCHAR(50) NOT NULL UNIQUE

);
DESCRIBE cliente;

CREATE TABLE producto_cliente(
	fecha_compra DATE,
	cod_producto INT,
	ID_cliente INT,
	CONSTRAINT PK_producto_cliente PRIMARY KEY (fecha_compra,cod_producto,ID_cliente),
	CONSTRAINT FK_cod_producto FOREIGN KEY (cod_producto) REFERENCES Producto(cod_producto),
	CONSTRAINT FK_ID_cliente FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente)
);
DESCRIBE producto_cliente;

CREATE TABLE cupon(
	ID_cupon INT PRIMARY KEY AUTO_INCREMENT,
	descuento_porciento INT UNIQUE

);
DESCRIBE cupon;

CREATE TABLE cliente_cupon(
	fecha_obtencion DATE,
	ID_cliente INT,
	ID_cupon INT,
	CONSTRAINT PK_cliente_cupon PRIMARY KEY (fecha_obtencion,ID_cliente,ID_cupon),
	CONSTRAINT FK_ID_cliente_cupon FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente),
	CONSTRAINT FK_ID_cupon FOREIGN KEY (ID_cupon) REFERENCES cupon(ID_cupon)
);
DESCRIBE cliente_cupon;

INSERT INTO categoria(nombre,genero) VALUES
	('zapatillas','H'),
	('zapatillas','M'),
	('Futbol','H'),
	('running','M'),
	('gafas','H'),
	('gafas','M'),
	('balones','H'),
	('hoodies','H'),
	('gym','H'),
	('gym','M');

SELECT * FROM categoria;

INSERT INTO producto(nombre,material,precio,ID_categoria) VALUES
	('bota de futbol predator elite cesped natural seco','cuero',260,3),
	('bota de futbol x crazyfast messi league cesped natural seco','piel',90,3),
	('zapatilla supernova stride','tela',110,4),
	('balon ucl pro 23/24 knockout','cuero',150,7),
	('chaqueta con capucha z.n.e. premium','algodon',100,8);

SELECT * FROM producto;

INSERT INTO cliente(DNI,nombre,apellidos,usuario) VALUES
	('11111111A','Pepe','Martinez Herrero','pepemarhe33'),
	('22222222Q','Ana','Jimenez Herrero','anitaJim'),
	('34567428X','Maria','Rodriguez Humanes','martuqui'),
	('45787341Y','Pepe','Martinez Herrero','pepinelcrack'),
	('56162437A','Leo','Climent Dominguez','leoclimentmma'),
	('67897654E','ilia','Topuria Sanchez','iliatopuria'),
	('72135678V','aleksander','Topuria Sanchez','aleksanderTopuria'),
	('89345321P','Michael','Venum Page','MVP');
SELECT * FROM cliente;

INSERT INTO producto_cliente(fecha_compra,cod_producto,ID_cliente) VALUES
	('2024/1/12',2,5),
	('2024/1/13',2,5),
	('2024/2/2',5,8),
	('2023/10/5',1,1),
	('2023/4/1',2,3),
	('2021/10/5',3,7),
	('2023/10/5',2,4),
	('2021/2/28',1,6),
	('2022/4/24',4,2),
	('2023/1/5',2,8);

SELECT * FROM producto_cliente;

INSERT INTO cupon(descuento_porciento) VALUES
	(25),
	(20),
	(15),
	(33),
	(50),
	(10),
	(5),
	(55);

SELECT * FROM cupon ORDER BY ID_cupon;

INSERT INTO cliente_cupon (fecha_obtencion,ID_cliente,ID_cupon) VALUES 
	('2023/11/23',1,5),
	('2022/10/5',3,2),
	('2023/1/5',1,5),
	('2021/5/25',2,1),
	('2022/1/4',4,3),
	('2021/5/25',3,1),
	('2023/8/19',7,6);

SELECT * FROM cliente_cupon;