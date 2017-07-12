-- -----------------------------------------------------
-- Schema decodemtl_addressbook_import
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `decodemtl_addressbook` ;

-- -----------------------------------------------------
-- Schema decodemtl_addressbook_import/ comment
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `decodemtl_addressbook` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

USE `decodemtl_addressbook` ;

-- -----------------------------------------------------
-- Table `decodemtl_addressbook_import`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `decodemtl_addressbook`.`Account` ;

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook`.`Account` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `email` VARCHAR(255) NOT NULL COMMENT '',
  `password` VARCHAR(40) NOT NULL COMMENT '',
  `createdOn` DATETIME NOT NULL COMMENT '',
  `modifiedOn` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO decodemtl_addressbook.Account (email, password, createdOn, modifiedOn)
  VALUES
  ('abc@gmail.com' , 'passw8rd', '2017-07-10 08:15:00', '2017-07-11 08:15:00')
;
SELECT * FROM decodemtl_addressbook.Account;

UPDATE decodemtl_addressbook.Account SET email='abc@hotmail.com' WHERE id=1;

SELECT * FROM decodemtl_addressbook.Account;

-- -----------------------------------------------------
-- Table `decodemtl_addressbook_import`.`AddressBook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `decodemtl_addressbook`.`AddressBook` ;

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook`.`AddressBook` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `accountId` INT NOT NULL COMMENT '',
  `name` VARCHAR(255) NOT NULL COMMENT '',
  `createdOn` DATETIME NOT NULL COMMENT '',
  `modifiedOn` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;

INSERT INTO decodemtl_addressbook.AddressBook (accountId, name, createdOn, modifiedOn)
  VALUES
  (1786448 , 'Joe Perrier', '2017-07-10 08:15:00', '2017-07-11 08:15:00')
;
SELECT * FROM decodemtl_addressbook.AddressBook;

UPDATE decodemtl_addressbook.AddressBook SET accountId=2786448 WHERE id=1;

DELETE FROM decodemtl_addressbook.AddressBook;

SELECT * FROM decodemtl_addressbook.AddressBook;

-- -----------------------------------------------------
-- Table `decodemtl_addressbook_import`.`Entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `decodemtl_addressbook`.`Entry` ;

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook`.`Entry` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `addressBookId` INT NOT NULL COMMENT '',
  `firstName` VARCHAR(255) NOT NULL COMMENT '',
  `lastName` VARCHAR(255) NULL COMMENT '',
  `birthday` DATETIME NULL COMMENT '',
  `type` ENUM('home', 'work', 'other') NOT NULL COMMENT '',
  `subtype` ENUM('phone', 'address', 'email') NOT NULL COMMENT '',
  `contentLineOne` VARCHAR(255) NOT NULL COMMENT '',
  `contentLineTwo` VARCHAR(255) NULL COMMENT '',
  `contentLineThree` VARCHAR(255) NULL COMMENT '',
  `contentLineFour` VARCHAR(255) NULL COMMENT '',
  `contentLineFive` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;

-- UPDATE decodemtl_addressbook.Entry SET accountId=2786448 WHERE id=1;

INSERT INTO decodemtl_addressbook.Entry
  (addressBookId, firstName, lastName, birthday, type, subtype
  , contentLineOne, contentLineTwo, contentLineThree
, contentLineFour, contentLineFive)
  VALUES
  (178644890 , 'Joe', 'Perrier',  '2000-07-10 08:15:00', 'home', 'email'
    ,'sdjkfnskjfn','sjkfbasljkf','sjhfbashj','dhjfbasjhf','jhsdbfaj')
    , (178623890 , 'Peter', 'Perrier',  '2000-02-20 08:15:00', 'work', 'address'
      ,'sdjkfnskjfn','sjkfbasljkf','sjhfbashj','dhjfbasjhf','jhsdbfaj')
      , (111167890 , 'Jenny', 'Perrier',  '1992-07-10 08:15:00', 'other', 'phone'
        ,'sdjjukjfn','sjjjjbasljkf','zzzfbashj','dhjfbasjhfzz','jhfaj')
;
SELECT * FROM decodemtl_addressbook.Entry;

UPDATE decodemtl_addressbook.Entry SET lastName='Perry' WHERE lastName='Perrier';

TRUNCATE decodemtl_addressbook.Entry;


-- /usr/local/mysql/bin/mysqldump -u root -p backuptables.sql
-- < /Users/admin/Desktop/mysql-workshop-2/data/database_addressbook.sql ;
-- DOESN'T WORK :(
