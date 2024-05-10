-- -----------------------------------------------------
-- INSERT gama_producto
-- ----------------------------------------------------
INSERT INTO gama_producto VALUES (1,'Herbaceas','Plantas para jardin decorativas',NULL,NULL);
INSERT INTO gama_producto VALUES (2,'Herramientas','Herramientas para todo tipo de acción',NULL,NULL);
INSERT INTO gama_producto VALUES (3,'Aromáticas','Plantas aromáticas',NULL,NULL);
INSERT INTO gama_producto VALUES (4,'Frutales','Árboles pequeños de producción frutal',NULL,NULL);
INSERT INTO gama_producto VALUES (5,'Ornamentales','Plantas vistosas para la decoración del jardín',NULL,NULL);

-- -----------------------------------------------------
-- INSERT PAIS
-- ----------------------------------------------------
INSERT INTO pais VALUES ('ES','España');
INSERT INTO pais VALUES ('USA','EEUU');
INSERT INTO pais VALUES ('UK','Inglaterra');
INSERT INTO pais VALUES ('FR','Francia');
INSERT INTO pais VALUES ('AU','Australia');
INSERT INTO pais VALUES ('JP','Japón');

-- -----------------------------------------------------
-- INSERT REGION
-- ----------------------------------------------------
INSERT INTO region VALUES ('reg01','Barcelona','ES');
INSERT INTO region VALUES ('reg02','MA', 'USA');
INSERT INTO region VALUES ('reg03','EMEA','UK');
INSERT INTO region VALUES ('reg04','Madrid','ES');
INSERT INTO region VALUES ('reg05','EMEA','FR');
INSERT INTO region VALUES ('reg06','CA','USA');
INSERT INTO region VALUES ('reg07','APAC','AU');
INSERT INTO region VALUES ('reg08','Castilla-LaMancha','ES');
INSERT INTO region VALUES ('reg09','Chiyoda-Ku','JP');

-- -----------------------------------------------------
-- INSERT CIUDAD
-- ----------------------------------------------------
INSERT INTO ciudad VALUES (001,'Barcelona', 'reg01');
INSERT INTO ciudad VALUES (002,'Boston', 'reg02');
INSERT INTO ciudad VALUES (003,'Londres', 'reg03');
INSERT INTO ciudad VALUES (004,'Madrid', 'reg04');
INSERT INTO ciudad VALUES (005,'Paris', 'reg05');
INSERT INTO ciudad VALUES (006,'San Francisco', 'reg06');
INSERT INTO ciudad VALUES (007,'Sydney', 'reg07');
INSERT INTO ciudad VALUES (008,'Talavera de la Reina', 'reg08');
INSERT INTO ciudad VALUES (009,'Tokyo', 'reg09');

-- -----------------------------------------------------
-- INSERT ESTADO
-- ----------------------------------------------------

INSERT INTO estado VALUES (01,'Entregado');
INSERT INTO estado VALUES (02,'Pendiente');
INSERT INTO estado VALUES (03,'Rechazado');

-- -----------------------------------------------------
-- INSERT TIPO DIRECCION
-- ----------------------------------------------------
INSERT INTO tipo_direccion VALUES (1,'Avenida');
INSERT INTO tipo_direccion VALUES (111,'Calle');
INSERT INTO tipo_direccion VALUES (222,'Bulevar');
INSERT INTO tipo_direccion VALUES (333,'Carrera');
INSERT INTO tipo_direccion VALUES (444,'Pasaje');

-- -----------------------------------------------------
-- INSERT TIPO TELEFONO
-- ----------------------------------------------------
INSERT INTO tipo_telefono VALUES (1,'Celular');
INSERT INTO tipo_telefono VALUES (2,'Fax');
INSERT INTO tipo_telefono VALUES (3,'Fijo o Casa');

-- -----------------------------------------------------
-- INSERT METODO PAGO
-- ----------------------------------------------------
INSERT INTO metodo_pago VALUES (1,'Transfrerencia');
INSERT INTO metodo_pago VALUES (2,'Cheque');
INSERT INTO metodo_pago VALUES (3,'efectivo');
INSERT INTO metodo_pago VALUES (4,'Paypal');

-- -----------------------------------------------------
-- INSERT PUESTO EMPLEADO
-- ----------------------------------------------------

INSERT INTO puesto_empleado VALUES (1,'Director General',125);
INSERT INTO puesto_empleado VALUES (2,'Subdirector Marketing', 698);
INSERT INTO puesto_empleado VALUES (3,'Subdirector Ventas', 256);
INSERT INTO puesto_empleado VALUES (4,'Secretaria', 569);
INSERT INTO puesto_empleado VALUES (5,'Representante Ventas', 256);
INSERT INTO puesto_empleado VALUES (6,'Director Oficina', 1102);

-- ----------------------------------------------------
-- INSERT OFICINA
-- ----------------------------------------------------
INSERT INTO oficina VALUES (001, 001, 000001);
INSERT INTO oficina VALUES (002, 002, 000002);
INSERT INTO oficina VALUES (003, 003, 000003);
INSERT INTO oficina VALUES (004, 004, 000004);
INSERT INTO oficina VALUES (005, 005, 000005);
INSERT INTO oficina VALUES (006, 006, 000006);
INSERT INTO oficina VALUES (007, 007, 000007);
INSERT INTO oficina VALUES (008, 008, 000008);
INSERT INTO oficina VALUES (009, 009, 000009);

