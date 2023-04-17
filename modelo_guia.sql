-- MySQL Script generated by MySQL Workbench
-- Sun Apr 16 20:07:51 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tipo_documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_documento` (
  `Id` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Abreviatura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estudiante` (
  `Id` INT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NULL,
  `Numero` VARCHAR(45) NOT NULL,
  `Tipo_documeto_id` INT NULL,
  PRIMARY KEY (`Id`),
  INDEX `Tipo_documento_idx` (`Tipo_documeto_id` ASC) VISIBLE,
  CONSTRAINT `Tipo_documento`
    FOREIGN KEY (`Tipo_documeto_id`)
    REFERENCES `mydb`.`Tipo_documento` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignatura` (
  `codigo` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inscripcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inscripcion` (
  `Id` INT NOT NULL,
  `Estudiante_id` INT NULL,
  `Asignatura_codigo` INT NULL,
  PRIMARY KEY (`Id`),
  INDEX `Estudiante_id_idx` (`Estudiante_id` ASC) VISIBLE,
  CONSTRAINT `Asignatura_codigo`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Asignatura` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Estudiante_id`
    FOREIGN KEY (`Estudiante_id`)
    REFERENCES `mydb`.`Estudiante` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tema` (
  `Id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Asignatura_codigo` INT NULL,
  PRIMARY KEY (`Id`),
  INDEX `Asignatura_codigo_idx` (`Asignatura_codigo` ASC) VISIBLE,
  CONSTRAINT `Asignatura_codigo`
    FOREIGN KEY (`Asignatura_codigo`)
    REFERENCES `mydb`.`Asignatura` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;