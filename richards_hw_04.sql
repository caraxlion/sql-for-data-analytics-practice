-- ITP 249 HW 4
-- Caroline Richards, csrichar@usc.edu

USE csrichar; /* Use your schema */

SET FOREIGN_KEY_CHECKS = 0; /* Disable referential integrity check */

-- start creating tables
CREATE TABLE VENDOR (
V_CODE 		int 			NOT NULL,
V_NAME 		varchar(35) 	NOT NULL,
V_CONTACT 	varchar(15) 	NOT NULL,
V_AREACODE 	char(3) 		NOT NULL,
V_PHONE 	char(8) 		NOT NULL,
V_STATE 	char(2) 		NOT NULL,
V_ORDER 	char(1) 		NOT NULL,
PRIMARY KEY (V_CODE));

CREATE TABLE PRODUCT (
P_CODE 			varchar(10) 	NOT NULL,
P_DESCRIPT 		varchar(35) 	NOT NULL,
P_INDATE 		date 			NOT NULL,
P_QOH 			int 			NOT NULL,
P_MIN 			int 			NOT NULL,
P_PRICE 		decimal(8,2) 	NOT NULL,
P_DISCOUNT 		decimal(5,2) 	NOT NULL,
V_CODE 			int 			NOT NULL,
PRIMARY KEY (P_CODE),
FOREIGN KEY (V_CODE) REFERENCES VENDOR(V_CODE));

CREATE TABLE CUSTOMER (
CUS_CODE 		int 			NOT NULL,
CUS_LNAME 		varchar(15) 	NOT NULL,
CUS_FNAME 		varchar(15) 	NOT NULL,
CUS_INITIAL 	char(1),
CUS_AREACODE 	char(3) 		NOT NULL,
CUS_PHONE 		char(8) 		NOT NULL,
CUS_BALANCE 	decimal(9,2),
PRIMARY KEY (CUS_CODE));

CREATE TABLE INVOICE (
INV_NUMBER 		int 		NOT NULL,
CUS_CODE 		int 		NOT NULL,
INV_DATE 		date 		NOT NULL,
PRIMARY KEY (INV_NUMBER),
FOREIGN KEY (CUS_CODE) REFERENCES CUSTOMER(CUS_CODE));

CREATE TABLE LINE (
INV_NUMBER 		int 			NOT NULL,
LINE_NUMBER 	decimal(2,0) 	NOT NULL,
P_CODE 			varchar(10) 	NOT NULL,
LINE_UNITS 		decimal(9,2) 	NOT NULL,
LINE_PRICE 		decimal(9,2) 	NOT NULL,
PRIMARY KEY (LINE_NUMBER),
FOREIGN KEY (INV_NUMBER) REFERENCES INVOICE(INV_NUMBER),
FOREIGN KEY (P_CODE) REFERENCES PRODUCT(P_CODE));

SET FOREIGN_KEY_CHECKS = 1; /* ENABLE referential integrity check */

-- SELECT * FROM csrichar.tablename;

-- insert last row into product table
INSERT INTO `csrichar`.`product` (`P_CODE`, `P_DESCRIPT`, `P_INDATE`, `P_QOH`, `P_MIN`, `P_PRICE`, `P_DISCOUNT`, `V_CODE`) VALUES ('WR3/TT3', 'Steel matting, 4\'x8\'x1/6\", .5\"mesh', '2014-01-17', '18', '5', '119.95', '0.1', '25595');