-- ----------------------------------------------------
-- INSERT EMPLEADO 
-- ----------------------------------------------------
INSERT INTO empleado VALUES (1,'Marcos','Magaña','Perez','marcos@jardineria.es',008,NULL,1);
INSERT INTO empleado VALUES (2,'Ruben','López','Martinez','rlopez@jardineria.es',008,1,2);
INSERT INTO empleado VALUES (3,'Alberto','Soria','Carrasco','asoria@jardineria.es',008,2,3);
INSERT INTO empleado VALUES (4,'Maria','Solís','Jerez','msolis@jardineria.es',008,2,4);
INSERT INTO empleado VALUES (5,'Felipe','Rosas','Marquez','frosas@jardineria.es',008,3,5);
INSERT INTO empleado VALUES (6,'Juan Carlos','Ortiz','Serrano','cortiz@jardineria.es',008,3,5);
INSERT INTO empleado VALUES (7,'Carlos','Soria','Jimenez','csoria@jardineria.es',004,3,6);
INSERT INTO empleado VALUES (8,'Mariano','López','Murcia','mlopez@jardineria.es',004,7,5);
INSERT INTO empleado VALUES (9,'Lucio','Campoamor','Martín','lcampoamor@jardineria.es',004,7,5);
INSERT INTO empleado VALUES (10,'Hilario','Rodriguez','Huertas','hrodriguez@jardineria.es',004,7,5);
INSERT INTO empleado VALUES (11,'Emmanuel','Magaña','Perez','manu@jardineria.es',001,3,6);
INSERT INTO empleado VALUES (12,'José Manuel','Martinez','De la Osa','jmmart@hotmail.es',001,11,5);
INSERT INTO empleado VALUES (13,'David','Palma','Aceituno','dpalma@jardineria.es',001,11,5);
INSERT INTO empleado VALUES (14,'Oscar','Palma','Aceituno','opalma@jardineria.es',001,11,5);
INSERT INTO empleado VALUES (15,'Francois','Fignon','','ffignon@gardening.com',005,3,6);
INSERT INTO empleado VALUES (16,'Lionel','Narvaez','','lnarvaez@gardening.com',005,15,5);
INSERT INTO empleado VALUES (17,'Laurent','Serra','','lserra@gardening.com',005,15,5);
INSERT INTO empleado VALUES (18,'Michael','Bolton','','mbolton@gardening.com',006,3,6);
INSERT INTO empleado VALUES (19,'Walter Santiago','Sanchez','Lopez','wssanchez@gardening.com',006,18,5);
INSERT INTO empleado VALUES (20,'Hilary','Washington','','hwashington@gardening.com',002,3,6);
INSERT INTO empleado VALUES (21,'Marcus','Paxton','','mpaxton@gardening.com',002,20,5);
INSERT INTO empleado VALUES (22,'Lorena','Paxton','','lpaxton@gardening.com',002,20,5);
INSERT INTO empleado VALUES (23,'Nei','Nishikori','','nnishikori@gardening.com',009,3,6);
INSERT INTO empleado VALUES (24,'Narumi','Riko','','nriko@gardening.com',009,23,5);
INSERT INTO empleado VALUES (25,'Takuma','Nomura','','tnomura@gardening.com',009,23,5);
INSERT INTO empleado VALUES (26,'Amy','Johnson','','ajohnson@gardening.com',003,3,6);
INSERT INTO empleado VALUES (27,'Larry','Westfalls','','lwestfalls@gardening.com',003,26,5);
INSERT INTO empleado VALUES (28,'John','Walton','','jwalton@gardening.com',003,26,5);
INSERT INTO empleado VALUES (29,'Kevin','Fallmer','','kfalmer@gardening.com',007,3,6);
INSERT INTO empleado VALUES (30,'Julian','Bellinelli','','jbellinelli@gardening.com',007,29,5);
INSERT INTO empleado VALUES (31,'Mariko','Kishi','','mkishi@gardening.com',007,29,5);

-- ----------------------------------------------------
-- INSERT TELEFONO OFICINA
-- ----------------------------------------------------

INSERT INTO telefono_oficina VALUES (NULL, '+34 93 3561182', 1, 001);
INSERT INTO telefono_oficina VALUES (NULL, '+1 215 837 0825', 2, 002);
INSERT INTO telefono_oficina VALUES (NULL, '+44 20 78772041', 3, 003);
INSERT INTO telefono_oficina VALUES (NULL,'+34 91 7514487', 2, 004);
INSERT INTO telefono_oficina VALUES (NULL, '+33 14 723 4404', 2, 005);
INSERT INTO telefono_oficina VALUES (NULL, '+1 650 219 4782', 1, 006);
INSERT INTO telefono_oficina VALUES (NULL, '+61 2 9264 2451', 3, 007);
INSERT INTO telefono_oficina VALUES (NULL, '+34 925 867231', 1, 008);
INSERT INTO telefono_oficina VALUES (NULL, '+81 33 224 5000', 3, 009);

-- ----------------------------------------------------
-- INSERT DIRECCION OFICINA
-- ----------------------------------------------------

INSERT INTO direccion_oficina VALUES (1,'Avenida Diagonal', '38', NULL,001, 1);
INSERT INTO direccion_oficina VALUES (2,'Court Place', '1550', NULL, 002, 111);
INSERT INTO direccion_oficina VALUES (3,'Old Broad Street', '52', NULL, 003, 222);
INSERT INTO direccion_oficina VALUES (4,'Bulevar Indalecio Prieto', '32', NULL, 004, 222);
INSERT INTO direccion_oficina VALUES (5,'Rue Jouffroy d''abbans', '29', NULL, 005, 333);
INSERT INTO direccion_oficina VALUES (6,'Market Street', '100', NULL, 006, 111);
INSERT INTO direccion_oficina VALUES (7,'Wentworth Avenue', '5-11', NULL, 007, 444);
INSERT INTO direccion_oficina VALUES (8,'Francisco Aguirre', '32', NULL, 008, 1);
INSERT INTO direccion_oficina VALUES (9,'Kioicho', '4-1', NULL, 009, 111);

