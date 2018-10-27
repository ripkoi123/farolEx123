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
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `type` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `id` INT NOT NULL,
  `order` VARCHAR(45) NULL,
  `cost` VARCHAR(45) NULL,
  `lat` VARCHAR(45) NULL,
  `long` VARCHAR(45) NULL,
  `Users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Orders_Users1_idx` (`Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Users1`
    FOREIGN KEY (`Users_id`)
    REFERENCES `mydb`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Delivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Delivers` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Delivered`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Delivered` (
  `id` INT NOT NULL,
  `state` VARCHAR(45) NULL,
  `dateOrder` DATETIME NULL,
  `dateDelivered` DATETIME NULL,
  `Delivers_id` INT NOT NULL,
  `Orders_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Delivered_Delivers_idx` (`Delivers_id` ASC) VISIBLE,
  INDEX `fk_Delivered_Orders1_idx` (`Orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_Delivered_Delivers`
    FOREIGN KEY (`Delivers_id`)
    REFERENCES `mydb`.`Delivers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Delivered_Orders1`
    FOREIGN KEY (`Orders_id`)
    REFERENCES `mydb`.`Orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Stores` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `lat` DOUBLE NULL,
  `long` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `id` INT NOT NULL,
  `product` VARCHAR(45) NULL,
  `cost` FLOAT NULL,
  `Stores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Products_Stores1_idx` (`Stores_id` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Stores1`
    FOREIGN KEY (`Stores_id`)
    REFERENCES `mydb`.`Stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `id` INT NOT NULL,
  `address` VARCHAR(45) NULL,
  `lat` DOUBLE NULL,
  `long` DOUBLE NULL,
  `Users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Address_Users1_idx` (`Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Address_Users1`
    FOREIGN KEY (`Users_id`)
    REFERENCES `mydb`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Phones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Phones` (
  `id` INT NOT NULL,
  `phone` INT NULL,
  `tipo` INT NULL,
  `Users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Phones_Users1_idx` (`Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Phones_Users1`
    FOREIGN KEY (`Users_id`)
    REFERENCES `mydb`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Exchange`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Exchange` (
  `id` INT NOT NULL,
  `Stores_id` INT NOT NULL,
  `Products_id` INT NOT NULL,
  `Orders_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Exchange_Stores1_idx` (`Stores_id` ASC) VISIBLE,
  INDEX `fk_Exchange_Products1_idx` (`Products_id` ASC) VISIBLE,
  INDEX `fk_Exchange_Orders1_idx` (`Orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_Exchange_Stores1`
    FOREIGN KEY (`Stores_id`)
    REFERENCES `mydb`.`Stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exchange_Products1`
    FOREIGN KEY (`Products_id`)
    REFERENCES `mydb`.`Products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exchange_Orders1`
    FOREIGN KEY (`Orders_id`)
    REFERENCES `mydb`.`Orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
