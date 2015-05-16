/*
Navicat MySQL Data Transfer

Source Server         : cnMySQL
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : db_acopio

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-05-08 11:39:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_cargo
-- ----------------------------
DROP TABLE IF EXISTS `tb_cargo`;
CREATE TABLE `tb_cargo` (
  `Id_Cargo` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Id_Cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cargo
-- ----------------------------
INSERT INTO `tb_cargo` VALUES ('1', 'GERENTE GENERAL');

-- ----------------------------
-- Table structure for tb_cargo_permisos
-- ----------------------------
DROP TABLE IF EXISTS `tb_cargo_permisos`;
CREATE TABLE `tb_cargo_permisos` (
  `Id_Cargo` int(11) NOT NULL,
  `Id_Permisos` int(11) NOT NULL,
  PRIMARY KEY (`Id_Cargo`,`Id_Permisos`),
  KEY `fk_Tb_Cargo_has_Tb_Permisos_Tb_Permisos1_idx` (`Id_Permisos`),
  KEY `fk_Tb_Cargo_has_Tb_Permisos_Tb_Cargo1_idx` (`Id_Cargo`),
  CONSTRAINT `fk_Tb_Cargo_has_Tb_Permisos_Tb_Cargo1` FOREIGN KEY (`Id_Cargo`) REFERENCES `tb_cargo` (`Id_Cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Cargo_has_Tb_Permisos_Tb_Permisos1` FOREIGN KEY (`Id_Permisos`) REFERENCES `tb_permisos` (`Id_Permisos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cargo_permisos
-- ----------------------------
INSERT INTO `tb_cargo_permisos` VALUES ('1', '1');
INSERT INTO `tb_cargo_permisos` VALUES ('1', '2');
INSERT INTO `tb_cargo_permisos` VALUES ('1', '3');
INSERT INTO `tb_cargo_permisos` VALUES ('1', '4');

-- ----------------------------
-- Table structure for tb_certificacion
-- ----------------------------
DROP TABLE IF EXISTS `tb_certificacion`;
CREATE TABLE `tb_certificacion` (
  `Id_Certificacion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`Id_Certificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_certificacion
-- ----------------------------
INSERT INTO `tb_certificacion` VALUES ('1', 'ORGANICO: NOP USDA-UE-JAS');
INSERT INTO `tb_certificacion` VALUES ('2', 'FLO-FAIRTRADE');
INSERT INTO `tb_certificacion` VALUES ('3', 'STARBUCKS');
INSERT INTO `tb_certificacion` VALUES ('4', '4C');
INSERT INTO `tb_certificacion` VALUES ('5', 'RAINFOREST ALLIANCE');

-- ----------------------------
-- Table structure for tb_cliente
-- ----------------------------
DROP TABLE IF EXISTS `tb_cliente`;
CREATE TABLE `tb_cliente` (
  `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Razon_Social` varchar(45) NOT NULL,
  `Nro_RUC` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cliente
-- ----------------------------

-- ----------------------------
-- Table structure for tb_controlcalidad
-- ----------------------------
DROP TABLE IF EXISTS `tb_controlcalidad`;
CREATE TABLE `tb_controlcalidad` (
  `id_ControlCalidad` int(11) NOT NULL,
  `Humedad` decimal(10,0) DEFAULT NULL,
  `Rendimiento_Final` varchar(45) DEFAULT NULL,
  `Total_Granos` int(11) DEFAULT NULL,
  `Total_Procentaje` decimal(10,0) DEFAULT NULL,
  `Observaciones` text,
  PRIMARY KEY (`id_ControlCalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_controlcalidad
-- ----------------------------

-- ----------------------------
-- Table structure for tb_cuenca
-- ----------------------------
DROP TABLE IF EXISTS `tb_cuenca`;
CREATE TABLE `tb_cuenca` (
  `Id_Cuenca` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Cuenca`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cuenca
-- ----------------------------
INSERT INTO `tb_cuenca` VALUES ('1', 'CUENCA 1');

-- ----------------------------
-- Table structure for tb_datos
-- ----------------------------
DROP TABLE IF EXISTS `tb_datos`;
CREATE TABLE `tb_datos` (
  `Id_Datos` int(11) NOT NULL AUTO_INCREMENT,
  `Paterno` varchar(30) DEFAULT NULL,
  `Materno` varchar(45) DEFAULT NULL,
  `Nombres` varchar(45) DEFAULT NULL,
  `Nro_DocIdentidad` varchar(15) DEFAULT NULL,
  `Id_Departamento` int(11) NOT NULL,
  `Id_Cargo` int(11) NOT NULL,
  PRIMARY KEY (`Id_Datos`),
  KEY `fk_Tb_Datos_Tb_Departamento1_idx` (`Id_Departamento`),
  KEY `fk_Tb_Datos_Tb_Cargo1_idx` (`Id_Cargo`),
  CONSTRAINT `fk_Tb_Datos_Tb_Cargo1` FOREIGN KEY (`Id_Cargo`) REFERENCES `tb_cargo` (`Id_Cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Datos_Tb_Departamento1` FOREIGN KEY (`Id_Departamento`) REFERENCES `tb_departamento` (`Id_Departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_datos
-- ----------------------------
INSERT INTO `tb_datos` VALUES ('1', 'QUISPE', 'QUISPE', 'JOHN KENY', '12345678', '1', '1');

-- ----------------------------
-- Table structure for tb_departamento
-- ----------------------------
DROP TABLE IF EXISTS `tb_departamento`;
CREATE TABLE `tb_departamento` (
  `Id_Departamento` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Id_Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_departamento
-- ----------------------------
INSERT INTO `tb_departamento` VALUES ('1', 'ACOPIO');

-- ----------------------------
-- Table structure for tb_detalle_controlcalidad
-- ----------------------------
DROP TABLE IF EXISTS `tb_detalle_controlcalidad`;
CREATE TABLE `tb_detalle_controlcalidad` (
  `Id_ControlCalidad` int(11) NOT NULL,
  `Id_NotaIngreso` int(11) NOT NULL,
  `Gramos` decimal(10,0) DEFAULT NULL,
  `Porcentaje` decimal(10,0) DEFAULT NULL,
  `Presencia_Granos` varchar(45) DEFAULT NULL,
  `Id_Certificacion` int(11) NOT NULL,
  PRIMARY KEY (`Id_ControlCalidad`,`Id_NotaIngreso`),
  KEY `fk_Tb_Detalle_ControlCalidad_Tb_ControlCalidad1_idx` (`Id_ControlCalidad`),
  KEY `fk_Tb_Detalle_ControlCalidad_Tb_NotaIngreso1_idx` (`Id_NotaIngreso`),
  KEY `fk_Tb_Detalle_ControlCalidad_Tb_Certificacion1_idx` (`Id_Certificacion`),
  CONSTRAINT `fk_Tb_Detalle_ControlCalidad_Tb_Certificacion1` FOREIGN KEY (`Id_Certificacion`) REFERENCES `tb_certificacion` (`Id_Certificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Detalle_ControlCalidad_Tb_ControlCalidad1` FOREIGN KEY (`Id_ControlCalidad`) REFERENCES `tb_controlcalidad` (`id_ControlCalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Detalle_ControlCalidad_Tb_NotaIngreso1` FOREIGN KEY (`Id_NotaIngreso`) REFERENCES `tb_notaingreso` (`Id_NotaIngreso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_detalle_controlcalidad
-- ----------------------------

-- ----------------------------
-- Table structure for tb_detalle_liqcompra
-- ----------------------------
DROP TABLE IF EXISTS `tb_detalle_liqcompra`;
CREATE TABLE `tb_detalle_liqcompra` (
  `Id_LiqCompra` int(11) NOT NULL,
  `Id_Producto` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioUnitario` decimal(10,0) DEFAULT NULL,
  `Importe` decimal(10,0) DEFAULT NULL,
  `Id_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_LiqCompra`,`Id_Producto`),
  KEY `fk_Tb_LiqCompra_has_Tb_TipoCafe_Tb_LiqCompra_idx` (`Id_LiqCompra`),
  KEY `fk_Tb_Detalle_LiqCompra_Tb_Usuario1_idx` (`Id_Usuario`),
  KEY `fk_Tb_Detalle_LiqCompra_Tb_Producto1_idx` (`Id_Producto`),
  CONSTRAINT `fk_Tb_Detalle_LiqCompra_Tb_Producto1` FOREIGN KEY (`Id_Producto`) REFERENCES `tb_producto` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Detalle_LiqCompra_Tb_Usuario1` FOREIGN KEY (`Id_Usuario`) REFERENCES `tb_usuario` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_LiqCompra_has_Tb_TipoCafe_Tb_LiqCompra` FOREIGN KEY (`Id_LiqCompra`) REFERENCES `tb_liqcompra` (`Id_LiqCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_detalle_liqcompra
-- ----------------------------

-- ----------------------------
-- Table structure for tb_detalle_notaingreso
-- ----------------------------
DROP TABLE IF EXISTS `tb_detalle_notaingreso`;
CREATE TABLE `tb_detalle_notaingreso` (
  `Id_NotaIngreso` int(11) NOT NULL,
  `Id_Producto` int(11) NOT NULL,
  `Id_TipoSaco` int(11) NOT NULL,
  `Nro_Sacos` int(11) DEFAULT NULL,
  `Peso_Estimado(Bruto)` decimal(10,0) DEFAULT NULL,
  `Tara` decimal(10,0) DEFAULT NULL,
  `Observacion` text,
  `Id_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_NotaIngreso`,`Id_Producto`),
  KEY `fk_Tb_Detalle_NotaIngreso_Tb_Producto1_idx` (`Id_Producto`),
  KEY `fk_Tb_Detalle_NotaIngreso_Tb_Usuario1_idx` (`Id_Usuario`),
  KEY `fk_Tb_Detalle_NotaIngreso_Tb_TipoSaco1_idx` (`Id_TipoSaco`),
  CONSTRAINT `fk_Tb_Detalle_NotaIngreso_Tb_NotaIngreso1` FOREIGN KEY (`Id_NotaIngreso`) REFERENCES `tb_notaingreso` (`Id_NotaIngreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Detalle_NotaIngreso_Tb_Producto1` FOREIGN KEY (`Id_Producto`) REFERENCES `tb_producto` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Detalle_NotaIngreso_Tb_TipoSaco1` FOREIGN KEY (`Id_TipoSaco`) REFERENCES `tb_tiposaco` (`Id_TipoSaco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Detalle_NotaIngreso_Tb_Usuario1` FOREIGN KEY (`Id_Usuario`) REFERENCES `tb_usuario` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_detalle_notaingreso
-- ----------------------------

-- ----------------------------
-- Table structure for tb_guiaremision
-- ----------------------------
DROP TABLE IF EXISTS `tb_guiaremision`;
CREATE TABLE `tb_guiaremision` (
  `Id_Producto` int(11) NOT NULL,
  `Id_Cliente` int(11) NOT NULL,
  `Id_LLegada` int(11) NOT NULL,
  `Id_Partida` int(11) NOT NULL,
  `Id_Transporte` int(11) NOT NULL,
  `Sacos` int(11) NOT NULL,
  `Kilo` decimal(10,0) NOT NULL,
  `Tara` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Id_Producto`,`Id_Cliente`),
  KEY `fk_Tb_Producto_has_Tb_Cliente_Tb_Cliente1_idx` (`Id_Cliente`),
  KEY `fk_Tb_Producto_has_Tb_Cliente_Tb_Producto1_idx` (`Id_Producto`),
  KEY `fk_Tb_GuiaRemision_Tb_LLegada1_idx` (`Id_LLegada`),
  KEY `fk_Tb_GuiaRemision_Tb_Partida1_idx` (`Id_Partida`),
  KEY `fk_Tb_GuiaRemision_Tb_Transporte1_idx` (`Id_Transporte`),
  CONSTRAINT `fk_Tb_GuiaRemision_Tb_LLegada1` FOREIGN KEY (`Id_LLegada`) REFERENCES `tb_llegada` (`Id_LLegada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_GuiaRemision_Tb_Partida1` FOREIGN KEY (`Id_Partida`) REFERENCES `tb_partida` (`Id_Partida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_GuiaRemision_Tb_Transporte1` FOREIGN KEY (`Id_Transporte`) REFERENCES `tb_transporte` (`Id_Transporte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Producto_has_Tb_Cliente_Tb_Cliente1` FOREIGN KEY (`Id_Cliente`) REFERENCES `tb_cliente` (`Id_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Producto_has_Tb_Cliente_Tb_Producto1` FOREIGN KEY (`Id_Producto`) REFERENCES `tb_producto` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_guiaremision
-- ----------------------------

-- ----------------------------
-- Table structure for tb_liqcompra
-- ----------------------------
DROP TABLE IF EXISTS `tb_liqcompra`;
CREATE TABLE `tb_liqcompra` (
  `Id_LiqCompra` int(11) NOT NULL AUTO_INCREMENT,
  `Nro_serie` varchar(15) DEFAULT NULL,
  `Id_LugarOperacion` int(11) NOT NULL,
  `Fecha_Emision` date DEFAULT NULL,
  `Fecha_Cancelacion` date DEFAULT NULL,
  `Valor_Venta` decimal(10,0) DEFAULT NULL,
  `IGV` decimal(10,0) DEFAULT NULL,
  `Total` decimal(10,0) DEFAULT NULL,
  `Id_Certificacion` int(11) NOT NULL,
  PRIMARY KEY (`Id_LiqCompra`),
  KEY `fk_Tb_LiqCompra_Tb_LugarOperacion1_idx` (`Id_LugarOperacion`),
  KEY `fk_Tb_LiqCompra_Tb_Certificacion1_idx` (`Id_Certificacion`),
  CONSTRAINT `fk_Tb_LiqCompra_Tb_Certificacion1` FOREIGN KEY (`Id_Certificacion`) REFERENCES `tb_certificacion` (`Id_Certificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_LiqCompra_Tb_LugarOperacion1` FOREIGN KEY (`Id_LugarOperacion`) REFERENCES `tb_lugaroperacion` (`Id_LugarOperacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_liqcompra
-- ----------------------------

-- ----------------------------
-- Table structure for tb_llegada
-- ----------------------------
DROP TABLE IF EXISTS `tb_llegada`;
CREATE TABLE `tb_llegada` (
  `Id_LLegada` int(11) NOT NULL AUTO_INCREMENT,
  `Via_Tipo` varchar(75) NOT NULL,
  `Via_Nombre` varchar(75) NOT NULL,
  `Id_Ubigeo` char(6) NOT NULL,
  PRIMARY KEY (`Id_LLegada`),
  KEY `fk_Tb_LLegada_Tb_Ubigeo1_idx` (`Id_Ubigeo`),
  CONSTRAINT `fk_Tb_LLegada_Tb_Ubigeo1` FOREIGN KEY (`Id_Ubigeo`) REFERENCES `tb_ubigeo` (`Id_Ubigeo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_llegada
-- ----------------------------

-- ----------------------------
-- Table structure for tb_lugaroperacion
-- ----------------------------
DROP TABLE IF EXISTS `tb_lugaroperacion`;
CREATE TABLE `tb_lugaroperacion` (
  `Id_LugarOperacion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id_LugarOperacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_lugaroperacion
-- ----------------------------

-- ----------------------------
-- Table structure for tb_notaingreso
-- ----------------------------
DROP TABLE IF EXISTS `tb_notaingreso`;
CREATE TABLE `tb_notaingreso` (
  `Id_NotaIngreso` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` varchar(20) DEFAULT NULL,
  `Nro_Serie` varchar(15) DEFAULT NULL,
  `Kilos_Neto` decimal(10,0) DEFAULT NULL,
  `Fecha_Recepcion` date DEFAULT NULL,
  PRIMARY KEY (`Id_NotaIngreso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_notaingreso
-- ----------------------------

-- ----------------------------
-- Table structure for tb_partida
-- ----------------------------
DROP TABLE IF EXISTS `tb_partida`;
CREATE TABLE `tb_partida` (
  `Id_Partida` int(11) NOT NULL AUTO_INCREMENT,
  `Via_Tipo` varchar(75) NOT NULL,
  `Via_Nombre` varchar(75) NOT NULL,
  `Id_Ubigeo` char(6) NOT NULL,
  PRIMARY KEY (`Id_Partida`),
  KEY `fk_Tb_Partida_Tb_Ubigeo1_idx` (`Id_Ubigeo`),
  CONSTRAINT `fk_Tb_Partida_Tb_Ubigeo1` FOREIGN KEY (`Id_Ubigeo`) REFERENCES `tb_ubigeo` (`Id_Ubigeo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_partida
-- ----------------------------

-- ----------------------------
-- Table structure for tb_permisos
-- ----------------------------
DROP TABLE IF EXISTS `tb_permisos`;
CREATE TABLE `tb_permisos` (
  `Id_Permisos` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Id_Permisos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_permisos
-- ----------------------------
INSERT INTO `tb_permisos` VALUES ('1', 'LEER');
INSERT INTO `tb_permisos` VALUES ('2', 'CREAR');
INSERT INTO `tb_permisos` VALUES ('3', 'EDITAR');
INSERT INTO `tb_permisos` VALUES ('4', 'BORRAR');

-- ----------------------------
-- Table structure for tb_producto
-- ----------------------------
DROP TABLE IF EXISTS `tb_producto`;
CREATE TABLE `tb_producto` (
  `Id_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` int(11) DEFAULT NULL,
  `Id_TipoProducto` int(11) NOT NULL,
  `Peso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Producto`),
  KEY `fk_Tb_Cafe_Tb_TipoCafe1_idx` (`Id_TipoProducto`),
  CONSTRAINT `fk_Tb_Cafe_Tb_TipoCafe1` FOREIGN KEY (`Id_TipoProducto`) REFERENCES `tb_tipoproducto` (`Id_TipoProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_producto
-- ----------------------------

-- ----------------------------
-- Table structure for tb_productor
-- ----------------------------
DROP TABLE IF EXISTS `tb_productor`;
CREATE TABLE `tb_productor` (
  `Id_Productor` int(11) NOT NULL AUTO_INCREMENT,
  `Paterno` varchar(30) DEFAULT NULL,
  `Materno` varchar(30) DEFAULT NULL,
  `Nombres` varchar(30) DEFAULT NULL,
  `Id_TipoDocIdentidad` int(11) NOT NULL,
  `Nro_DocIdentidad` varchar(15) DEFAULT NULL,
  `Id_Zona` int(11) NOT NULL,
  `Condicion` varchar(45) DEFAULT NULL,
  `Status_` varchar(45) DEFAULT NULL,
  `Area_Terreno` varchar(45) DEFAULT NULL,
  `Produccion_Estimada` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Productor`),
  KEY `fk_Tb_Productor_Tb_TipoDocIdentidad1_idx` (`Id_TipoDocIdentidad`),
  KEY `fk_Tb_Productor_Tb_Zona1_idx` (`Id_Zona`),
  CONSTRAINT `fk_Tb_Productor_Tb_TipoDocIdentidad1` FOREIGN KEY (`Id_TipoDocIdentidad`) REFERENCES `tb_tipodocidentidad` (`Id_TipoDocIdentidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Productor_Tb_Zona1` FOREIGN KEY (`Id_Zona`) REFERENCES `tb_zona` (`Id_Zona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_productor
-- ----------------------------
INSERT INTO `tb_productor` VALUES ('1', 'EWQ', 'EQW', 'EQW', '1', '3424342', '1', 'SI', 'T2', 'EQW', 'EQW');
INSERT INTO `tb_productor` VALUES ('2', 'EQWE', 'EQW', 'EQW', '1', '3424', '1', 'SI', 'ORGANIC', 'A', 'S');

-- ----------------------------
-- Table structure for tb_productor_producto
-- ----------------------------
DROP TABLE IF EXISTS `tb_productor_producto`;
CREATE TABLE `tb_productor_producto` (
  `Id_Productor` int(11) NOT NULL,
  `Id_Producto` int(11) NOT NULL,
  PRIMARY KEY (`Id_Productor`,`Id_Producto`),
  KEY `fk_Tb_Productor_has_Tb_Producto_Tb_Producto1_idx` (`Id_Producto`),
  KEY `fk_Tb_Productor_has_Tb_Producto_Tb_Productor1_idx` (`Id_Productor`),
  CONSTRAINT `fk_Tb_Productor_has_Tb_Producto_Tb_Producto1` FOREIGN KEY (`Id_Producto`) REFERENCES `tb_producto` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Productor_has_Tb_Producto_Tb_Productor1` FOREIGN KEY (`Id_Productor`) REFERENCES `tb_productor` (`Id_Productor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_productor_producto
-- ----------------------------

-- ----------------------------
-- Table structure for tb_tipodocidentidad
-- ----------------------------
DROP TABLE IF EXISTS `tb_tipodocidentidad`;
CREATE TABLE `tb_tipodocidentidad` (
  `Id_TipoDocIdentidad` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id_TipoDocIdentidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tipodocidentidad
-- ----------------------------
INSERT INTO `tb_tipodocidentidad` VALUES ('1', 'DNI');
INSERT INTO `tb_tipodocidentidad` VALUES ('2', 'CARNET DE EXTRANJERIA');
INSERT INTO `tb_tipodocidentidad` VALUES ('3', 'PASAPORTE');

-- ----------------------------
-- Table structure for tb_tipoproducto
-- ----------------------------
DROP TABLE IF EXISTS `tb_tipoproducto`;
CREATE TABLE `tb_tipoproducto` (
  `Id_TipoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_TipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tipoproducto
-- ----------------------------
INSERT INTO `tb_tipoproducto` VALUES ('1', 'CAFE ORGANICO CERTIFICADO');
INSERT INTO `tb_tipoproducto` VALUES ('2', 'CAFE ORGANICO CONVENCIONAL');

-- ----------------------------
-- Table structure for tb_tiposaco
-- ----------------------------
DROP TABLE IF EXISTS `tb_tiposaco`;
CREATE TABLE `tb_tiposaco` (
  `Id_TipoSaco` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_TipoSaco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tiposaco
-- ----------------------------

-- ----------------------------
-- Table structure for tb_transporte
-- ----------------------------
DROP TABLE IF EXISTS `tb_transporte`;
CREATE TABLE `tb_transporte` (
  `Id_Transporte` int(11) NOT NULL AUTO_INCREMENT,
  `Razon_Social` varchar(75) NOT NULL,
  `Nro_RUC` varchar(45) NOT NULL,
  `Direccion` varchar(75) DEFAULT NULL,
  `Id_UndTransporte` int(11) NOT NULL,
  PRIMARY KEY (`Id_Transporte`),
  KEY `fk_Tb_Transporte_Tb_UndTransporte1_idx` (`Id_UndTransporte`),
  CONSTRAINT `fk_Tb_Transporte_Tb_UndTransporte1` FOREIGN KEY (`Id_UndTransporte`) REFERENCES `tb_undtransporte` (`Id_UndTransporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_transporte
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ubigeo
-- ----------------------------
DROP TABLE IF EXISTS `tb_ubigeo`;
CREATE TABLE `tb_ubigeo` (
  `Id_Ubigeo` char(6) NOT NULL,
  `Ccdd` varchar(3) DEFAULT NULL,
  `Nombredd` varchar(80) DEFAULT NULL,
  `Ccpp` varchar(3) DEFAULT NULL,
  `Nombrepp` varchar(80) DEFAULT NULL,
  `Ccdi` varchar(3) DEFAULT NULL,
  `Nombredi` varchar(80) DEFAULT NULL,
  `Obs` varchar(50) DEFAULT NULL,
  `Orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Ubigeo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ubigeo
-- ----------------------------
INSERT INTO `tb_ubigeo` VALUES ('000000', '0', '-', '0', '-', '0', '-', 'CREADO', '10');
INSERT INTO `tb_ubigeo` VALUES ('010000', '01', 'AMAZONAS', '00', 'AMAZONAS', '00', 'AMAZONAS', 'CREADO', '10');
INSERT INTO `tb_ubigeo` VALUES ('010101', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '01', 'CHACHAPOYAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010102', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '02', 'ASUNCION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010103', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '03', 'BALSAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010104', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '04', 'CHETO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010105', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '05', 'CHILIQUIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010106', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '06', 'CHUQUIBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010107', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '07', 'GRANADA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010108', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '08', 'HUANCAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010109', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '09', 'LA JALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010110', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '10', 'LEIMEBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010111', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '11', 'LEVANTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010112', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '12', 'MAGDALENA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010113', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '13', 'MARISCAL CASTILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010114', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '14', 'MOLINOPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010115', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '15', 'MONTEVIDEO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010116', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '16', 'OLLEROS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010117', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '17', 'QUINJALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010118', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '18', 'SAN FRANCISCO DE DAGUAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010119', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '19', 'SAN ISIDRO DE MAINO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010120', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '20', 'SOLOCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010121', '01', 'AMAZONAS', '01', 'CHACHAPOYAS', '21', 'SONCHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010201', '01', 'AMAZONAS', '02', 'BAGUA', '01', 'LA PECA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010202', '01', 'AMAZONAS', '02', 'BAGUA', '02', 'ARAMANGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010203', '01', 'AMAZONAS', '02', 'BAGUA', '03', 'COPALLIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010204', '01', 'AMAZONAS', '02', 'BAGUA', '04', 'EL PARCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010205', '01', 'AMAZONAS', '02', 'BAGUA', '05', 'IMAZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010301', '01', 'AMAZONAS', '03', 'BONGARA', '01', 'JUMBILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010302', '01', 'AMAZONAS', '03', 'BONGARA', '02', 'CHISQUILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010303', '01', 'AMAZONAS', '03', 'BONGARA', '03', 'CHURUJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010304', '01', 'AMAZONAS', '03', 'BONGARA', '04', 'COROSHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010305', '01', 'AMAZONAS', '03', 'BONGARA', '05', 'CUISPES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010306', '01', 'AMAZONAS', '03', 'BONGARA', '06', 'FLORIDA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010307', '01', 'AMAZONAS', '03', 'BONGARA', '07', 'JAZAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010308', '01', 'AMAZONAS', '03', 'BONGARA', '08', 'RECTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010309', '01', 'AMAZONAS', '03', 'BONGARA', '09', 'SAN CARLOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010310', '01', 'AMAZONAS', '03', 'BONGARA', '10', 'SHIPASBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010311', '01', 'AMAZONAS', '03', 'BONGARA', '11', 'VALERA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010312', '01', 'AMAZONAS', '03', 'BONGARA', '12', 'YAMBRASBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010401', '01', 'AMAZONAS', '04', 'CONDORCANQUI', '01', 'NIEVA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010402', '01', 'AMAZONAS', '04', 'CONDORCANQUI', '02', 'EL CENEPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010403', '01', 'AMAZONAS', '04', 'CONDORCANQUI', '03', 'RIO SANTIAGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010501', '01', 'AMAZONAS', '05', 'LUYA', '01', 'LAMUD', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010502', '01', 'AMAZONAS', '05', 'LUYA', '02', 'CAMPORREDONDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010503', '01', 'AMAZONAS', '05', 'LUYA', '03', 'COCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010504', '01', 'AMAZONAS', '05', 'LUYA', '04', 'COLCAMAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010505', '01', 'AMAZONAS', '05', 'LUYA', '05', 'CONILA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010506', '01', 'AMAZONAS', '05', 'LUYA', '06', 'INGUILPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010507', '01', 'AMAZONAS', '05', 'LUYA', '07', 'LONGUITA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010508', '01', 'AMAZONAS', '05', 'LUYA', '08', 'LONYA CHICO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010509', '01', 'AMAZONAS', '05', 'LUYA', '09', 'LUYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010510', '01', 'AMAZONAS', '05', 'LUYA', '10', 'LUYA VIEJO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010511', '01', 'AMAZONAS', '05', 'LUYA', '11', 'MARIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010512', '01', 'AMAZONAS', '05', 'LUYA', '12', 'OCALLI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010513', '01', 'AMAZONAS', '05', 'LUYA', '13', 'OCUMAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010514', '01', 'AMAZONAS', '05', 'LUYA', '14', 'PISUQUIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010515', '01', 'AMAZONAS', '05', 'LUYA', '15', 'PROVIDENCIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010516', '01', 'AMAZONAS', '05', 'LUYA', '16', 'SAN CRISTOBAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010517', '01', 'AMAZONAS', '05', 'LUYA', '17', 'SAN FRANCISCO DEL YESO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010518', '01', 'AMAZONAS', '05', 'LUYA', '18', 'SAN JERONIMO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010519', '01', 'AMAZONAS', '05', 'LUYA', '19', 'SAN JUAN DE LOPECANCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010520', '01', 'AMAZONAS', '05', 'LUYA', '20', 'SANTA CATALINA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010521', '01', 'AMAZONAS', '05', 'LUYA', '21', 'SANTO TOMAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010522', '01', 'AMAZONAS', '05', 'LUYA', '22', 'TINGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010523', '01', 'AMAZONAS', '05', 'LUYA', '23', 'TRITA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010601', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '01', 'SAN NICOLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010602', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '02', 'CHIRIMOTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010603', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '03', 'COCHAMAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010604', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '04', 'HUAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010605', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '05', 'LIMABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010606', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '06', 'LONGAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010607', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '07', 'MARISCAL BENAVIDES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010608', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '08', 'MILPUC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010609', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '09', 'OMIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010610', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '10', 'SANTA ROSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010611', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '11', 'TOTORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010612', '01', 'AMAZONAS', '06', 'RODRIGUEZ DE MENDOZA', '12', 'VISTA ALEGRE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010701', '01', 'AMAZONAS', '07', 'UTCUBAMBA', '01', 'BAGUA GRANDE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010702', '01', 'AMAZONAS', '07', 'UTCUBAMBA', '02', 'CAJARURO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010703', '01', 'AMAZONAS', '07', 'UTCUBAMBA', '03', 'CUMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010704', '01', 'AMAZONAS', '07', 'UTCUBAMBA', '04', 'EL MILAGRO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010705', '01', 'AMAZONAS', '07', 'UTCUBAMBA', '05', 'JAMALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010706', '01', 'AMAZONAS', '07', 'UTCUBAMBA', '06', 'LONYA GRANDE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('010707', '01', 'AMAZONAS', '07', 'UTCUBAMBA', '07', 'YAMON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020000', '02', 'ANCASH', '00', 'ANCASH', '00', 'ANCASH', 'CREADO', '10');
INSERT INTO `tb_ubigeo` VALUES ('020101', '02', 'ANCASH', '01', 'HUARAZ', '01', 'HUARAZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020102', '02', 'ANCASH', '01', 'HUARAZ', '02', 'COCHABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020103', '02', 'ANCASH', '01', 'HUARAZ', '03', 'COLCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020104', '02', 'ANCASH', '01', 'HUARAZ', '04', 'HUANCHAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020105', '02', 'ANCASH', '01', 'HUARAZ', '05', 'INDEPENDENCIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020106', '02', 'ANCASH', '01', 'HUARAZ', '06', 'JANGAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020107', '02', 'ANCASH', '01', 'HUARAZ', '07', 'LA LIBERTAD', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020108', '02', 'ANCASH', '01', 'HUARAZ', '08', 'OLLEROS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020109', '02', 'ANCASH', '01', 'HUARAZ', '09', 'PAMPAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020110', '02', 'ANCASH', '01', 'HUARAZ', '10', 'PARIACOTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020111', '02', 'ANCASH', '01', 'HUARAZ', '11', 'PIRA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020112', '02', 'ANCASH', '01', 'HUARAZ', '12', 'TARICA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020201', '02', 'ANCASH', '02', 'AIJA', '01', 'AIJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020202', '02', 'ANCASH', '02', 'AIJA', '02', 'CORIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020203', '02', 'ANCASH', '02', 'AIJA', '03', 'HUACLLAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020204', '02', 'ANCASH', '02', 'AIJA', '04', 'LA MERCED', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020205', '02', 'ANCASH', '02', 'AIJA', '05', 'SUCCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020301', '02', 'ANCASH', '03', 'ANTONIO RAYMONDI', '01', 'LLAMELLIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020302', '02', 'ANCASH', '03', 'ANTONIO RAYMONDI', '02', 'ACZO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020303', '02', 'ANCASH', '03', 'ANTONIO RAYMONDI', '03', 'CHACCHO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020304', '02', 'ANCASH', '03', 'ANTONIO RAYMONDI', '04', 'CHINGAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020305', '02', 'ANCASH', '03', 'ANTONIO RAYMONDI', '05', 'MIRGAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020306', '02', 'ANCASH', '03', 'ANTONIO RAYMONDI', '06', 'SAN JUAN DE RONTOY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020401', '02', 'ANCASH', '04', 'ASUNCION', '01', 'CHACAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020402', '02', 'ANCASH', '04', 'ASUNCION', '02', 'ACOCHACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020501', '02', 'ANCASH', '05', 'BOLOGNESI', '01', 'CHIQUIAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020502', '02', 'ANCASH', '05', 'BOLOGNESI', '02', 'ABELARDO PARDO LEZAMETA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020503', '02', 'ANCASH', '05', 'BOLOGNESI', '03', 'ANTONIO RAYMONDI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020504', '02', 'ANCASH', '05', 'BOLOGNESI', '04', 'AQUIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020505', '02', 'ANCASH', '05', 'BOLOGNESI', '05', 'CAJACAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020506', '02', 'ANCASH', '05', 'BOLOGNESI', '06', 'CANIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020507', '02', 'ANCASH', '05', 'BOLOGNESI', '07', 'COLQUIOC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020508', '02', 'ANCASH', '05', 'BOLOGNESI', '08', 'HUALLANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020509', '02', 'ANCASH', '05', 'BOLOGNESI', '09', 'HUASTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020510', '02', 'ANCASH', '05', 'BOLOGNESI', '10', 'HUAYLLACAYAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020511', '02', 'ANCASH', '05', 'BOLOGNESI', '11', 'LA PRIMAVERA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020512', '02', 'ANCASH', '05', 'BOLOGNESI', '12', 'MANGAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020513', '02', 'ANCASH', '05', 'BOLOGNESI', '13', 'PACLLON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020514', '02', 'ANCASH', '05', 'BOLOGNESI', '14', 'SAN MIGUEL DE CORPANQUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020515', '02', 'ANCASH', '05', 'BOLOGNESI', '15', 'TICLLOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020601', '02', 'ANCASH', '06', 'CARHUAZ', '01', 'CARHUAZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020602', '02', 'ANCASH', '06', 'CARHUAZ', '02', 'ACOPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020603', '02', 'ANCASH', '06', 'CARHUAZ', '03', 'AMASHCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020604', '02', 'ANCASH', '06', 'CARHUAZ', '04', 'ANTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020605', '02', 'ANCASH', '06', 'CARHUAZ', '05', 'ATAQUERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020606', '02', 'ANCASH', '06', 'CARHUAZ', '06', 'MARCARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020607', '02', 'ANCASH', '06', 'CARHUAZ', '07', 'PARIAHUANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020608', '02', 'ANCASH', '06', 'CARHUAZ', '08', 'SAN MIGUEL DE ACO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020609', '02', 'ANCASH', '06', 'CARHUAZ', '09', 'SHILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020610', '02', 'ANCASH', '06', 'CARHUAZ', '10', 'TINCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020611', '02', 'ANCASH', '06', 'CARHUAZ', '11', 'YUNGAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020701', '02', 'ANCASH', '07', 'CARLOS FERMIN FITZCARRALD', '01', 'SAN LUIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020702', '02', 'ANCASH', '07', 'CARLOS FERMIN FITZCARRALD', '02', 'SAN NICOLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020703', '02', 'ANCASH', '07', 'CARLOS FERMIN FITZCARRALD', '03', 'YAUYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020801', '02', 'ANCASH', '08', 'CASMA', '01', 'CASMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020802', '02', 'ANCASH', '08', 'CASMA', '02', 'BUENA VISTA ALTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020803', '02', 'ANCASH', '08', 'CASMA', '03', 'COMANDANTE NOEL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020804', '02', 'ANCASH', '08', 'CASMA', '04', 'YAUTAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020901', '02', 'ANCASH', '09', 'CORONGO', '01', 'CORONGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020902', '02', 'ANCASH', '09', 'CORONGO', '02', 'ACO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020903', '02', 'ANCASH', '09', 'CORONGO', '03', 'BAMBAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020904', '02', 'ANCASH', '09', 'CORONGO', '04', 'CUSCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020905', '02', 'ANCASH', '09', 'CORONGO', '05', 'LA PAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020906', '02', 'ANCASH', '09', 'CORONGO', '06', 'YANAC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('020907', '02', 'ANCASH', '09', 'CORONGO', '07', 'YUPAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021001', '02', 'ANCASH', '10', 'HUARI', '01', 'HUARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021002', '02', 'ANCASH', '10', 'HUARI', '02', 'ANRA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021003', '02', 'ANCASH', '10', 'HUARI', '03', 'CAJAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021004', '02', 'ANCASH', '10', 'HUARI', '04', 'CHAVIN DE HUANTAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021005', '02', 'ANCASH', '10', 'HUARI', '05', 'HUACACHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021006', '02', 'ANCASH', '10', 'HUARI', '06', 'HUACCHIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021007', '02', 'ANCASH', '10', 'HUARI', '07', 'HUACHIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021008', '02', 'ANCASH', '10', 'HUARI', '08', 'HUANTAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021009', '02', 'ANCASH', '10', 'HUARI', '09', 'MASIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021010', '02', 'ANCASH', '10', 'HUARI', '10', 'PAUCAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021011', '02', 'ANCASH', '10', 'HUARI', '11', 'PONTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021012', '02', 'ANCASH', '10', 'HUARI', '12', 'RAHUAPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021013', '02', 'ANCASH', '10', 'HUARI', '13', 'RAPAYAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021014', '02', 'ANCASH', '10', 'HUARI', '14', 'SAN MARCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021015', '02', 'ANCASH', '10', 'HUARI', '15', 'SAN PEDRO DE CHANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021016', '02', 'ANCASH', '10', 'HUARI', '16', 'UCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021101', '02', 'ANCASH', '11', 'HUARMEY', '01', 'HUARMEY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021102', '02', 'ANCASH', '11', 'HUARMEY', '02', 'COCHAPETI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021103', '02', 'ANCASH', '11', 'HUARMEY', '03', 'CULEBRAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021104', '02', 'ANCASH', '11', 'HUARMEY', '04', 'HUAYAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021105', '02', 'ANCASH', '11', 'HUARMEY', '05', 'MALVAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021201', '02', 'ANCASH', '12', 'HUAYLAS', '01', 'CARAZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021202', '02', 'ANCASH', '12', 'HUAYLAS', '02', 'HUALLANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021203', '02', 'ANCASH', '12', 'HUAYLAS', '03', 'HUATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021204', '02', 'ANCASH', '12', 'HUAYLAS', '04', 'HUAYLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021205', '02', 'ANCASH', '12', 'HUAYLAS', '05', 'MATO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021206', '02', 'ANCASH', '12', 'HUAYLAS', '06', 'PAMPAROMAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021207', '02', 'ANCASH', '12', 'HUAYLAS', '07', 'PUEBLO LIBRE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021208', '02', 'ANCASH', '12', 'HUAYLAS', '08', 'SANTA CRUZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021209', '02', 'ANCASH', '12', 'HUAYLAS', '09', 'SANTO TORIBIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021210', '02', 'ANCASH', '12', 'HUAYLAS', '10', 'YURACMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021301', '02', 'ANCASH', '13', 'MARISCAL LUZURIAGA', '01', 'PISCOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021302', '02', 'ANCASH', '13', 'MARISCAL LUZURIAGA', '02', 'CASCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021303', '02', 'ANCASH', '13', 'MARISCAL LUZURIAGA', '03', 'ELEAZAR GUZMAN BARRON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021304', '02', 'ANCASH', '13', 'MARISCAL LUZURIAGA', '04', 'FIDEL OLIVAS ESCUDERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021305', '02', 'ANCASH', '13', 'MARISCAL LUZURIAGA', '05', 'LLAMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021306', '02', 'ANCASH', '13', 'MARISCAL LUZURIAGA', '06', 'LLUMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021307', '02', 'ANCASH', '13', 'MARISCAL LUZURIAGA', '07', 'LUCMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021308', '02', 'ANCASH', '13', 'MARISCAL LUZURIAGA', '08', 'MUSGA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021401', '02', 'ANCASH', '14', 'OCROS', '01', 'OCROS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021402', '02', 'ANCASH', '14', 'OCROS', '02', 'ACAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021403', '02', 'ANCASH', '14', 'OCROS', '03', 'CAJAMARQUILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021404', '02', 'ANCASH', '14', 'OCROS', '04', 'CARHUAPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021405', '02', 'ANCASH', '14', 'OCROS', '05', 'COCHAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021406', '02', 'ANCASH', '14', 'OCROS', '06', 'CONGAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021407', '02', 'ANCASH', '14', 'OCROS', '07', 'LLIPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021408', '02', 'ANCASH', '14', 'OCROS', '08', 'SAN CRISTOBAL DE RAJAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021409', '02', 'ANCASH', '14', 'OCROS', '09', 'SAN PEDRO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021410', '02', 'ANCASH', '14', 'OCROS', '10', 'SANTIAGO DE CHILCAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021501', '02', 'ANCASH', '15', 'PALLASCA', '01', 'CABANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021502', '02', 'ANCASH', '15', 'PALLASCA', '02', 'BOLOGNESI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021503', '02', 'ANCASH', '15', 'PALLASCA', '03', 'CONCHUCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021504', '02', 'ANCASH', '15', 'PALLASCA', '04', 'HUACASCHUQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021505', '02', 'ANCASH', '15', 'PALLASCA', '05', 'HUANDOVAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021506', '02', 'ANCASH', '15', 'PALLASCA', '06', 'LACABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021507', '02', 'ANCASH', '15', 'PALLASCA', '07', 'LLAPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021508', '02', 'ANCASH', '15', 'PALLASCA', '08', 'PALLASCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021509', '02', 'ANCASH', '15', 'PALLASCA', '09', 'PAMPAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021510', '02', 'ANCASH', '15', 'PALLASCA', '10', 'SANTA ROSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021511', '02', 'ANCASH', '15', 'PALLASCA', '11', 'TAUCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021601', '02', 'ANCASH', '16', 'POMABAMBA', '01', 'POMABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021602', '02', 'ANCASH', '16', 'POMABAMBA', '02', 'HUAYLLAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021603', '02', 'ANCASH', '16', 'POMABAMBA', '03', 'PAROBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021604', '02', 'ANCASH', '16', 'POMABAMBA', '04', 'QUINUABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021701', '02', 'ANCASH', '17', 'RECUAY', '01', 'RECUAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021702', '02', 'ANCASH', '17', 'RECUAY', '02', 'CATAC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021703', '02', 'ANCASH', '17', 'RECUAY', '03', 'COTAPARACO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021704', '02', 'ANCASH', '17', 'RECUAY', '04', 'HUAYLLAPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021705', '02', 'ANCASH', '17', 'RECUAY', '05', 'LLACLLIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021706', '02', 'ANCASH', '17', 'RECUAY', '06', 'MARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021707', '02', 'ANCASH', '17', 'RECUAY', '07', 'PAMPAS CHICO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021708', '02', 'ANCASH', '17', 'RECUAY', '08', 'PARARIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021709', '02', 'ANCASH', '17', 'RECUAY', '09', 'TAPACOCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021710', '02', 'ANCASH', '17', 'RECUAY', '10', 'TICAPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021801', '02', 'ANCASH', '18', 'SANTA', '01', 'CHIMBOTE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021802', '02', 'ANCASH', '18', 'SANTA', '02', 'CACERES DEL PERU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021803', '02', 'ANCASH', '18', 'SANTA', '03', 'COISHCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021804', '02', 'ANCASH', '18', 'SANTA', '04', 'MACATE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021805', '02', 'ANCASH', '18', 'SANTA', '05', 'MORO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021806', '02', 'ANCASH', '18', 'SANTA', '06', 'NEPEÑA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021807', '02', 'ANCASH', '18', 'SANTA', '07', 'SAMANCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021808', '02', 'ANCASH', '18', 'SANTA', '08', 'SANTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021809', '02', 'ANCASH', '18', 'SANTA', '09', 'NUEVO CHIMBOTE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021901', '02', 'ANCASH', '19', 'SIHUAS', '01', 'SIHUAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021902', '02', 'ANCASH', '19', 'SIHUAS', '02', 'ACOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021903', '02', 'ANCASH', '19', 'SIHUAS', '03', 'ALFONSO UGARTE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021904', '02', 'ANCASH', '19', 'SIHUAS', '04', 'CASHAPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021905', '02', 'ANCASH', '19', 'SIHUAS', '05', 'CHINGALPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021906', '02', 'ANCASH', '19', 'SIHUAS', '06', 'HUAYLLABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021907', '02', 'ANCASH', '19', 'SIHUAS', '07', 'QUICHES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021908', '02', 'ANCASH', '19', 'SIHUAS', '08', 'RAGASH', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021909', '02', 'ANCASH', '19', 'SIHUAS', '09', 'SAN JUAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('021910', '02', 'ANCASH', '19', 'SIHUAS', '10', 'SICSIBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('022001', '02', 'ANCASH', '20', 'YUNGAY', '01', 'YUNGAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('022002', '02', 'ANCASH', '20', 'YUNGAY', '02', 'CASCAPARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('022003', '02', 'ANCASH', '20', 'YUNGAY', '03', 'MANCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('022004', '02', 'ANCASH', '20', 'YUNGAY', '04', 'MATACOTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('022005', '02', 'ANCASH', '20', 'YUNGAY', '05', 'QUILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('022006', '02', 'ANCASH', '20', 'YUNGAY', '06', 'RANRAHIRCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('022007', '02', 'ANCASH', '20', 'YUNGAY', '07', 'SHUPLUY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('022008', '02', 'ANCASH', '20', 'YUNGAY', '08', 'YANAMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030000', '03', 'APURIMAC', '00', 'APURIMAC', '00', 'APURIMAC', 'CREADO', '10');
INSERT INTO `tb_ubigeo` VALUES ('030101', '03', 'APURIMAC', '01', 'ABANCAY', '01', 'ABANCAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030102', '03', 'APURIMAC', '01', 'ABANCAY', '02', 'CHACOCHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030103', '03', 'APURIMAC', '01', 'ABANCAY', '03', 'CIRCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030104', '03', 'APURIMAC', '01', 'ABANCAY', '04', 'CURAHUASI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030105', '03', 'APURIMAC', '01', 'ABANCAY', '05', 'HUANIPACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030106', '03', 'APURIMAC', '01', 'ABANCAY', '06', 'LAMBRAMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030107', '03', 'APURIMAC', '01', 'ABANCAY', '07', 'PICHIRHUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030108', '03', 'APURIMAC', '01', 'ABANCAY', '08', 'SAN PEDRO DE CACHORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030109', '03', 'APURIMAC', '01', 'ABANCAY', '09', 'TAMBURCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030201', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '01', 'ANDAHUAYLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030202', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '02', 'ANDARAPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030203', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '03', 'CHIARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030204', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '04', 'HUANCARAMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030205', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '05', 'HUANCARAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030206', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '06', 'HUAYANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030207', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '07', 'KISHUARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030208', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '08', 'PACOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030209', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '09', 'PACUCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030210', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '10', 'PAMPACHIRI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030211', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '11', 'POMACOCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030212', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '12', 'SAN ANTONIO DE CACHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030213', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '13', 'SAN JERONIMO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030214', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '14', 'SAN MIGUEL DE CHACCRAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030215', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '15', 'SANTA MARIA DE CHICMO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030216', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '16', 'TALAVERA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030217', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '17', 'TUMAY HUARACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030218', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '18', 'TURPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030219', '03', 'APURIMAC', '02', 'ANDAHUAYLAS', '19', 'KAQUIABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030301', '03', 'APURIMAC', '03', 'ANTABAMBA', '01', 'ANTABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030302', '03', 'APURIMAC', '03', 'ANTABAMBA', '02', 'EL ORO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030303', '03', 'APURIMAC', '03', 'ANTABAMBA', '03', 'HUAQUIRCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030304', '03', 'APURIMAC', '03', 'ANTABAMBA', '04', 'JUAN ESPINOZA MEDRANO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030305', '03', 'APURIMAC', '03', 'ANTABAMBA', '05', 'OROPESA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030306', '03', 'APURIMAC', '03', 'ANTABAMBA', '06', 'PACHACONAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030307', '03', 'APURIMAC', '03', 'ANTABAMBA', '07', 'SABAINO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030401', '03', 'APURIMAC', '04', 'AYMARAES', '01', 'CHALHUANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030402', '03', 'APURIMAC', '04', 'AYMARAES', '02', 'CAPAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030403', '03', 'APURIMAC', '04', 'AYMARAES', '03', 'CARAYBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030404', '03', 'APURIMAC', '04', 'AYMARAES', '04', 'CHAPIMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030405', '03', 'APURIMAC', '04', 'AYMARAES', '05', 'COLCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030406', '03', 'APURIMAC', '04', 'AYMARAES', '06', 'COTARUSE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030407', '03', 'APURIMAC', '04', 'AYMARAES', '07', 'HUAYLLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030408', '03', 'APURIMAC', '04', 'AYMARAES', '08', 'JUSTO APU SAHUARAURA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030409', '03', 'APURIMAC', '04', 'AYMARAES', '09', 'LUCRE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030410', '03', 'APURIMAC', '04', 'AYMARAES', '10', 'POCOHUANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030411', '03', 'APURIMAC', '04', 'AYMARAES', '11', 'SAN JUAN DE CHACÑA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030412', '03', 'APURIMAC', '04', 'AYMARAES', '12', 'SAÑAYCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030413', '03', 'APURIMAC', '04', 'AYMARAES', '13', 'SORAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030414', '03', 'APURIMAC', '04', 'AYMARAES', '14', 'TAPAIRIHUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030415', '03', 'APURIMAC', '04', 'AYMARAES', '15', 'TINTAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030416', '03', 'APURIMAC', '04', 'AYMARAES', '16', 'TORAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030417', '03', 'APURIMAC', '04', 'AYMARAES', '17', 'YANACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030501', '03', 'APURIMAC', '05', 'COTABAMBAS', '01', 'TAMBOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030502', '03', 'APURIMAC', '05', 'COTABAMBAS', '02', 'COTABAMBAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030503', '03', 'APURIMAC', '05', 'COTABAMBAS', '03', 'COYLLURQUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030504', '03', 'APURIMAC', '05', 'COTABAMBAS', '04', 'HAQUIRA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030505', '03', 'APURIMAC', '05', 'COTABAMBAS', '05', 'MARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030506', '03', 'APURIMAC', '05', 'COTABAMBAS', '06', 'CHALLHUAHUACHO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030601', '03', 'APURIMAC', '06', 'CHINCHEROS', '01', 'CHINCHEROS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030602', '03', 'APURIMAC', '06', 'CHINCHEROS', '02', 'ANCO_HUALLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030603', '03', 'APURIMAC', '06', 'CHINCHEROS', '03', 'COCHARCAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030604', '03', 'APURIMAC', '06', 'CHINCHEROS', '04', 'HUACCANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030605', '03', 'APURIMAC', '06', 'CHINCHEROS', '05', 'OCOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030606', '03', 'APURIMAC', '06', 'CHINCHEROS', '06', 'ONGOY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030607', '03', 'APURIMAC', '06', 'CHINCHEROS', '07', 'URANMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030608', '03', 'APURIMAC', '06', 'CHINCHEROS', '08', 'RANRACANCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030701', '03', 'APURIMAC', '07', 'GRAU', '01', 'CHUQUIBAMBILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030702', '03', 'APURIMAC', '07', 'GRAU', '02', 'CURPAHUASI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030703', '03', 'APURIMAC', '07', 'GRAU', '03', 'GAMARRA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030704', '03', 'APURIMAC', '07', 'GRAU', '04', 'HUAYLLATI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030705', '03', 'APURIMAC', '07', 'GRAU', '05', 'MAMARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030706', '03', 'APURIMAC', '07', 'GRAU', '06', 'MICAELA BASTIDAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030707', '03', 'APURIMAC', '07', 'GRAU', '07', 'PATAYPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030708', '03', 'APURIMAC', '07', 'GRAU', '08', 'PROGRESO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030709', '03', 'APURIMAC', '07', 'GRAU', '09', 'SAN ANTONIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030710', '03', 'APURIMAC', '07', 'GRAU', '10', 'SANTA ROSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030711', '03', 'APURIMAC', '07', 'GRAU', '11', 'TURPAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030712', '03', 'APURIMAC', '07', 'GRAU', '12', 'VILCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030713', '03', 'APURIMAC', '07', 'GRAU', '13', 'VIRUNDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('030714', '03', 'APURIMAC', '07', 'GRAU', '14', 'CURASCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040101', '04', 'AREQUIPA', '01', 'AREQUIPA', '01', 'AREQUIPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040102', '04', 'AREQUIPA', '01', 'AREQUIPA', '02', 'ALTO SELVA ALEGRE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040103', '04', 'AREQUIPA', '01', 'AREQUIPA', '03', 'CAYMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040104', '04', 'AREQUIPA', '01', 'AREQUIPA', '04', 'CERRO COLORADO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040105', '04', 'AREQUIPA', '01', 'AREQUIPA', '05', 'CHARACATO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040106', '04', 'AREQUIPA', '01', 'AREQUIPA', '06', 'CHIGUATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040107', '04', 'AREQUIPA', '01', 'AREQUIPA', '07', 'JACOBO HUNTER', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040108', '04', 'AREQUIPA', '01', 'AREQUIPA', '08', 'LA JOYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040109', '04', 'AREQUIPA', '01', 'AREQUIPA', '09', 'MARIANO MELGAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040110', '04', 'AREQUIPA', '01', 'AREQUIPA', '10', 'MIRAFLORES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040111', '04', 'AREQUIPA', '01', 'AREQUIPA', '11', 'MOLLEBAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040112', '04', 'AREQUIPA', '01', 'AREQUIPA', '12', 'PAUCARPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040113', '04', 'AREQUIPA', '01', 'AREQUIPA', '13', 'POCSI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040114', '04', 'AREQUIPA', '01', 'AREQUIPA', '14', 'POLOBAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040115', '04', 'AREQUIPA', '01', 'AREQUIPA', '15', 'QUEQUEÑA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040116', '04', 'AREQUIPA', '01', 'AREQUIPA', '16', 'SABANDIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040117', '04', 'AREQUIPA', '01', 'AREQUIPA', '17', 'SACHACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040118', '04', 'AREQUIPA', '01', 'AREQUIPA', '18', 'SAN JUAN DE SIGUAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040119', '04', 'AREQUIPA', '01', 'AREQUIPA', '19', 'SAN JUAN DE TARUCANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040120', '04', 'AREQUIPA', '01', 'AREQUIPA', '20', 'SANTA ISABEL DE SIGUAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040121', '04', 'AREQUIPA', '01', 'AREQUIPA', '21', 'SANTA RITA DE SIGUAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040122', '04', 'AREQUIPA', '01', 'AREQUIPA', '22', 'SOCABAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040123', '04', 'AREQUIPA', '01', 'AREQUIPA', '23', 'TIABAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040124', '04', 'AREQUIPA', '01', 'AREQUIPA', '24', 'UCHUMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040125', '04', 'AREQUIPA', '01', 'AREQUIPA', '25', 'VITOR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040126', '04', 'AREQUIPA', '01', 'AREQUIPA', '26', 'YANAHUARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040127', '04', 'AREQUIPA', '01', 'AREQUIPA', '27', 'YARABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040128', '04', 'AREQUIPA', '01', 'AREQUIPA', '28', 'YURA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040129', '04', 'AREQUIPA', '01', 'AREQUIPA', '29', 'JOSE LUIS BUSTAMANTE Y RIVERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040201', '04', 'AREQUIPA', '02', 'CAMANA', '01', 'CAMANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040202', '04', 'AREQUIPA', '02', 'CAMANA', '02', 'JOSE MARIA QUIMPER', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040203', '04', 'AREQUIPA', '02', 'CAMANA', '03', 'MARIANO NICOLAS VALCARCEL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040204', '04', 'AREQUIPA', '02', 'CAMANA', '04', 'MARISCAL CACERES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040205', '04', 'AREQUIPA', '02', 'CAMANA', '05', 'NICOLAS DE PIEROLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040206', '04', 'AREQUIPA', '02', 'CAMANA', '06', 'OCOÑA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040207', '04', 'AREQUIPA', '02', 'CAMANA', '07', 'QUILCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040208', '04', 'AREQUIPA', '02', 'CAMANA', '08', 'SAMUEL PASTOR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040301', '04', 'AREQUIPA', '03', 'CARAVELI', '01', 'CARAVELI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040302', '04', 'AREQUIPA', '03', 'CARAVELI', '02', 'ACARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040303', '04', 'AREQUIPA', '03', 'CARAVELI', '03', 'ATICO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040304', '04', 'AREQUIPA', '03', 'CARAVELI', '04', 'ATIQUIPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040305', '04', 'AREQUIPA', '03', 'CARAVELI', '05', 'BELLA UNION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040306', '04', 'AREQUIPA', '03', 'CARAVELI', '06', 'CAHUACHO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040307', '04', 'AREQUIPA', '03', 'CARAVELI', '07', 'CHALA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040308', '04', 'AREQUIPA', '03', 'CARAVELI', '08', 'CHAPARRA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040309', '04', 'AREQUIPA', '03', 'CARAVELI', '09', 'HUANUHUANU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040310', '04', 'AREQUIPA', '03', 'CARAVELI', '10', 'JAQUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040311', '04', 'AREQUIPA', '03', 'CARAVELI', '11', 'LOMAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040312', '04', 'AREQUIPA', '03', 'CARAVELI', '12', 'QUICACHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040313', '04', 'AREQUIPA', '03', 'CARAVELI', '13', 'YAUCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040401', '04', 'AREQUIPA', '04', 'CASTILLA', '01', 'APLAO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040402', '04', 'AREQUIPA', '04', 'CASTILLA', '02', 'ANDAGUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040403', '04', 'AREQUIPA', '04', 'CASTILLA', '03', 'AYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040404', '04', 'AREQUIPA', '04', 'CASTILLA', '04', 'CHACHAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040405', '04', 'AREQUIPA', '04', 'CASTILLA', '05', 'CHILCAYMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040406', '04', 'AREQUIPA', '04', 'CASTILLA', '06', 'CHOCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040407', '04', 'AREQUIPA', '04', 'CASTILLA', '07', 'HUANCARQUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040408', '04', 'AREQUIPA', '04', 'CASTILLA', '08', 'MACHAGUAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040409', '04', 'AREQUIPA', '04', 'CASTILLA', '09', 'ORCOPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040410', '04', 'AREQUIPA', '04', 'CASTILLA', '10', 'PAMPACOLCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040411', '04', 'AREQUIPA', '04', 'CASTILLA', '11', 'TIPAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040412', '04', 'AREQUIPA', '04', 'CASTILLA', '12', 'UÑON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040413', '04', 'AREQUIPA', '04', 'CASTILLA', '13', 'URACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040414', '04', 'AREQUIPA', '04', 'CASTILLA', '14', 'VIRACO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040501', '04', 'AREQUIPA', '05', 'CAYLLOMA', '01', 'CHIVAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040502', '04', 'AREQUIPA', '05', 'CAYLLOMA', '02', 'ACHOMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040503', '04', 'AREQUIPA', '05', 'CAYLLOMA', '03', 'CABANACONDE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040504', '04', 'AREQUIPA', '05', 'CAYLLOMA', '04', 'CALLALLI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040505', '04', 'AREQUIPA', '05', 'CAYLLOMA', '05', 'CAYLLOMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040506', '04', 'AREQUIPA', '05', 'CAYLLOMA', '06', 'COPORAQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040507', '04', 'AREQUIPA', '05', 'CAYLLOMA', '07', 'HUAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040508', '04', 'AREQUIPA', '05', 'CAYLLOMA', '08', 'HUANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040509', '04', 'AREQUIPA', '05', 'CAYLLOMA', '09', 'ICHUPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040510', '04', 'AREQUIPA', '05', 'CAYLLOMA', '10', 'LARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040511', '04', 'AREQUIPA', '05', 'CAYLLOMA', '11', 'LLUTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040512', '04', 'AREQUIPA', '05', 'CAYLLOMA', '12', 'MACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040513', '04', 'AREQUIPA', '05', 'CAYLLOMA', '13', 'MADRIGAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040514', '04', 'AREQUIPA', '05', 'CAYLLOMA', '14', 'SAN ANTONIO DE CHUCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040515', '04', 'AREQUIPA', '05', 'CAYLLOMA', '15', 'SIBAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040516', '04', 'AREQUIPA', '05', 'CAYLLOMA', '16', 'TAPAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040517', '04', 'AREQUIPA', '05', 'CAYLLOMA', '17', 'TISCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040518', '04', 'AREQUIPA', '05', 'CAYLLOMA', '18', 'TUTI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040519', '04', 'AREQUIPA', '05', 'CAYLLOMA', '19', 'YANQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040520', '04', 'AREQUIPA', '05', 'CAYLLOMA', '20', 'MAJES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040601', '04', 'AREQUIPA', '06', 'CONDESUYOS', '01', 'CHUQUIBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040602', '04', 'AREQUIPA', '06', 'CONDESUYOS', '02', 'ANDARAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040603', '04', 'AREQUIPA', '06', 'CONDESUYOS', '03', 'CAYARANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040604', '04', 'AREQUIPA', '06', 'CONDESUYOS', '04', 'CHICHAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040605', '04', 'AREQUIPA', '06', 'CONDESUYOS', '05', 'IRAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040606', '04', 'AREQUIPA', '06', 'CONDESUYOS', '06', 'RIO GRANDE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040607', '04', 'AREQUIPA', '06', 'CONDESUYOS', '07', 'SALAMANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040608', '04', 'AREQUIPA', '06', 'CONDESUYOS', '08', 'YANAQUIHUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040701', '04', 'AREQUIPA', '07', 'ISLAY', '01', 'MOLLENDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040702', '04', 'AREQUIPA', '07', 'ISLAY', '02', 'COCACHACRA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040703', '04', 'AREQUIPA', '07', 'ISLAY', '03', 'DEAN VALDIVIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040704', '04', 'AREQUIPA', '07', 'ISLAY', '04', 'ISLAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040705', '04', 'AREQUIPA', '07', 'ISLAY', '05', 'MEJIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040706', '04', 'AREQUIPA', '07', 'ISLAY', '06', 'PUNTA DE BOMBON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040801', '04', 'AREQUIPA', '08', 'LA UNION', '01', 'COTAHUASI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040802', '04', 'AREQUIPA', '08', 'LA UNION', '02', 'ALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040803', '04', 'AREQUIPA', '08', 'LA UNION', '03', 'CHARCANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040804', '04', 'AREQUIPA', '08', 'LA UNION', '04', 'HUAYNACOTAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040805', '04', 'AREQUIPA', '08', 'LA UNION', '05', 'PAMPAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040806', '04', 'AREQUIPA', '08', 'LA UNION', '06', 'PUYCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040807', '04', 'AREQUIPA', '08', 'LA UNION', '07', 'QUECHUALLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040808', '04', 'AREQUIPA', '08', 'LA UNION', '08', 'SAYLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040809', '04', 'AREQUIPA', '08', 'LA UNION', '09', 'TAURIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040810', '04', 'AREQUIPA', '08', 'LA UNION', '10', 'TOMEPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('040811', '04', 'AREQUIPA', '08', 'LA UNION', '11', 'TORO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050101', '05', 'AYACUCHO', '01', 'HUAMANGA', '01', 'AYACUCHO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050102', '05', 'AYACUCHO', '01', 'HUAMANGA', '02', 'ACOCRO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050103', '05', 'AYACUCHO', '01', 'HUAMANGA', '03', 'ACOS VINCHOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050105', '05', 'AYACUCHO', '01', 'HUAMANGA', '05', 'CHIARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050106', '05', 'AYACUCHO', '01', 'HUAMANGA', '06', 'OCROS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050107', '05', 'AYACUCHO', '01', 'HUAMANGA', '07', 'PACAYCASA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050108', '05', 'AYACUCHO', '01', 'HUAMANGA', '08', 'QUINUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050109', '05', 'AYACUCHO', '01', 'HUAMANGA', '09', 'SAN JOSE DE TICLLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050110', '05', 'AYACUCHO', '01', 'HUAMANGA', '10', 'SAN JUAN BAUTISTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050111', '05', 'AYACUCHO', '01', 'HUAMANGA', '11', 'SANTIAGO DE PISCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050112', '05', 'AYACUCHO', '01', 'HUAMANGA', '12', 'SOCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050113', '05', 'AYACUCHO', '01', 'HUAMANGA', '13', 'TAMBILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050114', '05', 'AYACUCHO', '01', 'HUAMANGA', '14', 'VINCHOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050115', '05', 'AYACUCHO', '01', 'HUAMANGA', '15', 'JESUS NAZARENO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050201', '05', 'AYACUCHO', '02', 'CANGALLO', '01', 'CANGALLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050202', '05', 'AYACUCHO', '02', 'CANGALLO', '02', 'CHUSCHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050203', '05', 'AYACUCHO', '02', 'CANGALLO', '03', 'LOS MOROCHUCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050204', '05', 'AYACUCHO', '02', 'CANGALLO', '04', 'MARIA PARADO DE BELLIDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050205', '05', 'AYACUCHO', '02', 'CANGALLO', '05', 'PARAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050206', '05', 'AYACUCHO', '02', 'CANGALLO', '06', 'TOTOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050301', '05', 'AYACUCHO', '03', 'HUANCA SANCOS', '01', 'SANCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050302', '05', 'AYACUCHO', '03', 'HUANCA SANCOS', '02', 'CARAPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050303', '05', 'AYACUCHO', '03', 'HUANCA SANCOS', '03', 'SACSAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050304', '05', 'AYACUCHO', '03', 'HUANCA SANCOS', '04', 'SANTIAGO DE LUCANAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050401', '05', 'AYACUCHO', '04', 'HUANTA', '01', 'HUANTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050402', '05', 'AYACUCHO', '04', 'HUANTA', '02', 'AYAHUANCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050403', '05', 'AYACUCHO', '04', 'HUANTA', '03', 'HUAMANGUILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050404', '05', 'AYACUCHO', '04', 'HUANTA', '04', 'IGUAIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050405', '05', 'AYACUCHO', '04', 'HUANTA', '05', 'LURICOCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050406', '05', 'AYACUCHO', '04', 'HUANTA', '06', 'SANTILLANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050407', '05', 'AYACUCHO', '04', 'HUANTA', '07', 'SIVIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050408', '05', 'AYACUCHO', '04', 'HUANTA', '08', 'LLOCHEGUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050501', '05', 'AYACUCHO', '05', 'LA MAR', '01', 'SAN MIGUEL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050502', '05', 'AYACUCHO', '05', 'LA MAR', '02', 'ANCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050503', '05', 'AYACUCHO', '05', 'LA MAR', '03', 'AYNA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050504', '05', 'AYACUCHO', '05', 'LA MAR', '04', 'CHILCAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050505', '05', 'AYACUCHO', '05', 'LA MAR', '05', 'CHUNGUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050506', '05', 'AYACUCHO', '05', 'LA MAR', '06', 'LUIS CARRANZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050507', '05', 'AYACUCHO', '05', 'LA MAR', '07', 'SANTA ROSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050508', '05', 'AYACUCHO', '05', 'LA MAR', '08', 'TAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050601', '05', 'AYACUCHO', '06', 'LUCANAS', '01', 'PUQUIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050602', '05', 'AYACUCHO', '06', 'LUCANAS', '02', 'AUCARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050603', '05', 'AYACUCHO', '06', 'LUCANAS', '03', 'CABANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050604', '05', 'AYACUCHO', '06', 'LUCANAS', '04', 'CARMEN SALCEDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050605', '05', 'AYACUCHO', '06', 'LUCANAS', '05', 'CHAVIÑA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050606', '05', 'AYACUCHO', '06', 'LUCANAS', '06', 'CHIPAO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050607', '05', 'AYACUCHO', '06', 'LUCANAS', '07', 'HUAC-HUAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050608', '05', 'AYACUCHO', '06', 'LUCANAS', '08', 'LARAMATE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050609', '05', 'AYACUCHO', '06', 'LUCANAS', '09', 'LEONCIO PRADO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050610', '05', 'AYACUCHO', '06', 'LUCANAS', '10', 'LLAUTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050611', '05', 'AYACUCHO', '06', 'LUCANAS', '11', 'LUCANAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050612', '05', 'AYACUCHO', '06', 'LUCANAS', '12', 'OCAÑA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050613', '05', 'AYACUCHO', '06', 'LUCANAS', '13', 'OTOCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050614', '05', 'AYACUCHO', '06', 'LUCANAS', '14', 'SAISA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050615', '05', 'AYACUCHO', '06', 'LUCANAS', '15', 'SAN CRISTOBAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050616', '05', 'AYACUCHO', '06', 'LUCANAS', '16', 'SAN JUAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050617', '05', 'AYACUCHO', '06', 'LUCANAS', '17', 'SAN PEDRO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050618', '05', 'AYACUCHO', '06', 'LUCANAS', '18', 'SAN PEDRO DE PALCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050619', '05', 'AYACUCHO', '06', 'LUCANAS', '19', 'SANCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050620', '05', 'AYACUCHO', '06', 'LUCANAS', '20', 'SANTA ANA DE HUAYCAHUACHO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050621', '05', 'AYACUCHO', '06', 'LUCANAS', '21', 'SANTA LUCIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050701', '05', 'AYACUCHO', '07', 'PARINACOCHAS', '01', 'CORACORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050702', '05', 'AYACUCHO', '07', 'PARINACOCHAS', '02', 'CHUMPI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050703', '05', 'AYACUCHO', '07', 'PARINACOCHAS', '03', 'CORONEL CASTAÑEDA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050704', '05', 'AYACUCHO', '07', 'PARINACOCHAS', '04', 'PACAPAUSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050705', '05', 'AYACUCHO', '07', 'PARINACOCHAS', '05', 'PULLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050706', '05', 'AYACUCHO', '07', 'PARINACOCHAS', '06', 'PUYUSCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050707', '05', 'AYACUCHO', '07', 'PARINACOCHAS', '07', 'SAN FRANCISCO DE RAVACAYCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050708', '05', 'AYACUCHO', '07', 'PARINACOCHAS', '08', 'UPAHUACHO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050801', '05', 'AYACUCHO', '08', 'PAUCAR DEL SARA SARA', '01', 'PAUSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050802', '05', 'AYACUCHO', '08', 'PAUCAR DEL SARA SARA', '02', 'COLTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050803', '05', 'AYACUCHO', '08', 'PAUCAR DEL SARA SARA', '03', 'CORCULLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050804', '05', 'AYACUCHO', '08', 'PAUCAR DEL SARA SARA', '04', 'LAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050805', '05', 'AYACUCHO', '08', 'PAUCAR DEL SARA SARA', '05', 'MARCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050806', '05', 'AYACUCHO', '08', 'PAUCAR DEL SARA SARA', '06', 'OYOLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050807', '05', 'AYACUCHO', '08', 'PAUCAR DEL SARA SARA', '07', 'PARARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050808', '05', 'AYACUCHO', '08', 'PAUCAR DEL SARA SARA', '08', 'SAN JAVIER DE ALPABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050809', '05', 'AYACUCHO', '08', 'PAUCAR DEL SARA SARA', '09', 'SAN JOSE DE USHUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050810', '05', 'AYACUCHO', '08', 'PAUCAR DEL SARA SARA', '10', 'SARA SARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050901', '05', 'AYACUCHO', '09', 'SUCRE', '01', 'QUEROBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050902', '05', 'AYACUCHO', '09', 'SUCRE', '02', 'BELEN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050903', '05', 'AYACUCHO', '09', 'SUCRE', '03', 'CHALCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050904', '05', 'AYACUCHO', '09', 'SUCRE', '04', 'CHILCAYOC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050905', '05', 'AYACUCHO', '09', 'SUCRE', '05', 'HUACAÑA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050906', '05', 'AYACUCHO', '09', 'SUCRE', '06', 'MORCOLLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050907', '05', 'AYACUCHO', '09', 'SUCRE', '07', 'PAICO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050908', '05', 'AYACUCHO', '09', 'SUCRE', '08', 'SAN PEDRO DE LARCAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050909', '05', 'AYACUCHO', '09', 'SUCRE', '09', 'SAN SALVADOR DE QUIJE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050910', '05', 'AYACUCHO', '09', 'SUCRE', '10', 'SANTIAGO DE PAUCARAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('050911', '05', 'AYACUCHO', '09', 'SUCRE', '11', 'SORAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051001', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '01', 'HUANCAPI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051002', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '02', 'ALCAMENCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051003', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '03', 'APONGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051004', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '04', 'ASQUIPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051005', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '05', 'CANARIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051006', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '06', 'CAYARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051007', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '07', 'COLCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051008', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '08', 'HUAMANQUIQUIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051009', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '09', 'HUANCARAYLLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051010', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '10', 'HUAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051011', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '11', 'SARHUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051012', '05', 'AYACUCHO', '10', 'VICTOR FAJARDO', '12', 'VILCANCHOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051101', '05', 'AYACUCHO', '11', 'VILCAS HUAMAN', '01', 'VILCAS HUAMAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051102', '05', 'AYACUCHO', '11', 'VILCAS HUAMAN', '02', 'ACCOMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051103', '05', 'AYACUCHO', '11', 'VILCAS HUAMAN', '03', 'CARHUANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051104', '05', 'AYACUCHO', '11', 'VILCAS HUAMAN', '04', 'CONCEPCION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051105', '05', 'AYACUCHO', '11', 'VILCAS HUAMAN', '05', 'HUAMBALPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051106', '05', 'AYACUCHO', '11', 'VILCAS HUAMAN', '06', 'INDEPENDENCIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051107', '05', 'AYACUCHO', '11', 'VILCAS HUAMAN', '07', 'SAURAMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('051108', '05', 'AYACUCHO', '11', 'VILCAS HUAMAN', '08', 'VISCHONGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060101', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '01', 'CAJAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060102', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '02', 'ASUNCION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060103', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '03', 'CHETILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060104', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '04', 'COSPAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060105', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '05', 'ENCAÑADA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060106', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '06', 'JESUS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060107', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '07', 'LLACANORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060108', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '08', 'LOS BAÑOS DEL INCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060109', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '09', 'MAGDALENA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060110', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '10', 'MATARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060111', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '11', 'NAMORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060112', '06', 'CAJAMARCA', '01', 'CAJAMARCA', '12', 'SAN JUAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060201', '06', 'CAJAMARCA', '02', 'CAJABAMBA', '01', 'CAJABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060202', '06', 'CAJAMARCA', '02', 'CAJABAMBA', '02', 'CACHACHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060203', '06', 'CAJAMARCA', '02', 'CAJABAMBA', '03', 'CONDEBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060204', '06', 'CAJAMARCA', '02', 'CAJABAMBA', '04', 'SITACOCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060301', '06', 'CAJAMARCA', '03', 'CELENDIN', '01', 'CELENDIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060302', '06', 'CAJAMARCA', '03', 'CELENDIN', '02', 'CHUMUCH', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060303', '06', 'CAJAMARCA', '03', 'CELENDIN', '03', 'CORTEGANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060304', '06', 'CAJAMARCA', '03', 'CELENDIN', '04', 'HUASMIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060305', '06', 'CAJAMARCA', '03', 'CELENDIN', '05', 'JORGE CHAVEZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060306', '06', 'CAJAMARCA', '03', 'CELENDIN', '06', 'JOSE GALVEZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060307', '06', 'CAJAMARCA', '03', 'CELENDIN', '07', 'MIGUEL IGLESIAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060308', '06', 'CAJAMARCA', '03', 'CELENDIN', '08', 'OXAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060309', '06', 'CAJAMARCA', '03', 'CELENDIN', '09', 'SOROCHUCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060310', '06', 'CAJAMARCA', '03', 'CELENDIN', '10', 'SUCRE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060311', '06', 'CAJAMARCA', '03', 'CELENDIN', '11', 'UTCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060312', '06', 'CAJAMARCA', '03', 'CELENDIN', '12', 'LA LIBERTAD DE PALLAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060401', '06', 'CAJAMARCA', '04', 'CHOTA', '01', 'CHOTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060402', '06', 'CAJAMARCA', '04', 'CHOTA', '02', 'ANGUIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060403', '06', 'CAJAMARCA', '04', 'CHOTA', '03', 'CHADIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060404', '06', 'CAJAMARCA', '04', 'CHOTA', '04', 'CHIGUIRIP', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060405', '06', 'CAJAMARCA', '04', 'CHOTA', '05', 'CHIMBAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060406', '06', 'CAJAMARCA', '04', 'CHOTA', '06', 'CHOROPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060407', '06', 'CAJAMARCA', '04', 'CHOTA', '07', 'COCHABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060408', '06', 'CAJAMARCA', '04', 'CHOTA', '08', 'CONCHAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060409', '06', 'CAJAMARCA', '04', 'CHOTA', '09', 'HUAMBOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060410', '06', 'CAJAMARCA', '04', 'CHOTA', '10', 'LAJAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060411', '06', 'CAJAMARCA', '04', 'CHOTA', '11', 'LLAMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060412', '06', 'CAJAMARCA', '04', 'CHOTA', '12', 'MIRACOSTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060413', '06', 'CAJAMARCA', '04', 'CHOTA', '13', 'PACCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060414', '06', 'CAJAMARCA', '04', 'CHOTA', '14', 'PION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060415', '06', 'CAJAMARCA', '04', 'CHOTA', '15', 'QUEROCOTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060416', '06', 'CAJAMARCA', '04', 'CHOTA', '16', 'SAN JUAN DE LICUPIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060417', '06', 'CAJAMARCA', '04', 'CHOTA', '17', 'TACABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060418', '06', 'CAJAMARCA', '04', 'CHOTA', '18', 'TOCMOCHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060419', '06', 'CAJAMARCA', '04', 'CHOTA', '19', 'CHALAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060501', '06', 'CAJAMARCA', '05', 'CONTUMAZA', '01', 'CONTUMAZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060502', '06', 'CAJAMARCA', '05', 'CONTUMAZA', '02', 'CHILETE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060503', '06', 'CAJAMARCA', '05', 'CONTUMAZA', '03', 'CUPISNIQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060504', '06', 'CAJAMARCA', '05', 'CONTUMAZA', '04', 'GUZMANGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060505', '06', 'CAJAMARCA', '05', 'CONTUMAZA', '05', 'SAN BENITO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060506', '06', 'CAJAMARCA', '05', 'CONTUMAZA', '06', 'SANTA CRUZ DE TOLED', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060507', '06', 'CAJAMARCA', '05', 'CONTUMAZA', '07', 'TANTARICA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060508', '06', 'CAJAMARCA', '05', 'CONTUMAZA', '08', 'YONAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060601', '06', 'CAJAMARCA', '06', 'CUTERVO', '01', 'CUTERVO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060602', '06', 'CAJAMARCA', '06', 'CUTERVO', '02', 'CALLAYUC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060603', '06', 'CAJAMARCA', '06', 'CUTERVO', '03', 'CHOROS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060604', '06', 'CAJAMARCA', '06', 'CUTERVO', '04', 'CUJILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060605', '06', 'CAJAMARCA', '06', 'CUTERVO', '05', 'LA RAMADA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060606', '06', 'CAJAMARCA', '06', 'CUTERVO', '06', 'PIMPINGOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060607', '06', 'CAJAMARCA', '06', 'CUTERVO', '07', 'QUEROCOTILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060608', '06', 'CAJAMARCA', '06', 'CUTERVO', '08', 'SAN ANDRES DE CUTERVO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060609', '06', 'CAJAMARCA', '06', 'CUTERVO', '09', 'SAN JUAN DE CUTERVO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060610', '06', 'CAJAMARCA', '06', 'CUTERVO', '10', 'SAN LUIS DE LUCMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060611', '06', 'CAJAMARCA', '06', 'CUTERVO', '11', 'SANTA CRUZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060612', '06', 'CAJAMARCA', '06', 'CUTERVO', '12', 'SANTO DOMINGO DE LA CAPILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060613', '06', 'CAJAMARCA', '06', 'CUTERVO', '13', 'SANTO TOMAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060614', '06', 'CAJAMARCA', '06', 'CUTERVO', '14', 'SOCOTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060615', '06', 'CAJAMARCA', '06', 'CUTERVO', '15', 'TORIBIO CASANOVA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060701', '06', 'CAJAMARCA', '07', 'HUALGAYOC', '01', 'BAMBAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060702', '06', 'CAJAMARCA', '07', 'HUALGAYOC', '02', 'CHUGUR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060703', '06', 'CAJAMARCA', '07', 'HUALGAYOC', '03', 'HUALGAYOC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060801', '06', 'CAJAMARCA', '08', 'JAEN', '01', 'JAEN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060802', '06', 'CAJAMARCA', '08', 'JAEN', '02', 'BELLAVISTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060803', '06', 'CAJAMARCA', '08', 'JAEN', '03', 'CHONTALI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060804', '06', 'CAJAMARCA', '08', 'JAEN', '04', 'COLASAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060805', '06', 'CAJAMARCA', '08', 'JAEN', '05', 'HUABAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060806', '06', 'CAJAMARCA', '08', 'JAEN', '06', 'LAS PIRIAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060807', '06', 'CAJAMARCA', '08', 'JAEN', '07', 'POMAHUACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060808', '06', 'CAJAMARCA', '08', 'JAEN', '08', 'PUCARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060809', '06', 'CAJAMARCA', '08', 'JAEN', '09', 'SALLIQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060810', '06', 'CAJAMARCA', '08', 'JAEN', '10', 'SAN FELIPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060811', '06', 'CAJAMARCA', '08', 'JAEN', '11', 'SAN JOSE DEL ALTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060812', '06', 'CAJAMARCA', '08', 'JAEN', '12', 'SANTA ROSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060901', '06', 'CAJAMARCA', '09', 'SAN IGNACIO', '01', 'SAN IGNACIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060902', '06', 'CAJAMARCA', '09', 'SAN IGNACIO', '02', 'CHIRINOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060903', '06', 'CAJAMARCA', '09', 'SAN IGNACIO', '03', 'HUARANGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060904', '06', 'CAJAMARCA', '09', 'SAN IGNACIO', '04', 'LA COIPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060905', '06', 'CAJAMARCA', '09', 'SAN IGNACIO', '05', 'NAMBALLE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060906', '06', 'CAJAMARCA', '09', 'SAN IGNACIO', '06', 'SAN JOSE DE LOURDES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('060907', '06', 'CAJAMARCA', '09', 'SAN IGNACIO', '07', 'TABACONAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061001', '06', 'CAJAMARCA', '10', 'SAN MARCOS', '01', 'PEDRO GALVEZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061002', '06', 'CAJAMARCA', '10', 'SAN MARCOS', '02', 'CHANCAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061003', '06', 'CAJAMARCA', '10', 'SAN MARCOS', '03', 'EDUARDO VILLANUEVA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061004', '06', 'CAJAMARCA', '10', 'SAN MARCOS', '04', 'GREGORIO PITA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061005', '06', 'CAJAMARCA', '10', 'SAN MARCOS', '05', 'ICHOCAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061006', '06', 'CAJAMARCA', '10', 'SAN MARCOS', '06', 'JOSE MANUEL QUIROZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061007', '06', 'CAJAMARCA', '10', 'SAN MARCOS', '07', 'JOSE SABOGAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061101', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '01', 'SAN MIGUEL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061102', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '02', 'BOLIVAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061103', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '03', 'CALQUIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061104', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '04', 'CATILLUC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061105', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '05', 'EL PRADO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061106', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '06', 'LA FLORIDA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061107', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '07', 'LLAPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061108', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '08', 'NANCHOC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061109', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '09', 'NIEPOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061110', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '10', 'SAN GREGORIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061111', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '11', 'SAN SILVESTRE DE COCHAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061112', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '12', 'TONGOD', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061113', '06', 'CAJAMARCA', '11', 'SAN MIGUEL', '13', 'UNION AGUA BLANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061201', '06', 'CAJAMARCA', '12', 'SAN PABLO', '01', 'SAN PABLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061202', '06', 'CAJAMARCA', '12', 'SAN PABLO', '02', 'SAN BERNARDINO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061203', '06', 'CAJAMARCA', '12', 'SAN PABLO', '03', 'SAN LUIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061204', '06', 'CAJAMARCA', '12', 'SAN PABLO', '04', 'TUMBADEN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061301', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '01', 'SANTA CRUZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061302', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '02', 'ANDABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061303', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '03', 'CATACHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061304', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '04', 'CHANCAYBAÑOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061305', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '05', 'LA ESPERANZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061306', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '06', 'NINABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061307', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '07', 'PULAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061308', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '08', 'SAUCEPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061309', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '09', 'SEXI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061310', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '10', 'UTICYACU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('061311', '06', 'CAJAMARCA', '13', 'SANTA CRUZ', '11', 'YAUYUCAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('070101', '07', 'CALLAO', '01', 'CALLAO', '01', 'CALLAO', '', '2');
INSERT INTO `tb_ubigeo` VALUES ('070102', '07', 'CALLAO', '01', 'CALLAO', '02', 'BELLAVISTA', '', '2');
INSERT INTO `tb_ubigeo` VALUES ('070103', '07', 'CALLAO', '01', 'CALLAO', '03', 'CARMEN DE LA LEGUA REYNOSO', '', '2');
INSERT INTO `tb_ubigeo` VALUES ('070104', '07', 'CALLAO', '01', 'CALLAO', '04', 'LA PERLA', '', '2');
INSERT INTO `tb_ubigeo` VALUES ('070105', '07', 'CALLAO', '01', 'CALLAO', '05', 'LA PUNTA', '', '2');
INSERT INTO `tb_ubigeo` VALUES ('070106', '07', 'CALLAO', '01', 'CALLAO', '06', 'VENTANILLA', '', '2');
INSERT INTO `tb_ubigeo` VALUES ('080101', '08', 'CUSCO', '01', 'CUSCO', '01', 'CUSCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080102', '08', 'CUSCO', '01', 'CUSCO', '02', 'CCORCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080103', '08', 'CUSCO', '01', 'CUSCO', '03', 'POROY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080104', '08', 'CUSCO', '01', 'CUSCO', '04', 'SAN JERONIMO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080105', '08', 'CUSCO', '01', 'CUSCO', '05', 'SAN SEBASTIAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080106', '08', 'CUSCO', '01', 'CUSCO', '06', 'SANTIAGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080107', '08', 'CUSCO', '01', 'CUSCO', '07', 'SAYLLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080108', '08', 'CUSCO', '01', 'CUSCO', '08', 'WANCHAQ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080201', '08', 'CUSCO', '02', 'ACOMAYO', '01', 'ACOMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080202', '08', 'CUSCO', '02', 'ACOMAYO', '02', 'ACOPIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080203', '08', 'CUSCO', '02', 'ACOMAYO', '03', 'ACOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080204', '08', 'CUSCO', '02', 'ACOMAYO', '04', 'MOSOC LLACTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080205', '08', 'CUSCO', '02', 'ACOMAYO', '05', 'POMACANCHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080206', '08', 'CUSCO', '02', 'ACOMAYO', '06', 'RONDOCAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080207', '08', 'CUSCO', '02', 'ACOMAYO', '07', 'SANGARARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080301', '08', 'CUSCO', '03', 'ANTA', '01', 'ANTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080302', '08', 'CUSCO', '03', 'ANTA', '02', 'ANCAHUASI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080303', '08', 'CUSCO', '03', 'ANTA', '03', 'CACHIMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080304', '08', 'CUSCO', '03', 'ANTA', '04', 'CHINCHAYPUJIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080305', '08', 'CUSCO', '03', 'ANTA', '05', 'HUAROCONDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080306', '08', 'CUSCO', '03', 'ANTA', '06', 'LIMATAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080307', '08', 'CUSCO', '03', 'ANTA', '07', 'MOLLEPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080308', '08', 'CUSCO', '03', 'ANTA', '08', 'PUCYURA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080309', '08', 'CUSCO', '03', 'ANTA', '09', 'ZURITE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080401', '08', 'CUSCO', '04', 'CALCA', '01', 'CALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080402', '08', 'CUSCO', '04', 'CALCA', '02', 'COYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080403', '08', 'CUSCO', '04', 'CALCA', '03', 'LAMAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080404', '08', 'CUSCO', '04', 'CALCA', '04', 'LARES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080405', '08', 'CUSCO', '04', 'CALCA', '05', 'PISAC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080406', '08', 'CUSCO', '04', 'CALCA', '06', 'SAN SALVADOR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080407', '08', 'CUSCO', '04', 'CALCA', '07', 'TARAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080408', '08', 'CUSCO', '04', 'CALCA', '08', 'YANATILE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080501', '08', 'CUSCO', '05', 'CANAS', '01', 'YANAOCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080502', '08', 'CUSCO', '05', 'CANAS', '02', 'CHECCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080503', '08', 'CUSCO', '05', 'CANAS', '03', 'KUNTURKANKI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080504', '08', 'CUSCO', '05', 'CANAS', '04', 'LANGUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080505', '08', 'CUSCO', '05', 'CANAS', '05', 'LAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080506', '08', 'CUSCO', '05', 'CANAS', '06', 'PAMPAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080507', '08', 'CUSCO', '05', 'CANAS', '07', 'QUEHUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080508', '08', 'CUSCO', '05', 'CANAS', '08', 'TUPAC AMARU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080601', '08', 'CUSCO', '06', 'CANCHIS', '01', 'SICUANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080602', '08', 'CUSCO', '06', 'CANCHIS', '02', 'CHECACUPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080603', '08', 'CUSCO', '06', 'CANCHIS', '03', 'COMBAPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080604', '08', 'CUSCO', '06', 'CANCHIS', '04', 'MARANGANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080605', '08', 'CUSCO', '06', 'CANCHIS', '05', 'PITUMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080606', '08', 'CUSCO', '06', 'CANCHIS', '06', 'SAN PABLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080607', '08', 'CUSCO', '06', 'CANCHIS', '07', 'SAN PEDRO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080608', '08', 'CUSCO', '06', 'CANCHIS', '08', 'TINTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080701', '08', 'CUSCO', '07', 'CHUMBIVILCAS', '01', 'SANTO TOMAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080702', '08', 'CUSCO', '07', 'CHUMBIVILCAS', '02', 'CAPACMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080703', '08', 'CUSCO', '07', 'CHUMBIVILCAS', '03', 'CHAMACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080704', '08', 'CUSCO', '07', 'CHUMBIVILCAS', '04', 'COLQUEMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080705', '08', 'CUSCO', '07', 'CHUMBIVILCAS', '05', 'LIVITACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080706', '08', 'CUSCO', '07', 'CHUMBIVILCAS', '06', 'LLUSCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080707', '08', 'CUSCO', '07', 'CHUMBIVILCAS', '07', 'QUIÑOTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080708', '08', 'CUSCO', '07', 'CHUMBIVILCAS', '08', 'VELILLE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080801', '08', 'CUSCO', '08', 'ESPINAR', '01', 'ESPINAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080802', '08', 'CUSCO', '08', 'ESPINAR', '02', 'CONDOROMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080803', '08', 'CUSCO', '08', 'ESPINAR', '03', 'COPORAQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080804', '08', 'CUSCO', '08', 'ESPINAR', '04', 'OCORURO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080805', '08', 'CUSCO', '08', 'ESPINAR', '05', 'PALLPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080806', '08', 'CUSCO', '08', 'ESPINAR', '06', 'PICHIGUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080807', '08', 'CUSCO', '08', 'ESPINAR', '07', 'SUYCKUTAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080808', '08', 'CUSCO', '08', 'ESPINAR', '08', 'ALTO PICHIGUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080901', '08', 'CUSCO', '09', 'LA CONVENCION', '01', 'SANTA ANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080902', '08', 'CUSCO', '09', 'LA CONVENCION', '02', 'ECHARATE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080903', '08', 'CUSCO', '09', 'LA CONVENCION', '03', 'HUAYOPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080904', '08', 'CUSCO', '09', 'LA CONVENCION', '04', 'MARANURA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080905', '08', 'CUSCO', '09', 'LA CONVENCION', '05', 'OCOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080906', '08', 'CUSCO', '09', 'LA CONVENCION', '06', 'QUELLOUNO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080907', '08', 'CUSCO', '09', 'LA CONVENCION', '07', 'KIMBIRI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080908', '08', 'CUSCO', '09', 'LA CONVENCION', '08', 'SANTA TERESA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080909', '08', 'CUSCO', '09', 'LA CONVENCION', '09', 'VILCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('080910', '08', 'CUSCO', '09', 'LA CONVENCION', '10', 'PICHARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081001', '08', 'CUSCO', '10', 'PARURO', '01', 'PARURO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081002', '08', 'CUSCO', '10', 'PARURO', '02', 'ACCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081003', '08', 'CUSCO', '10', 'PARURO', '03', 'CCAPI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081004', '08', 'CUSCO', '10', 'PARURO', '04', 'COLCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081005', '08', 'CUSCO', '10', 'PARURO', '05', 'HUANOQUITE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081006', '08', 'CUSCO', '10', 'PARURO', '06', 'OMACHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081007', '08', 'CUSCO', '10', 'PARURO', '07', 'PACCARITAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081008', '08', 'CUSCO', '10', 'PARURO', '08', 'PILLPINTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081009', '08', 'CUSCO', '10', 'PARURO', '09', 'YAURISQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081101', '08', 'CUSCO', '11', 'PAUCARTAMBO', '01', 'PAUCARTAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081102', '08', 'CUSCO', '11', 'PAUCARTAMBO', '02', 'CAICAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081103', '08', 'CUSCO', '11', 'PAUCARTAMBO', '03', 'CHALLABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081104', '08', 'CUSCO', '11', 'PAUCARTAMBO', '04', 'COLQUEPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081105', '08', 'CUSCO', '11', 'PAUCARTAMBO', '05', 'HUANCARANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081106', '08', 'CUSCO', '11', 'PAUCARTAMBO', '06', 'KOSÑIPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081201', '08', 'CUSCO', '12', 'QUISPICANCHI', '01', 'URCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081202', '08', 'CUSCO', '12', 'QUISPICANCHI', '02', 'ANDAHUAYLILLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081203', '08', 'CUSCO', '12', 'QUISPICANCHI', '03', 'CAMANTI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081204', '08', 'CUSCO', '12', 'QUISPICANCHI', '04', 'CCARHUAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081205', '08', 'CUSCO', '12', 'QUISPICANCHI', '05', 'CCATCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081206', '08', 'CUSCO', '12', 'QUISPICANCHI', '06', 'CUSIPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081207', '08', 'CUSCO', '12', 'QUISPICANCHI', '07', 'HUARO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081208', '08', 'CUSCO', '12', 'QUISPICANCHI', '08', 'LUCRE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081209', '08', 'CUSCO', '12', 'QUISPICANCHI', '09', 'MARCAPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081210', '08', 'CUSCO', '12', 'QUISPICANCHI', '10', 'OCONGATE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081211', '08', 'CUSCO', '12', 'QUISPICANCHI', '11', 'OROPESA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081212', '08', 'CUSCO', '12', 'QUISPICANCHI', '12', 'QUIQUIJANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081301', '08', 'CUSCO', '13', 'URUBAMBA', '01', 'URUBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081302', '08', 'CUSCO', '13', 'URUBAMBA', '02', 'CHINCHERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081303', '08', 'CUSCO', '13', 'URUBAMBA', '03', 'HUAYLLABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081304', '08', 'CUSCO', '13', 'URUBAMBA', '04', 'MACHUPICCHU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081305', '08', 'CUSCO', '13', 'URUBAMBA', '05', 'MARAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081306', '08', 'CUSCO', '13', 'URUBAMBA', '06', 'OLLANTAYTAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('081307', '08', 'CUSCO', '13', 'URUBAMBA', '07', 'YUCAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090101', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '01', 'HUANCAVELICA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090102', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '02', 'ACOBAMBILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090103', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '03', 'ACORIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090104', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '04', 'CONAYCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090105', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '05', 'CUENCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090106', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '06', 'HUACHOCOLPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090107', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '07', 'HUAYLLAHUARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090108', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '08', 'IZCUCHACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090109', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '09', 'LARIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090110', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '10', 'MANTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090111', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '11', 'MARISCAL CACERES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090112', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '12', 'MOYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090113', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '13', 'NUEVO OCCORO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090114', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '14', 'PALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090115', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '15', 'PILCHACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090116', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '16', 'VILCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090117', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '17', 'YAULI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090118', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '18', 'ASCENSION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090119', '09', 'HUANCAVELICA', '01', 'HUANCAVELICA', '19', 'HUANDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090201', '09', 'HUANCAVELICA', '02', 'ACOBAMBA', '01', 'ACOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090202', '09', 'HUANCAVELICA', '02', 'ACOBAMBA', '02', 'ANDABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090203', '09', 'HUANCAVELICA', '02', 'ACOBAMBA', '03', 'ANTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090204', '09', 'HUANCAVELICA', '02', 'ACOBAMBA', '04', 'CAJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090205', '09', 'HUANCAVELICA', '02', 'ACOBAMBA', '05', 'MARCAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090206', '09', 'HUANCAVELICA', '02', 'ACOBAMBA', '06', 'PAUCARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090207', '09', 'HUANCAVELICA', '02', 'ACOBAMBA', '07', 'POMACOCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090208', '09', 'HUANCAVELICA', '02', 'ACOBAMBA', '08', 'ROSARIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090301', '09', 'HUANCAVELICA', '03', 'ANGARAES', '01', 'LIRCAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090302', '09', 'HUANCAVELICA', '03', 'ANGARAES', '02', 'ANCHONGA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090303', '09', 'HUANCAVELICA', '03', 'ANGARAES', '03', 'CALLANMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090304', '09', 'HUANCAVELICA', '03', 'ANGARAES', '04', 'CCOCHACCASA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090305', '09', 'HUANCAVELICA', '03', 'ANGARAES', '05', 'CHINCHO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090306', '09', 'HUANCAVELICA', '03', 'ANGARAES', '06', 'CONGALLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090307', '09', 'HUANCAVELICA', '03', 'ANGARAES', '07', 'HUANCA-HUANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090308', '09', 'HUANCAVELICA', '03', 'ANGARAES', '08', 'HUAYLLAY GRANDE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090309', '09', 'HUANCAVELICA', '03', 'ANGARAES', '09', 'JULCAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090310', '09', 'HUANCAVELICA', '03', 'ANGARAES', '10', 'SAN ANTONIO DE ANTAPARCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090311', '09', 'HUANCAVELICA', '03', 'ANGARAES', '11', 'SANTO TOMAS DE PATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090312', '09', 'HUANCAVELICA', '03', 'ANGARAES', '12', 'SECCLLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090401', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '01', 'CASTROVIRREYNA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090402', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '02', 'ARMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090403', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '03', 'AURAHUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090404', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '04', 'CAPILLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090405', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '05', 'CHUPAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090406', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '06', 'COCAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090407', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '07', 'HUACHOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090408', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '08', 'HUAMATAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090409', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '09', 'MOLLEPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090410', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '10', 'SAN JUAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090411', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '11', 'SANTA ANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090412', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '12', 'TANTARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090413', '09', 'HUANCAVELICA', '04', 'CASTROVIRREYNA', '13', 'TICRAPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090501', '09', 'HUANCAVELICA', '05', 'CHURCAMPA', '01', 'CHURCAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090502', '09', 'HUANCAVELICA', '05', 'CHURCAMPA', '02', 'ANCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090503', '09', 'HUANCAVELICA', '05', 'CHURCAMPA', '03', 'CHINCHIHUASI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090504', '09', 'HUANCAVELICA', '05', 'CHURCAMPA', '04', 'EL CARMEN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090505', '09', 'HUANCAVELICA', '05', 'CHURCAMPA', '05', 'LA MERCED', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090506', '09', 'HUANCAVELICA', '05', 'CHURCAMPA', '06', 'LOCROJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090507', '09', 'HUANCAVELICA', '05', 'CHURCAMPA', '07', 'PAUCARBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090508', '09', 'HUANCAVELICA', '05', 'CHURCAMPA', '08', 'SAN MIGUEL DE MAYOCC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090509', '09', 'HUANCAVELICA', '05', 'CHURCAMPA', '09', 'SAN PEDRO DE CORIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090510', '09', 'HUANCAVELICA', '05', 'CHURCAMPA', '10', 'PACHAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090601', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '01', 'HUAYTARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090602', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '02', 'AYAVI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090603', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '03', 'CORDOVA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090604', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '04', 'HUAYACUNDO ARMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090605', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '05', 'LARAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090606', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '06', 'OCOYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090607', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '07', 'PILPICHACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090608', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '08', 'QUERCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090609', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '09', 'QUITO-ARMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090610', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '10', 'SAN ANTONIO DE CUSICANCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090611', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '11', 'SAN FRANCISCO DE SANGAYAICO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090612', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '12', 'SAN ISIDRO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090613', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '13', 'SANTIAGO DE CHOCORVOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090614', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '14', 'SANTIAGO DE QUIRAHUARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090615', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '15', 'SANTO DOMINGO DE CAPILLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090616', '09', 'HUANCAVELICA', '06', 'HUAYTARA', '16', 'TAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090701', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '01', 'PAMPAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090702', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '02', 'ACOSTAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090703', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '03', 'ACRAQUIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090704', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '04', 'AHUAYCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090705', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '05', 'COLCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090706', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '06', 'DANIEL HERNANDEZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090707', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '07', 'HUACHOCOLPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090709', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '09', 'HUARIBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090710', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '10', 'ÑAHUIMPUQUIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090711', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '11', 'PAZOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090713', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '13', 'QUISHUAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090714', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '14', 'SALCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090715', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '15', 'SALCAHUASI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090716', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '16', 'SAN MARCOS DE ROCCHAC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090717', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '17', 'SURCUBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('090718', '09', 'HUANCAVELICA', '07', 'TAYACAJA', '18', 'TINTAY PUNCU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100101', '10', 'HUANUCO', '01', 'HUANUCO', '01', 'HUANUCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100102', '10', 'HUANUCO', '01', 'HUANUCO', '02', 'AMARILIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100103', '10', 'HUANUCO', '01', 'HUANUCO', '03', 'CHINCHAO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100104', '10', 'HUANUCO', '01', 'HUANUCO', '04', 'CHURUBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100105', '10', 'HUANUCO', '01', 'HUANUCO', '05', 'MARGOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100106', '10', 'HUANUCO', '01', 'HUANUCO', '06', 'QUISQUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100107', '10', 'HUANUCO', '01', 'HUANUCO', '07', 'SAN FRANCISCO DE CAYRAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100108', '10', 'HUANUCO', '01', 'HUANUCO', '08', 'SAN PEDRO DE CHAULAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100109', '10', 'HUANUCO', '01', 'HUANUCO', '09', 'SANTA MARIA DEL VALLE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100110', '10', 'HUANUCO', '01', 'HUANUCO', '10', 'YARUMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100111', '10', 'HUANUCO', '01', 'HUANUCO', '11', 'PILLCO MARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100201', '10', 'HUANUCO', '02', 'AMBO', '01', 'AMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100202', '10', 'HUANUCO', '02', 'AMBO', '02', 'CAYNA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100203', '10', 'HUANUCO', '02', 'AMBO', '03', 'COLPAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100204', '10', 'HUANUCO', '02', 'AMBO', '04', 'CONCHAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100205', '10', 'HUANUCO', '02', 'AMBO', '05', 'HUACAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100206', '10', 'HUANUCO', '02', 'AMBO', '06', 'SAN FRANCISCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100207', '10', 'HUANUCO', '02', 'AMBO', '07', 'SAN RAFAEL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100208', '10', 'HUANUCO', '02', 'AMBO', '08', 'TOMAY KICHWA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100301', '10', 'HUANUCO', '03', 'DOS DE MAYO', '01', 'LA UNION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100307', '10', 'HUANUCO', '03', 'DOS DE MAYO', '07', 'CHUQUIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100311', '10', 'HUANUCO', '03', 'DOS DE MAYO', '11', 'MARIAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100313', '10', 'HUANUCO', '03', 'DOS DE MAYO', '13', 'PACHAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100316', '10', 'HUANUCO', '03', 'DOS DE MAYO', '16', 'QUIVILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100317', '10', 'HUANUCO', '03', 'DOS DE MAYO', '17', 'RIPAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100321', '10', 'HUANUCO', '03', 'DOS DE MAYO', '21', 'SHUNQUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100322', '10', 'HUANUCO', '03', 'DOS DE MAYO', '22', 'SILLAPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100323', '10', 'HUANUCO', '03', 'DOS DE MAYO', '23', 'YANAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100401', '10', 'HUANUCO', '04', 'HUACAYBAMBA', '01', 'HUACAYBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100402', '10', 'HUANUCO', '04', 'HUACAYBAMBA', '02', 'CANCHABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100403', '10', 'HUANUCO', '04', 'HUACAYBAMBA', '03', 'COCHABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100404', '10', 'HUANUCO', '04', 'HUACAYBAMBA', '04', 'PINRA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100501', '10', 'HUANUCO', '05', 'HUAMALIES', '01', 'LLATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100502', '10', 'HUANUCO', '05', 'HUAMALIES', '02', 'ARANCAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100503', '10', 'HUANUCO', '05', 'HUAMALIES', '03', 'CHAVIN DE PARIARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100504', '10', 'HUANUCO', '05', 'HUAMALIES', '04', 'JACAS GRANDE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100505', '10', 'HUANUCO', '05', 'HUAMALIES', '05', 'JIRCAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100506', '10', 'HUANUCO', '05', 'HUAMALIES', '06', 'MIRAFLORES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100507', '10', 'HUANUCO', '05', 'HUAMALIES', '07', 'MONZON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100508', '10', 'HUANUCO', '05', 'HUAMALIES', '08', 'PUNCHAO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100509', '10', 'HUANUCO', '05', 'HUAMALIES', '09', 'PUÑOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100510', '10', 'HUANUCO', '05', 'HUAMALIES', '10', 'SINGA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100511', '10', 'HUANUCO', '05', 'HUAMALIES', '11', 'TANTAMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100601', '10', 'HUANUCO', '06', 'LEONCIO PRADO', '01', 'RUPA-RUPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100602', '10', 'HUANUCO', '06', 'LEONCIO PRADO', '02', 'DANIEL ALOMIAS ROBLES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100603', '10', 'HUANUCO', '06', 'LEONCIO PRADO', '03', 'HERMILIO VALDIZAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100604', '10', 'HUANUCO', '06', 'LEONCIO PRADO', '04', 'JOSE CRESPO Y CASTILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100605', '10', 'HUANUCO', '06', 'LEONCIO PRADO', '05', 'LUYANDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100606', '10', 'HUANUCO', '06', 'LEONCIO PRADO', '06', 'MARIANO DAMASO BERAUN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100701', '10', 'HUANUCO', '07', 'MARAÑON', '01', 'HUACRACHUCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100702', '10', 'HUANUCO', '07', 'MARAÑON', '02', 'CHOLON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100703', '10', 'HUANUCO', '07', 'MARAÑON', '03', 'SAN BUENAVENTURA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100801', '10', 'HUANUCO', '08', 'PACHITEA', '01', 'PANAO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100802', '10', 'HUANUCO', '08', 'PACHITEA', '02', 'CHAGLLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100803', '10', 'HUANUCO', '08', 'PACHITEA', '03', 'MOLINO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100804', '10', 'HUANUCO', '08', 'PACHITEA', '04', 'UMARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100901', '10', 'HUANUCO', '09', 'PUERTO INCA', '01', 'PUERTO INCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100902', '10', 'HUANUCO', '09', 'PUERTO INCA', '02', 'CODO DEL POZUZO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100903', '10', 'HUANUCO', '09', 'PUERTO INCA', '03', 'HONORIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100904', '10', 'HUANUCO', '09', 'PUERTO INCA', '04', 'TOURNAVISTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('100905', '10', 'HUANUCO', '09', 'PUERTO INCA', '05', 'YUYAPICHIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101001', '10', 'HUANUCO', '10', 'LAURICOCHA', '01', 'JESUS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101002', '10', 'HUANUCO', '10', 'LAURICOCHA', '02', 'BAÑOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101003', '10', 'HUANUCO', '10', 'LAURICOCHA', '03', 'JIVIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101004', '10', 'HUANUCO', '10', 'LAURICOCHA', '04', 'QUEROPALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101005', '10', 'HUANUCO', '10', 'LAURICOCHA', '05', 'RONDOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101006', '10', 'HUANUCO', '10', 'LAURICOCHA', '06', 'SAN FRANCISCO DE ASIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101007', '10', 'HUANUCO', '10', 'LAURICOCHA', '07', 'SAN MIGUEL DE CAURI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101101', '10', 'HUANUCO', '11', 'YAROWILCA', '01', 'CHAVINILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101102', '10', 'HUANUCO', '11', 'YAROWILCA', '02', 'CAHUAC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101103', '10', 'HUANUCO', '11', 'YAROWILCA', '03', 'CHACABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101104', '10', 'HUANUCO', '11', 'YAROWILCA', '04', 'APARICIO POMARES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101105', '10', 'HUANUCO', '11', 'YAROWILCA', '05', 'JACAS CHICO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101106', '10', 'HUANUCO', '11', 'YAROWILCA', '06', 'OBAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101107', '10', 'HUANUCO', '11', 'YAROWILCA', '07', 'PAMPAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('101108', '10', 'HUANUCO', '11', 'YAROWILCA', '08', 'CHORAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110101', '11', 'ICA', '01', 'ICA', '01', 'ICA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110102', '11', 'ICA', '01', 'ICA', '02', 'LA TINGUIÑA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110103', '11', 'ICA', '01', 'ICA', '03', 'LOS AQUIJES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110104', '11', 'ICA', '01', 'ICA', '04', 'OCUCAJE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110105', '11', 'ICA', '01', 'ICA', '05', 'PACHACUTEC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110106', '11', 'ICA', '01', 'ICA', '06', 'PARCONA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110107', '11', 'ICA', '01', 'ICA', '07', 'PUEBLO NUEVO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110108', '11', 'ICA', '01', 'ICA', '08', 'SALAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110109', '11', 'ICA', '01', 'ICA', '09', 'SAN JOSE DE LOS MOLINOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110110', '11', 'ICA', '01', 'ICA', '10', 'SAN JUAN BAUTISTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110111', '11', 'ICA', '01', 'ICA', '11', 'SANTIAGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110112', '11', 'ICA', '01', 'ICA', '12', 'SUBTANJALLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110113', '11', 'ICA', '01', 'ICA', '13', 'TATE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110114', '11', 'ICA', '01', 'ICA', '14', 'YAUCA DEL ROSARIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110201', '11', 'ICA', '02', 'CHINCHA', '01', 'CHINCHA ALTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110202', '11', 'ICA', '02', 'CHINCHA', '02', 'ALTO LARAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110203', '11', 'ICA', '02', 'CHINCHA', '03', 'CHAVIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110204', '11', 'ICA', '02', 'CHINCHA', '04', 'CHINCHA BAJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110205', '11', 'ICA', '02', 'CHINCHA', '05', 'EL CARMEN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110206', '11', 'ICA', '02', 'CHINCHA', '06', 'GROCIO PRADO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110207', '11', 'ICA', '02', 'CHINCHA', '07', 'PUEBLO NUEVO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110208', '11', 'ICA', '02', 'CHINCHA', '08', 'SAN JUAN DE YANAC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110209', '11', 'ICA', '02', 'CHINCHA', '09', 'SAN PEDRO DE HUACARPANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110210', '11', 'ICA', '02', 'CHINCHA', '10', 'SUNAMPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110211', '11', 'ICA', '02', 'CHINCHA', '11', 'TAMBO DE MORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110301', '11', 'ICA', '03', 'NAZCA', '01', 'NAZCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110302', '11', 'ICA', '03', 'NAZCA', '02', 'CHANGUILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110303', '11', 'ICA', '03', 'NAZCA', '03', 'EL INGENIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110304', '11', 'ICA', '03', 'NAZCA', '04', 'MARCONA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110305', '11', 'ICA', '03', 'NAZCA', '05', 'VISTA ALEGRE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110401', '11', 'ICA', '04', 'PALPA', '01', 'PALPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110402', '11', 'ICA', '04', 'PALPA', '02', 'LLIPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110403', '11', 'ICA', '04', 'PALPA', '03', 'RIO GRANDE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110404', '11', 'ICA', '04', 'PALPA', '04', 'SANTA CRUZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110405', '11', 'ICA', '04', 'PALPA', '05', 'TIBILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110501', '11', 'ICA', '05', 'PISCO', '01', 'PISCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110502', '11', 'ICA', '05', 'PISCO', '02', 'HUANCANO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110503', '11', 'ICA', '05', 'PISCO', '03', 'HUMAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110504', '11', 'ICA', '05', 'PISCO', '04', 'INDEPENDENCIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110505', '11', 'ICA', '05', 'PISCO', '05', 'PARACAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110506', '11', 'ICA', '05', 'PISCO', '06', 'SAN ANDRES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110507', '11', 'ICA', '05', 'PISCO', '07', 'SAN CLEMENTE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('110508', '11', 'ICA', '05', 'PISCO', '08', 'TUPAC AMARU INCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120101', '12', 'JUNIN', '01', 'HUANCAYO', '01', 'HUANCAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120104', '12', 'JUNIN', '01', 'HUANCAYO', '04', 'CARHUACALLANGA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120105', '12', 'JUNIN', '01', 'HUANCAYO', '05', 'CHACAPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120106', '12', 'JUNIN', '01', 'HUANCAYO', '06', 'CHICCHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120107', '12', 'JUNIN', '01', 'HUANCAYO', '07', 'CHILCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120108', '12', 'JUNIN', '01', 'HUANCAYO', '08', 'CHONGOS ALTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120111', '12', 'JUNIN', '01', 'HUANCAYO', '11', 'CHUPURO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120112', '12', 'JUNIN', '01', 'HUANCAYO', '12', 'COLCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120113', '12', 'JUNIN', '01', 'HUANCAYO', '13', 'CULLHUAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120114', '12', 'JUNIN', '01', 'HUANCAYO', '14', 'EL TAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120116', '12', 'JUNIN', '01', 'HUANCAYO', '16', 'HUACRAPUQUIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120117', '12', 'JUNIN', '01', 'HUANCAYO', '17', 'HUALHUAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120119', '12', 'JUNIN', '01', 'HUANCAYO', '19', 'HUANCAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120120', '12', 'JUNIN', '01', 'HUANCAYO', '20', 'HUASICANCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120121', '12', 'JUNIN', '01', 'HUANCAYO', '21', 'HUAYUCACHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120122', '12', 'JUNIN', '01', 'HUANCAYO', '22', 'INGENIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120124', '12', 'JUNIN', '01', 'HUANCAYO', '24', 'PARIAHUANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120125', '12', 'JUNIN', '01', 'HUANCAYO', '25', 'PILCOMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120126', '12', 'JUNIN', '01', 'HUANCAYO', '26', 'PUCARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120127', '12', 'JUNIN', '01', 'HUANCAYO', '27', 'QUICHUAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120128', '12', 'JUNIN', '01', 'HUANCAYO', '28', 'QUILCAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120129', '12', 'JUNIN', '01', 'HUANCAYO', '29', 'SAN AGUSTIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120130', '12', 'JUNIN', '01', 'HUANCAYO', '30', 'SAN JERONIMO DE TUNAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120132', '12', 'JUNIN', '01', 'HUANCAYO', '32', 'SAÑO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120133', '12', 'JUNIN', '01', 'HUANCAYO', '33', 'SAPALLANGA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120134', '12', 'JUNIN', '01', 'HUANCAYO', '34', 'SICAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120135', '12', 'JUNIN', '01', 'HUANCAYO', '35', 'SANTO DOMINGO DE ACOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120136', '12', 'JUNIN', '01', 'HUANCAYO', '36', 'VIQUES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120201', '12', 'JUNIN', '02', 'CONCEPCION', '01', 'CONCEPCION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120202', '12', 'JUNIN', '02', 'CONCEPCION', '02', 'ACO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120203', '12', 'JUNIN', '02', 'CONCEPCION', '03', 'ANDAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120204', '12', 'JUNIN', '02', 'CONCEPCION', '04', 'CHAMBARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120205', '12', 'JUNIN', '02', 'CONCEPCION', '05', 'COCHAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120206', '12', 'JUNIN', '02', 'CONCEPCION', '06', 'COMAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120207', '12', 'JUNIN', '02', 'CONCEPCION', '07', 'HEROINAS TOLEDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120208', '12', 'JUNIN', '02', 'CONCEPCION', '08', 'MANZANARES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120209', '12', 'JUNIN', '02', 'CONCEPCION', '09', 'MARISCAL CASTILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120210', '12', 'JUNIN', '02', 'CONCEPCION', '10', 'MATAHUASI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120211', '12', 'JUNIN', '02', 'CONCEPCION', '11', 'MITO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120212', '12', 'JUNIN', '02', 'CONCEPCION', '12', 'NUEVE DE JULIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120213', '12', 'JUNIN', '02', 'CONCEPCION', '13', 'ORCOTUNA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120214', '12', 'JUNIN', '02', 'CONCEPCION', '14', 'SAN JOSE DE QUERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120215', '12', 'JUNIN', '02', 'CONCEPCION', '15', 'SANTA ROSA DE OCOPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120301', '12', 'JUNIN', '03', 'CHANCHAMAYO', '01', 'CHANCHAMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120302', '12', 'JUNIN', '03', 'CHANCHAMAYO', '02', 'PERENE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120303', '12', 'JUNIN', '03', 'CHANCHAMAYO', '03', 'PICHANAQUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120304', '12', 'JUNIN', '03', 'CHANCHAMAYO', '04', 'SAN LUIS DE SHUARO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120305', '12', 'JUNIN', '03', 'CHANCHAMAYO', '05', 'SAN RAMON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120306', '12', 'JUNIN', '03', 'CHANCHAMAYO', '06', 'VITOC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120401', '12', 'JUNIN', '04', 'JAUJA', '01', 'JAUJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120402', '12', 'JUNIN', '04', 'JAUJA', '02', 'ACOLLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120403', '12', 'JUNIN', '04', 'JAUJA', '03', 'APATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120404', '12', 'JUNIN', '04', 'JAUJA', '04', 'ATAURA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120405', '12', 'JUNIN', '04', 'JAUJA', '05', 'CANCHAYLLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120406', '12', 'JUNIN', '04', 'JAUJA', '06', 'CURICACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120407', '12', 'JUNIN', '04', 'JAUJA', '07', 'EL MANTARO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120408', '12', 'JUNIN', '04', 'JAUJA', '08', 'HUAMALI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120409', '12', 'JUNIN', '04', 'JAUJA', '09', 'HUARIPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120410', '12', 'JUNIN', '04', 'JAUJA', '10', 'HUERTAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120411', '12', 'JUNIN', '04', 'JAUJA', '11', 'JANJAILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120412', '12', 'JUNIN', '04', 'JAUJA', '12', 'JULCAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120413', '12', 'JUNIN', '04', 'JAUJA', '13', 'LEONOR ORDOÑEZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120414', '12', 'JUNIN', '04', 'JAUJA', '14', 'LLOCLLAPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120415', '12', 'JUNIN', '04', 'JAUJA', '15', 'MARCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120416', '12', 'JUNIN', '04', 'JAUJA', '16', 'MASMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120417', '12', 'JUNIN', '04', 'JAUJA', '17', 'MASMA CHICCHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120418', '12', 'JUNIN', '04', 'JAUJA', '18', 'MOLINOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120419', '12', 'JUNIN', '04', 'JAUJA', '19', 'MONOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120420', '12', 'JUNIN', '04', 'JAUJA', '20', 'MUQUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120421', '12', 'JUNIN', '04', 'JAUJA', '21', 'MUQUIYAUYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120422', '12', 'JUNIN', '04', 'JAUJA', '22', 'PACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120423', '12', 'JUNIN', '04', 'JAUJA', '23', 'PACCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120424', '12', 'JUNIN', '04', 'JAUJA', '24', 'PANCAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120425', '12', 'JUNIN', '04', 'JAUJA', '25', 'PARCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120426', '12', 'JUNIN', '04', 'JAUJA', '26', 'POMACANCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120427', '12', 'JUNIN', '04', 'JAUJA', '27', 'RICRAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120428', '12', 'JUNIN', '04', 'JAUJA', '28', 'SAN LORENZO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120429', '12', 'JUNIN', '04', 'JAUJA', '29', 'SAN PEDRO DE CHUNAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120430', '12', 'JUNIN', '04', 'JAUJA', '30', 'SAUSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120431', '12', 'JUNIN', '04', 'JAUJA', '31', 'SINCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120432', '12', 'JUNIN', '04', 'JAUJA', '32', 'TUNAN MARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120433', '12', 'JUNIN', '04', 'JAUJA', '33', 'YAULI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120434', '12', 'JUNIN', '04', 'JAUJA', '34', 'YAUYOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120501', '12', 'JUNIN', '05', 'JUNIN', '01', 'JUNIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120502', '12', 'JUNIN', '05', 'JUNIN', '02', 'CARHUAMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120503', '12', 'JUNIN', '05', 'JUNIN', '03', 'ONDORES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120504', '12', 'JUNIN', '05', 'JUNIN', '04', 'ULCUMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120601', '12', 'JUNIN', '06', 'SATIPO', '01', 'SATIPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120602', '12', 'JUNIN', '06', 'SATIPO', '02', 'COVIRIALI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120603', '12', 'JUNIN', '06', 'SATIPO', '03', 'LLAYLLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120604', '12', 'JUNIN', '06', 'SATIPO', '04', 'MAZAMARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120605', '12', 'JUNIN', '06', 'SATIPO', '05', 'PAMPA HERMOSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120606', '12', 'JUNIN', '06', 'SATIPO', '06', 'PANGOA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120607', '12', 'JUNIN', '06', 'SATIPO', '07', 'RIO NEGRO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120608', '12', 'JUNIN', '06', 'SATIPO', '08', 'RIO TAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120699', '12', 'JUNIN', '06', 'SATIPO', '99', 'MAZAMARI-PANGOA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120701', '12', 'JUNIN', '07', 'TARMA', '01', 'TARMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120702', '12', 'JUNIN', '07', 'TARMA', '02', 'ACOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120703', '12', 'JUNIN', '07', 'TARMA', '03', 'HUARICOLCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120704', '12', 'JUNIN', '07', 'TARMA', '04', 'HUASAHUASI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120705', '12', 'JUNIN', '07', 'TARMA', '05', 'LA UNION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120706', '12', 'JUNIN', '07', 'TARMA', '06', 'PALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120707', '12', 'JUNIN', '07', 'TARMA', '07', 'PALCAMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120708', '12', 'JUNIN', '07', 'TARMA', '08', 'SAN PEDRO DE CAJAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120709', '12', 'JUNIN', '07', 'TARMA', '09', 'TAPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120801', '12', 'JUNIN', '08', 'YAULI', '01', 'LA OROYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120802', '12', 'JUNIN', '08', 'YAULI', '02', 'CHACAPALPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120803', '12', 'JUNIN', '08', 'YAULI', '03', 'HUAY-HUAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120804', '12', 'JUNIN', '08', 'YAULI', '04', 'MARCAPOMACOCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120805', '12', 'JUNIN', '08', 'YAULI', '05', 'MOROCOCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120806', '12', 'JUNIN', '08', 'YAULI', '06', 'PACCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120807', '12', 'JUNIN', '08', 'YAULI', '07', 'SANTA BARBARA DE CARHUACAYAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120808', '12', 'JUNIN', '08', 'YAULI', '08', 'SANTA ROSA DE SACCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120809', '12', 'JUNIN', '08', 'YAULI', '09', 'SUITUCANCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120810', '12', 'JUNIN', '08', 'YAULI', '10', 'YAULI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120901', '12', 'JUNIN', '09', 'CHUPACA', '01', 'CHUPACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120902', '12', 'JUNIN', '09', 'CHUPACA', '02', 'AHUAC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120903', '12', 'JUNIN', '09', 'CHUPACA', '03', 'CHONGOS BAJO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120904', '12', 'JUNIN', '09', 'CHUPACA', '04', 'HUACHAC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120905', '12', 'JUNIN', '09', 'CHUPACA', '05', 'HUAMANCACA CHICO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120906', '12', 'JUNIN', '09', 'CHUPACA', '06', 'SAN JUAN DE YSCOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120907', '12', 'JUNIN', '09', 'CHUPACA', '07', 'SAN JUAN DE JARPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120908', '12', 'JUNIN', '09', 'CHUPACA', '08', 'TRES DE DICIEMBRE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('120909', '12', 'JUNIN', '09', 'CHUPACA', '09', 'YANACANCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130000', '13', 'LA LIBERTAD', '00', 'LA LIBERTAD', '00', 'LA LIBERTAD', 'CREADO', '10');
INSERT INTO `tb_ubigeo` VALUES ('130101', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '01', 'TRUJILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130102', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '02', 'EL PORVENIR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130103', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '03', 'FLORENCIA DE MORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130104', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '04', 'HUANCHACO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130105', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '05', 'LA ESPERANZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130106', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '06', 'LAREDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130107', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '07', 'MOCHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130108', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '08', 'POROTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130109', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '09', 'SALAVERRY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130110', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '10', 'SIMBAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130111', '13', 'LA LIBERTAD', '01', 'TRUJILLO', '11', 'VICTOR LARCO HERRERA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130201', '13', 'LA LIBERTAD', '02', 'ASCOPE', '01', 'ASCOPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130202', '13', 'LA LIBERTAD', '02', 'ASCOPE', '02', 'CHICAMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130203', '13', 'LA LIBERTAD', '02', 'ASCOPE', '03', 'CHOCOPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130204', '13', 'LA LIBERTAD', '02', 'ASCOPE', '04', 'MAGDALENA DE CAO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130205', '13', 'LA LIBERTAD', '02', 'ASCOPE', '05', 'PAIJAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130206', '13', 'LA LIBERTAD', '02', 'ASCOPE', '06', 'RAZURI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130207', '13', 'LA LIBERTAD', '02', 'ASCOPE', '07', 'SANTIAGO DE CAO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130208', '13', 'LA LIBERTAD', '02', 'ASCOPE', '08', 'CASA GRANDE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130301', '13', 'LA LIBERTAD', '03', 'BOLIVAR', '01', 'BOLIVAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130302', '13', 'LA LIBERTAD', '03', 'BOLIVAR', '02', 'BAMBAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130303', '13', 'LA LIBERTAD', '03', 'BOLIVAR', '03', 'CONDORMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130304', '13', 'LA LIBERTAD', '03', 'BOLIVAR', '04', 'LONGOTEA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130305', '13', 'LA LIBERTAD', '03', 'BOLIVAR', '05', 'UCHUMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130306', '13', 'LA LIBERTAD', '03', 'BOLIVAR', '06', 'UCUNCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130401', '13', 'LA LIBERTAD', '04', 'CHEPEN', '01', 'CHEPEN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130402', '13', 'LA LIBERTAD', '04', 'CHEPEN', '02', 'PACANGA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130403', '13', 'LA LIBERTAD', '04', 'CHEPEN', '03', 'PUEBLO NUEVO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130501', '13', 'LA LIBERTAD', '05', 'JULCAN', '01', 'JULCAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130502', '13', 'LA LIBERTAD', '05', 'JULCAN', '02', 'CALAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130503', '13', 'LA LIBERTAD', '05', 'JULCAN', '03', 'CARABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130504', '13', 'LA LIBERTAD', '05', 'JULCAN', '04', 'HUASO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130601', '13', 'LA LIBERTAD', '06', 'OTUZCO', '01', 'OTUZCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130602', '13', 'LA LIBERTAD', '06', 'OTUZCO', '02', 'AGALLPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130604', '13', 'LA LIBERTAD', '06', 'OTUZCO', '04', 'CHARAT', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130605', '13', 'LA LIBERTAD', '06', 'OTUZCO', '05', 'HUARANCHAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130606', '13', 'LA LIBERTAD', '06', 'OTUZCO', '06', 'LA CUESTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130608', '13', 'LA LIBERTAD', '06', 'OTUZCO', '08', 'MACHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130610', '13', 'LA LIBERTAD', '06', 'OTUZCO', '10', 'PARANDAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130611', '13', 'LA LIBERTAD', '06', 'OTUZCO', '11', 'SALPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130613', '13', 'LA LIBERTAD', '06', 'OTUZCO', '13', 'SINSICAP', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130614', '13', 'LA LIBERTAD', '06', 'OTUZCO', '14', 'USQUIL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130701', '13', 'LA LIBERTAD', '07', 'PACASMAYO', '01', 'SAN PEDRO DE LLOC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130702', '13', 'LA LIBERTAD', '07', 'PACASMAYO', '02', 'GUADALUPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130703', '13', 'LA LIBERTAD', '07', 'PACASMAYO', '03', 'JEQUETEPEQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130704', '13', 'LA LIBERTAD', '07', 'PACASMAYO', '04', 'PACASMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130705', '13', 'LA LIBERTAD', '07', 'PACASMAYO', '05', 'SAN JOSE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130801', '13', 'LA LIBERTAD', '08', 'PATAZ', '01', 'TAYABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130802', '13', 'LA LIBERTAD', '08', 'PATAZ', '02', 'BULDIBUYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130803', '13', 'LA LIBERTAD', '08', 'PATAZ', '03', 'CHILLIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130804', '13', 'LA LIBERTAD', '08', 'PATAZ', '04', 'HUANCASPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130805', '13', 'LA LIBERTAD', '08', 'PATAZ', '05', 'HUAYLILLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130806', '13', 'LA LIBERTAD', '08', 'PATAZ', '06', 'HUAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130807', '13', 'LA LIBERTAD', '08', 'PATAZ', '07', 'ONGON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130808', '13', 'LA LIBERTAD', '08', 'PATAZ', '08', 'PARCOY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130809', '13', 'LA LIBERTAD', '08', 'PATAZ', '09', 'PATAZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130810', '13', 'LA LIBERTAD', '08', 'PATAZ', '10', 'PIAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130811', '13', 'LA LIBERTAD', '08', 'PATAZ', '11', 'SANTIAGO DE CHALLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130812', '13', 'LA LIBERTAD', '08', 'PATAZ', '12', 'TAURIJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130813', '13', 'LA LIBERTAD', '08', 'PATAZ', '13', 'URPAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130901', '13', 'LA LIBERTAD', '09', 'SANCHEZ CARRION', '01', 'HUAMACHUCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130902', '13', 'LA LIBERTAD', '09', 'SANCHEZ CARRION', '02', 'CHUGAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130903', '13', 'LA LIBERTAD', '09', 'SANCHEZ CARRION', '03', 'COCHORCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130904', '13', 'LA LIBERTAD', '09', 'SANCHEZ CARRION', '04', 'CURGOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130905', '13', 'LA LIBERTAD', '09', 'SANCHEZ CARRION', '05', 'MARCABAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130906', '13', 'LA LIBERTAD', '09', 'SANCHEZ CARRION', '06', 'SANAGORAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130907', '13', 'LA LIBERTAD', '09', 'SANCHEZ CARRION', '07', 'SARIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('130908', '13', 'LA LIBERTAD', '09', 'SANCHEZ CARRION', '08', 'SARTIMBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131001', '13', 'LA LIBERTAD', '10', 'SANTIAGO DE CHUCO', '01', 'SANTIAGO DE CHUCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131002', '13', 'LA LIBERTAD', '10', 'SANTIAGO DE CHUCO', '02', 'ANGASMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131003', '13', 'LA LIBERTAD', '10', 'SANTIAGO DE CHUCO', '03', 'CACHICADAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131004', '13', 'LA LIBERTAD', '10', 'SANTIAGO DE CHUCO', '04', 'MOLLEBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131005', '13', 'LA LIBERTAD', '10', 'SANTIAGO DE CHUCO', '05', 'MOLLEPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131006', '13', 'LA LIBERTAD', '10', 'SANTIAGO DE CHUCO', '06', 'QUIRUVILCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131007', '13', 'LA LIBERTAD', '10', 'SANTIAGO DE CHUCO', '07', 'SANTA CRUZ DE CHUCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131008', '13', 'LA LIBERTAD', '10', 'SANTIAGO DE CHUCO', '08', 'SITABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131101', '13', 'LA LIBERTAD', '11', 'GRAN CHIMU', '01', 'CASCAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131102', '13', 'LA LIBERTAD', '11', 'GRAN CHIMU', '02', 'LUCMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131103', '13', 'LA LIBERTAD', '11', 'GRAN CHIMU', '03', 'COMPIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131104', '13', 'LA LIBERTAD', '11', 'GRAN CHIMU', '04', 'SAYAPULLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131201', '13', 'LA LIBERTAD', '12', 'VIRU', '01', 'VIRU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131202', '13', 'LA LIBERTAD', '12', 'VIRU', '02', 'CHAO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('131203', '13', 'LA LIBERTAD', '12', 'VIRU', '03', 'GUADALUPITO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140101', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '01', 'CHICLAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140102', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '02', 'CHONGOYAPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140103', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '03', 'ETEN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140104', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '04', 'ETEN PUERTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140105', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '05', 'JOSE LEONARDO ORTIZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140106', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '06', 'LA VICTORIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140107', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '07', 'LAGUNAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140108', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '08', 'MONSEFU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140109', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '09', 'NUEVA ARICA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140110', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '10', 'OYOTUN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140111', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '11', 'PICSI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140112', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '12', 'PIMENTEL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140113', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '13', 'REQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140114', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '14', 'SANTA ROSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140115', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '15', 'SAÑA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140116', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '16', 'CAYALTI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140117', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '17', 'PATAPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140118', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '18', 'POMALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140119', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '19', 'PUCALA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140120', '14', 'LAMBAYEQUE', '01', 'CHICLAYO', '20', 'TUMAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140201', '14', 'LAMBAYEQUE', '02', 'FERREÑAFE', '01', 'FERREÑAFE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140202', '14', 'LAMBAYEQUE', '02', 'FERREÑAFE', '02', 'CAÑARIS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140203', '14', 'LAMBAYEQUE', '02', 'FERREÑAFE', '03', 'INCAHUASI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140204', '14', 'LAMBAYEQUE', '02', 'FERREÑAFE', '04', 'MANUEL ANTONIO MESONES MURO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140205', '14', 'LAMBAYEQUE', '02', 'FERREÑAFE', '05', 'PITIPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140206', '14', 'LAMBAYEQUE', '02', 'FERREÑAFE', '06', 'PUEBLO NUEVO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140301', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '01', 'LAMBAYEQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140302', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '02', 'CHOCHOPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140303', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '03', 'ILLIMO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140304', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '04', 'JAYANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140305', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '05', 'MOCHUMI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140306', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '06', 'MORROPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140307', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '07', 'MOTUPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140308', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '08', 'OLMOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140309', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '09', 'PACORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140310', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '10', 'SALAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140311', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '11', 'SAN JOSE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('140312', '14', 'LAMBAYEQUE', '03', 'LAMBAYEQUE', '12', 'TUCUME', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('150101', '15', 'LIMA', '01', 'LIMA', '01', 'LIMA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150102', '15', 'LIMA', '01', 'LIMA', '02', 'ANCON', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150103', '15', 'LIMA', '01', 'LIMA', '03', 'ATE', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150104', '15', 'LIMA', '01', 'LIMA', '04', 'BARRANCO', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150105', '15', 'LIMA', '01', 'LIMA', '05', 'BREÑA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150106', '15', 'LIMA', '01', 'LIMA', '06', 'CARABAYLLO', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150107', '15', 'LIMA', '01', 'LIMA', '07', 'CHACLACAYO', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150108', '15', 'LIMA', '01', 'LIMA', '08', 'CHORRILLOS', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150109', '15', 'LIMA', '01', 'LIMA', '09', 'CIENEGUILLA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150110', '15', 'LIMA', '01', 'LIMA', '10', 'COMAS', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150111', '15', 'LIMA', '01', 'LIMA', '11', 'EL AGUSTINO', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150112', '15', 'LIMA', '01', 'LIMA', '12', 'INDEPENDENCIA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150113', '15', 'LIMA', '01', 'LIMA', '13', 'JESUS MARIA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150114', '15', 'LIMA', '01', 'LIMA', '14', 'LA MOLINA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150115', '15', 'LIMA', '01', 'LIMA', '15', 'LA VICTORIA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150116', '15', 'LIMA', '01', 'LIMA', '16', 'LINCE', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150117', '15', 'LIMA', '01', 'LIMA', '17', 'LOS OLIVOS', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150118', '15', 'LIMA', '01', 'LIMA', '18', 'LURIGANCHO (CHOSICA)', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150119', '15', 'LIMA', '01', 'LIMA', '19', 'LURIN', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150120', '15', 'LIMA', '01', 'LIMA', '20', 'MAGDALENA DEL MAR', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150121', '15', 'LIMA', '01', 'LIMA', '21', 'PUEBLO LIBRE', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150122', '15', 'LIMA', '01', 'LIMA', '22', 'MIRAFLORES', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150123', '15', 'LIMA', '01', 'LIMA', '23', 'PACHACAMAC', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150124', '15', 'LIMA', '01', 'LIMA', '24', 'PUCUSANA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150125', '15', 'LIMA', '01', 'LIMA', '25', 'PUENTE PIEDRA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150126', '15', 'LIMA', '01', 'LIMA', '26', 'PUNTA HERMOSA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150127', '15', 'LIMA', '01', 'LIMA', '27', 'PUNTA NEGRA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150128', '15', 'LIMA', '01', 'LIMA', '28', 'RIMAC', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150129', '15', 'LIMA', '01', 'LIMA', '29', 'SAN BARTOLO', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150130', '15', 'LIMA', '01', 'LIMA', '30', 'SAN BORJA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150131', '15', 'LIMA', '01', 'LIMA', '31', 'SAN ISIDRO', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150132', '15', 'LIMA', '01', 'LIMA', '32', 'SAN JUAN DE LURIGANCHO', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150133', '15', 'LIMA', '01', 'LIMA', '33', 'SAN JUAN DE MIRAFLORES', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150134', '15', 'LIMA', '01', 'LIMA', '34', 'SAN LUIS', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150135', '15', 'LIMA', '01', 'LIMA', '35', 'SAN MARTIN DE PORRES', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150136', '15', 'LIMA', '01', 'LIMA', '36', 'SAN MIGUEL', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150137', '15', 'LIMA', '01', 'LIMA', '37', 'SANTA ANITA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150138', '15', 'LIMA', '01', 'LIMA', '38', 'SANTA MARIA DEL MAR', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150139', '15', 'LIMA', '01', 'LIMA', '39', 'SANTA ROSA', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150140', '15', 'LIMA', '01', 'LIMA', '40', 'SANTIAGO DE SURCO', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150141', '15', 'LIMA', '01', 'LIMA', '41', 'SURQUILLO', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150142', '15', 'LIMA', '01', 'LIMA', '42', 'VILLA EL SALVADOR', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150143', '15', 'LIMA', '01', 'LIMA', '43', 'VILLA MARIA DEL TRIUNFO', '', '1');
INSERT INTO `tb_ubigeo` VALUES ('150201', '15', 'LIMA', '02', 'BARRANCA', '01', 'BARRANCA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150202', '15', 'LIMA', '02', 'BARRANCA', '02', 'PARAMONGA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150203', '15', 'LIMA', '02', 'BARRANCA', '03', 'PATIVILCA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150204', '15', 'LIMA', '02', 'BARRANCA', '04', 'SUPE', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150205', '15', 'LIMA', '02', 'BARRANCA', '05', 'SUPE PUERTO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150301', '15', 'LIMA', '03', 'CAJATAMBO', '01', 'CAJATAMBO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150302', '15', 'LIMA', '03', 'CAJATAMBO', '02', 'COPA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150303', '15', 'LIMA', '03', 'CAJATAMBO', '03', 'GORGOR', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150304', '15', 'LIMA', '03', 'CAJATAMBO', '04', 'HUANCAPON', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150305', '15', 'LIMA', '03', 'CAJATAMBO', '05', 'MANAS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150401', '15', 'LIMA', '04', 'CANTA', '01', 'CANTA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150402', '15', 'LIMA', '04', 'CANTA', '02', 'ARAHUAY', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150403', '15', 'LIMA', '04', 'CANTA', '03', 'HUAMANTANGA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150404', '15', 'LIMA', '04', 'CANTA', '04', 'HUAROS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150405', '15', 'LIMA', '04', 'CANTA', '05', 'LACHAQUI', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150406', '15', 'LIMA', '04', 'CANTA', '06', 'SAN BUENAVENTURA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150407', '15', 'LIMA', '04', 'CANTA', '07', 'SANTA ROSA DE QUIVES', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150501', '15', 'LIMA', '05', 'CAÑETE', '01', 'SAN VICENTE DE CAÑETE', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150502', '15', 'LIMA', '05', 'CAÑETE', '02', 'ASIA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150503', '15', 'LIMA', '05', 'CAÑETE', '03', 'CALANGO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150504', '15', 'LIMA', '05', 'CAÑETE', '04', 'CERRO AZUL', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150505', '15', 'LIMA', '05', 'CAÑETE', '05', 'CHILCA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150506', '15', 'LIMA', '05', 'CAÑETE', '06', 'COAYLLO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150507', '15', 'LIMA', '05', 'CAÑETE', '07', 'IMPERIAL', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150508', '15', 'LIMA', '05', 'CAÑETE', '08', 'LUNAHUANA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150509', '15', 'LIMA', '05', 'CAÑETE', '09', 'MALA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150510', '15', 'LIMA', '05', 'CAÑETE', '10', 'NUEVO IMPERIAL', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150511', '15', 'LIMA', '05', 'CAÑETE', '11', 'PACARAN', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150512', '15', 'LIMA', '05', 'CAÑETE', '12', 'QUILMANA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150513', '15', 'LIMA', '05', 'CAÑETE', '13', 'SAN ANTONIO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150514', '15', 'LIMA', '05', 'CAÑETE', '14', 'SAN LUIS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150515', '15', 'LIMA', '05', 'CAÑETE', '15', 'SANTA CRUZ DE FLORES', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150516', '15', 'LIMA', '05', 'CAÑETE', '16', 'ZUÑIGA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150601', '15', 'LIMA', '06', 'HUARAL', '01', 'HUARAL', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150602', '15', 'LIMA', '06', 'HUARAL', '02', 'ATAVILLOS ALTO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150603', '15', 'LIMA', '06', 'HUARAL', '03', 'ATAVILLOS BAJO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150604', '15', 'LIMA', '06', 'HUARAL', '04', 'AUCALLAMA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150605', '15', 'LIMA', '06', 'HUARAL', '05', 'CHANCAY', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150606', '15', 'LIMA', '06', 'HUARAL', '06', 'IHUARI', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150607', '15', 'LIMA', '06', 'HUARAL', '07', 'LAMPIAN', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150608', '15', 'LIMA', '06', 'HUARAL', '08', 'PACARAOS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150609', '15', 'LIMA', '06', 'HUARAL', '09', 'SAN MIGUEL DE ACOS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150610', '15', 'LIMA', '06', 'HUARAL', '10', 'SANTA CRUZ DE ANDAMARCA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150611', '15', 'LIMA', '06', 'HUARAL', '11', 'SUMBILCA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150612', '15', 'LIMA', '06', 'HUARAL', '12', 'VEINTISIETE DE NOVIEMBRE', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150701', '15', 'LIMA', '07', 'HUAROCHIRI', '01', 'MATUCANA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150702', '15', 'LIMA', '07', 'HUAROCHIRI', '02', 'ANTIOQUIA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150703', '15', 'LIMA', '07', 'HUAROCHIRI', '03', 'CALLAHUANCA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150704', '15', 'LIMA', '07', 'HUAROCHIRI', '04', 'CARAMPOMA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150705', '15', 'LIMA', '07', 'HUAROCHIRI', '05', 'CHICLA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150706', '15', 'LIMA', '07', 'HUAROCHIRI', '06', 'CUENCA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150707', '15', 'LIMA', '07', 'HUAROCHIRI', '07', 'HUACHUPAMPA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150708', '15', 'LIMA', '07', 'HUAROCHIRI', '08', 'HUANZA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150709', '15', 'LIMA', '07', 'HUAROCHIRI', '09', 'HUAROCHIRI', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150710', '15', 'LIMA', '07', 'HUAROCHIRI', '10', 'LAHUAYTAMBO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150711', '15', 'LIMA', '07', 'HUAROCHIRI', '11', 'LANGA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150712', '15', 'LIMA', '07', 'HUAROCHIRI', '12', 'LARAOS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150713', '15', 'LIMA', '07', 'HUAROCHIRI', '13', 'MARIATANA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150714', '15', 'LIMA', '07', 'HUAROCHIRI', '14', 'RICARDO PALMA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150715', '15', 'LIMA', '07', 'HUAROCHIRI', '15', 'SAN ANDRES DE TUPICOCHA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150716', '15', 'LIMA', '07', 'HUAROCHIRI', '16', 'SAN ANTONIO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150717', '15', 'LIMA', '07', 'HUAROCHIRI', '17', 'SAN BARTOLOME', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150718', '15', 'LIMA', '07', 'HUAROCHIRI', '18', 'SAN DAMIAN', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150719', '15', 'LIMA', '07', 'HUAROCHIRI', '19', 'SAN JUAN DE IRIS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150720', '15', 'LIMA', '07', 'HUAROCHIRI', '20', 'SAN JUAN DE TANTARANCHE', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150721', '15', 'LIMA', '07', 'HUAROCHIRI', '21', 'SAN LORENZO DE QUINTI', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150722', '15', 'LIMA', '07', 'HUAROCHIRI', '22', 'SAN MATEO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150723', '15', 'LIMA', '07', 'HUAROCHIRI', '23', 'SAN MATEO DE OTAO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150724', '15', 'LIMA', '07', 'HUAROCHIRI', '24', 'SAN PEDRO DE CASTA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150725', '15', 'LIMA', '07', 'HUAROCHIRI', '25', 'SAN PEDRO DE HUANCAYRE', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150726', '15', 'LIMA', '07', 'HUAROCHIRI', '26', 'SANGALLAYA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150727', '15', 'LIMA', '07', 'HUAROCHIRI', '27', 'SANTA CRUZ DE COCACHACRA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150728', '15', 'LIMA', '07', 'HUAROCHIRI', '28', 'SANTA EULALIA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150729', '15', 'LIMA', '07', 'HUAROCHIRI', '29', 'SANTIAGO DE ANCHUCAYA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150730', '15', 'LIMA', '07', 'HUAROCHIRI', '30', 'SANTIAGO DE TUNA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150731', '15', 'LIMA', '07', 'HUAROCHIRI', '31', 'SANTO DOMINGO DE LOS OLLEROS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150732', '15', 'LIMA', '07', 'HUAROCHIRI', '32', 'SURCO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150801', '15', 'LIMA', '08', 'HUAURA', '01', 'HUACHO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150802', '15', 'LIMA', '08', 'HUAURA', '02', 'AMBAR', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150803', '15', 'LIMA', '08', 'HUAURA', '03', 'CALETA DE CARQUIN', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150804', '15', 'LIMA', '08', 'HUAURA', '04', 'CHECRAS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150805', '15', 'LIMA', '08', 'HUAURA', '05', 'HUALMAY', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150806', '15', 'LIMA', '08', 'HUAURA', '06', 'HUAURA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150807', '15', 'LIMA', '08', 'HUAURA', '07', 'LEONCIO PRADO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150808', '15', 'LIMA', '08', 'HUAURA', '08', 'PACCHO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150809', '15', 'LIMA', '08', 'HUAURA', '09', 'SANTA LEONOR', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150810', '15', 'LIMA', '08', 'HUAURA', '10', 'SANTA MARIA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150811', '15', 'LIMA', '08', 'HUAURA', '11', 'SAYAN', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150812', '15', 'LIMA', '08', 'HUAURA', '12', 'VEGUETA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150901', '15', 'LIMA', '09', 'OYON', '01', 'OYON', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150902', '15', 'LIMA', '09', 'OYON', '02', 'ANDAJES', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150903', '15', 'LIMA', '09', 'OYON', '03', 'CAUJUL', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150904', '15', 'LIMA', '09', 'OYON', '04', 'COCHAMARCA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150905', '15', 'LIMA', '09', 'OYON', '05', 'NAVAN', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('150906', '15', 'LIMA', '09', 'OYON', '06', 'PACHANGARA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151001', '15', 'LIMA', '10', 'YAUYOS', '01', 'YAUYOS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151002', '15', 'LIMA', '10', 'YAUYOS', '02', 'ALIS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151003', '15', 'LIMA', '10', 'YAUYOS', '03', 'AYAUCA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151004', '15', 'LIMA', '10', 'YAUYOS', '04', 'AYAVIRI', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151005', '15', 'LIMA', '10', 'YAUYOS', '05', 'AZANGARO', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151006', '15', 'LIMA', '10', 'YAUYOS', '06', 'CACRA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151007', '15', 'LIMA', '10', 'YAUYOS', '07', 'CARANIA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151008', '15', 'LIMA', '10', 'YAUYOS', '08', 'CATAHUASI', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151009', '15', 'LIMA', '10', 'YAUYOS', '09', 'CHOCOS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151010', '15', 'LIMA', '10', 'YAUYOS', '10', 'COCHAS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151011', '15', 'LIMA', '10', 'YAUYOS', '11', 'COLONIA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151012', '15', 'LIMA', '10', 'YAUYOS', '12', 'HONGOS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151013', '15', 'LIMA', '10', 'YAUYOS', '13', 'HUAMPARA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151014', '15', 'LIMA', '10', 'YAUYOS', '14', 'HUANCAYA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151015', '15', 'LIMA', '10', 'YAUYOS', '15', 'HUANGASCAR', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151016', '15', 'LIMA', '10', 'YAUYOS', '16', 'HUANTAN', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151017', '15', 'LIMA', '10', 'YAUYOS', '17', 'HUAÑEC', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151018', '15', 'LIMA', '10', 'YAUYOS', '18', 'LARAOS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151019', '15', 'LIMA', '10', 'YAUYOS', '19', 'LINCHA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151020', '15', 'LIMA', '10', 'YAUYOS', '20', 'MADEAN', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151021', '15', 'LIMA', '10', 'YAUYOS', '21', 'MIRAFLORES', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151022', '15', 'LIMA', '10', 'YAUYOS', '22', 'OMAS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151023', '15', 'LIMA', '10', 'YAUYOS', '23', 'PUTINZA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151024', '15', 'LIMA', '10', 'YAUYOS', '24', 'QUINCHES', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151025', '15', 'LIMA', '10', 'YAUYOS', '25', 'QUINOCAY', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151026', '15', 'LIMA', '10', 'YAUYOS', '26', 'SAN JOAQUIN', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151027', '15', 'LIMA', '10', 'YAUYOS', '27', 'SAN PEDRO DE PILAS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151028', '15', 'LIMA', '10', 'YAUYOS', '28', 'TANTA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151029', '15', 'LIMA', '10', 'YAUYOS', '29', 'TAURIPAMPA', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151030', '15', 'LIMA', '10', 'YAUYOS', '30', 'TOMAS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151031', '15', 'LIMA', '10', 'YAUYOS', '31', 'TUPE', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151032', '15', 'LIMA', '10', 'YAUYOS', '32', 'VIÑAC', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('151033', '15', 'LIMA', '10', 'YAUYOS', '33', 'VITIS', '', '3');
INSERT INTO `tb_ubigeo` VALUES ('160101', '16', 'LORETO', '01', 'MAYNAS', '01', 'IQUITOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160102', '16', 'LORETO', '01', 'MAYNAS', '02', 'ALTO NANAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160103', '16', 'LORETO', '01', 'MAYNAS', '03', 'FERNANDO LORES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160104', '16', 'LORETO', '01', 'MAYNAS', '04', 'INDIANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160105', '16', 'LORETO', '01', 'MAYNAS', '05', 'LAS AMAZONAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160106', '16', 'LORETO', '01', 'MAYNAS', '06', 'MAZAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160107', '16', 'LORETO', '01', 'MAYNAS', '07', 'NAPO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160108', '16', 'LORETO', '01', 'MAYNAS', '08', 'PUNCHANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160109', '16', 'LORETO', '01', 'MAYNAS', '09', 'PUTUMAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160110', '16', 'LORETO', '01', 'MAYNAS', '10', 'TORRES CAUSANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160112', '16', 'LORETO', '01', 'MAYNAS', '12', 'BELEN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160113', '16', 'LORETO', '01', 'MAYNAS', '13', 'SAN JUAN BAUTISTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160114', '16', 'LORETO', '01', 'MAYNAS', '14', 'TENIENTE MANUEL CLAVERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160201', '16', 'LORETO', '02', 'ALTO AMAZONAS', '01', 'YURIMAGUAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160202', '16', 'LORETO', '02', 'ALTO AMAZONAS', '02', 'BALSAPUERTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160205', '16', 'LORETO', '02', 'ALTO AMAZONAS', '05', 'JEBEROS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160206', '16', 'LORETO', '02', 'ALTO AMAZONAS', '06', 'LAGUNAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160210', '16', 'LORETO', '02', 'ALTO AMAZONAS', '10', 'SANTA CRUZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160211', '16', 'LORETO', '02', 'ALTO AMAZONAS', '11', 'TENIENTE CESAR LOPEZ ROJAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160301', '16', 'LORETO', '03', 'LORETO', '01', 'NAUTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160302', '16', 'LORETO', '03', 'LORETO', '02', 'PARINARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160303', '16', 'LORETO', '03', 'LORETO', '03', 'TIGRE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160304', '16', 'LORETO', '03', 'LORETO', '04', 'TROMPETEROS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160305', '16', 'LORETO', '03', 'LORETO', '05', 'URARINAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160401', '16', 'LORETO', '04', 'MARISCAL RAMON CASTILLA', '01', 'RAMON CASTILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160402', '16', 'LORETO', '04', 'MARISCAL RAMON CASTILLA', '02', 'PEBAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160403', '16', 'LORETO', '04', 'MARISCAL RAMON CASTILLA', '03', 'YAVARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160404', '16', 'LORETO', '04', 'MARISCAL RAMON CASTILLA', '04', 'SAN PABLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160501', '16', 'LORETO', '05', 'REQUENA', '01', 'REQUENA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160502', '16', 'LORETO', '05', 'REQUENA', '02', 'ALTO TAPICHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160503', '16', 'LORETO', '05', 'REQUENA', '03', 'CAPELO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160504', '16', 'LORETO', '05', 'REQUENA', '04', 'EMILIO SAN MARTIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160505', '16', 'LORETO', '05', 'REQUENA', '05', 'MAQUIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160506', '16', 'LORETO', '05', 'REQUENA', '06', 'PUINAHUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160507', '16', 'LORETO', '05', 'REQUENA', '07', 'SAQUENA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160508', '16', 'LORETO', '05', 'REQUENA', '08', 'SOPLIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160509', '16', 'LORETO', '05', 'REQUENA', '09', 'TAPICHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160510', '16', 'LORETO', '05', 'REQUENA', '10', 'JENARO HERRERA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160511', '16', 'LORETO', '05', 'REQUENA', '11', 'YAQUERANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160601', '16', 'LORETO', '06', 'UCAYALI', '01', 'CONTAMANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160602', '16', 'LORETO', '06', 'UCAYALI', '02', 'INAHUAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160603', '16', 'LORETO', '06', 'UCAYALI', '03', 'PADRE MARQUEZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160604', '16', 'LORETO', '06', 'UCAYALI', '04', 'PAMPA HERMOSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160605', '16', 'LORETO', '06', 'UCAYALI', '05', 'SARAYACU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160606', '16', 'LORETO', '06', 'UCAYALI', '06', 'VARGAS GUERRA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160701', '16', 'LORETO', '07', 'DATEM DEL MARAÑON', '01', 'BARRANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160702', '16', 'LORETO', '07', 'DATEM DEL MARAÑON', '02', 'CAHUAPANAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160703', '16', 'LORETO', '07', 'DATEM DEL MARAÑON', '03', 'MANSERICHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160704', '16', 'LORETO', '07', 'DATEM DEL MARAÑON', '04', 'MORONA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160705', '16', 'LORETO', '07', 'DATEM DEL MARAÑON', '05', 'PASTAZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('160706', '16', 'LORETO', '07', 'DATEM DEL MARAÑON', '06', 'ANDOAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170101', '17', 'MADRE DE DIOS', '01', 'TAMBOPATA', '01', 'TAMBOPATA (PUERTO MALDONADO)', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170102', '17', 'MADRE DE DIOS', '01', 'TAMBOPATA', '02', 'INAMBARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170103', '17', 'MADRE DE DIOS', '01', 'TAMBOPATA', '03', 'LAS PIEDRAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170104', '17', 'MADRE DE DIOS', '01', 'TAMBOPATA', '04', 'LABERINTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170201', '17', 'MADRE DE DIOS', '02', 'MANU', '01', 'MANU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170202', '17', 'MADRE DE DIOS', '02', 'MANU', '02', 'FITZCARRALD', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170203', '17', 'MADRE DE DIOS', '02', 'MANU', '03', 'MADRE DE DIOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170204', '17', 'MADRE DE DIOS', '02', 'MANU', '04', 'HUEPETUHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170301', '17', 'MADRE DE DIOS', '03', 'TAHUAMANU', '01', 'IÑAPARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170302', '17', 'MADRE DE DIOS', '03', 'TAHUAMANU', '02', 'IBERIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('170303', '17', 'MADRE DE DIOS', '03', 'TAHUAMANU', '03', 'TAHUAMANU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180101', '18', 'MOQUEGUA', '01', 'MARISCAL NIETO', '01', 'MOQUEGUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180102', '18', 'MOQUEGUA', '01', 'MARISCAL NIETO', '02', 'CARUMAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180103', '18', 'MOQUEGUA', '01', 'MARISCAL NIETO', '03', 'CUCHUMBAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180104', '18', 'MOQUEGUA', '01', 'MARISCAL NIETO', '04', 'SAMEGUA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180105', '18', 'MOQUEGUA', '01', 'MARISCAL NIETO', '05', 'SAN CRISTOBAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180106', '18', 'MOQUEGUA', '01', 'MARISCAL NIETO', '06', 'TORATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180201', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '01', 'OMATE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180202', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '02', 'CHOJATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180203', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '03', 'COALAQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180204', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '04', 'ICHUÑA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180205', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '05', 'LA CAPILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180206', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '06', 'LLOQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180207', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '07', 'MATALAQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180208', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '08', 'PUQUINA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180209', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '09', 'QUINISTAQUILLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180210', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '10', 'UBINAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180211', '18', 'MOQUEGUA', '02', 'GENERAL SANCHEZ CERRO', '11', 'YUNGA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180301', '18', 'MOQUEGUA', '03', 'ILO', '01', 'ILO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180302', '18', 'MOQUEGUA', '03', 'ILO', '02', 'EL ALGARROBAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('180303', '18', 'MOQUEGUA', '03', 'ILO', '03', 'PACOCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190101', '19', 'PASCO', '01', 'PASCO', '01', 'CHAUPIMARCA (CERRO DE PASCO)', 'MODIFICADO', '10');
INSERT INTO `tb_ubigeo` VALUES ('190102', '19', 'PASCO', '01', 'PASCO', '02', 'HUACHON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190103', '19', 'PASCO', '01', 'PASCO', '03', 'HUARIACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190104', '19', 'PASCO', '01', 'PASCO', '04', 'HUAYLLAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190105', '19', 'PASCO', '01', 'PASCO', '05', 'NINACACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190106', '19', 'PASCO', '01', 'PASCO', '06', 'PALLANCHACRA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190107', '19', 'PASCO', '01', 'PASCO', '07', 'PAUCARTAMBO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190108', '19', 'PASCO', '01', 'PASCO', '08', 'SAN FRANCISCO DE ASIS DE YARUSYACAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190109', '19', 'PASCO', '01', 'PASCO', '09', 'SIMON BOLIVAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190110', '19', 'PASCO', '01', 'PASCO', '10', 'TICLACAYAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190111', '19', 'PASCO', '01', 'PASCO', '11', 'TINYAHUARCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190112', '19', 'PASCO', '01', 'PASCO', '12', 'VICCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190113', '19', 'PASCO', '01', 'PASCO', '13', 'YANACANCHA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190201', '19', 'PASCO', '02', 'DANIEL ALCIDES CARRION', '01', 'YANAHUANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190202', '19', 'PASCO', '02', 'DANIEL ALCIDES CARRION', '02', 'CHACAYAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190203', '19', 'PASCO', '02', 'DANIEL ALCIDES CARRION', '03', 'GOYLLARISQUIZGA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190204', '19', 'PASCO', '02', 'DANIEL ALCIDES CARRION', '04', 'PAUCAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190205', '19', 'PASCO', '02', 'DANIEL ALCIDES CARRION', '05', 'SAN PEDRO DE PILLAO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190206', '19', 'PASCO', '02', 'DANIEL ALCIDES CARRION', '06', 'SANTA ANA DE TUSI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190207', '19', 'PASCO', '02', 'DANIEL ALCIDES CARRION', '07', 'TAPUC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190208', '19', 'PASCO', '02', 'DANIEL ALCIDES CARRION', '08', 'VILCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190301', '19', 'PASCO', '03', 'OXAPAMPA', '01', 'OXAPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190302', '19', 'PASCO', '03', 'OXAPAMPA', '02', 'CHONTABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190303', '19', 'PASCO', '03', 'OXAPAMPA', '03', 'HUANCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190304', '19', 'PASCO', '03', 'OXAPAMPA', '04', 'PALCAZU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190305', '19', 'PASCO', '03', 'OXAPAMPA', '05', 'POZUZO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190306', '19', 'PASCO', '03', 'OXAPAMPA', '06', 'PUERTO BERMUDEZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('190307', '19', 'PASCO', '03', 'OXAPAMPA', '07', 'VILLA RICA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200101', '20', 'PIURA', '01', 'PIURA', '01', 'PIURA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200104', '20', 'PIURA', '01', 'PIURA', '04', 'CASTILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200105', '20', 'PIURA', '01', 'PIURA', '05', 'CATACAOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200107', '20', 'PIURA', '01', 'PIURA', '07', 'CURA MORI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200108', '20', 'PIURA', '01', 'PIURA', '08', 'EL TALLAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200109', '20', 'PIURA', '01', 'PIURA', '09', 'LA ARENA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200110', '20', 'PIURA', '01', 'PIURA', '10', 'LA UNION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200111', '20', 'PIURA', '01', 'PIURA', '11', 'LAS LOMAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200114', '20', 'PIURA', '01', 'PIURA', '14', 'TAMBO GRANDE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200201', '20', 'PIURA', '02', 'AYABACA', '01', 'AYABACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200202', '20', 'PIURA', '02', 'AYABACA', '02', 'FRIAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200203', '20', 'PIURA', '02', 'AYABACA', '03', 'JILILI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200204', '20', 'PIURA', '02', 'AYABACA', '04', 'LAGUNAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200205', '20', 'PIURA', '02', 'AYABACA', '05', 'MONTERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200206', '20', 'PIURA', '02', 'AYABACA', '06', 'PACAIPAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200207', '20', 'PIURA', '02', 'AYABACA', '07', 'PAIMAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200208', '20', 'PIURA', '02', 'AYABACA', '08', 'SAPILLICA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200209', '20', 'PIURA', '02', 'AYABACA', '09', 'SICCHEZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200210', '20', 'PIURA', '02', 'AYABACA', '10', 'SUYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200301', '20', 'PIURA', '03', 'HUANCABAMBA', '01', 'HUANCABAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200302', '20', 'PIURA', '03', 'HUANCABAMBA', '02', 'CANCHAQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200303', '20', 'PIURA', '03', 'HUANCABAMBA', '03', 'EL CARMEN DE LA FRONTERA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200304', '20', 'PIURA', '03', 'HUANCABAMBA', '04', 'HUARMACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200305', '20', 'PIURA', '03', 'HUANCABAMBA', '05', 'LALAQUIZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200306', '20', 'PIURA', '03', 'HUANCABAMBA', '06', 'SAN MIGUEL DE EL FAIQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200307', '20', 'PIURA', '03', 'HUANCABAMBA', '07', 'SONDOR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200308', '20', 'PIURA', '03', 'HUANCABAMBA', '08', 'SONDORILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200401', '20', 'PIURA', '04', 'MORROPON', '01', 'CHULUCANAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200402', '20', 'PIURA', '04', 'MORROPON', '02', 'BUENOS AIRES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200403', '20', 'PIURA', '04', 'MORROPON', '03', 'CHALACO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200404', '20', 'PIURA', '04', 'MORROPON', '04', 'LA MATANZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200405', '20', 'PIURA', '04', 'MORROPON', '05', 'MORROPON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200406', '20', 'PIURA', '04', 'MORROPON', '06', 'SALITRAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200407', '20', 'PIURA', '04', 'MORROPON', '07', 'SAN JUAN DE BIGOTE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200408', '20', 'PIURA', '04', 'MORROPON', '08', 'SANTA CATALINA DE MOSSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200409', '20', 'PIURA', '04', 'MORROPON', '09', 'SANTO DOMINGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200410', '20', 'PIURA', '04', 'MORROPON', '10', 'YAMANGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200501', '20', 'PIURA', '05', 'PAITA', '01', 'PAITA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200502', '20', 'PIURA', '05', 'PAITA', '02', 'AMOTAPE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200503', '20', 'PIURA', '05', 'PAITA', '03', 'ARENAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200504', '20', 'PIURA', '05', 'PAITA', '04', 'COLAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200505', '20', 'PIURA', '05', 'PAITA', '05', 'LA HUACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200506', '20', 'PIURA', '05', 'PAITA', '06', 'TAMARINDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200507', '20', 'PIURA', '05', 'PAITA', '07', 'VICHAYAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200601', '20', 'PIURA', '06', 'SULLANA', '01', 'SULLANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200602', '20', 'PIURA', '06', 'SULLANA', '02', 'BELLAVISTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200603', '20', 'PIURA', '06', 'SULLANA', '03', 'IGNACIO ESCUDERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200604', '20', 'PIURA', '06', 'SULLANA', '04', 'LANCONES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200605', '20', 'PIURA', '06', 'SULLANA', '05', 'MARCAVELICA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200606', '20', 'PIURA', '06', 'SULLANA', '06', 'MIGUEL CHECA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200607', '20', 'PIURA', '06', 'SULLANA', '07', 'QUERECOTILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200608', '20', 'PIURA', '06', 'SULLANA', '08', 'SALITRAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200701', '20', 'PIURA', '07', 'TALARA', '01', 'PARIÑAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200702', '20', 'PIURA', '07', 'TALARA', '02', 'EL ALTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200703', '20', 'PIURA', '07', 'TALARA', '03', 'LA BREA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200704', '20', 'PIURA', '07', 'TALARA', '04', 'LOBITOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200705', '20', 'PIURA', '07', 'TALARA', '05', 'LOS ORGANOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200706', '20', 'PIURA', '07', 'TALARA', '06', 'MANCORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200801', '20', 'PIURA', '08', 'SECHURA', '01', 'SECHURA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200802', '20', 'PIURA', '08', 'SECHURA', '02', 'BELLAVISTA DE LA UNION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200803', '20', 'PIURA', '08', 'SECHURA', '03', 'BERNAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200804', '20', 'PIURA', '08', 'SECHURA', '04', 'CRISTO NOS VALGA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200805', '20', 'PIURA', '08', 'SECHURA', '05', 'VICE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('200806', '20', 'PIURA', '08', 'SECHURA', '06', 'RINCONADA LLICUAR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210101', '21', 'PUNO', '01', 'PUNO', '01', 'PUNO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210102', '21', 'PUNO', '01', 'PUNO', '02', 'ACORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210103', '21', 'PUNO', '01', 'PUNO', '03', 'AMANTANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210104', '21', 'PUNO', '01', 'PUNO', '04', 'ATUNCOLLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210105', '21', 'PUNO', '01', 'PUNO', '05', 'CAPACHICA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210106', '21', 'PUNO', '01', 'PUNO', '06', 'CHUCUITO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210107', '21', 'PUNO', '01', 'PUNO', '07', 'COATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210108', '21', 'PUNO', '01', 'PUNO', '08', 'HUATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210109', '21', 'PUNO', '01', 'PUNO', '09', 'MAÑAZO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210110', '21', 'PUNO', '01', 'PUNO', '10', 'PAUCARCOLLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210111', '21', 'PUNO', '01', 'PUNO', '11', 'PICHACANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210112', '21', 'PUNO', '01', 'PUNO', '12', 'PLATERIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210113', '21', 'PUNO', '01', 'PUNO', '13', 'SAN ANTONIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210114', '21', 'PUNO', '01', 'PUNO', '14', 'TIQUILLACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210115', '21', 'PUNO', '01', 'PUNO', '15', 'VILQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210201', '21', 'PUNO', '02', 'AZANGARO', '01', 'AZANGARO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210202', '21', 'PUNO', '02', 'AZANGARO', '02', 'ACHAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210203', '21', 'PUNO', '02', 'AZANGARO', '03', 'ARAPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210204', '21', 'PUNO', '02', 'AZANGARO', '04', 'ASILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210205', '21', 'PUNO', '02', 'AZANGARO', '05', 'CAMINACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210206', '21', 'PUNO', '02', 'AZANGARO', '06', 'CHUPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210207', '21', 'PUNO', '02', 'AZANGARO', '07', 'JOSE DOMINGO CHOQUEHUANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210208', '21', 'PUNO', '02', 'AZANGARO', '08', 'MUÑANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210209', '21', 'PUNO', '02', 'AZANGARO', '09', 'POTONI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210210', '21', 'PUNO', '02', 'AZANGARO', '10', 'SAMAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210211', '21', 'PUNO', '02', 'AZANGARO', '11', 'SAN ANTON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210212', '21', 'PUNO', '02', 'AZANGARO', '12', 'SAN JOSE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210213', '21', 'PUNO', '02', 'AZANGARO', '13', 'SAN JUAN DE SALINAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210214', '21', 'PUNO', '02', 'AZANGARO', '14', 'SANTIAGO DE PUPUJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210215', '21', 'PUNO', '02', 'AZANGARO', '15', 'TIRAPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210301', '21', 'PUNO', '03', 'CARABAYA', '01', 'MACUSANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210302', '21', 'PUNO', '03', 'CARABAYA', '02', 'AJOYANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210303', '21', 'PUNO', '03', 'CARABAYA', '03', 'AYAPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210304', '21', 'PUNO', '03', 'CARABAYA', '04', 'COASA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210305', '21', 'PUNO', '03', 'CARABAYA', '05', 'CORANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210306', '21', 'PUNO', '03', 'CARABAYA', '06', 'CRUCERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210307', '21', 'PUNO', '03', 'CARABAYA', '07', 'ITUATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210308', '21', 'PUNO', '03', 'CARABAYA', '08', 'OLLACHEA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210309', '21', 'PUNO', '03', 'CARABAYA', '09', 'SAN GABAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210310', '21', 'PUNO', '03', 'CARABAYA', '10', 'USICAYOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210401', '21', 'PUNO', '04', 'CHUCUITO', '01', 'JULI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210402', '21', 'PUNO', '04', 'CHUCUITO', '02', 'DESAGUADERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210403', '21', 'PUNO', '04', 'CHUCUITO', '03', 'HUACULLANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210404', '21', 'PUNO', '04', 'CHUCUITO', '04', 'KELLUYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210405', '21', 'PUNO', '04', 'CHUCUITO', '05', 'PISACOMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210406', '21', 'PUNO', '04', 'CHUCUITO', '06', 'POMATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210407', '21', 'PUNO', '04', 'CHUCUITO', '07', 'ZEPITA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210501', '21', 'PUNO', '05', 'EL COLLAO', '01', 'ILAVE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210502', '21', 'PUNO', '05', 'EL COLLAO', '02', 'CAPAZO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210503', '21', 'PUNO', '05', 'EL COLLAO', '03', 'PILCUYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210504', '21', 'PUNO', '05', 'EL COLLAO', '04', 'SANTA ROSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210505', '21', 'PUNO', '05', 'EL COLLAO', '05', 'CONDURIRI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210601', '21', 'PUNO', '06', 'HUANCANE', '01', 'HUANCANE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210602', '21', 'PUNO', '06', 'HUANCANE', '02', 'COJATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210603', '21', 'PUNO', '06', 'HUANCANE', '03', 'HUATASANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210604', '21', 'PUNO', '06', 'HUANCANE', '04', 'INCHUPALLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210605', '21', 'PUNO', '06', 'HUANCANE', '05', 'PUSI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210606', '21', 'PUNO', '06', 'HUANCANE', '06', 'ROSASPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210607', '21', 'PUNO', '06', 'HUANCANE', '07', 'TARACO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210608', '21', 'PUNO', '06', 'HUANCANE', '08', 'VILQUE CHICO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210701', '21', 'PUNO', '07', 'LAMPA', '01', 'LAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210702', '21', 'PUNO', '07', 'LAMPA', '02', 'CABANILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210703', '21', 'PUNO', '07', 'LAMPA', '03', 'CALAPUJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210704', '21', 'PUNO', '07', 'LAMPA', '04', 'NICASIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210705', '21', 'PUNO', '07', 'LAMPA', '05', 'OCUVIRI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210706', '21', 'PUNO', '07', 'LAMPA', '06', 'PALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210707', '21', 'PUNO', '07', 'LAMPA', '07', 'PARATIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210708', '21', 'PUNO', '07', 'LAMPA', '08', 'PUCARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210709', '21', 'PUNO', '07', 'LAMPA', '09', 'SANTA LUCIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210710', '21', 'PUNO', '07', 'LAMPA', '10', 'VILAVILA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210801', '21', 'PUNO', '08', 'MELGAR', '01', 'AYAVIRI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210802', '21', 'PUNO', '08', 'MELGAR', '02', 'ANTAUTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210803', '21', 'PUNO', '08', 'MELGAR', '03', 'CUPI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210804', '21', 'PUNO', '08', 'MELGAR', '04', 'LLALLI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210805', '21', 'PUNO', '08', 'MELGAR', '05', 'MACARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210806', '21', 'PUNO', '08', 'MELGAR', '06', 'NUÑOA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210807', '21', 'PUNO', '08', 'MELGAR', '07', 'ORURILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210808', '21', 'PUNO', '08', 'MELGAR', '08', 'SANTA ROSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210809', '21', 'PUNO', '08', 'MELGAR', '09', 'UMACHIRI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210901', '21', 'PUNO', '09', 'MOHO', '01', 'MOHO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210902', '21', 'PUNO', '09', 'MOHO', '02', 'CONIMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210903', '21', 'PUNO', '09', 'MOHO', '03', 'HUAYRAPATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('210904', '21', 'PUNO', '09', 'MOHO', '04', 'TILALI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211001', '21', 'PUNO', '10', 'SAN ANTONIO DE PUTINA', '01', 'PUTINA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211002', '21', 'PUNO', '10', 'SAN ANTONIO DE PUTINA', '02', 'ANANEA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211003', '21', 'PUNO', '10', 'SAN ANTONIO DE PUTINA', '03', 'PEDRO VILCA APAZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211004', '21', 'PUNO', '10', 'SAN ANTONIO DE PUTINA', '04', 'QUILCAPUNCU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211005', '21', 'PUNO', '10', 'SAN ANTONIO DE PUTINA', '05', 'SINA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211101', '21', 'PUNO', '11', 'SAN ROMAN', '01', 'JULIACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211102', '21', 'PUNO', '11', 'SAN ROMAN', '02', 'CABANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211103', '21', 'PUNO', '11', 'SAN ROMAN', '03', 'CABANILLAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211104', '21', 'PUNO', '11', 'SAN ROMAN', '04', 'CARACOTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211201', '21', 'PUNO', '12', 'SANDIA', '01', 'SANDIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211202', '21', 'PUNO', '12', 'SANDIA', '02', 'CUYOCUYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211203', '21', 'PUNO', '12', 'SANDIA', '03', 'LIMBANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211204', '21', 'PUNO', '12', 'SANDIA', '04', 'PATAMBUCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211205', '21', 'PUNO', '12', 'SANDIA', '05', 'PHARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211206', '21', 'PUNO', '12', 'SANDIA', '06', 'QUIACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211207', '21', 'PUNO', '12', 'SANDIA', '07', 'SAN JUAN DEL ORO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211208', '21', 'PUNO', '12', 'SANDIA', '08', 'YANAHUAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211209', '21', 'PUNO', '12', 'SANDIA', '09', 'ALTO INAMBARI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211210', '21', 'PUNO', '12', 'SANDIA', '10', 'SAN PEDRO DE PUTINA PUNCO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211301', '21', 'PUNO', '13', 'YUNGUYO', '01', 'YUNGUYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211302', '21', 'PUNO', '13', 'YUNGUYO', '02', 'ANAPIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211303', '21', 'PUNO', '13', 'YUNGUYO', '03', 'COPANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211304', '21', 'PUNO', '13', 'YUNGUYO', '04', 'CUTURAPI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211305', '21', 'PUNO', '13', 'YUNGUYO', '05', 'OLLARAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211306', '21', 'PUNO', '13', 'YUNGUYO', '06', 'TINICACHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('211307', '21', 'PUNO', '13', 'YUNGUYO', '07', 'UNICACHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220101', '22', 'SAN MARTIN', '01', 'MOYOBAMBA', '01', 'MOYOBAMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220102', '22', 'SAN MARTIN', '01', 'MOYOBAMBA', '02', 'CALZADA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220103', '22', 'SAN MARTIN', '01', 'MOYOBAMBA', '03', 'HABANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220104', '22', 'SAN MARTIN', '01', 'MOYOBAMBA', '04', 'JEPELACIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220105', '22', 'SAN MARTIN', '01', 'MOYOBAMBA', '05', 'SORITOR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220106', '22', 'SAN MARTIN', '01', 'MOYOBAMBA', '06', 'YANTALO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220201', '22', 'SAN MARTIN', '02', 'BELLAVISTA', '01', 'BELLAVISTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220202', '22', 'SAN MARTIN', '02', 'BELLAVISTA', '02', 'ALTO BIAVO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220203', '22', 'SAN MARTIN', '02', 'BELLAVISTA', '03', 'BAJO BIAVO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220204', '22', 'SAN MARTIN', '02', 'BELLAVISTA', '04', 'HUALLAGA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220205', '22', 'SAN MARTIN', '02', 'BELLAVISTA', '05', 'SAN PABLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220206', '22', 'SAN MARTIN', '02', 'BELLAVISTA', '06', 'SAN RAFAEL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220301', '22', 'SAN MARTIN', '03', 'EL DORADO', '01', 'SAN JOSE DE SISA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220302', '22', 'SAN MARTIN', '03', 'EL DORADO', '02', 'AGUA BLANCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220303', '22', 'SAN MARTIN', '03', 'EL DORADO', '03', 'SAN MARTIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220304', '22', 'SAN MARTIN', '03', 'EL DORADO', '04', 'SANTA ROSA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220305', '22', 'SAN MARTIN', '03', 'EL DORADO', '05', 'SHATOJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220401', '22', 'SAN MARTIN', '04', 'HUALLAGA', '01', 'SAPOSOA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220402', '22', 'SAN MARTIN', '04', 'HUALLAGA', '02', 'ALTO SAPOSOA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220403', '22', 'SAN MARTIN', '04', 'HUALLAGA', '03', 'EL ESLABON', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220404', '22', 'SAN MARTIN', '04', 'HUALLAGA', '04', 'PISCOYACU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220405', '22', 'SAN MARTIN', '04', 'HUALLAGA', '05', 'SACANCHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220406', '22', 'SAN MARTIN', '04', 'HUALLAGA', '06', 'TINGO DE SAPOSOA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220501', '22', 'SAN MARTIN', '05', 'LAMAS', '01', 'LAMAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220502', '22', 'SAN MARTIN', '05', 'LAMAS', '02', 'ALONSO DE ALVARADO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220503', '22', 'SAN MARTIN', '05', 'LAMAS', '03', 'BARRANQUITA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220504', '22', 'SAN MARTIN', '05', 'LAMAS', '04', 'CAYNARACHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220505', '22', 'SAN MARTIN', '05', 'LAMAS', '05', 'CUÑUMBUQUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220506', '22', 'SAN MARTIN', '05', 'LAMAS', '06', 'PINTO RECODO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220507', '22', 'SAN MARTIN', '05', 'LAMAS', '07', 'RUMISAPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220508', '22', 'SAN MARTIN', '05', 'LAMAS', '08', 'SAN ROQUE DE CUMBAZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220509', '22', 'SAN MARTIN', '05', 'LAMAS', '09', 'SHANAO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220510', '22', 'SAN MARTIN', '05', 'LAMAS', '10', 'TABALOSOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220511', '22', 'SAN MARTIN', '05', 'LAMAS', '11', 'ZAPATERO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220601', '22', 'SAN MARTIN', '06', 'MARISCAL CACERES', '01', 'JUANJUI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220602', '22', 'SAN MARTIN', '06', 'MARISCAL CACERES', '02', 'CAMPANILLA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220603', '22', 'SAN MARTIN', '06', 'MARISCAL CACERES', '03', 'HUICUNGO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220604', '22', 'SAN MARTIN', '06', 'MARISCAL CACERES', '04', 'PACHIZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220605', '22', 'SAN MARTIN', '06', 'MARISCAL CACERES', '05', 'PAJARILLO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220701', '22', 'SAN MARTIN', '07', 'PICOTA', '01', 'PICOTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220702', '22', 'SAN MARTIN', '07', 'PICOTA', '02', 'BUENOS AIRES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220703', '22', 'SAN MARTIN', '07', 'PICOTA', '03', 'CASPISAPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220704', '22', 'SAN MARTIN', '07', 'PICOTA', '04', 'PILLUANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220705', '22', 'SAN MARTIN', '07', 'PICOTA', '05', 'PUCACACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220706', '22', 'SAN MARTIN', '07', 'PICOTA', '06', 'SAN CRISTOBAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220707', '22', 'SAN MARTIN', '07', 'PICOTA', '07', 'SAN HILARION', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220708', '22', 'SAN MARTIN', '07', 'PICOTA', '08', 'SHAMBOYACU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220709', '22', 'SAN MARTIN', '07', 'PICOTA', '09', 'TINGO DE PONASA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220710', '22', 'SAN MARTIN', '07', 'PICOTA', '10', 'TRES UNIDOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220801', '22', 'SAN MARTIN', '08', 'RIOJA', '01', 'RIOJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220802', '22', 'SAN MARTIN', '08', 'RIOJA', '02', 'AWAJUN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220803', '22', 'SAN MARTIN', '08', 'RIOJA', '03', 'ELIAS SOPLIN VARGAS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220804', '22', 'SAN MARTIN', '08', 'RIOJA', '04', 'NUEVA CAJAMARCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220805', '22', 'SAN MARTIN', '08', 'RIOJA', '05', 'PARDO MIGUEL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220806', '22', 'SAN MARTIN', '08', 'RIOJA', '06', 'POSIC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220807', '22', 'SAN MARTIN', '08', 'RIOJA', '07', 'SAN FERNANDO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220808', '22', 'SAN MARTIN', '08', 'RIOJA', '08', 'YORONGOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220809', '22', 'SAN MARTIN', '08', 'RIOJA', '09', 'YURACYACU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220901', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '01', 'TARAPOTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220902', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '02', 'ALBERTO LEVEAU', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220903', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '03', 'CACATACHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220904', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '04', 'CHAZUTA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220905', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '05', 'CHIPURANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220906', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '06', 'EL PORVENIR', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220907', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '07', 'HUIMBAYOC', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220908', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '08', 'JUAN GUERRA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220909', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '09', 'LA BANDA DE SHILCAYO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220910', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '10', 'MORALES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220911', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '11', 'PAPAPLAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220912', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '12', 'SAN ANTONIO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220913', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '13', 'SAUCE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('220914', '22', 'SAN MARTIN', '09', 'SAN MARTIN', '14', 'SHAPAJA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('221001', '22', 'SAN MARTIN', '10', 'TOCACHE', '01', 'TOCACHE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('221002', '22', 'SAN MARTIN', '10', 'TOCACHE', '02', 'NUEVO PROGRESO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('221003', '22', 'SAN MARTIN', '10', 'TOCACHE', '03', 'POLVORA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('221004', '22', 'SAN MARTIN', '10', 'TOCACHE', '04', 'SHUNTE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('221005', '22', 'SAN MARTIN', '10', 'TOCACHE', '05', 'UCHIZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230101', '23', 'TACNA', '01', 'TACNA', '01', 'TACNA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230102', '23', 'TACNA', '01', 'TACNA', '02', 'ALTO DE LA ALIANZA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230103', '23', 'TACNA', '01', 'TACNA', '03', 'CALANA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230104', '23', 'TACNA', '01', 'TACNA', '04', 'CIUDAD NUEVA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230105', '23', 'TACNA', '01', 'TACNA', '05', 'INCLAN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230106', '23', 'TACNA', '01', 'TACNA', '06', 'PACHIA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230107', '23', 'TACNA', '01', 'TACNA', '07', 'PALCA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230108', '23', 'TACNA', '01', 'TACNA', '08', 'POCOLLAY', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230109', '23', 'TACNA', '01', 'TACNA', '09', 'SAMA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230110', '23', 'TACNA', '01', 'TACNA', '10', 'CORONEL GREGORIO ALBARRACIN LANCHIPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230201', '23', 'TACNA', '02', 'CANDARAVE', '01', 'CANDARAVE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230202', '23', 'TACNA', '02', 'CANDARAVE', '02', 'CAIRANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230203', '23', 'TACNA', '02', 'CANDARAVE', '03', 'CAMILACA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230204', '23', 'TACNA', '02', 'CANDARAVE', '04', 'CURIBAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230205', '23', 'TACNA', '02', 'CANDARAVE', '05', 'HUANUARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230206', '23', 'TACNA', '02', 'CANDARAVE', '06', 'QUILAHUANI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230301', '23', 'TACNA', '03', 'JORGE BASADRE', '01', 'LOCUMBA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230302', '23', 'TACNA', '03', 'JORGE BASADRE', '02', 'ILABAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230303', '23', 'TACNA', '03', 'JORGE BASADRE', '03', 'ITE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230401', '23', 'TACNA', '04', 'TARATA', '01', 'TARATA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230402', '23', 'TACNA', '04', 'TARATA', '02', 'HEROES ALBARRACIN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230403', '23', 'TACNA', '04', 'TARATA', '03', 'ESTIQUE', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230404', '23', 'TACNA', '04', 'TARATA', '04', 'ESTIQUE-PAMPA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230405', '23', 'TACNA', '04', 'TARATA', '05', 'SITAJARA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230406', '23', 'TACNA', '04', 'TARATA', '06', 'SUSAPAYA', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230407', '23', 'TACNA', '04', 'TARATA', '07', 'TARUCACHI', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('230408', '23', 'TACNA', '04', 'TARATA', '08', 'TICACO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('240101', '24', 'TUMBES', '01', 'TUMBES', '01', 'TUMBES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('240102', '24', 'TUMBES', '01', 'TUMBES', '02', 'CORRALES', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('240103', '24', 'TUMBES', '01', 'TUMBES', '03', 'LA CRUZ', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('240104', '24', 'TUMBES', '01', 'TUMBES', '04', 'PAMPAS DE HOSPITAL', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('240105', '24', 'TUMBES', '01', 'TUMBES', '05', 'SAN JACINTO', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('240106', '24', 'TUMBES', '01', 'TUMBES', '06', 'SAN JUAN DE LA VIRGEN', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('240201', '24', 'TUMBES', '02', 'CONTRALMIRANTE VILLAR', '01', 'ZORRITOS', '', '10');
INSERT INTO `tb_ubigeo` VALUES ('240202', '24', 'TUMBES', '02', 'CONTRALMIRANTE VILLAR', '02', 'CASITAS', '', '10');

-- ----------------------------
-- Table structure for tb_undtransporte
-- ----------------------------
DROP TABLE IF EXISTS `tb_undtransporte`;
CREATE TABLE `tb_undtransporte` (
  `Id_UndTransporte` int(11) NOT NULL AUTO_INCREMENT,
  `Vehiculo` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `Licencia_Conducir` varchar(45) NOT NULL,
  `Conductor` varchar(75) NOT NULL,
  PRIMARY KEY (`Id_UndTransporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_undtransporte
-- ----------------------------

-- ----------------------------
-- Table structure for tb_usuario
-- ----------------------------
DROP TABLE IF EXISTS `tb_usuario`;
CREATE TABLE `tb_usuario` (
  `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(30) DEFAULT NULL,
  `Clave` varchar(45) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `Id_Datos` int(11) NOT NULL,
  PRIMARY KEY (`Id_Usuario`),
  KEY `fk_Tb_Usuario_Tb_Datos1_idx` (`Id_Datos`),
  CONSTRAINT `fk_Tb_Usuario_Tb_Datos1` FOREIGN KEY (`Id_Datos`) REFERENCES `tb_datos` (`Id_Datos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_usuario
-- ----------------------------
INSERT INTO `tb_usuario` VALUES ('1', 'jquispe', '123456', '1', '1');

-- ----------------------------
-- Table structure for tb_zona
-- ----------------------------
DROP TABLE IF EXISTS `tb_zona`;
CREATE TABLE `tb_zona` (
  `Id_Zona` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Id_Cuenca` int(11) NOT NULL,
  `Id_Ubigeo` char(6) NOT NULL,
  PRIMARY KEY (`Id_Zona`),
  KEY `fk_Tb_Zona_Tb_Cuenca1_idx` (`Id_Cuenca`),
  KEY `fk_Tb_Zona_Tb_Ubigeo1_idx` (`Id_Ubigeo`),
  CONSTRAINT `fk_Tb_Zona_Tb_Cuenca1` FOREIGN KEY (`Id_Cuenca`) REFERENCES `tb_cuenca` (`Id_Cuenca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tb_Zona_Tb_Ubigeo1` FOREIGN KEY (`Id_Ubigeo`) REFERENCES `tb_ubigeo` (`Id_Ubigeo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_zona
-- ----------------------------
INSERT INTO `tb_zona` VALUES ('1', 'AYTE-NUEVO IMPERIO', '1', '120601');
INSERT INTO `tb_zona` VALUES ('2', 'VALLE SONDOVENI', '1', '120601');
INSERT INTO `tb_zona` VALUES ('3', 'NAZARATEGUI', '1', '120601');
INSERT INTO `tb_zona` VALUES ('4', 'MANANTIAL-TIWINZA', '1', '120601');

-- ----------------------------
-- Procedure structure for sp_CambiarClave
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_CambiarClave`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CambiarClave`(cod INT)
BEGIN
	UPDATE  Tb_Usuario SET Clave=('123') WHERE Id_Usuario=cod;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_EditarProducto
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_EditarProducto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EditarProducto`(d1 INT,d2 INT,d3 VARCHAR(45),cod INT)
BEGIN
	UPDATE tb_producto SET 
		Descripcion=d1,
		Id_TipoProducto=d2,
		Peso=d3

	WHERE Id_Producto=cod;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_EditarProductor
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_EditarProductor`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EditarProductor`(d1 VARCHAR(30),d2 VARCHAR(30),d3 VARCHAR(30),d4 INT,d5 VARCHAR(15),d6 INT,d7 VARCHAR(45),d8 VARCHAR(45),d9 VARCHAR(45),d10 VARCHAR(45),cod INT)
BEGIN
	UPDATE tb_productor SET 
		Paterno=d1,
		Materno=d2,
		Nombres=d3,
		Id_TipoDocIdentidad=d4,
		Nro_DocIdentidad=d5,
		Id_Zona=d6,
		Condicion=d7,
		Status_=d8,
		Area_Terreno=d9,
		Produccion_Estimada=d10
 
	WHERE Id_Productor=cod;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_EditarUsuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_EditarUsuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EditarUsuario`(d1 VARCHAR(150),d2 INT,cod INT)
BEGIN
UPDATE  Tb_Usuario SET Usuario=d1,
Id_TipoUsuario=d2 WHERE Id_Usuario=cod;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_GrabarProducto
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GrabarProducto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GrabarProducto`(d1 INT,d2 INT,d3 VARCHAR(45))
BEGIN
	INSERT INTO tb_producto(Descripcion,Id_TipoProducto,Peso) 
	VALUES(d1,d2,d3);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_GrabarProductor
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GrabarProductor`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GrabarProductor`(d1 VARCHAR(30),d2 VARCHAR(30),d3 VARCHAR(30),d4 INT,d5 VARCHAR(15),d6 INT,d7 VARCHAR(45),d8 VARCHAR(45),d9 VARCHAR(45),d10 VARCHAR(45))
BEGIN
	INSERT INTO tb_productor(Paterno,Materno,Nombres,Id_TipoDocIdentidad,Nro_DocIdentidad,Id_Zona,Condicion,Status_,Area_Terreno,Produccion_Estimada) 
	VALUES(d1,d2,d3,d4,d5,d6,d7,d8,d9,d10);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_GrabarUsuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GrabarUsuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GrabarUsuario`(d1 VARCHAR(10),d2 INT)
BEGIN
INSERT INTO Tb_Usuario(Usuario,Clave,Estado,Id_TipoUsuario) VALUES(d1,MD5('123'),1,d2);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_LProducto
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_LProducto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_LProducto`()
BEGIN
	SELECT Id_Producto,p.Descripcion,t.Id_TipoProducto,t.Descripcion AS TipoProducto,Peso
 
	FROM tb_producto p, tb_tipoproducto t 
	WHERE p.Id_TipoProducto=p.Id_TipoProducto;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_LProductoPorCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_LProductoPorCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_LProductoPorCodigo`(cod INT)
BEGIN
	SELECT Id_Producto,p.Descripcion,t.Id_TipoProducto,t.Descripcion AS TipoProducto,Peso
 
	FROM tb_producto p, tb_tipoproducto t 
	WHERE p.Id_TipoProducto=p.Id_TipoProducto AND Id_Producto=cod LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_LProductor
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_LProductor`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_LProductor`()
BEGIN
	SELECT Id_Productor,Paterno,Materno,Nombres,CONCAT(Paterno,' ',Materno,', ',Nombres)AS Datos,td.Id_TipoDocIdentidad,td.Descripcion AS TipoDoc,Nro_DocIdentidad,z.Id_Zona,z.Descripcion AS Zona,Condicion,Status_,Area_Terreno,Produccion_Estimada 
	FROM tb_productor p, tb_zona z, tb_tipodocidentidad td 
	WHERE p.Id_Zona=z.Id_Zona AND p.Id_TipoDocIdentidad=td.Id_TipoDocIdentidad;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_LProductorPorCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_LProductorPorCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_LProductorPorCodigo`(cod INT)
BEGIN
	SELECT Id_Productor,Paterno,Materno,Nombres,CONCAT(Paterno,' ',Materno,', ',Nombres)AS Datos,td.Id_TipoDocIdentidad,td.Descripcion AS TipoDoc,Nro_DocIdentidad,z.Id_Zona,z.Descripcion AS Zona,Condicion,Status_,Area_Terreno,Produccion_Estimada 
	FROM tb_productor p, tb_zona z, tb_tipodocidentidad td 
	WHERE p.Id_Zona=z.Id_Zona AND p.Id_TipoDocIdentidad=td.Id_TipoDocIdentidad AND Id_Productor=cod LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_LTipoDoc
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_LTipoDoc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_LTipoDoc`()
BEGIN
	SELECT Id_TipoDocIdentidad,Descripcion
	FROM tb_tipodocidentidad;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_LTipoProducto
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_LTipoProducto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_LTipoProducto`()
BEGIN
	SELECT Id_TipoProducto,Descripcion
	FROM tb_tipoproducto;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_LZona
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_LZona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_LZona`()
BEGIN
	SELECT Id_Zona,Descripcion,Id_Cuenca,Id_Ubigeo
	FROM tb_zona;
END
;;
DELIMITER ;