-- ----------------------------------------------------
-- INSERT CLIENTE
-- ----------------------------------------------------
INSERT INTO cliente VALUES (1, 'GoldFish Garden',001, '24006', 3000,5);
INSERT INTO cliente VALUES (3, 'Gardening Associates',001, '24010', 6000,6);
INSERT INTO cliente VALUES (4, 'Gerudo Valley',001, '85495', 12000,9);
INSERT INTO cliente VALUES (5, 'Tendo Garden',002, '696969', 600000,8);
INSERT INTO cliente VALUES (6, 'Lasas S.A.',002, '28945', 154310,12);
INSERT INTO cliente VALUES (7, 'Beragua',003, '28942', 20000,13);
INSERT INTO cliente VALUES (8, 'Club Golf Puerta del hierro',003, '28930', 40000,14);
INSERT INTO cliente VALUES (9, 'Naturagua',004, '28947', 32000,16);
INSERT INTO cliente VALUES (10, 'DaraDistribuciones',009, '28946', 50000,16);
INSERT INTO cliente VALUES (11, 'Madrileña de riegos',008, '28943', 20000,17);
INSERT INTO cliente VALUES (12, 'Lasas S.A.',005, '28945', '15431',19);
INSERT INTO cliente VALUES (13, 'Camunas Jardines S.L.',009, '28145', 16481,21);
INSERT INTO cliente VALUES (14, 'Dardena S.A.',006, '28003', 321000,22);
INSERT INTO cliente VALUES (15, 'Jardin de Flores',005,'28950', 40000,24);
INSERT INTO cliente VALUES (16, 'Flores Marivi', 003,'28945', 1500,24);
INSERT INTO cliente VALUES (17, 'Flowers, S.A', 002,'24586', 3500,25);
INSERT INTO cliente VALUES (18, 'Naturajardin',001, '28011', 5050,27);
INSERT INTO cliente VALUES (19, 'Golf S.A.',009, '38297', 30000,28);
INSERT INTO cliente VALUES (20, 'Americh Golf Management SL',008, '12320', 20000,30);
INSERT INTO cliente VALUES (21, 'Aloha', 006,'35488', 50000,31);
INSERT INTO cliente VALUES (22, 'El Prat', 005,'12320', 30000,10);
INSERT INTO cliente VALUES (23, 'Sotogrande', 002,'11310', 60000,16);
INSERT INTO cliente VALUES (24, 'Vivero Humanes',001, '28970', 7430,24);
INSERT INTO cliente VALUES (25, 'Fuenla City', 007, '28574', 4500,24);
INSERT INTO cliente VALUES (26, 'Jardines y Mansiones Cactus SL',006, '29874', 76000,25);
INSERT INTO cliente VALUES (27, 'Jardinerías Matías SL', 005,'37845', 100500,24);
INSERT INTO cliente VALUES (28, 'Agrojardin',003, '28904', 8040,30);
INSERT INTO cliente VALUES (29, 'Top Campo', 002,'28574', 5500,31);
INSERT INTO cliente VALUES (30, 'Jardineria Sara',004, '27584', 7500,10);
INSERT INTO cliente VALUES (31, 'Campohermoso', 008,'28945', 3250,5);
INSERT INTO cliente VALUES (32, 'france telecom',006, '75010', 10000,6);
INSERT INTO cliente VALUES (33, 'Musée du Louvre', 002,'75058', 30000,9);
INSERT INTO cliente VALUES (35, 'Tutifruti S.A',001, '2000', 10000,24);
INSERT INTO cliente VALUES (36, 'Flores S.L.',009, '29643', 6000,12);
INSERT INTO cliente VALUES (37, 'The Magic Garden', 008,'65930', 10000,8);
INSERT INTO cliente VALUES (38, 'El Jardin Viviente S.L',005, '2003', 8000,24);


-- ----------------------------------------------------
-- INSERT TELEFONO CLIENTE
-- ----------------------------------------------------
INSERT INTO telefono_cliente VALUES (1, '5556901745', 1, 1);
INSERT INTO telefono_cliente VALUES (3, '5552323129', 3, 3);
INSERT INTO telefono_cliente VALUES (4, '55591233210', 4, 3);
INSERT INTO telefono_cliente VALUES (5, '34916540145', 5, 2);
INSERT INTO telefono_cliente VALUES (6, '654987321', 6, 1);
INSERT INTO telefono_cliente VALUES (7, '62456810', 7, 1);
INSERT INTO telefono_cliente VALUES (8, '689234750', 8, 3);
INSERT INTO telefono_cliente VALUES (9, '675598001', 9, 3);
INSERT INTO telefono_cliente VALUES (10, '655983045', 10, 2);
INSERT INTO telefono_cliente VALUES (11, '34914873241', 11, 1);
INSERT INTO telefono_cliente VALUES (12, '34912453217', 12, 1);
INSERT INTO telefono_cliente VALUES (14, '666555444', 14, 3);
INSERT INTO telefono_cliente VALUES (15, '698754159', 15, 2);
INSERT INTO telefono_cliente VALUES (16, '612343529', 16, 1);
INSERT INTO telefono_cliente VALUES (17, '916458762', 17, 3);
INSERT INTO telefono_cliente VALUES (18, '964493072', 18, 2);
INSERT INTO telefono_cliente VALUES (19, '916485852', 19, 1);
INSERT INTO telefono_cliente VALUES (20, '916882323', 20, 1);
INSERT INTO telefono_cliente VALUES (21, '915576622', 21, 2);
INSERT INTO telefono_cliente VALUES (22, '654987690', 22, 3);
INSERT INTO telefono_cliente VALUES (23, '675842139', 23, 2);
INSERT INTO telefono_cliente VALUES (24, '916877445', 24, 2);
INSERT INTO telefono_cliente VALUES (25, '916544147', 25, 2);
INSERT INTO telefono_cliente VALUES (26, '675432926', 26, 3);
INSERT INTO telefono_cliente VALUES (27, '685746512', 27, 1);
INSERT INTO telefono_cliente VALUES (28, '675124537', 28, 3);
INSERT INTO telefono_cliente VALUES (29, '645925376', 29, 3);
INSERT INTO telefono_cliente VALUES (30, '5120578961', 30,1);
INSERT INTO telefono_cliente VALUES (31, '0140205050', 31,2);
INSERT INTO telefono_cliente VALUES (32, '9261-2433', 32, 1);
INSERT INTO telefono_cliente VALUES (33, '654352981', 33, 1);
INSERT INTO telefono_cliente VALUES (35, '8005-7161', 35, 3);
INSERT INTO telefono_cliente VALUES (36, '8005-7162', 36, 2);


