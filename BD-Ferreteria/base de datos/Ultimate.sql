SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Ultimate_FerreteriaAndres
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ultimate_FerreteriaAndres` DEFAULT CHARACTER SET utf32 ;
USE `Ultimate_FerreteriaAndres` ;

-- -----------------------------------------------------
-- Table `Ultimate_FerreteriaAndres`.`table_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimate_FerreteriaAndres`.`table_Cliente` (
  `idCliente` INT NOT NULL,
  `Nombre_Cliente` VARCHAR(45) NOT NULL,
  `Apellido_Cliente` VARCHAR(45) NOT NULL,
  `Cedula_Cliente` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ultimate_FerreteriaAndres`.`table_Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimate_FerreteriaAndres`.`table_Vendedor` (
  `idVendedor` INT NOT NULL,
  `nombreVendedor` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE INDEX `idVendedor_UNIQUE` (`idVendedor` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ultimate_FerreteriaAndres`.`table_Facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimate_FerreteriaAndres`.`table_Facturas` (
  `No_Facturas` INT NOT NULL,
  `cliente` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `vendedor` INT NOT NULL,
  `totals` INT NOT NULL,
  PRIMARY KEY (`No_Facturas`),
  UNIQUE INDEX `No_Facturas_UNIQUE` (`No_Facturas` ASC),
  INDEX `llavesForaneas_Vendedor_idx` (`vendedor` ASC),
  INDEX `llavesForaneas_Cliente_idx` (`cliente` ASC),
  CONSTRAINT `llavesForaneas_Vendedor`
    FOREIGN KEY (`vendedor`)
    REFERENCES `Ultimate_FerreteriaAndres`.`table_Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llavesForaneas_Cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `Ultimate_FerreteriaAndres`.`table_Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ultimate_FerreteriaAndres`.`table_Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimate_FerreteriaAndres`.`table_Productos` (
  `idProductos` VARCHAR(45) NOT NULL,
  `nombreProductos` VARCHAR(45) NOT NULL,
  `preciosProductos` INT NOT NULL,
  PRIMARY KEY (`idProductos`),
  UNIQUE INDEX `idtProductos_UNIQUE` (`idProductos` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ultimate_FerreteriaAndres`.`table_Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimate_FerreteriaAndres`.`table_Ventas` (
  `idVentas` INT NOT NULL,
  `No_Facturas` INT NOT NULL,
  `Productos` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `importe` INT NOT NULL,
  PRIMARY KEY (`idVentas`),
  UNIQUE INDEX `idVentas_UNIQUE` (`idVentas` ASC),
  INDEX `llavesForaneas_Facturas_idx` (`No_Facturas` ASC),
  INDEX `llavesForaneas_Productos_idx` (`Productos` ASC),
  CONSTRAINT `llavesForaneas_Facturas`
    FOREIGN KEY (`No_Facturas`)
    REFERENCES `Ultimate_FerreteriaAndres`.`table_Facturas` (`No_Facturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llavesForaneas_Productos`
    FOREIGN KEY (`Productos`)
    REFERENCES `Ultimate_FerreteriaAndres`.`table_Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ultimate_FerreteriaAndres`.`table_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimate_FerreteriaAndres`.`table_cliente` (
  `idCliente` INT(11) NOT NULL,
  `Nombre_Cliente` VARCHAR(45) NOT NULL,
  `Apellido_Cliente` VARCHAR(45) NOT NULL,
  `Cedula_Cliente` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16;


-- -----------------------------------------------------
-- Table `Ultimate_FerreteriaAndres`.`table_vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimate_FerreteriaAndres`.`table_vendedor` (
  `idVendedor` INT(11) NOT NULL,
  `nombreVendedor` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE INDEX `idVendedor_UNIQUE` (`idVendedor` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16;


-- -----------------------------------------------------
-- Table `Ultimate_FerreteriaAndres`.`table_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimate_FerreteriaAndres`.`table_facturas` (
  `No_Facturas` INT(11) NOT NULL,
  `cliente` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `vendedor` INT(11) NOT NULL,
  `totals` INT(11) NOT NULL,
  PRIMARY KEY (`No_Facturas`),
  UNIQUE INDEX `No_Facturas_UNIQUE` (`No_Facturas` ASC),
  INDEX `llavesForaneas_Vendedor_idx` (`vendedor` ASC),
  INDEX `llavesForaneas_Cliente_idx` (`cliente` ASC),
  CONSTRAINT `llavesForaneas_Vendedor`
    FOREIGN KEY (`vendedor`)
    REFERENCES `Ultimate_FerreteriaAndres`.`table_vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llavesForaneas_Cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `Ultimate_FerreteriaAndres`.`table_cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16;


-- -----------------------------------------------------
-- Table `Ultimate_FerreteriaAndres`.`table_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimate_FerreteriaAndres`.`table_productos` (
  `idProductos` INT NOT NULL,
  `nombreProductos` VARCHAR(45) NOT NULL,
  `preciosProductos` INT(11) NOT NULL,
  PRIMARY KEY (`idProductos`),
  UNIQUE INDEX `idtProductos_UNIQUE` (`idProductos` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16;


-- -----------------------------------------------------
-- Table `Ultimate_FerreteriaAndres`.`table_ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimate_FerreteriaAndres`.`table_ventas` (
  `idVentas` INT(11) NOT NULL,
  `No_Facturas` INT(11) NOT NULL,
  `Productos` INT NOT NULL,
  `cantidad` INT(11) NOT NULL,
  `importe` INT(11) NOT NULL,
  PRIMARY KEY (`idVentas`),
  UNIQUE INDEX `idVentas_UNIQUE` (`idVentas` ASC),
  INDEX `llavesForaneas_Facturas_idx` (`No_Facturas` ASC),
  INDEX `llavesForaneas_Productos_idx` (`Productos` ASC),
  CONSTRAINT `llavesForaneas_Facturas`
    FOREIGN KEY (`No_Facturas`)
    REFERENCES `Ultimate_FerreteriaAndres`.`table_facturas` (`No_Facturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llavesForaneas_Productos`
    FOREIGN KEY (`Productos`)
    REFERENCES `Ultimate_FerreteriaAndres`.`table_productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
