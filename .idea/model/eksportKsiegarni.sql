-- MySQL Script generated by MySQL Workbench
-- Sun Mar  1 14:22:49 2020
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
-- Table `mydb`.`Autorzy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autorzy` (
  `idAutorzy` INT NOT NULL,
  `Imie` VARCHAR(45) NULL,
  `Nazwisko` VARCHAR(45) NULL,
  PRIMARY KEY (`idAutorzy`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Czytelnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Czytelnik` (
  `idCzytelnik` INT NOT NULL,
  `Imie` VARCHAR(45) NULL,
  `Nazwisko` VARCHAR(45) NULL,
  PRIMARY KEY (`idCzytelnik`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Książki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Książki` (
  `idKsiążki` INT NOT NULL,
  `Tytuł` VARCHAR(45) NULL,
  `Czytelnik_idCzytelnik` INT NOT NULL,
  PRIMARY KEY (`idKsiążki`, `Czytelnik_idCzytelnik`),
  INDEX `fk_Książki_Czytelnik1_idx` (`Czytelnik_idCzytelnik` ASC) VISIBLE,
  CONSTRAINT `fk_Książki_Czytelnik1`
    FOREIGN KEY (`Czytelnik_idCzytelnik`)
    REFERENCES `mydb`.`Czytelnik` (`idCzytelnik`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Wydawnictwo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Wydawnictwo` (
  `idWydawnictwo` INT NOT NULL,
  `Nazwa` VARCHAR(45) NULL,
  `Książki_idKsiążki` INT NOT NULL,
  PRIMARY KEY (`idWydawnictwo`),
  INDEX `fk_Wydawnictwo_Książki1_idx` (`Książki_idKsiążki` ASC) VISIBLE,
  CONSTRAINT `fk_Wydawnictwo_Książki1`
    FOREIGN KEY (`Książki_idKsiążki`)
    REFERENCES `mydb`.`Książki` (`idKsiążki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Autorzy_has_Książki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autorzy_has_Książki` (
  `Autorzy_idAutorzy` INT NOT NULL,
  `Książki_idKsiążki` INT NOT NULL,
  PRIMARY KEY (`Autorzy_idAutorzy`, `Książki_idKsiążki`),
  INDEX `fk_Autorzy_has_Książki_Książki1_idx` (`Książki_idKsiążki` ASC) VISIBLE,
  INDEX `fk_Autorzy_has_Książki_Autorzy_idx` (`Autorzy_idAutorzy` ASC) VISIBLE,
  CONSTRAINT `fk_Autorzy_has_Książki_Autorzy`
    FOREIGN KEY (`Autorzy_idAutorzy`)
    REFERENCES `mydb`.`Autorzy` (`idAutorzy`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Autorzy_has_Książki_Książki1`
    FOREIGN KEY (`Książki_idKsiążki`)
    REFERENCES `mydb`.`Książki` (`idKsiążki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