-- ----------------------------------------------------
-- INSERT DIRECCCION CLIENTE
-- ----------------------------------------------------
INSERT INTO direccion VALUES (NULL, 'False Street', '52 2 A', NULL, 1, 1);
INSERT INTO direccion VALUES (NULL, 'Wall-e Avenue', NULL, NULL, 3, 111);
INSERT INTO direccion VALUES (NULL, 'Oaks Avenue nº22', NULL, NULL, 4, 222);
INSERT INTO direccion VALUES (NULL, 'Null Street nº69', NULL, NULL, 5, 333);
INSERT INTO direccion VALUES (NULL, 'C/Leganes', '15', NULL, 6, 444);
INSERT INTO direccion VALUES (NULL, 'C/pintor segundo', NULL, NULL, 7, 1);
INSERT INTO direccion VALUES (NULL, 'C/sinesio delgado', NULL, NULL, 8, 111);
INSERT INTO direccion VALUES (NULL, 'C/majadahonda', NULL, NULL, 9, 222);
INSERT INTO direccion VALUES (NULL, 'C/azores', NULL, NULL, 10, 333);
INSERT INTO direccion VALUES (NULL, 'C/Lagañas', NULL, NULL, 11, 444);
INSERT INTO direccion VALUES (NULL, 'C/Virgenes', '45', NULL, 13, 1);
INSERT INTO direccion VALUES (NULL, 'C/Nueva York', '74', NULL, 14, 111);
INSERT INTO direccion VALUES (NULL, 'C/ Oña', '34', NULL, 15, 222);
INSERT INTO direccion VALUES (NULL, 'C/Leganes24', NULL, NULL, 16, 333);
INSERT INTO direccion VALUES (NULL, 'C/Luis Salquillo4', NULL, NULL, 17, 444);
INSERT INTO direccion VALUES (NULL, 'Plaza Magallón', '15', NULL, 18, 1);
INSERT INTO direccion VALUES (NULL, 'C/Estancado', NULL, NULL, 19, 111);
INSERT INTO direccion VALUES (NULL, 'C/Roman', '3', NULL, 20, 222);
INSERT INTO direccion VALUES (NULL, 'Avenida Tibidabo', NULL, NULL, 21, 333);
INSERT INTO direccion VALUES (NULL, 'C/Paseo del Parque', NULL, NULL, 22, 444);
INSERT INTO direccion VALUES (NULL, 'C/Miguel Echegaray', '54', NULL, 23, 1);
INSERT INTO direccion VALUES (NULL, 'C/Callo', '52', NULL, 24, 111);
INSERT INTO direccion VALUES (NULL, 'Polígono Industrial Maspalomas, Nº52', NULL, NULL, 25, 222);
INSERT INTO direccion VALUES (NULL, 'C/Francisco Arce, Nº44', NULL, NULL, 26, 333);
INSERT INTO direccion VALUES (NULL, 'C/Mar Caspio', '43', NULL, 27, 444);
INSERT INTO direccion VALUES (NULL, 'C/Ibiza', '32', NULL, 28, 1);
INSERT INTO direccion VALUES (NULL, 'C/Lima', '1', NULL, 29, 111);
INSERT INTO direccion VALUES (NULL, 'C/Peru', '78', NULL, 30, 222);
INSERT INTO direccion VALUES (NULL, '6 place d Alleray', '15ème', NULL, 31, 333);
INSERT INTO direccion VALUES (NULL, 'Quai du Louvre', NULL, NULL, 32, 444);
INSERT INTO direccion VALUES (NULL, 'level 24, St. Martins Tower.-31 Market St.', NULL, NULL, 33, 1);


-- ----------------------------------------------------
-- INSERT CONTACTO
-- ----------------------------------------------------

INSERT INTO contacto VALUES ('GC-001', 'Daniel', 'G', 'daniel@ejemplo.com', 'García', NULL,1);
INSERT INTO contacto VALUES ('GG-003', 'Link', 'F', 'link@ejemplo.com', NULL, NULL,3);
INSERT INTO contacto VALUES ('TG-004', 'Akane', 'T', 'akane@ejemplo.com', NULL, NULL,4);
INSERT INTO contacto VALUES ('LAS-005', 'Antonio', 'L', 'antonio@ejemplo.com', NULL, NULL,5);
INSERT INTO contacto VALUES ('BJ-006', 'Jose', 'B', 'jose@ejemplo.com', NULL, NULL,6);
INSERT INTO contacto VALUES ('PL-007', 'Paco', 'L', 'paco@ejemplo.com', NULL, NULL,7);
INSERT INTO contacto VALUES ('GR-008', 'Guillermo', 'R', 'guillermo@ejemplo.com', NULL, NULL,8);
INSERT INTO contacto VALUES ('DS-009', 'David', 'S', 'david@ejemplo.com', NULL, NULL,9);
INSERT INTO contacto VALUES ('JT-010', 'Jose', 'T', 'jose@ejemplo.com', NULL, NULL,10);
INSERT INTO contacto VALUES ('LAS-011', 'Antonio', 'L', 'antonio@ejemplo.com', NULL, NULL,11);
INSERT INTO contacto VALUES ('PC-012', 'Pedro', 'C', 'pedro@ejemplo.com', NULL, NULL,12);
INSERT INTO contacto VALUES ('JR-013', 'Juan', 'R', 'juan@ejemplo.com', NULL, NULL,13);
INSERT INTO contacto VALUES ('JV-014', 'Javier', 'V', 'javier@ejemplo.com', NULL, NULL,14);
INSERT INTO contacto VALUES ('MR-015', 'Maria', 'R', 'maria@ejemplo.com', NULL, NULL,15);
INSERT INTO contacto VALUES ('BF-016', 'Beatriz', 'F', 'beatriz@ejemplo.com', NULL, NULL,16);
INSERT INTO contacto VALUES ('VC-017', 'Victoria', 'C', 'victoria@ejemplo.com', NULL, NULL,17);
INSERT INTO contacto VALUES ('LM-018', 'Luis', 'M', 'luis@ejemplo.com', NULL, NULL,18);
INSERT INTO contacto VALUES ('MS-019', 'Mario', 'S', 'mario@ejemplo.com', NULL, NULL,19);
INSERT INTO contacto VALUES ('CR-020', 'Cristian', 'R', 'cristian@ejemplo.com', NULL, NULL, 20);
INSERT INTO contacto VALUES ('FC-021', 'Francisco', 'C', 'francisco@ejemplo.com', NULL, NULL,21);
INSERT INTO contacto VALUES ('MS-022', 'Maria', 'S', 'maria@ejemplo.com', NULL, NULL,22);
INSERT INTO contacto VALUES ('FG-023', 'Federico', 'G', 'federico@ejemplo.com', NULL, NULL,23);
INSERT INTO contacto VALUES ('TM-024', 'Tony', 'M', 'tony@ejemplo.com', NULL, NULL, 24);
INSERT INTO contacto VALUES ('EMS-025', 'Eva María', 'S', 'eva@ejemplo.com', NULL, NULL, 25);
INSERT INTO contacto VALUES ('MSM-026', 'Matías', 'S', 'matias@ejemplo.com', NULL, NULL, 26);
INSERT INTO contacto VALUES ('BL-027', 'Benito', 'L', 'benito@ejemplo.com', NULL, NULL, 27);
INSERT INTO contacto VALUES ('JS-028', 'Joseluis', 'S', 'joseluis@ejemplo.com', NULL, NULL, 28);
INSERT INTO contacto VALUES ('SM-029', 'Sara', 'M', 'sara@ejemplo.com', NULL, NULL, 29);
INSERT INTO contacto VALUES ('LJ-030', 'Luis', 'J', 'luis@ejemplo.com', NULL, NULL, 30);
INSERT INTO contacto VALUES ('FT-031', 'Fraçois', 'T', 'francois@ejemplo.com', NULL, NULL, 31);
INSERT INTO contacto VALUES ('PD-032', 'Pierre', 'D', 'pierre@ejemplo.com', NULL, NULL, 32);
INSERT INTO contacto VALUES ('JJ-033', 'Jacob', 'J', 'jacob@ejemplo.com', NULL, NULL, 33);
INSERT INTO contacto VALUES ('RM-035', 'Richard', 'M', 'richard@ejemplo.com', NULL, NULL, 35);
INSERT INTO contacto VALUES ('JS-036', 'Justin', 'S', 'justin@ejemplo.com', NULL, NULL, 36);
INSERT INTO contacto VALUES ('GA-002', 'Anne', 'W', 'anne@ejemplo.com', NULL, NULL,37);
INSERT INTO contacto VALUES ('AR-034', 'Antonio', 'R', 'antonio@ejemplo.com', NULL, NULL, 38);

