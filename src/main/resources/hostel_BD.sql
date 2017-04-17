-- MySQL Script generated by MySQL Workbench
-- Wed Apr 12 11:20:46 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Hostel
-- -----------------------------------------------------
-- Hostel system. The client fills in the Request for booking or for complete payment specifying necessary number of places. The administrator confirms (rejects) the arrived Request, does discounts to regular customers, puts a ban to the clients who violated rules of system.

-- -----------------------------------------------------
-- Schema Hostel
--
-- Hostel system. The client fills in the Request for booking or for complete payment specifying necessary number of places. The administrator confirms (rejects) the arrived Request, does discounts to regular customers, puts a ban to the clients who violated rules of system.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hostel` DEFAULT CHARACTER SET utf8 ;
USE `Hostel` ;

-- -----------------------------------------------------
-- Table `Hostel`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hostel`.`User` (
  `u_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role` BIT(1) NOT NULL DEFAULT 1 COMMENT 'Shows role( 1 - User , 0 - Admin)',
  `name` VARCHAR(45) NOT NULL COMMENT 'Client\'s name',
  `surname` VARCHAR(45) NOT NULL COMMENT 'Client\'s surname',
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 - the user is banned. If client wasn\'t banned field value is NULL',
  PRIMARY KEY (`u_id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC))
ENGINE = InnoDB
COMMENT = 'Client Table. It represents the client entity. The client has a role (user or admin), name, offer, as well as banned attribute (banned or not).';


-- -----------------------------------------------------
-- Table `Hostel`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hostel`.`Room` (
  `r_id` TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Each room is unique.I think that\'s enough 255 hostel rooms',
  `room_number` TINYINT(3) UNSIGNED NOT NULL,
  `room_places` TINYINT(3) UNSIGNED NOT NULL COMMENT 'Shows how many places in the room',
  `price` DECIMAL(5,2) UNSIGNED NOT NULL COMMENT 'It shows the cost of the room, use decimal.',
  `status` TINYINT(2) NOT NULL DEFAULT 0 COMMENT '0-FREE, 1-BOOKED, 2-TAKEN',
  PRIMARY KEY (`r_id`))
ENGINE = InnoDB
COMMENT = 'Table room. The room has a number of places and price.';


-- -----------------------------------------------------
-- Table `Hostel`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hostel`.`Order` (
  `o_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `arrival_date` DATE NOT NULL COMMENT 'It shows the client arrival date',
  `depature_date` DATE NOT NULL COMMENT 'It shows the client departure date',
  `places_amount` TINYINT(3) UNSIGNED NOT NULL COMMENT 'It shows the number of visitors',
  `pay_type` TINYINT(1) NOT NULL COMMENT 'It shows the type of payment(1 - booking ; 0 - complete payment)',
  `discount` DECIMAL(4,2) NULL DEFAULT 0,
  `status` TINYINT(1) NULL DEFAULT 0 COMMENT 'It shows order status ( 0-new,1 - confirmed , 2 - (not confirmed) rejected, 3 - archived). ',
  `User_id` INT UNSIGNED NOT NULL COMMENT 'Shows client ID',
  `Room_id` TINYINT(3) UNSIGNED NOT NULL,
  `approver_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  INDEX `fk_Application_Client1_idx` (`User_id` ASC),
  INDEX `fk_Order_Room1_idx` (`Room_id` ASC),
  CONSTRAINT `fk_Application_Client1`
    FOREIGN KEY (`User_id`)
    REFERENCES `Hostel`.`User` (`u_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Room1`
    FOREIGN KEY (`Room_id`)
    REFERENCES `Hostel`.`Room` (`r_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'Table application. The application consists of the arrival date, departure date, number of places required, type of payment (complete payment of booking), as well as  the confirmed field (confirmed or not confirmed(rejected)) . ';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Hostel`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `Hostel`;
INSERT INTO `Hostel`.`User` (`u_id`, `role`, `name`, `surname`, `login`, `password`, `status`) VALUES (1, 0, 'Админ', 'Админ', 'админ', md5('admin1'), 1);
INSERT INTO `Hostel`.`User` (`u_id`, `role`, `name`, `surname`, `login`, `password`, `status`) VALUES (2, 1, 'Иван', 'Петров', 'петров_ваня', md5('petrof123'), 1);
INSERT INTO `Hostel`.`User` (`u_id`, `role`, `name`, `surname`, `login`, `password`, `status`) VALUES (3, 1, 'Андрей', 'Серов', 'серов_андр', md5('sero4'), 1);
INSERT INTO `Hostel`.`User` (`u_id`, `role`, `name`, `surname`, `login`, `password`, `status`) VALUES (4, 1, 'Виктор', 'Соболев', 'соболев_витя', md5('sobole4vit9'), 1);
INSERT INTO `Hostel`.`User` (`u_id`, `role`, `name`, `surname`, `login`, `password`, `status`) VALUES (5, 1, 'Дмитрий', 'Аверин', 'дима_авер', md5('d1man'), 1);
INSERT INTO `Hostel`.`User` (`u_id`, `role`, `name`, `surname`, `login`, `password`, `status`) VALUES (6, 1, 'Ольга', 'Токарева', 'оля_ток', md5('ol9тtokarev4a'), 0);
INSERT INTO `Hostel`.`User` (`u_id`, `role`, `name`, `surname`, `login`, `password`, `status`) VALUES (7, 1, 'Петр', 'Демидов', 'петя_демид', md5('demido4'), 1);
INSERT INTO `Hostel`.`User` (`u_id`, `role`, `name`, `surname`, `login`, `password`, `status`) VALUES (8, 1, 'Екатерина', 'Власова', 'катя_влас', md5('kat9vlas'), 1);
INSERT INTO `Hostel`.`User` (`u_id`, `role`, `name`, `surname`, `login`, `password`, `status`) VALUES (9, 1, 'Игорь', 'Вершаль', 'игорь', md5('igor1'), 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Hostel`.`Room`
-- -----------------------------------------------------
START TRANSACTION;
USE `Hostel`;
INSERT INTO `Hostel`.`Room` (`r_id`, `room_number`, `room_places`, `price`, `status`) VALUES (1, 1, 2, 5.25, 1);
INSERT INTO `Hostel`.`Room` (`r_id`, `room_number`, `room_places`, `price`, `status`) VALUES (2, 2, 2, 5.45, 1);
INSERT INTO `Hostel`.`Room` (`r_id`, `room_number`, `room_places`, `price`, `status`) VALUES (3, 3, 3, 10.25, 2);
INSERT INTO `Hostel`.`Room` (`r_id`, `room_number`, `room_places`, `price`, `status`) VALUES (4, 4, 3, 10, 1);
INSERT INTO `Hostel`.`Room` (`r_id`, `room_number`, `room_places`, `price`, `status`) VALUES (5, 5, 4, 15, 2);
INSERT INTO `Hostel`.`Room` (`r_id`, `room_number`, `room_places`, `price`, `status`) VALUES (6, 6, 5, 20, 2);
INSERT INTO `Hostel`.`Room` (`r_id`, `room_number`, `room_places`, `price`, `status`) VALUES (7, 7, 6, 25, 2);
INSERT INTO `Hostel`.`Room` (`r_id`, `room_number`, `room_places`, `price`, `status`) VALUES (8, 8, 4, 12.50, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Hostel`.`Order`
-- -----------------------------------------------------
START TRANSACTION;
USE `Hostel`;
INSERT INTO `Hostel`.`Order` (`o_id`, `arrival_date`, `depature_date`, `places_amount`, `pay_type`, `discount`, `status`, `User_id`, `Room_id`, `approver_id`) VALUES (1, '2017.02.22', '2017.02.24', 2, 0, 0, 1, 2, 1, NULL);
INSERT INTO `Hostel`.`Order` (`o_id`, `arrival_date`, `depature_date`, `places_amount`, `pay_type`, `discount`, `status`, `User_id`, `Room_id`, `approver_id`) VALUES (2, '2017.02.24', '2017.02.26', 2, 1, 0, 1, 3, 2, NULL);
INSERT INTO `Hostel`.`Order` (`o_id`, `arrival_date`, `depature_date`, `places_amount`, `pay_type`, `discount`, `status`, `User_id`, `Room_id`, `approver_id`) VALUES (3, '2017.02.24', '2017.02.27', 3, 1, 0, 0, 4, 3, NULL);
INSERT INTO `Hostel`.`Order` (`o_id`, `arrival_date`, `depature_date`, `places_amount`, `pay_type`, `discount`, `status`, `User_id`, `Room_id`, `approver_id`) VALUES (4, '2017.02.25', '2017.02.28', 3, 0, 0, 1, 5, 4, NULL);
INSERT INTO `Hostel`.`Order` (`o_id`, `arrival_date`, `depature_date`, `places_amount`, `pay_type`, `discount`, `status`, `User_id`, `Room_id`, `approver_id`) VALUES (5, '2017.03.01', '2017.03.03', 4, 1, 0, 2, 6, 5, NULL);
INSERT INTO `Hostel`.`Order` (`o_id`, `arrival_date`, `depature_date`, `places_amount`, `pay_type`, `discount`, `status`, `User_id`, `Room_id`, `approver_id`) VALUES (6, '2017.03.04', '2017.03.05', 5, 1, 0, 0, 7, 6, NULL);
INSERT INTO `Hostel`.`Order` (`o_id`, `arrival_date`, `depature_date`, `places_amount`, `pay_type`, `discount`, `status`, `User_id`, `Room_id`, `approver_id`) VALUES (7, '2017.03.04', '2017.03.06', 6, 0, 0, 3, 8, 7, NULL);

COMMIT;

