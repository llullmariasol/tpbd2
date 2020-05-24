-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tpbd2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tpbd2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tpbd2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `tpbd2` ;

-- -----------------------------------------------------
-- Table `tpbd2`.`localidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`localidades` (
  `Cod_Postal` VARCHAR(10) NOT NULL,
  `Nombre_Loc` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Cod_Postal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`puertos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`puertos` (
  `Cod_Puerto` TINYINT NOT NULL AUTO_INCREMENT,
  `Cod_Postal` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Cod_Puerto`),
  INDEX `Cod_Postal` (`Cod_Postal` ASC) VISIBLE,
  CONSTRAINT `Cod_Postal_FK`
    FOREIGN KEY (`Cod_Postal`)
    REFERENCES `tpbd2`.`localidades` (`Cod_Postal`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`muelles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`muelles` (
  `Cod_Muelle` TINYINT NOT NULL AUTO_INCREMENT,
  `Cod_Puerto` TINYINT NOT NULL,
  `Metros_Calado` FLOAT NOT NULL,
  PRIMARY KEY (`Cod_Muelle`),
  INDEX `Cod_Puerto_FK2` (`Cod_Puerto` ASC) VISIBLE,
  CONSTRAINT `Cod_Puerto_FK2`
    FOREIGN KEY (`Cod_Puerto`)
    REFERENCES `tpbd2`.`puertos` (`Cod_Puerto`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`tipos_amarres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`tipos_amarres` (
  `Cod_Tipo_Amarre` TINYINT NOT NULL AUTO_INCREMENT,
  `Desc_Tipo_Amarre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Cod_Tipo_Amarre`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`amarres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`amarres` (
  `Cod_Muelle` TINYINT NOT NULL,
  `Nro_Ubicación_Amarre` TINYINT NOT NULL,
  `Cod_Tipo_Amarre` TINYINT NOT NULL,
  `Metros_Largo` SMALLINT NOT NULL,
  `Metros_Ancho` SMALLINT NOT NULL,
  `Estado` BIT(1) NULL DEFAULT b'0',
  PRIMARY KEY (`Cod_Muelle`, `Nro_Ubicación_Amarre`),
  INDEX `Cod_Tipo_Amarre` (`Cod_Tipo_Amarre` ASC) VISIBLE,
  CONSTRAINT `Cod_Muelle_FK`
    FOREIGN KEY (`Cod_Muelle`)
    REFERENCES `tpbd2`.`muelles` (`Cod_Muelle`),
  CONSTRAINT `Tipos_Amarres_FK`
    FOREIGN KEY (`Cod_Tipo_Amarre`)
    REFERENCES `tpbd2`.`tipos_amarres` (`Cod_Tipo_Amarre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`categorías`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`categorías` (
  `Cod_Categ` TINYINT NOT NULL AUTO_INCREMENT,
  `Desc_Categ` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Cod_Categ`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`países`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`países` (
  `Cod_País` TINYINT NOT NULL AUTO_INCREMENT,
  `Nombre_País` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Cod_País`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`emp_navieras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`emp_navieras` (
  `Cod_Emp_Naviera` SMALLINT NOT NULL AUTO_INCREMENT,
  `Nombre_Emp_Naviera` VARCHAR(30) NOT NULL,
  `Cod_País` TINYINT NOT NULL,
  PRIMARY KEY (`Cod_Emp_Naviera`),
  INDEX `Cod_País` (`Cod_País` ASC) VISIBLE,
  CONSTRAINT `emp_navieras_ibfk_1`
    FOREIGN KEY (`Cod_País`)
    REFERENCES `tpbd2`.`países` (`Cod_País`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`proveedores` (
  `Cod_Prov` TINYINT NOT NULL AUTO_INCREMENT,
  `Nombre_Prov` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Prov`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`equipos` (
  `Cod_Equipo` TINYINT NOT NULL AUTO_INCREMENT,
  `Cod_Puerto` TINYINT NOT NULL,
  `Desc_Equipo` VARCHAR(50) NOT NULL,
  `Año_Compra` SMALLINT NULL DEFAULT NULL,
  `Cod_Prov` TINYINT NOT NULL,
  `Estado` BIT(1) NULL DEFAULT b'0',
  PRIMARY KEY (`Cod_Equipo`),
  INDEX `Cod_Puerto` (`Cod_Puerto` ASC) VISIBLE,
  INDEX `Cod_Prov` (`Cod_Prov` ASC) VISIBLE,
  CONSTRAINT `Cod_Prov_FK`
    FOREIGN KEY (`Cod_Prov`)
    REFERENCES `tpbd2`.`proveedores` (`Cod_Prov`),
  CONSTRAINT `Cod_Puerto_FK1`
    FOREIGN KEY (`Cod_Puerto`)
    REFERENCES `tpbd2`.`puertos` (`Cod_Puerto`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`tipos_cargas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`tipos_cargas` (
  `Cod_Tipo_Carga` TINYINT NOT NULL AUTO_INCREMENT,
  `Desc_Tipo_Carga` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Cod_Tipo_Carga`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`tipos_navíos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`tipos_navíos` (
  `Cod_Tipo_Navío` TINYINT NOT NULL AUTO_INCREMENT,
  `Desc_Tipo_Navío` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Cod_Tipo_Navío`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`navíos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`navíos` (
  `Matrícula_Navío` VARCHAR(10) NOT NULL,
  `Cod_Tipo_Navío` TINYINT NOT NULL,
  `Metros_Eslora` SMALLINT NOT NULL,
  `Metros_Manga` SMALLINT NOT NULL,
  `Metros_Calado_Entrada` SMALLINT NOT NULL,
  `Metros_Calado_Salida` SMALLINT NOT NULL,
  `Cod_Emp_Naviera` SMALLINT NOT NULL,
  PRIMARY KEY (`Matrícula_Navío`),
  INDEX `Cod_Tipo_Navío` (`Cod_Tipo_Navío` ASC) VISIBLE,
  INDEX `Cod_Emp_Naviera_FK_idx` (`Cod_Emp_Naviera` ASC) VISIBLE,
  CONSTRAINT `Cod_Emp_Naviera_FK`
    FOREIGN KEY (`Cod_Emp_Naviera`)
    REFERENCES `tpbd2`.`emp_navieras` (`Cod_Emp_Naviera`),
  CONSTRAINT `navíos_ibfk_1`
    FOREIGN KEY (`Cod_Tipo_Navío`)
    REFERENCES `tpbd2`.`tipos_navíos` (`Cod_Tipo_Navío`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`usuarios` (
  `Usuario` VARCHAR(30) NOT NULL,
  `Clave` VARCHAR(30) NOT NULL,
  `Nombre` VARCHAR(50) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Cod_Categ` TINYINT NOT NULL,
  `Cod_Puerto` TINYINT NOT NULL,
  `Cod_Emp_Naviera` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`Usuario`),
  INDEX `Cod_Categ` (`Cod_Categ` ASC) VISIBLE,
  INDEX `Cod_Emp_Naviera_FK_idx` (`Cod_Emp_Naviera` ASC) VISIBLE,
  INDEX `Cod_Puerto_FK4` (`Cod_Puerto` ASC) VISIBLE,
  CONSTRAINT `Cod_Categ_FK`
    FOREIGN KEY (`Cod_Categ`)
    REFERENCES `tpbd2`.`categorías` (`Cod_Categ`),
  CONSTRAINT `Cod_Emp_Naviera_FK1`
    FOREIGN KEY (`Cod_Emp_Naviera`)
    REFERENCES `tpbd2`.`emp_navieras` (`Cod_Emp_Naviera`),
  CONSTRAINT `Cod_Puerto_FK4`
    FOREIGN KEY (`Cod_Puerto`)
    REFERENCES `tpbd2`.`puertos` (`Cod_Puerto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`solicitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`solicitudes` (
  `Cod_Solicitud` INT NOT NULL AUTO_INCREMENT,
  `Matrícula_Navío` VARCHAR(10) NOT NULL,
  `FechaArribo_Est` DATE NOT NULL,
  `FechaSalida_Est` DATE NOT NULL,
  `Estado` CHAR(1) NULL DEFAULT '\0',
  `Cod_Muelle` TINYINT NULL DEFAULT NULL,
  `Nro_Ubicación_Amarre` TINYINT NULL DEFAULT NULL,
  `Usuario` VARCHAR(30) NOT NULL,
  `FechaArribo_Real` DATE NULL DEFAULT NULL,
  `Cod_País_Origen` TINYINT NOT NULL,
  `Cod_Tipo_Carga` TINYINT NOT NULL,
  `Cant_Carga` MEDIUMINT NULL DEFAULT NULL,
  `Cant_Pasajeros` MEDIUMINT NULL DEFAULT NULL,
  `Cant_Contenedores` MEDIUMINT NULL DEFAULT NULL,
  `MercPeligrosa` BIT(1) NULL DEFAULT b'0',
  PRIMARY KEY (`Cod_Solicitud`),
  INDEX `Matrícula_Navío` (`Matrícula_Navío` ASC) VISIBLE,
  INDEX `Cod_Muelle` (`Cod_Muelle` ASC, `Nro_Ubicación_Amarre` ASC) VISIBLE,
  INDEX `Usuario` (`Usuario` ASC) VISIBLE,
  INDEX `Cod_Tipo_Carga_FK_idx` (`Cod_Tipo_Carga` ASC) VISIBLE,
  INDEX `Cod_PaisOrig_FK_idx` (`Cod_País_Origen` ASC) VISIBLE,
  CONSTRAINT `Cod_Tipo_Carga_FK`
    FOREIGN KEY (`Cod_Tipo_Carga`)
    REFERENCES `tpbd2`.`tipos_cargas` (`Cod_Tipo_Carga`),
  CONSTRAINT `Matrícula_Navio_FK`
    FOREIGN KEY (`Matrícula_Navío`)
    REFERENCES `tpbd2`.`navíos` (`Matrícula_Navío`),
  CONSTRAINT `solicitudes_ibfk_3`
    FOREIGN KEY (`Cod_Muelle` , `Nro_Ubicación_Amarre`)
    REFERENCES `tpbd2`.`amarres` (`Cod_Muelle` , `Nro_Ubicación_Amarre`),
  CONSTRAINT `solicitudes_ibfk_4`
    FOREIGN KEY (`Usuario`)
    REFERENCES `tpbd2`.`usuarios` (`Usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`facturas_cab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`facturas_cab` (
  `Nro_Factura` INT NOT NULL AUTO_INCREMENT,
  `Fecha_Fact` DATETIME NOT NULL,
  `Cod_Solicitud` INT NOT NULL,
  `Monto_Total` INT NOT NULL,
  `Estado` BIT(1) NULL DEFAULT b'0',
  PRIMARY KEY (`Nro_Factura`),
  INDEX `Cod_Solicitud` (`Cod_Solicitud` ASC) VISIBLE,
  CONSTRAINT `facturas_cab_ibfk_1`
    FOREIGN KEY (`Cod_Solicitud`)
    REFERENCES `tpbd2`.`solicitudes` (`Cod_Solicitud`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`servicios` (
  `Cod_Servicio` TINYINT NOT NULL AUTO_INCREMENT,
  `Desc_Servicio` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Cod_Servicio`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`facturas_det`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`facturas_det` (
  `Nro_Factura` INT NOT NULL,
  `Cod_Servicio` TINYINT NOT NULL,
  INDEX `Nro_Factura` (`Nro_Factura` ASC) VISIBLE,
  INDEX `Cod_Servicio` (`Cod_Servicio` ASC) VISIBLE,
  CONSTRAINT `facturas_det_ibfk_1`
    FOREIGN KEY (`Nro_Factura`)
    REFERENCES `tpbd2`.`facturas_cab` (`Nro_Factura`),
  CONSTRAINT `facturas_det_ibfk_2`
    FOREIGN KEY (`Cod_Servicio`)
    REFERENCES `tpbd2`.`servicios` (`Cod_Servicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`servicios_solicitados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`servicios_solicitados` (
  `Cod_Solicitud` INT NOT NULL,
  `Cod_Servicio` TINYINT NOT NULL,
  PRIMARY KEY (`Cod_Solicitud`, `Cod_Servicio`),
  INDEX `Cod_Servicio` (`Cod_Servicio` ASC) VISIBLE,
  CONSTRAINT `servicios_solicitados_ibfk_1`
    FOREIGN KEY (`Cod_Solicitud`)
    REFERENCES `tpbd2`.`solicitudes` (`Cod_Solicitud`),
  CONSTRAINT `servicios_solicitados_ibfk_2`
    FOREIGN KEY (`Cod_Servicio`)
    REFERENCES `tpbd2`.`servicios` (`Cod_Servicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`historial_servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`historial_servicios` (
  `Cod_Solicitud` INT NOT NULL,
  `Cod_Servicio` TINYINT NOT NULL,
  `FechaHora_Inicio` DATETIME NOT NULL,
  `FechaHora_Fin` DATETIME NOT NULL,
  PRIMARY KEY (`Cod_Solicitud`, `Cod_Servicio`, `FechaHora_Inicio`),
  CONSTRAINT `historial_servicios_ibfk_1`
    FOREIGN KEY (`Cod_Solicitud` , `Cod_Servicio`)
    REFERENCES `tpbd2`.`servicios_solicitados` (`Cod_Solicitud` , `Cod_Servicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`puertos_servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`puertos_servicios` (
  `Cod_Puerto` TINYINT NOT NULL,
  `Cod_Servicio` TINYINT NOT NULL,
  `Tarifa` INT NOT NULL,
  `Capacidad_Total` INT NULL DEFAULT NULL,
  `Capacidad_Ocupada` INT NULL DEFAULT '0',
  PRIMARY KEY (`Cod_Puerto`, `Cod_Servicio`),
  INDEX `Cod_Servicio` (`Cod_Servicio` ASC) VISIBLE,
  CONSTRAINT `Cod_Puerto_FK`
    FOREIGN KEY (`Cod_Puerto`)
    REFERENCES `tpbd2`.`puertos` (`Cod_Puerto`),
  CONSTRAINT `Cod_Servicio_FK`
    FOREIGN KEY (`Cod_Servicio`)
    REFERENCES `tpbd2`.`servicios` (`Cod_Servicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`rrhh_equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`rrhh_equipos` (
  `Usuario` VARCHAR(30) NOT NULL,
  `Cod_Equipo` TINYINT NOT NULL,
  `Estado` BIT(1) NULL DEFAULT b'0',
  PRIMARY KEY (`Usuario`, `Cod_Equipo`),
  INDEX `Cod_Equipo` (`Cod_Equipo` ASC) VISIBLE,
  CONSTRAINT `rrhh_equipos_ibfk_1`
    FOREIGN KEY (`Usuario`)
    REFERENCES `tpbd2`.`usuarios` (`Usuario`),
  CONSTRAINT `rrhh_equipos_ibfk_2`
    FOREIGN KEY (`Cod_Equipo`)
    REFERENCES `tpbd2`.`equipos` (`Cod_Equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tpbd2`.`servicios_equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpbd2`.`servicios_equipos` (
  `Cod_Puerto` TINYINT NOT NULL,
  `Cod_Servicio` TINYINT NOT NULL,
  `Cod_Equipo` TINYINT NOT NULL,
  PRIMARY KEY (`Cod_Puerto`, `Cod_Servicio`, `Cod_Equipo`),
  INDEX `Cod_Equipo` (`Cod_Equipo` ASC) VISIBLE,
  CONSTRAINT `Equipos_FK`
    FOREIGN KEY (`Cod_Equipo`)
    REFERENCES `tpbd2`.`equipos` (`Cod_Equipo`),
  CONSTRAINT `Puertos_Servicios_FK`
    FOREIGN KEY (`Cod_Puerto` , `Cod_Servicio`)
    REFERENCES `tpbd2`.`puertos_servicios` (`Cod_Puerto` , `Cod_Servicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