-- ----------------------------------------------------
-- INSERT PAGO
-- ----------------------------------------------------

INSERT INTO pago  VALUES (1, '2008-11-10', 2000, 1, 1);
INSERT INTO pago  VALUES (2, '2008-12-10', 2000, 1, 2);
INSERT INTO pago  VALUES (3, '2009-01-16', 5000, 3, 3);
INSERT INTO pago  VALUES (4, '2009-02-16', 5000, 3, 1);
INSERT INTO pago  VALUES (5, '2009-02-19', 926, 3, 3);
INSERT INTO pago  VALUES (6, '2007-01-08', 20000, 4, 3);
INSERT INTO pago  VALUES (7, '2007-01-08', 20000, 4, 2);
INSERT INTO pago  VALUES (8, '2007-01-08', 20000, 4, 3);
INSERT INTO pago  VALUES (9, '2007-01-08', 20000, 4, 2);
INSERT INTO pago  VALUES (10, '2007-01-08', 1849, 4, 3);
INSERT INTO pago  VALUES (11, '2006-01-18', 23794, 5, 2);
INSERT INTO pago  VALUES (12, '2009-01-13', 2390, 7, 1);
INSERT INTO pago  VALUES (13, '2009-01-06', 929, 9, 2);
INSERT INTO pago  VALUES (14, '2008-08-04', 2246, 13, 2);
INSERT INTO pago  VALUES (15, '2008-07-15', 4160, 14, 3);
INSERT INTO pago  VALUES (16, '2009-01-15', 2081, 15, 1);
INSERT INTO pago  VALUES (17, '2009-02-15', 10000, 15, 1);
INSERT INTO pago  VALUES (18, '2009-02-16', 4399, 16, 1);
INSERT INTO pago  VALUES (19, '2009-03-06', 232, 19, 3);
INSERT INTO pago  VALUES (20, '2009-03-26', 272, 23, 2);
INSERT INTO pago  VALUES (21, '2008-03-18', 18846, 26, 2);
INSERT INTO pago  VALUES (22, '2009-02-08', 10972, 27, 2);
INSERT INTO pago  VALUES (23, '2009-01-13', 8489, 28, 3);
INSERT INTO pago  VALUES (24, '2009-01-16', 7863, 30, 1);
INSERT INTO pago  VALUES (25, '2007-10-06', 3321, 35, 2);
INSERT INTO pago  VALUES (26, '2006-05-26', 1171, 38, 3);

-- ----------------------------------------------------
-- INSERT DIMENSIONES
-- ----------------------------------------------------
INSERT INTO dimensiones VALUES ('DIM001', '100', '50', '30', '10');
INSERT INTO dimensiones VALUES ('DIM002', '80', '40', '25', '8');
INSERT INTO dimensiones VALUES ('DIM003', '120', '60', '35', '12');
INSERT INTO dimensiones VALUES ('DIM004', '90', '45', '28', '9');
INSERT INTO dimensiones VALUES ('DIM005', '110', '55', '32', '11');
INSERT INTO dimensiones VALUES ('DIM006', '95', '47', '29', '9.5');
INSERT INTO dimensiones VALUES ('DIM007', '105', '52', '31', '10.5');
INSERT INTO dimensiones VALUES ('DIM008', '85', '42', '26', '8.5');
INSERT INTO dimensiones VALUES ('DIM009', '115', '57', '33', '11.5');
INSERT INTO dimensiones VALUES ('DIM010', '125', '62', '36', '12.5');
INSERT INTO dimensiones VALUES ('DIM011', '130', '65', '38', '13');
INSERT INTO dimensiones VALUES ('DIM012', '75', '37', '23', '7.5');
INSERT INTO dimensiones VALUES ('DIM013', '140', '70', '40', '14');
INSERT INTO dimensiones VALUES ('DIM014', '70', '35', '22', '7');
INSERT INTO dimensiones VALUES ('DIM015', '150', '75', '45', '15');

