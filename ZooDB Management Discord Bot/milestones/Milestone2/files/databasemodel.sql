-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ZooDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ZooDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ZooDB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ZooDB` ;

-- -----------------------------------------------------
-- Table `ZooDB`.`animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`animal` (
  `animal_id` INT NOT NULL,
  `animal_type` VARCHAR(30) NOT NULL,
  `food` INT NOT NULL,
  `medical_id` INT NOT NULL,
  PRIMARY KEY (`animal_id`),
  UNIQUE INDEX `animal_id_UNIQUE` (`animal_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`employee` (
  `emp_id` INT NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `department` INT NOT NULL,
  `salary` INT NOT NULL,
  `super_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE INDEX `emp_id_UNIQUE` (`emp_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`department` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(45) NOT NULL,
  `manager` INT NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE INDEX `department_id_UNIQUE` (`department_id` ASC) VISIBLE,
  INDEX `FK_mgr_id_idx` (`manager` ASC) VISIBLE,
  CONSTRAINT `FK_mgr_id`
    FOREIGN KEY (`manager`)
    REFERENCES `ZooDB`.`employee` (`emp_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`employee_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`employee_account` (
  `acc_id` INT NOT NULL,
  `emp_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`acc_id`),
  UNIQUE INDEX `emp_acc_id_UNIQUE` (`acc_id` ASC) VISIBLE,
  UNIQUE INDEX `emp_id_UNIQUE` (`emp_id` ASC) VISIBLE,
  UNIQUE INDEX `permission_id_UNIQUE` (`permission_id` ASC) VISIBLE,
  INDEX `FK_emp_id_idx` (`emp_id` ASC) VISIBLE,
  CONSTRAINT `FK_emp_id`
    FOREIGN KEY (`emp_id`)
    REFERENCES `ZooDB`.`employee` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`employee_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`employee_permission` (
  `permisson_id` INT NOT NULL,
  `emp_acc_id` INT NOT NULL,
  `view_animal_record` TINYINT NOT NULL,
  `edit_animal_record` TINYINT NOT NULL,
  `view_medical_record` TINYINT NOT NULL,
  `edit_medical_record` TINYINT NOT NULL,
  `view_timesheet` TINYINT NOT NULL,
  `edit_timeshseet` TINYINT NOT NULL,
  `edit_ticket_price` TINYINT NOT NULL,
  `view_zoo_expense` TINYINT NOT NULL,
  `edit_zoo_expense` TINYINT NOT NULL,
  PRIMARY KEY (`permisson_id`),
  UNIQUE INDEX `acc_id_UNIQUE` (`emp_acc_id` ASC) VISIBLE,
  UNIQUE INDEX `permisson_id_UNIQUE` (`permisson_id` ASC) VISIBLE,
  CONSTRAINT `FK_emp_id_2`
    FOREIGN KEY (`emp_acc_id`)
    REFERENCES `ZooDB`.`employee_account` (`acc_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`food_supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`food_supply` (
  `food_supply_id` INT NOT NULL,
  `supply_name` VARCHAR(25) NOT NULL,
  `amount(low/high)` VARCHAR(10) NOT NULL,
  `expiration_date` DATE NOT NULL,
  `future_delivery_date` DATE NOT NULL,
  `last_updated` DATETIME NOT NULL,
  PRIMARY KEY (`food_supply_id`),
  UNIQUE INDEX `food_supply_id_UNIQUE` (`food_supply_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`medical_record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`medical_record` (
  `medical_id` INT NOT NULL,
  `animal` INT NOT NULL,
  `medicine` VARCHAR(45) NULL DEFAULT NULL,
  `medical_condition` VARCHAR(100) NULL DEFAULT NULL,
  `last_checkup` DATE NULL DEFAULT NULL,
  `veterinarian_name` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`medical_id`),
  UNIQUE INDEX `animal_UNIQUE` (`animal` ASC) VISIBLE,
  UNIQUE INDEX `medical_id_UNIQUE` (`medical_id` ASC) VISIBLE,
  INDEX `FK_animal_id_idx` (`animal` ASC) VISIBLE,
  CONSTRAINT `FK_animal_id`
    FOREIGN KEY (`animal`)
    REFERENCES `ZooDB`.`animal` (`animal_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`medical_supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`medical_supply` (
  `medical_supply_id` INT NOT NULL,
  `supply_name` VARCHAR(45) NOT NULL,
  `expiration_date` DATE NOT NULL,
  `future_delivery_date` DATE NOT NULL,
  PRIMARY KEY (`medical_supply_id`),
  UNIQUE INDEX `medical_supply_id_UNIQUE` (`medical_supply_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`visitor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`visitor` (
  `visitor_id` INT NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`visitor_id`),
  UNIQUE INDEX `visitor_id_UNIQUE` (`visitor_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`payment_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`payment_info` (
  `payment_id` INT NOT NULL,
  `visitor_permission_id` INT NOT NULL,
  `debit` VARCHAR(20) NOT NULL,
  `credit` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE INDEX `payment_id_UNIQUE` (`payment_id` ASC) VISIBLE,
  UNIQUE INDEX `edit_permission_id_UNIQUE` (`visitor_permission_id` ASC) VISIBLE,
  INDEX `FK_Visitor_ID_idx` (`visitor_permission_id` ASC) VISIBLE,
  CONSTRAINT `FK_Visitor`
    FOREIGN KEY (`visitor_permission_id`)
    REFERENCES `ZooDB`.`visitor` (`visitor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`receipt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`receipt` (
  `receipt_id` INT NOT NULL,
  `view_permission_id` INT NOT NULL,
  `num_adult_ticket` INT NOT NULL,
  `num_child_ticket` INT NOT NULL,
  `total` INT NOT NULL,
  `payment` INT NOT NULL,
  `refundable` TINYINT NOT NULL,
  PRIMARY KEY (`receipt_id`),
  UNIQUE INDEX `receipt_id_UNIQUE` (`receipt_id` ASC) VISIBLE,
  INDEX `Fk_id_visitor_idx` (`view_permission_id` ASC) VISIBLE,
  INDEX `FK_Payment_idx` (`payment` ASC) VISIBLE,
  CONSTRAINT `Fk_id_visitor`
    FOREIGN KEY (`view_permission_id`)
    REFERENCES `ZooDB`.`visitor` (`visitor_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Payment`
    FOREIGN KEY (`payment`)
    REFERENCES `ZooDB`.`payment_info` (`payment_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`ticket` (
  `ticket_id` INT NOT NULL,
  `ticket_type` VARCHAR(25) NOT NULL,
  `price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`ticket_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`time_sheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`time_sheet` (
  `emp_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `start_at` TIME NOT NULL,
  `end_at` TIME NOT NULL,
  `total_hours` INT NOT NULL,
  PRIMARY KEY (`emp_id`, `date`),
  CONSTRAINT `FK_emp_id_1`
    FOREIGN KEY (`emp_id`)
    REFERENCES `ZooDB`.`employee` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`visitor_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`visitor_account` (
  `acc_id` INT NOT NULL,
  `visitor_id` INT NOT NULL,
  `receipt` INT NULL DEFAULT NULL,
  `payment_id` INT NOT NULL,
  PRIMARY KEY (`acc_id`),
  UNIQUE INDEX `acc_id_UNIQUE` (`acc_id` ASC) VISIBLE,
  UNIQUE INDEX `visitor_id_UNIQUE` (`visitor_id` ASC) VISIBLE,
  UNIQUE INDEX `payment_id_UNIQUE` (`payment_id` ASC) VISIBLE,
  UNIQUE INDEX `receipt_UNIQUE` (`receipt` ASC) VISIBLE,
  INDEX `FK_Visitor_id_idx` (`visitor_id` ASC) VISIBLE,
  CONSTRAINT `FK_Visitor_id`
    FOREIGN KEY (`visitor_id`)
    REFERENCES `ZooDB`.`visitor` (`visitor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ZooDB`.`zoo_expense`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ZooDB`.`zoo_expense` (
  `expense_id` INT NOT NULL,
  `expense_type` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `cost` INT NOT NULL,
  PRIMARY KEY (`expense_id`),
  UNIQUE INDEX `expense_id_UNIQUE` (`expense_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
