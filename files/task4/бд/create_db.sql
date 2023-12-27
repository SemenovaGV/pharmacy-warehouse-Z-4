-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema apteka
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema apteka
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `apteka` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `apteka` ;

-- -----------------------------------------------------
-- Table `apteka`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka`.`category` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `apteka`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apteka`.`item` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `category_id` BIGINT NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `code` VARCHAR(20) NULL DEFAULT NULL,
  `manufacturer` VARCHAR(100) NULL DEFAULT NULL,
  `price` DECIMAL(15,2) NOT NULL,
  `count` INT NOT NULL,
  `image` BLOB NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_category_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_item_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `apteka`.`category` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