-- ----------------------------------------------------
-- INSERT PRODUCTO
-- ----------------------------------------------------
INSERT INTO producto VALUES ('PRD001', 'Ramo de Rosas Rojas', 1, 50, 35.99, 'Ramo de rosas rojas frescas', 'DIM001');
INSERT INTO producto VALUES ('PRD002', 'Caja de Rosas Blancas', 2, 30, 25.50, 'Caja de rosas blancas para regalo', 'DIM002');
INSERT INTO producto VALUES ('PRD003', 'Bouquet de Tulipanes', 3, 40, 45.75, 'Bouquet de tulipanes variados', 'DIM003');
INSERT INTO producto VALUES ('PRD004', 'Orquídea Phalaenopsis', 4, 20, 60.00, 'Orquídea Phalaenopsis en maceta de cerámica', 'DIM004');
INSERT INTO producto VALUES ('PRD005', 'Cesta de Plantas Variadas', 5, 35, 55.25, 'Cesta de plantas variadas: suculentas, cactus, etc.', 'DIM005');
INSERT INTO producto VALUES ('PRD006', 'Ramo de Girasoles', 1, 60, 30.99, 'Ramo de girasoles frescos', 'DIM006');
INSERT INTO producto VALUES ('PRD007', 'Lavanda', 1, 25, 12.99, 'Planta de lavanda para aromaterapia', 'DIM007');
INSERT INTO producto VALUES ('PRD008', 'Helechos', 1, 40, 18.75, 'Variedad de helechos para interiores', 'DIM008');
INSERT INTO producto VALUES ('PRD009', 'Amapolas', 1, 30, 9.50, 'Flores de amapolas en varios colores', 'DIM009');
INSERT INTO producto VALUES ('PRD010', 'Pala de jardín', 2, 15, 32.50, 'Pala resistente para la jardinería', 'DIM005');
INSERT INTO producto VALUES ('PRD011', 'Tijeras de podar', 2, 50, 14.99, 'Tijeras de podar profesionales', 'DIM004');
INSERT INTO producto VALUES ('PRD012', 'Regadera', 2, 35, 20.75, 'Regadera de plástico resistente', 'DIM002');
INSERT INTO producto VALUES ('PRD013', 'Menta', 3, 20, 8.99, 'Planta de menta para infusiones', 'DIM001');
INSERT INTO producto VALUES ('PRD014', 'Romero', 3, 28, 10.50, 'Planta de romero para condimentar', 'DIM002');
INSERT INTO producto VALUES ('PRD015', 'Albahaca', 3, 22, 7.75, 'Planta de albahaca para cocina', 'DIM003');
INSERT INTO producto VALUES ('PRD016', 'Manzano', 4, 18, 45.99, 'Árbol de manzanas dulces', 'DIM004');
INSERT INTO producto VALUES ('PRD017', 'Limón', 4, 25, 30.50, 'Árbol de limones para el jardín', 'DIM005');
INSERT INTO producto VALUES ('PRD018', 'Naranjo', 4, 20, 35.75, 'Árbol de naranjas frescas', 'DIM010');
INSERT INTO producto VALUES ('PRD019', 'Dalia', 5, 32, 22.99, 'Flores de dalia en varios colores', 'DIM008');
INSERT INTO producto VALUES ('PRD020', 'Azalea', 5, 28, 28.50, 'Planta de azalea para jardines', 'DIM004');
INSERT INTO producto VALUES ('PRD021', 'Begonia', 5, 35, 15.75, 'Flores de begonia en maceta', 'DIM009');
INSERT INTO producto VALUES ('PRD025', 'Semillas de Tomate', 4, 50, 5.99, 'Paquete de semillas de tomate', 'DIM013');
INSERT INTO producto VALUES ('PRD026', 'Kit de Plantación', 2, 60, 29.99, 'Kit completo para plantar en el jardín', 'DIM003');
INSERT INTO producto VALUES ('PRD027', 'Fertilizante Orgánico', 5, 45, 8.75, 'Fertilizante natural para plantas', 'DIM004');
INSERT INTO producto VALUES ('PRD028', 'Terrario de Suculentas', 5, 20, 42.50, 'Terrario con variedad de suculentas', 'DIM005');
INSERT INTO producto VALUES ('PRD029', 'Kit de Jardinería Infantil', 2, 15, 19.99, 'Kit de jardinería para niños', 'DIM002');
INSERT INTO producto VALUES ('PRD030', 'Set de Macetas de Cerámica', 5, 40, 55.99, 'Set de macetas de colores', 'DIM015');

-- ----------------------------------------------------
-- INSERT PROVEEDORES
-- ----------------------------------------------------
INSERT INTO proveedor VALUES (1, 'FloraLand', 'floraland@example.com');
INSERT INTO proveedor VALUES (2, 'PetalsRUs', 'petalsrus@example.com');
INSERT INTO proveedor VALUES (3, 'GardenDelights', 'gardendelights@example.com');
INSERT INTO proveedor VALUES (4, 'BloomMagic', 'bloommagic@example.com');
INSERT INTO proveedor VALUES (5, 'EvergreenSupplies', 'evergreensupplies@example.com');
INSERT INTO proveedor VALUES (6, 'FlowerFusion', 'flowerfusion@example.com');
INSERT INTO proveedor VALUES (7, 'GreenHarmony', 'greenharmony@example.com');
INSERT INTO proveedor VALUES (8, 'NatureWonders', 'naturewonders@example.com');
INSERT INTO proveedor VALUES (9, 'BlossomHaven', 'blossomhaven@example.com');
INSERT INTO proveedor VALUES (10, 'PetalPerfection', 'petalperfection@example.com');
INSERT INTO proveedor VALUES (11, 'GardenGlow', 'gardenglow@example.com');
INSERT INTO proveedor VALUES (12, 'FloralEssence', 'floralessence@example.com');
INSERT INTO proveedor VALUES (13, 'SunriseBlooms', 'sunriseblooms@example.com');
INSERT INTO proveedor VALUES (14, 'GoldenGardens', 'goldengardens@example.com');
INSERT INTO proveedor VALUES (15, 'PetuniaParadise', 'petuniaparadise@example.com');
INSERT INTO proveedor VALUES (16, 'MorningMeadows', 'morningmeadows@example.com');
INSERT INTO proveedor  VALUES (17, 'FlowerField', 'flowerfield@example.com');
INSERT INTO proveedor  VALUES (18, 'BlossomBazaar', 'blossombazaar@example.com');
INSERT INTO proveedor  VALUES (19, 'GardenGlory', 'gardenglory@example.com');
INSERT INTO proveedor  VALUES (20, 'PetalPleasures', 'petalpleasures@example.com');
INSERT INTO proveedor  VALUES (21, 'BotanicBeauty', 'botanicbeauty@example.com');
INSERT INTO proveedor  VALUES (22, 'SunflowerSource', 'sunflowersource@example.com');
INSERT INTO proveedor  VALUES (23, 'GreenThumb', 'greenthumb@example.com');
INSERT INTO proveedor  VALUES (24, 'FlowerFantasy', 'flowerfantasy@example.com');
INSERT INTO proveedor  VALUES (25, 'BloomBoutique', 'bloomboutique@example.com');
INSERT INTO proveedor  VALUES (26, 'RoseRidge', 'roseridge@example.com');
INSERT INTO proveedor  VALUES (27, 'TropicalTreats', 'tropicaltreats@example.com');
INSERT INTO proveedor  VALUES (28, 'GreenGroves', 'greengroves@example.com');
INSERT INTO proveedor  VALUES (29, 'FlowerFiesta', 'flowerfiesta@example.com');
INSERT INTO proveedor  VALUES (30, 'PetalPavilion', 'petalpavilion@example.com');
INSERT INTO proveedor  VALUES (31, 'LushLandscapes', 'lushlandscapes@example.com');
INSERT INTO proveedor  VALUES (32, 'BlossomBounty', 'blossombounty@example.com');

