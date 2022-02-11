-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema RedBallon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema RedBallon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RedBallon` ;
USE `RedBallon` ;


-- -----------------------------------------------------
-- Table `RedBallon`.`responsavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RedBallon`.`responsavel` (
  `id_Resp` INT NOT NULL,
  `cpf` VARCHAR(45) NULL,
  `data_nasc` DATE NULL,
  `email` VARCHAR(255) NULL,
  `telefone` VARCHAR(255) NULL,
  `profissao` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Resp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedBallon`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RedBallon`.`alunos` (
  `idAlunos` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `escola` VARCHAR(45) NULL,
  `turma` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `id_Resp` INT NULL,
  PRIMARY KEY (`idAlunos`),
  INDEX `fk_Resp_idx` (`id_Resp` ASC) VISIBLE,
  CONSTRAINT `fk_Resp`
    FOREIGN KEY (`id_Resp`)
    REFERENCES `RedBallon`.`responsavel` (`id_Resp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedBallon`.`dados_med`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RedBallon`.`dados_med` (
  `id_Hosp` INT NOT NULL,
  `medico` VARCHAR(45) NULL,
  `hospital` VARCHAR(45) NULL,
  `alergia` VARCHAR(45) NULL,
  `idAlunos` INT NULL,
  PRIMARY KEY (`id_Hosp`),
  INDEX `fk_dados_med_1_idx` (`idAlunos` ASC) VISIBLE,
  CONSTRAINT `fk_idAlunos`
    FOREIGN KEY (`idAlunos`)
    REFERENCES `RedBallon`.`alunos` (`idAlunos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedBallon`.`mensalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RedBallon`.`mensalidade` (
  `idmensalidade` INT NOT NULL,
  `valor` FLOAT NULL,
  `idAlunos` INT NULL,
  PRIMARY KEY (`idmensalidade`),
  INDEX `fk_idAlunos_idx` (`idAlunos` ASC) VISIBLE,
  CONSTRAINT `fk_idAlunos`
    FOREIGN KEY (`idAlunos`)
    REFERENCES `RedBallon`.`alunos` (`idAlunos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedBallon`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RedBallon`.`matricula` (
  `idmatricula` INT NOT NULL,
  `idAlunos` INT NULL,
  `idmensalidade` INT NULL,
  PRIMARY KEY (`idmatricula`),
  INDEX `fk_idAlunos_idx` (`idAlunos` ASC) VISIBLE,
  INDEX `fk_idMensalidade_idx` (`idmensalidade` ASC) VISIBLE,
  CONSTRAINT `fk_idAlunos`
    FOREIGN KEY (`idAlunos`)
    REFERENCES `RedBallon`.`alunos` (`idAlunos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idMensalidade`
    FOREIGN KEY (`idmensalidade`)
    REFERENCES `RedBallon`.`mensalidade` (`idmensalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;