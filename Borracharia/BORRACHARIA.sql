-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema borracharia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema borracharia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `borracharia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `borracharia` ;

-- -----------------------------------------------------
-- Table `borracharia`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `borracharia`.`clientes` (
  `CODCLI` INT(11) NOT NULL,
  `NOME` VARCHAR(50) NULL DEFAULT NULL,
  `ENDERECO` VARCHAR(60) NULL DEFAULT NULL,
  `ESTADO` CHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`CODCLI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `borracharia`.`notafiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `borracharia`.`notafiscal` (
  `NUMERO` CHAR(9) NOT NULL,
  `SERIE` CHAR(3) NOT NULL,
  `CODCLI` INT(11) NOT NULL,
  `DATACOMPRA` DATE NOT NULL,
  `CANCELADA` CHAR(1) NOT NULL,
  PRIMARY KEY (`NUMERO`, `SERIE`),
  INDEX `CODCLI` (`CODCLI` ASC) VISIBLE,
  CONSTRAINT `notafiscal_ibfk_1`
    FOREIGN KEY (`CODCLI`)
    REFERENCES `borracharia`.`clientes` (`CODCLI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `borracharia`.`pneus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `borracharia`.`pneus` (
  `CODPNEU` INT(11) NOT NULL,
  `DESCRICAO` VARCHAR(50) NULL DEFAULT NULL,
  `MEDIDAS` VARCHAR(15) NULL DEFAULT NULL,
  `PRECO` DECIMAL(10,2) NOT NULL,
  `ATIVO` CHAR(1) NOT NULL,
  PRIMARY KEY (`CODPNEU`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `borracharia`.`itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `borracharia`.`itens` (
  `NUMERO` CHAR(9) NOT NULL,
  `SERIE` CHAR(3) NOT NULL,
  `ITEM` SMALLINT(6) NOT NULL,
  `CODPNEU` INT(11) NOT NULL,
  `QTDE` SMALLINT(6) NOT NULL,
  `PRECO` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`NUMERO`, `SERIE`, `ITEM`),
  INDEX `CODPNEU` (`CODPNEU` ASC) VISIBLE,
  CONSTRAINT `itens_ibfk_1`
    FOREIGN KEY (`NUMERO` , `SERIE`)
    REFERENCES `borracharia`.`notafiscal` (`NUMERO` , `SERIE`),
  CONSTRAINT `itens_ibfk_2`
    FOREIGN KEY (`CODPNEU`)
    REFERENCES `borracharia`.`pneus` (`CODPNEU`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