-- ----------------------------------------------------
-- INSERT PRODUCTO PROVEEDOR
-- ----------------------------------------------------

INSERT INTO producto_proveedor VALUES ('PRD001', 1, 15.99);
INSERT INTO producto_proveedor VALUES ('PRD002', 2, 20.50);
INSERT INTO producto_proveedor VALUES ('PRD003', 3, 18.75);
INSERT INTO producto_proveedor VALUES ('PRD004', 4, 12.99);
INSERT INTO producto_proveedor VALUES ('PRD005', 5, 9.99);
INSERT INTO producto_proveedor VALUES ('PRD006', 6, 14.25);
INSERT INTO producto_proveedor VALUES ('PRD007', 7, 16.50);
INSERT INTO producto_proveedor VALUES ('PRD008', 8, 22.99);
INSERT INTO producto_proveedor VALUES ('PRD009', 9, 19.99);
INSERT INTO producto_proveedor VALUES ('PRD010', 10, 17.25);
INSERT INTO producto_proveedor VALUES ('PRD011', 11, 13.99);
INSERT INTO producto_proveedor VALUES ('PRD012', 12, 24.50);
INSERT INTO producto_proveedor VALUES ('PRD013', 13, 28.75);
INSERT INTO producto_proveedor VALUES ('PRD014', 14, 32.99);
INSERT INTO producto_proveedor VALUES ('PRD015', 15, 29.99);
INSERT INTO producto_proveedor VALUES ('PRD016', 16, 26.25);
INSERT INTO producto_proveedor VALUES ('PRD017', 17, 18.99);
INSERT INTO producto_proveedor VALUES ('PRD018', 18, 21.50);
INSERT INTO producto_proveedor VALUES ('PRD019', 19, 17.75);
INSERT INTO producto_proveedor VALUES ('PRD020', 20, 14.99);
INSERT INTO producto_proveedor VALUES ('PRD021', 21, 11.99);
INSERT INTO producto_proveedor VALUES ('PRD025', 25, 22.75);
INSERT INTO producto_proveedor VALUES ('PRD026', 26, 19.99);
INSERT INTO producto_proveedor VALUES ('PRD027', 27, 15.99);
INSERT INTO producto_proveedor VALUES ('PRD028', 28, 18.50);
INSERT INTO producto_proveedor VALUES ('PRD029', 29, 23.75);
INSERT INTO producto_proveedor VALUES ('PRD030', 30, 27.99);

-- ----------------------------------------------------
-- INSERT PEDIDO
-- ----------------------------------------------------

-- Inserts para la tabla pedido
INSERT INTO pedido VALUES ('PED001', '2024-01-10', '2024-01-15', '2024-01-15', 'Sin comentarios', 1, 1);
INSERT INTO pedido VALUES ('PED003', '2024-01-12', '2024-01-17', '2024-01-17', 'Sin comentarios', 3, 3);
INSERT INTO pedido VALUES ('PED004', '2024-01-13', '2024-01-18', NULL, 'Sin comentarios', 4, 1);
INSERT INTO pedido VALUES ('PED005', '2024-01-14', '2024-01-19', '2024-01-19', 'Sin comentarios', 5, 2);
INSERT INTO pedido VALUES ('PED006', '2024-01-15', '2024-01-20', '2024-01-20', 'Sin comentarios', 6, 3);
INSERT INTO pedido VALUES ('PED007', '2024-01-16', '2024-01-21', NULL, 'Sin comentarios', 7, 1);
INSERT INTO pedido VALUES ('PED008', '2024-01-17', '2024-01-22', '2024-01-22', 'Sin comentarios', 8, 2);
INSERT INTO pedido VALUES ('PED009', '2024-01-18', '2024-01-23', '2024-01-23', 'Sin comentarios', 9, 3);
INSERT INTO pedido VALUES ('PED010', '2024-01-19', '2024-01-24', NULL, 'Sin comentarios', 10, 1);
INSERT INTO pedido VALUES ('PED011', '2024-01-20', '2024-01-25', '2024-01-25', 'Sin comentarios', 11, 2);
INSERT INTO pedido VALUES ('PED012', '2024-01-21', '2024-01-26', NULL, 'Sin comentarios', 12, 3);
INSERT INTO pedido VALUES ('PED013', '2024-01-22', '2024-01-27', '2024-01-27', 'Sin comentarios', 13, 1);
INSERT INTO pedido VALUES ('PED014', '2024-01-23', '2024-01-28', '2024-01-28', 'Sin comentarios', 14, 2);
INSERT INTO pedido VALUES ('PED015', '2024-01-24', '2024-01-29', NULL, 'Sin comentarios', 15, 3);
INSERT INTO pedido VALUES ('PED016', '2024-01-25', '2024-01-30', '2024-01-30', 'Sin comentarios', 16, 1);
INSERT INTO pedido VALUES ('PED017', '2024-01-26', '2024-01-31', '2024-01-31', 'Sin comentarios', 17, 2);
INSERT INTO pedido VALUES ('PED018', '2024-01-27', '2024-02-01', NULL, 'Sin comentarios', 18, 3);
INSERT INTO pedido VALUES ('PED019', '2024-01-28', '2024-02-02', '2024-02-02', 'Sin comentarios', 19, 1);
INSERT INTO pedido VALUES ('PED020', '2024-01-29', '2024-02-03', '2024-02-03', 'Sin comentarios', 20, 2);
INSERT INTO pedido VALUES ('PED021', '2009-01-30', '2009-02-04', '2009-02-04', 'Sin comentarios', 21, 1);
INSERT INTO pedido VALUES ('PED022', '2009-01-31', '2009-02-05', '2009-02-05', 'Sin comentarios', 22, 2);
INSERT INTO pedido VALUES ('PED023', '2009-02-01', '2009-02-06', '2009-02-06', 'Sin comentarios', 23, 3);
INSERT INTO pedido VALUES ('PED024', '2009-02-02', '2009-02-07', '2009-02-07', 'Sin comentarios', 24, 1);
INSERT INTO pedido VALUES ('PED025', '2009-02-03', '2009-02-08', '2009-02-08', 'Sin comentarios', 25, 2);
INSERT INTO pedido VALUES ('PED026', '2009-02-04', '2009-02-09', '2009-02-09', 'Sin comentarios', 26, 3);
INSERT INTO pedido VALUES ('PED027', '2009-02-05', '2009-02-10', '2009-02-10', 'Sin comentarios', 27, 1);
INSERT INTO pedido VALUES ('PED028', '2009-02-06', '2009-02-11', '2009-02-11', 'Sin comentarios', 28, 2);
INSERT INTO pedido VALUES ('PED029', '2009-02-07', '2009-02-12', '2009-02-12', 'Sin comentarios', 29, 3);
INSERT INTO pedido VALUES ('PED030', '2009-02-08', '2009-02-13', '2009-02-13', 'Sin comentarios', 30, 1);
INSERT INTO pedido VALUES ('PED031', '2009-02-09', '2009-02-14', '2009-02-14', 'Sin comentarios', 31, 2);
INSERT INTO pedido VALUES ('PED032', '2009-02-10', '2009-02-15', '2009-02-15', 'Sin comentarios', 32, 3);
INSERT INTO pedido VALUES ('PED033', '2009-02-11', '2009-02-16', '2009-02-16', 'Sin comentarios', 33, 1);
INSERT INTO pedido VALUES ('PED035', '2009-02-13', '2009-02-18', '2009-02-18', 'Sin comentarios', 35, 3);
INSERT INTO pedido VALUES ('PED036', '2009-02-14', '2009-02-19', '2009-02-19', 'Sin comentarios', 36, 1);
INSERT INTO pedido VALUES ('PED037', '2009-02-15', '2009-02-20', '2009-02-20', 'Sin comentarios', 37, 2);
INSERT INTO pedido VALUES ('PED038', '2009-02-16', '2009-02-21', '2009-02-21', 'Sin comentarios', 38, 3);
INSERT INTO pedido VALUES ('PED039', '2009-02-17', '2009-02-22', '2009-02-22', 'Sin comentarios', 1, 1);


-- ----------------------------------------------------
-- INSERT DETALLE DE PEDIDO
-- ----------------------------------------------------
INSERT INTO detalle_pedido VALUES ('PRD001', 'PED001', 5, 12.50, 1);
INSERT INTO detalle_pedido VALUES ('PRD003', 'PED003', 2, 8.75, 3);
INSERT INTO detalle_pedido VALUES ('PRD004', 'PED004', 4, 10.99, 4);
INSERT INTO detalle_pedido VALUES ('PRD005', 'PED005', 6, 7.99, 5);
INSERT INTO detalle_pedido VALUES ('PRD006', 'PED006', 1, 18.50, 6);
INSERT INTO detalle_pedido VALUES ('PRD007', 'PED007', 2, 14.25, 7);
INSERT INTO detalle_pedido VALUES ('PRD008', 'PED008', 3, 20.99, 8);
INSERT INTO detalle_pedido VALUES ('PRD009', 'PED009', 5, 16.75, 9);
INSERT INTO detalle_pedido VALUES ('PRD010', 'PED010', 2, 11.99, 10);
INSERT INTO detalle_pedido VALUES ('PRD011', 'PED011', 3, 9.50, 11);
INSERT INTO detalle_pedido VALUES ('PRD012', 'PED012', 4, 22.75, 12);
INSERT INTO detalle_pedido VALUES ('PRD013', 'PED013', 2, 28.99, 13);
INSERT INTO detalle_pedido VALUES ('PRD014', 'PED014', 1, 32.50, 14);
INSERT INTO detalle_pedido VALUES ('PRD015', 'PED015', 3, 29.99, 15);
INSERT INTO detalle_pedido VALUES ('PRD016', 'PED016', 4, 17.99, 16);
INSERT INTO detalle_pedido VALUES ('PRD017', 'PED017', 5, 12.75, 17);
INSERT INTO detalle_pedido VALUES ('PRD018', 'PED018', 3, 21.50, 18);
INSERT INTO detalle_pedido VALUES ('PRD019', 'PED019', 2, 19.99, 19);
INSERT INTO detalle_pedido VALUES ('PRD020', 'PED020', 6, 14.50, 20);
INSERT INTO detalle_pedido VALUES ('PRD021', 'PED021', 1, 27.75, 21);
INSERT INTO detalle_pedido VALUES ('PRD025', 'PED025', 3, 18.75, 25);
INSERT INTO detalle_pedido VALUES ('PRD026', 'PED026', 5, 22.99, 26);
INSERT INTO detalle_pedido VALUES ('PRD027', 'PED027', 2, 26.50, 27);
INSERT INTO detalle_pedido VALUES ('PRD028', 'PED028', 3, 14.99, 28);
INSERT INTO detalle_pedido VALUES ('PRD029', 'PED029', 4, 31.75, 29);
INSERT INTO detalle_pedido VALUES ('PRD030', 'PED030', 3, 24.50, 30);
INSERT INTO detalle_pedido VALUES ('PRD025', 'PED031', 4, 30.99, 31);
INSERT INTO detalle_pedido VALUES ('PRD026', 'PED032', 2, 16.75, 32);
INSERT INTO detalle_pedido VALUES ('PRD027', 'PED033', 3, 21.99, 33);
