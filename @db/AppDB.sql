#
# DUMP FILE
#
# Database is ported from MS Access
#------------------------------------------------------------------
# Created using "MS Access to MySQL" form http://www.bullzip.com
# Program Version 5.5.282
#
# OPTIONS:
#   sourcefilename=C:/Users/Sixto/Pictures/AppWeb/b/DB_App.mdb
#   sourceusername=
#   sourcepassword=
#   sourcesystemdatabase=
#   destinationdatabase=AppDB
#   storageengine=MyISAM
#   dropdatabase=0
#   createtables=1
#   unicode=1
#   autocommit=1
#   transferdefaultvalues=1
#   transferindexes=1
#   transferautonumbers=1
#   transferrecords=1
#   columnlist=1
#   tableprefix=
#   negativeboolean=0
#   ignorelargeblobs=0
#   memotype=LONGTEXT
#   datetimetype=DATETIME
#

CREATE DATABASE IF NOT EXISTS `AppDB`;
USE `AppDB`;

#
# Table structure for table 'Drillstring'
#

DROP TABLE IF EXISTS `Drillstring`;

CREATE TABLE `Drillstring` (
  `DS_ID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ProjectID` INTEGER DEFAULT 0, 
  `Description` VARCHAR(255), 
  `Bit_type` INTEGER DEFAULT 0, 
  `Bit_position` FLOAT NULL DEFAULT 0, 
  `Bit_Size` FLOAT NULL DEFAULT 0, 
  `Bit_TFA` FLOAT NULL DEFAULT 0, 
  `PWD_Distance` FLOAT NULL DEFAULT 0, 
  `PWD_Drop` FLOAT NULL DEFAULT 0, 
  INDEX (`DS_ID`), 
  PRIMARY KEY (`DS_ID`), 
  INDEX (`ProjectID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Drillstring'
#

INSERT INTO `Drillstring` (`DS_ID`, `ProjectID`, `Description`, `Bit_type`, `Bit_position`, `Bit_Size`, `Bit_TFA`, `PWD_Distance`, `PWD_Drop`) VALUES (1, 1, 'BHA#1', 1, 5200, 6.5, .775, 100, 200);
INSERT INTO `Drillstring` (`DS_ID`, `ProjectID`, `Description`, `Bit_type`, `Bit_position`, `Bit_Size`, `Bit_TFA`, `PWD_Distance`, `PWD_Drop`) VALUES (2, 1, 'BHA#2', 1, 8200, 8.25, .775, 1000, 20);
INSERT INTO `Drillstring` (`DS_ID`, `ProjectID`, `Description`, `Bit_type`, `Bit_position`, `Bit_Size`, `Bit_TFA`, `PWD_Distance`, `PWD_Drop`) VALUES (3, 1, 'BHA#3', 1, 3200, 8.5, .775, 1000, 0);
INSERT INTO `Drillstring` (`DS_ID`, `ProjectID`, `Description`, `Bit_type`, `Bit_position`, `Bit_Size`, `Bit_TFA`, `PWD_Distance`, `PWD_Drop`) VALUES (4, 2, 'BHA#1x2', 1, 6200, 6.45, .775, 500, 0);
INSERT INTO `Drillstring` (`DS_ID`, `ProjectID`, `Description`, `Bit_type`, `Bit_position`, `Bit_Size`, `Bit_TFA`, `PWD_Distance`, `PWD_Drop`) VALUES (5, 3, 'BHA#1x3', 1, 5400, 6.35, .775, 0, 270);
INSERT INTO `Drillstring` (`DS_ID`, `ProjectID`, `Description`, `Bit_type`, `Bit_position`, `Bit_Size`, `Bit_TFA`, `PWD_Distance`, `PWD_Drop`) VALUES (6, 4, 'BHA#1x4', 1, 2000, 6.25, .775, 200, 0);
INSERT INTO `Drillstring` (`DS_ID`, `ProjectID`, `Description`, `Bit_type`, `Bit_position`, `Bit_Size`, `Bit_TFA`, `PWD_Distance`, `PWD_Drop`) VALUES (7, 5, 'BHA#1x5', 1, 3450, 6.5, .775, 150, 300);
INSERT INTO `Drillstring` (`DS_ID`, `ProjectID`, `Description`, `Bit_type`, `Bit_position`, `Bit_Size`, `Bit_TFA`, `PWD_Distance`, `PWD_Drop`) VALUES (8, 6, 'BHA#1x6', 1, 5900, 6, .775, 0, 250);
# 8 records

#
# Table structure for table 'DS_Comp'
#

DROP TABLE IF EXISTS `DS_Comp`;

CREATE TABLE `DS_Comp` (
  `Comp_ID` INTEGER NOT NULL AUTO_INCREMENT, 
  `DS_ID` INTEGER DEFAULT 0, 
  `Description` VARCHAR(255), 
  `OD` FLOAT NULL DEFAULT 0, 
  `ID` FLOAT NULL DEFAULT 0, 
  `TJ` FLOAT NULL DEFAULT 0, 
  `Weight` FLOAT NULL DEFAULT 0, 
  `Lenght` FLOAT NULL DEFAULT 0, 
  INDEX (`Comp_ID`), 
  INDEX (`DS_ID`), 
  INDEX (`ID`), 
  PRIMARY KEY (`Comp_ID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'DS_Comp'
#

INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (1, 1, 'BHA', 8.25, 3.5, 9, 234, 200);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (2, 1, 'Motor', 8, 4, 9.45, 56.8, 34.87);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (3, 1, 'HWDP', 6, 3.6, 7, 67.3, 345.8);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (4, 1, 'DP', 5, 4, 6.25, 12, 567.7);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (5, 1, 'BHA', 8.25, 3.5, 9, 234, 200);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (6, 1, 'Motor', 8, 4, 9.45, 56.8, 34.87);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (7, 1, 'HWDP', 6, 3.6, 7, 67.3, 345.8);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (8, 2, 'DP', 5, 4, 6.25, 12, 567.7);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (9, 2, 'BHA', 8.25, 3.5, 9, 234, 200);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (10, 2, 'Motor', 8, 4, 9.45, 56.8, 34.87);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (11, 2, 'HWDP', 6, 3.6, 7, 67.3, 345.8);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (12, 2, 'DP', 5, 4, 6.25, 12, 567.7);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (13, 2, 'BHA', 8.25, 3.5, 9, 234, 200);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (14, 2, 'Motor', 8, 4, 9.45, 56.8, 34.87);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (15, 2, 'HWDP', 6, 3.6, 7, 67.3, 345.8);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (16, 4, 'DP', 5, 4, 6.25, 12, 567.7);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (17, 4, 'BHA', 8.25, 3.5, 9, 234, 200);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (18, 4, 'Motor', 8, 4, 9.45, 56.8, 34.87);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (19, 5, 'HWDP', 6, 3.6, 7, 67.3, 345.8);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (20, 5, 'DP', 5, 4, 6.25, 12, 567.7);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (25, 3, 'Stands DP HW 5\"', 5, 3, 6, 150, 268.04);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (26, 3, 'XO 4 1/2\" IF Box X 4 \" IF Pin', 6.5, 3.25, 7.5, 187.5, 3.01);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (27, 3, 'Gauge Carrier', 6.25, 3, 7.25, 181.25, 2.78);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (28, 3, 'XO 4\" IF Box X 4 1/2 IF Pin', 6.5, 3.25, 7.5, 187.5, 2.85);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (29, 3, 'Shock Absorber', 6.5, 2.25, 7.5, 187.5, 10.82);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (30, 3, 'Hammer Jar', 6.75, 2.5, 7.75, 193.75, 16.4);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (31, 3, 'XO', 6.75, 2.8125, 7.75, 193.75, 1.04);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (32, 3, '6 DC ', 6.5, 2.8125, 7.5, 187.5, 186.23);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (33, 3, 'XO', 6.75, 2.8125, 7.75, 193.75, 1.8);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (34, 3, 'DC Monel 6 3/4\"', 6.75, 2.8125, 7.75, 193.75, 29.29);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (35, 3, 'DC Monel 6 5/8\" (MWD)', 6.625, 2.8125, 7.625, 190.625, 29.12);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (36, 3, 'U.B.H.O. 6 3/4\"', 6.75, 2.8125, 7.75, 193.75, 2.42);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (37, 3, 'Stab 6 3/4\" x 8 1/4\"', 6.75, 2.8125, 7.75, 193.75, 4.59);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (38, 3, 'VCP 6 3/4\"', 6.75, 2.8125, 7.75, 193.75, 2.95);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (39, 3, 'Motor PWD 6 3/4\" x 8 1/4\" x 4\"', 6.75, 2.8125, 7.75, 193.75, 26.5);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (21, 6, 'BHA', 8.25, 3.5, 9, 234, 200);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (22, 6, 'Motor', 8, 4, 9.45, 56.8, 34.87);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (23, 6, 'HWDP', 6, 3.6, 7, 67.3, 345.8);
INSERT INTO `DS_Comp` (`Comp_ID`, `DS_ID`, `Description`, `OD`, `ID`, `TJ`, `Weight`, `Lenght`) VALUES (24, 6, 'DP', 5, 4, 6.25, 12, 567.7);
# 39 records

#
# Table structure for table 'FGPressure'
#

DROP TABLE IF EXISTS `FGPressure`;

CREATE TABLE `FGPressure` (
  `FG_ID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ProjectID` INTEGER DEFAULT 0, 
  `TVD` FLOAT NULL DEFAULT 0, 
  `FG` FLOAT NULL DEFAULT 0, 
  `Pressure` FLOAT NULL DEFAULT 0, 
  INDEX (`ProjectID`), 
  INDEX (`FG_ID`), 
  PRIMARY KEY (`FG_ID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'FGPressure'
#

INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (32, 1, 0, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (33, 1, 100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (34, 1, 200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (35, 1, 300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (36, 1, 400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (37, 1, 500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (38, 1, 600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (39, 1, 700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (40, 1, 800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (41, 1, 900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (42, 1, 1000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (43, 1, 1100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (44, 1, 1200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (45, 1, 1300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (46, 1, 1400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (47, 1, 1500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (48, 1, 1600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (49, 1, 1700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (50, 1, 1800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (51, 1, 1900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (52, 1, 2000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (53, 1, 2100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (54, 1, 2200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (55, 1, 2300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (56, 1, 2400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (57, 1, 2500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (58, 1, 2600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (59, 1, 2700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (60, 1, 2800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (61, 1, 2900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (62, 1, 3000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (63, 1, 3100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (64, 1, 3200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (65, 1, 3300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (66, 1, 3400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (67, 1, 3500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (68, 1, 3600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (69, 1, 3700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (70, 1, 3800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (71, 1, 3900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (72, 1, 4000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (73, 1, 4100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (74, 1, 4200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (75, 1, 4300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (76, 1, 4400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (77, 1, 4500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (78, 1, 4600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (79, 1, 4700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (80, 1, 4800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (81, 1, 4900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (82, 1, 5000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (83, 1, 5100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (84, 1, 5200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (85, 1, 5300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (86, 1, 5400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (87, 1, 5500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (88, 1, 5600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (89, 1, 5700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (90, 1, 5800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (91, 1, 5900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (92, 1, 6000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (93, 1, 6180.8, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (94, 1, 6199.8, 14.35, 2489.13);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (95, 1, 6221.5, 14.35, 2492.74);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (96, 1, 6243.4, 14.35, 2496.39);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (97, 1, 6265.7, 14.35, 2500.11);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (98, 1, 6287.7, 14.35, 2503.78);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (99, 1, 6298.9, 14.35, 2505.64);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (100, 1, 6337.3, 14.35, 2512.04);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (101, 1, 6362.5, 14.35, 2516.24);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (102, 1, 6388.1, 14.35, 2520.51);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (103, 1, 6412.7, 14.35, 2524.61);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (104, 1, 6436.4, 14.35, 2528.56);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (105, 1, 6459.6, 14.35, 2532.42);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (106, 1, 6482.6, 14.35, 2536.25);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (107, 1, 6497.4, 14.35, 2538.72);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (108, 1, 6538.4, 14.35, 2545.55);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (109, 1, 6568.9, 14.35, 2550.64);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (110, 1, 6599.4, 14.35, 2555.72);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (111, 1, 6629.9, 14.35, 2560.79);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (112, 1, 6659.1, 14.35, 2565.71);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (113, 1, 6683.1, 14.35, 2570.03);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (114, 1, 6701.8, 14.35, 2573.65);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (115, 1, 6719.5, 14.35, 2577.35);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (116, 1, 6736.9, 14.35, 2580.98);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (117, 1, 6753.6, 14.35, 2584.47);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (118, 1, 6770, 14.35, 2587.9);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (119, 1, 6786.1, 14.35, 2591.26);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (120, 1, 6801.5, 14.35, 2594.96);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (121, 1, 6816.6, 14.35, 2598.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (122, 1, 6831.4, 14.35, 2602.62);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (123, 1, 6845.8, 14.35, 2606.31);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (124, 1, 6859.9, 14.35, 2609.92);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (125, 1, 6873.7, 14.35, 2613.46);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (126, 1, 6887.1, 14.35, 2616.89);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (127, 1, 6900.6, 14.35, 2620.84);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (128, 1, 6913.7, 14.35, 2624.78);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (129, 1, 6926.5, 14.35, 2628.63);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (130, 1, 6939.3, 14.35, 2632.48);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (131, 1, 6951.8, 14.35, 2636.24);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (132, 1, 6959, 14.35, 2638.41);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (133, 1, 6979.7, 14.35, 2644.64);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (134, 1, 6993.4, 14.35, 2649);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (135, 1, 7006.9, 14.35, 2653.67);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (136, 1, 7019.7, 14.35, 2658.09);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (137, 1, 7032.8, 14.35, 2662.62);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (138, 1, 7045.3, 14.35, 2666.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (139, 1, 7057.7, 14.35, 2671.23);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (140, 1, 7070.2, 14.35, 2675.56);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (141, 1, 7076.8, 14.35, 2677.84);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (142, 1, 7094.5, 14.35, 2684.29);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (143, 1, 7106.3, 14.35, 2688.87);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (144, 1, 7117.8, 14.35, 2693.33);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (145, 1, 7129.3, 14.35, 2697.79);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (146, 1, 7140.1, 14.35, 2701.98);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (147, 1, 7148, 14.35, 2705.05);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (148, 1, 7152.6, 14.35, 2706.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (149, 1, 7157.8, 14.35, 2708.85);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (150, 1, 7163.1, 14.35, 2710.91);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (151, 1, 7168.3, 14.35, 2712.93);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (152, 1, 7174.2, 14.35, 2715.22);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (153, 1, 7180.1, 14.35, 2717.5);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (154, 1, 7186.7, 14.35, 2720.11);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (155, 1, 7193.2, 14.35, 2722.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (156, 1, 7199.8, 14.35, 2725.59);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (157, 1, 7199.8, 15.38, 2921.22);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (158, 1, 7223.4, 15.38, 2932.14);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (159, 1, 7236.9, 15.38, 2938.41);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (160, 1, 7250, 15.38, 2944.48);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (161, 1, 7262.8, 15.38, 2950.42);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (162, 1, 7275.6, 15.38, 2956.36);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (163, 1, 7288.4, 15.38, 2962.4);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (164, 1, 7300.5, 15.38, 2968.48);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (165, 1, 7313, 15.38, 2974.75);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (166, 1, 7325.1, 15.38, 2980.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (167, 1, 7336.9, 15.38, 2986.75);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (168, 1, 7348.8, 15.38, 2992.73);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (169, 1, 7360.6, 15.38, 2998.65);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (170, 1, 7372, 15.38, 3004.37);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (171, 1, 7383.5, 15.38, 3010.2);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (172, 1, 7392.1, 15.38, 3014.82);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (173, 1, 7405.8, 15.38, 3022.19);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (174, 1, 7417, 15.38, 3028.2);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (175, 1, 7422.9, 15.38, 3031.37);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (176, 1, 7437.7, 15.38, 3039.33);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (177, 1, 7447.8, 15.38, 3044.75);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (178, 1, 7458, 15.38, 3050.24);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (179, 1, 7467.8, 15.38, 3055.59);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (180, 1, 7477.7, 15.38, 3061.14);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (181, 1, 7487.5, 15.38, 3066.66);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (182, 1, 7497.4, 15.38, 3072.26);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (183, 1, 7507.2, 15.38, 3077.8);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (184, 1, 7516.7, 15.38, 3083.17);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (185, 1, 7526.6, 15.38, 3088.76);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (186, 1, 7536.1, 15.38, 3094.13);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (187, 1, 7545.6, 15.38, 3099.5);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (188, 1, 7555.4, 15.38, 3105.03);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (189, 1, 7565, 15.38, 3110.46);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (190, 1, 7574.1, 15.38, 3115.6);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (191, 1, 7583.7, 15.38, 3121.11);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (192, 1, 7592.2, 15.38, 3126.05);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (193, 1, 7600.4, 15.38, 3130.81);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (194, 1, 7608.6, 15.38, 3135.58);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (195, 1, 7616.8, 15.38, 3140.34);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (196, 1, 7625, 15.38, 3145.11);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (197, 1, 7632.2, 15.38, 3149.29);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (198, 1, 7637.1, 15.38, 3152.14);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (199, 1, 7642.1, 15.38, 3155.04);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (200, 1, 7646.7, 15.38, 3157.72);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (201, 1, 7651.2, 15.38, 3160.33);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (202, 1, 7655.5, 15.38, 3162.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (203, 1, 7659.8, 15.38, 3165.33);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (204, 1, 7663.7, 15.38, 3167.6);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (205, 1, 7667.7, 15.38, 3169.92);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (206, 1, 7671.6, 15.38, 3172.19);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (207, 1, 7675.2, 15.38, 3174.28);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (208, 1, 7678.8, 15.38, 3176.38);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (209, 1, 7682.1, 15.38, 3178.32);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (210, 1, 7685.4, 15.38, 3180.25);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (211, 1, 7690.3, 15.38, 3183.13);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (212, 1, 7697.2, 15.38, 3187.18);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (213, 1, 7704.4, 15.38, 3191.4);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (214, 1, 7711.3, 15.38, 3195.5);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (215, 1, 7711.3, 13.98, 2904.62);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (216, 1, 7725.1, 13.98, 2912.12);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (217, 1, 7732, 13.98, 2915.87);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (218, 1, 7738.8, 13.98, 2919.57);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (219, 1, 7745.7, 13.98, 2923.32);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (220, 1, 7752.6, 13.98, 2927.07);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (221, 1, 7759.5, 13.98, 2930.82);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (222, 1, 7766.4, 13.98, 2934.57);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (223, 1, 7773.3, 13.98, 2938.32);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (224, 1, 7779.9, 13.98, 2941.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (225, 1, 7786.7, 13.98, 2945.7);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (226, 1, 7793.6, 13.98, 2949.51);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (227, 1, 7800.2, 13.98, 2953.16);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (228, 1, 7807.1, 13.98, 2956.97);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (229, 1, 7813.6, 13.98, 2960.56);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (230, 1, 7820.5, 13.98, 2964.37);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (231, 1, 7827.1, 13.98, 2968.02);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (232, 1, 7834, 13.98, 2971.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (233, 1, 7840.6, 13.98, 2975.48);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (234, 1, 7847.1, 13.98, 2979.07);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (235, 1, 7853.7, 13.98, 2982.72);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (236, 1, 7860.6, 13.98, 2986.53);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (237, 1, 7867.1, 13.98, 2990.12);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (238, 1, 7874, 13.98, 2994.93);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (239, 2, 0, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (240, 2, 100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (241, 2, 200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (242, 2, 300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (243, 2, 400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (244, 2, 500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (245, 2, 600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (246, 2, 700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (247, 2, 800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (248, 2, 900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (249, 2, 1000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (250, 2, 1100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (251, 2, 1200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (252, 2, 1300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (253, 2, 1400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (254, 2, 1500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (255, 2, 1600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (256, 2, 1700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (257, 2, 1800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (258, 2, 1900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (259, 2, 2000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (260, 2, 2100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (261, 2, 2200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (262, 2, 2300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (263, 2, 2400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (264, 2, 2500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (265, 2, 2600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (266, 2, 2700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (267, 2, 2800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (268, 2, 2900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (269, 2, 3000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (270, 2, 3100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (271, 2, 3200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (272, 2, 3300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (273, 2, 3400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (274, 2, 3500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (275, 2, 3600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (276, 2, 3700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (277, 2, 3800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (278, 2, 3900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (279, 2, 4000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (280, 2, 4100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (281, 2, 4200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (282, 2, 4300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (283, 2, 4400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (284, 2, 4500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (285, 2, 4600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (286, 2, 4700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (287, 2, 4800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (288, 2, 4900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (289, 2, 5000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (290, 2, 5100, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (291, 2, 5200, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (292, 2, 5300, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (293, 2, 5400, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (294, 2, 5500, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (295, 2, 5600, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (296, 2, 5700, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (297, 2, 5800, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (298, 2, 5900, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (299, 2, 6000, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (300, 2, 6180.8, 14.35, 2485.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (301, 2, 6199.8, 14.35, 2489.13);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (302, 2, 6221.5, 14.35, 2492.74);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (303, 2, 6243.4, 14.35, 2496.39);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (304, 2, 6265.7, 14.35, 2500.11);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (305, 2, 6287.7, 14.35, 2503.78);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (306, 2, 6298.9, 14.35, 2505.64);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (307, 2, 6337.3, 14.35, 2512.04);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (308, 2, 6362.5, 14.35, 2516.24);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (309, 2, 6388.1, 14.35, 2520.51);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (310, 2, 6412.7, 14.35, 2524.61);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (311, 2, 6436.4, 14.35, 2528.56);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (312, 2, 6459.6, 14.35, 2532.42);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (313, 2, 6482.6, 14.35, 2536.25);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (314, 2, 6497.4, 14.35, 2538.72);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (315, 2, 6538.4, 14.35, 2545.55);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (316, 2, 6568.9, 14.35, 2550.64);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (317, 2, 6599.4, 14.35, 2555.72);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (318, 2, 6629.9, 14.35, 2560.79);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (319, 2, 6659.1, 14.35, 2565.71);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (320, 2, 6683.1, 14.35, 2570.03);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (321, 2, 6701.8, 14.35, 2573.65);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (322, 2, 6719.5, 14.35, 2577.35);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (323, 2, 6736.9, 14.35, 2580.98);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (324, 2, 6753.6, 14.35, 2584.47);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (325, 2, 6770, 14.35, 2587.9);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (326, 2, 6786.1, 14.35, 2591.26);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (327, 2, 6801.5, 14.35, 2594.96);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (328, 2, 6816.6, 14.35, 2598.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (329, 2, 6831.4, 14.35, 2602.62);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (330, 2, 6845.8, 14.35, 2606.31);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (331, 2, 6859.9, 14.35, 2609.92);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (332, 2, 6873.7, 14.35, 2613.46);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (333, 2, 6887.1, 14.35, 2616.89);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (334, 2, 6900.6, 14.35, 2620.84);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (335, 2, 6913.7, 14.35, 2624.78);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (336, 2, 6926.5, 14.35, 2628.63);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (337, 2, 6939.3, 14.35, 2632.48);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (338, 2, 6951.8, 14.35, 2636.24);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (339, 2, 6959, 14.35, 2638.41);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (340, 2, 6979.7, 14.35, 2644.64);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (341, 2, 6993.4, 14.35, 2649);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (342, 2, 7006.9, 14.35, 2653.67);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (343, 2, 7019.7, 14.35, 2658.09);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (344, 2, 7032.8, 14.35, 2662.62);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (345, 2, 7045.3, 14.35, 2666.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (346, 2, 7057.7, 14.35, 2671.23);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (347, 2, 7070.2, 14.35, 2675.56);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (348, 2, 7076.8, 14.35, 2677.84);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (349, 2, 7094.5, 14.35, 2684.29);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (350, 2, 7106.3, 14.35, 2688.87);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (351, 2, 7117.8, 14.35, 2693.33);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (352, 2, 7129.3, 14.35, 2697.79);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (353, 2, 7140.1, 14.35, 2701.98);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (354, 2, 7148, 14.35, 2705.05);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (355, 2, 7152.6, 14.35, 2706.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (356, 2, 7157.8, 14.35, 2708.85);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (357, 2, 7163.1, 14.35, 2710.91);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (358, 2, 7168.3, 14.35, 2712.93);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (359, 2, 7174.2, 14.35, 2715.22);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (360, 2, 7180.1, 14.35, 2717.5);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (361, 2, 7186.7, 14.35, 2720.11);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (362, 2, 7193.2, 14.35, 2722.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (363, 2, 7199.8, 14.35, 2725.59);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (364, 2, 7199.8, 15.38, 2921.22);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (365, 2, 7223.4, 15.38, 2932.14);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (366, 2, 7236.9, 15.38, 2938.41);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (367, 2, 7250, 15.38, 2944.48);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (368, 2, 7262.8, 15.38, 2950.42);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (369, 2, 7275.6, 15.38, 2956.36);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (370, 2, 7288.4, 15.38, 2962.4);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (371, 2, 7300.5, 15.38, 2968.48);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (372, 2, 7313, 15.38, 2974.75);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (373, 2, 7325.1, 15.38, 2980.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (374, 2, 7336.9, 15.38, 2986.75);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (375, 2, 7348.8, 15.38, 2992.73);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (376, 2, 7360.6, 15.38, 2998.65);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (377, 2, 7372, 15.38, 3004.37);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (378, 2, 7383.5, 15.38, 3010.2);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (379, 2, 7392.1, 15.38, 3014.82);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (380, 2, 7405.8, 15.38, 3022.19);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (381, 2, 7417, 15.38, 3028.2);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (382, 2, 7422.9, 15.38, 3031.37);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (383, 2, 7437.7, 15.38, 3039.33);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (384, 2, 7447.8, 15.38, 3044.75);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (385, 2, 7458, 15.38, 3050.24);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (386, 2, 7467.8, 15.38, 3055.59);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (387, 2, 7477.7, 15.38, 3061.14);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (388, 2, 7487.5, 15.38, 3066.66);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (389, 2, 7497.4, 15.38, 3072.26);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (390, 2, 7507.2, 15.38, 3077.8);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (391, 2, 7516.7, 15.38, 3083.17);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (392, 2, 7526.6, 15.38, 3088.76);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (393, 2, 7536.1, 15.38, 3094.13);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (394, 2, 7545.6, 15.38, 3099.5);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (395, 2, 7555.4, 15.38, 3105.03);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (396, 2, 7565, 15.38, 3110.46);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (397, 2, 7574.1, 15.38, 3115.6);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (398, 2, 7583.7, 15.38, 3121.11);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (399, 2, 7592.2, 15.38, 3126.05);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (400, 2, 7600.4, 15.38, 3130.81);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (401, 2, 7608.6, 15.38, 3135.58);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (402, 2, 7616.8, 15.38, 3140.34);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (403, 2, 7625, 15.38, 3145.11);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (404, 2, 7632.2, 15.38, 3149.29);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (405, 2, 7637.1, 15.38, 3152.14);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (406, 2, 7642.1, 15.38, 3155.04);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (407, 2, 7646.7, 15.38, 3157.72);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (408, 2, 7651.2, 15.38, 3160.33);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (409, 2, 7655.5, 15.38, 3162.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (410, 2, 7659.8, 15.38, 3165.33);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (411, 2, 7663.7, 15.38, 3167.6);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (412, 2, 7667.7, 15.38, 3169.92);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (413, 2, 7671.6, 15.38, 3172.19);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (414, 2, 7675.2, 15.38, 3174.28);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (415, 2, 7678.8, 15.38, 3176.38);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (416, 2, 7682.1, 15.38, 3178.32);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (417, 2, 7685.4, 15.38, 3180.25);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (418, 2, 7690.3, 15.38, 3183.13);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (419, 2, 7697.2, 15.38, 3187.18);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (420, 2, 7704.4, 15.38, 3191.4);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (421, 2, 7711.3, 15.38, 3195.5);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (422, 2, 7711.3, 13.98, 2904.62);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (423, 2, 7725.1, 13.98, 2912.12);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (424, 2, 7732, 13.98, 2915.87);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (425, 2, 7738.8, 13.98, 2919.57);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (426, 2, 7745.7, 13.98, 2923.32);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (427, 2, 7752.6, 13.98, 2927.07);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (428, 2, 7759.5, 13.98, 2930.82);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (429, 2, 7766.4, 13.98, 2934.57);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (430, 2, 7773.3, 13.98, 2938.32);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (431, 2, 7779.9, 13.98, 2941.95);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (432, 2, 7786.7, 13.98, 2945.7);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (433, 2, 7793.6, 13.98, 2949.51);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (434, 2, 7800.2, 13.98, 2953.16);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (435, 2, 7807.1, 13.98, 2956.97);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (436, 2, 7813.6, 13.98, 2960.56);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (437, 2, 7820.5, 13.98, 2964.37);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (438, 2, 7827.1, 13.98, 2968.02);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (439, 2, 7834, 13.98, 2971.83);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (440, 2, 7840.6, 13.98, 2975.48);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (441, 2, 7847.1, 13.98, 2979.07);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (442, 2, 7853.7, 13.98, 2982.72);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (443, 2, 7860.6, 13.98, 2986.53);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (444, 2, 7867.1, 13.98, 2990.12);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (445, 2, 7874, 13.98, 2994.93);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (446, 3, 1000, 13.22, 687.44);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (447, 3, 1100, 14.2, 812.24);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (448, 3, 1200, 13.76, 858.624);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (449, 3, 1300, 14.27, 964.652);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (450, 3, 1400, 14.19, 1033.032);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (451, 3, 1500, 14, 1092);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (452, 3, 1600, 13.07, 1087.424);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (453, 3, 1700, 13.9, 1228.76);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (454, 3, 1800, 13.89, 1300.104);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (455, 3, 1900, 14.43, 1425.684);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (456, 3, 2000, 14.36, 1493.44);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (457, 3, 2100, 15.17, 1656.564);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (458, 3, 2200, 13.62, 1558.128);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (459, 3, 2300, 14.93, 1785.628);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (460, 3, 2400, 13.65, 1703.52);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (461, 3, 2500, 13.93, 1810.9);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (462, 3, 2600, 14.48, 1957.696);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (463, 3, 2700, 15.1, 2120.04);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (464, 3, 2800, 14.48, 2108.288);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (465, 3, 2900, 14.22, 2144.376);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (466, 3, 3000, 14.17, 2210.52);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (467, 4, 1000, 13.22, 687.44);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (468, 4, 1100, 14.2, 812.24);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (469, 4, 1200, 13.76, 858.624);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (470, 4, 1300, 14.27, 964.652);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (471, 4, 1400, 14.19, 1033.032);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (472, 4, 1500, 14, 1092);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (473, 4, 1600, 13.07, 1087.424);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (474, 4, 1700, 13.9, 1228.76);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (475, 4, 1800, 13.89, 1300.104);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (476, 4, 1900, 14.43, 1425.684);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (477, 4, 2000, 14.36, 1493.44);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (478, 4, 2100, 15.17, 1656.564);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (479, 4, 2200, 13.62, 1558.128);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (480, 4, 2300, 14.93, 1785.628);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (481, 4, 2400, 13.65, 1703.52);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (482, 4, 2500, 13.93, 1810.9);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (483, 4, 2600, 14.48, 1957.696);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (484, 4, 2700, 15.1, 2120.04);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (485, 4, 2800, 14.48, 2108.288);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (486, 4, 2900, 14.22, 2144.376);
INSERT INTO `FGPressure` (`FG_ID`, `ProjectID`, `TVD`, `FG`, `Pressure`) VALUES (487, 4, 3000, 14.17, 2210.52);
# 456 records

#
# Table structure for table 'Fluids'
#

DROP TABLE IF EXISTS `Fluids`;

CREATE TABLE `Fluids` (
  `FluidID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ProjectID` INTEGER DEFAULT 0, 
  `SampleID` INTEGER DEFAULT 0, 
  `Description` VARCHAR(255), 
  `Density` FLOAT NULL DEFAULT 0, 
  `Type` INTEGER DEFAULT 0, 
  `Rheology` INTEGER DEFAULT 0, 
  `YP` FLOAT NULL DEFAULT 0, 
  `PV` FLOAT NULL DEFAULT 0, 
  `K` FLOAT NULL DEFAULT 0, 
  `n` FLOAT NULL DEFAULT 0, 
  `Viscosity` FLOAT NULL DEFAULT 0, 
  `Oil` FLOAT NULL DEFAULT 0, 
  `Water` FLOAT NULL DEFAULT 0, 
  `TC` FLOAT NULL DEFAULT 1, 
  `SH` FLOAT NULL DEFAULT .4, 
  INDEX (`FluidID`), 
  PRIMARY KEY (`FluidID`), 
  INDEX (`ProjectID`), 
  INDEX (`SampleID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Fluids'
#

INSERT INTO `Fluids` (`FluidID`, `ProjectID`, `SampleID`, `Description`, `Density`, `Type`, `Rheology`, `YP`, `PV`, `K`, `n`, `Viscosity`, `Oil`, `Water`, `TC`, `SH`) VALUES (1, 1, 1, 'Fluid#1', 10.3, 0, 1, 12, 24, .78, .98, 12, 100, 0, 1, .4);
INSERT INTO `Fluids` (`FluidID`, `ProjectID`, `SampleID`, `Description`, `Density`, `Type`, `Rheology`, `YP`, `PV`, `K`, `n`, `Viscosity`, `Oil`, `Water`, `TC`, `SH`) VALUES (2, 1, 1, 'Fluid#2', 12.3, 1, 2, 12, 20, .55, .87, 16, 90, 10, 1.02, .45);
INSERT INTO `Fluids` (`FluidID`, `ProjectID`, `SampleID`, `Description`, `Density`, `Type`, `Rheology`, `YP`, `PV`, `K`, `n`, `Viscosity`, `Oil`, `Water`, `TC`, `SH`) VALUES (3, 1, 1, 'Cement', 15.25, 2, 3, 13, 18, .67, .94, 15, 79, 21, .99, .55);
INSERT INTO `Fluids` (`FluidID`, `ProjectID`, `SampleID`, `Description`, `Density`, `Type`, `Rheology`, `YP`, `PV`, `K`, `n`, `Viscosity`, `Oil`, `Water`, `TC`, `SH`) VALUES (4, 2, 1, 'Fluid#1', 9.3, 3, 3, 15, 23, .45, .77, 16, 70, 30, 1.01, .55);
INSERT INTO `Fluids` (`FluidID`, `ProjectID`, `SampleID`, `Description`, `Density`, `Type`, `Rheology`, `YP`, `PV`, `K`, `n`, `Viscosity`, `Oil`, `Water`, `TC`, `SH`) VALUES (5, 2, 1, 'Fluid#2', 12.45, 4, 3, 15, 22, .74, .66, 14, 60, 40, 1.2, .44);
INSERT INTO `Fluids` (`FluidID`, `ProjectID`, `SampleID`, `Description`, `Density`, `Type`, `Rheology`, `YP`, `PV`, `K`, `n`, `Viscosity`, `Oil`, `Water`, `TC`, `SH`) VALUES (6, 3, 1, 'WBM#1', 10.5, 5, 5, 12, 25, .78, .95, 20, 60, 40, 1.1, .35);
INSERT INTO `Fluids` (`FluidID`, `ProjectID`, `SampleID`, `Description`, `Density`, `Type`, `Rheology`, `YP`, `PV`, `K`, `n`, `Viscosity`, `Oil`, `Water`, `TC`, `SH`) VALUES (7, 4, 1, 'OBM#1', 15.4, 3, 4, 10, 16, .89, .88, 22, 80, 20, 1.23, .4);
INSERT INTO `Fluids` (`FluidID`, `ProjectID`, `SampleID`, `Description`, `Density`, `Type`, `Rheology`, `YP`, `PV`, `K`, `n`, `Viscosity`, `Oil`, `Water`, `TC`, `SH`) VALUES (8, 5, 1, 'Fluid#HH', 12, 4, 3, 9, 16, .98, .8, 17, 77, 23, 1.24, .55);
INSERT INTO `Fluids` (`FluidID`, `ProjectID`, `SampleID`, `Description`, `Density`, `Type`, `Rheology`, `YP`, `PV`, `K`, `n`, `Viscosity`, `Oil`, `Water`, `TC`, `SH`) VALUES (9, 6, 1, 'Fluid#OBM', 11.5, 5, 2, 8, 22, 1.2, .7, 18, 22, 88, 1.11, .45);
# 9 records

#
# Table structure for table 'Lithology'
#

DROP TABLE IF EXISTS `Lithology`;

CREATE TABLE `Lithology` (
  `LithoID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ProjectID` INTEGER DEFAULT 0, 
  `Description` VARCHAR(255), 
  `MD` FLOAT NULL DEFAULT 0, 
  `TVD` FLOAT NULL DEFAULT 0, 
  `TC` FLOAT NULL DEFAULT 1, 
  `SH` FLOAT NULL DEFAULT .4, 
  INDEX (`LithoID`), 
  PRIMARY KEY (`LithoID`), 
  INDEX (`ProjectID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Lithology'
#

INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (1, 1, 'Formation 1', 1000, 1000, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (2, 1, 'Formation 2', 1100, 1100, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (3, 1, 'Formation 3', 1200, 1200, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (4, 1, 'Formation 4', 1300, 1300, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (5, 1, 'Formation 5', 1400, 1400, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (6, 1, 'Formation 6', 1500, 1500, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (7, 1, 'Formation 7', 1600, 1600, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (8, 1, 'Formation 8', 1700, 1700, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (9, 1, 'Formation 9', 1800, 1800, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (10, 1, 'Formation 10', 1900, 1900, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (11, 1, 'Formation 11', 2000, 2000, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (12, 1, 'Formation 12', 2100, 2100, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (13, 1, 'Formation 13', 2200, 2200, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (14, 1, 'Formation 14', 2300, 2300, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (15, 1, 'Formation 15', 2400, 2400, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (16, 1, 'Formation 16', 2500, 2500, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (17, 1, 'Formation 17', 2600, 2600, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (18, 1, 'Formation 18', 2700, 2700, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (19, 1, 'Formation 19', 2800, 2800, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (20, 1, 'Formation 20', 2900, 2900, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (21, 1, 'Formation 21', 3000, 3000, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (22, 2, 'Formation 1', 1000, 1000, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (23, 2, 'Formation 2', 1100, 1100, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (24, 2, 'Formation 3', 1200, 1200, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (25, 2, 'Formation 4', 1300, 1300, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (26, 2, 'Formation 5', 1400, 1400, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (27, 2, 'Formation 6', 1500, 1500, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (28, 2, 'Formation 7', 1600, 1600, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (29, 2, 'Formation 8', 1700, 1700, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (30, 2, 'Formation 9', 1800, 1800, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (31, 2, 'Formation 10', 1900, 1900, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (32, 2, 'Formation 11', 2000, 2000, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (33, 2, 'Formation 12', 2100, 2100, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (34, 2, 'Formation 13', 2200, 2200, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (35, 2, 'Formation 14', 2300, 2300, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (36, 2, 'Formation 15', 2400, 2400, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (37, 2, 'Formation 16', 2500, 2500, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (38, 2, 'Formation 17', 2600, 2600, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (39, 2, 'Formation 18', 2700, 2700, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (40, 2, 'Formation 19', 2800, 2800, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (41, 2, 'Formation 20', 2900, 2900, 1, .4);
INSERT INTO `Lithology` (`LithoID`, `ProjectID`, `Description`, `MD`, `TVD`, `TC`, `SH`) VALUES (42, 2, 'Formation 21', 3000, 3000, 1, .4);
# 42 records

#
# Table structure for table 'PorePressure'
#

DROP TABLE IF EXISTS `PorePressure`;

CREATE TABLE `PorePressure` (
  `PP_ID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ProjectID` INTEGER DEFAULT 0, 
  `TVD` FLOAT NULL DEFAULT 0, 
  `PP` FLOAT NULL DEFAULT 0, 
  `Pressure` FLOAT NULL DEFAULT 0, 
  INDEX (`PP_ID`), 
  PRIMARY KEY (`PP_ID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'PorePressure'
#

INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (1, 4, 1000, 11.1, 577.2);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (2, 4, 1100, 11.2, 640.64);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (3, 4, 1200, 11.14, 695.136);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (4, 4, 1300, 11.23, 759.148);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (5, 4, 1400, 11.23, 817.544);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (6, 4, 1500, 10.94, 853.32);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (7, 4, 1600, 10.9, 906.88);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (8, 4, 1700, 11, 972.4);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (9, 4, 1800, 11.3, 1057.68);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (10, 4, 1900, 11.5, 1136.2);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (11, 4, 2000, 11.4, 1185.6);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (12, 4, 2100, 11.7, 1277.64);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (13, 4, 2200, 11.44, 1308.736);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (14, 4, 2300, 11.55, 1381.38);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (15, 4, 2400, 11.45, 1428.96);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (16, 4, 2500, 11.34, 1474.2);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (17, 4, 2600, 11.56, 1562.912);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (18, 4, 2700, 11.78, 1653.912);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (19, 4, 2800, 11.98, 1744.288);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (20, 4, 2900, 11.9, 1794.52);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (21, 4, 3000, 11.8, 1840.8);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (22, 1, 1000, 11.1, 577.2);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (23, 1, 1100, 11.2, 640.64);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (24, 1, 1200, 11.14, 695.136);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (25, 1, 1300, 11.23, 759.148);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (26, 1, 1400, 11.23, 817.544);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (27, 1, 1500, 10.94, 853.32);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (28, 1, 1600, 10.9, 906.88);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (29, 1, 1700, 11, 972.4);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (30, 1, 1800, 11.3, 1057.68);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (31, 1, 1900, 11.5, 1136.2);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (32, 1, 2000, 11.4, 1185.6);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (33, 1, 2100, 11.7, 1277.64);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (34, 1, 2200, 11.44, 1308.736);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (35, 1, 2300, 11.55, 1381.38);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (36, 1, 2400, 11.45, 1428.96);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (37, 1, 2500, 11.34, 1474.2);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (38, 1, 2600, 11.56, 1562.912);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (39, 1, 2700, 11.78, 1653.912);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (40, 1, 2800, 11.98, 1744.288);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (41, 1, 2900, 11.9, 1794.52);
INSERT INTO `PorePressure` (`PP_ID`, `ProjectID`, `TVD`, `PP`, `Pressure`) VALUES (42, 1, 3000, 11.8, 1840.8);
# 42 records

#
# Table structure for table 'Samples'
#

DROP TABLE IF EXISTS `Samples`;

CREATE TABLE `Samples` (
  `SampleID` INTEGER NOT NULL AUTO_INCREMENT, 
  `FluidID` INTEGER DEFAULT 0, 
  `Pressure` FLOAT NULL DEFAULT 0, 
  `Temperature` FLOAT NULL DEFAULT 0, 
  `R3` FLOAT NULL DEFAULT 0, 
  `R6` FLOAT NULL DEFAULT 0, 
  `R30` FLOAT NULL DEFAULT 0, 
  `R60` FLOAT NULL DEFAULT 0, 
  `R100` FLOAT NULL DEFAULT 0, 
  `R200` FLOAT NULL DEFAULT 0, 
  `R300` FLOAT NULL DEFAULT 0, 
  `R600` FLOAT NULL DEFAULT 0, 
  INDEX (`FluidID`), 
  PRIMARY KEY (`SampleID`), 
  INDEX (`SampleID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Samples'
#

INSERT INTO `Samples` (`SampleID`, `FluidID`, `Pressure`, `Temperature`, `R3`, `R6`, `R30`, `R60`, `R100`, `R200`, `R300`, `R600`) VALUES (1, 1, 14.7, 60, 3, 4, 0, 0, 15, 24, 35, 45);
INSERT INTO `Samples` (`SampleID`, `FluidID`, `Pressure`, `Temperature`, `R3`, `R6`, `R30`, `R60`, `R100`, `R200`, `R300`, `R600`) VALUES (2, 1, 20, 60, 5, 6, 0, 0, 20, 30, 40, 55);
INSERT INTO `Samples` (`SampleID`, `FluidID`, `Pressure`, `Temperature`, `R3`, `R6`, `R30`, `R60`, `R100`, `R200`, `R300`, `R600`) VALUES (3, 2, 14.7, 60, 7, 8, 9, 12, 16, 28, 33, 50);
INSERT INTO `Samples` (`SampleID`, `FluidID`, `Pressure`, `Temperature`, `R3`, `R6`, `R30`, `R60`, `R100`, `R200`, `R300`, `R600`) VALUES (4, 3, 14.7, 60, 2, 4, 0, 0, 18, 22, 45, 55);
INSERT INTO `Samples` (`SampleID`, `FluidID`, `Pressure`, `Temperature`, `R3`, `R6`, `R30`, `R60`, `R100`, `R200`, `R300`, `R600`) VALUES (5, 4, 14.7, 60, 5, 7, 0, 0, 16, 20, 44, 60);
INSERT INTO `Samples` (`SampleID`, `FluidID`, `Pressure`, `Temperature`, `R3`, `R6`, `R30`, `R60`, `R100`, `R200`, `R300`, `R600`) VALUES (6, 5, 14.7, 60, 4, 8, 10, 12, 17, 25, 56, 70);
# 6 records

#
# Table structure for table 'SurfPiping'
#

DROP TABLE IF EXISTS `SurfPiping`;

CREATE TABLE `SurfPiping` (
  `SurfID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ProjectID` INTEGER DEFAULT 0, 
  `Length` FLOAT NULL DEFAULT 0, 
  `ID` FLOAT NULL DEFAULT 0, 
  INDEX (`ID`), 
  PRIMARY KEY (`SurfID`), 
  INDEX (`ProjectID`), 
  INDEX (`SurfID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'SurfPiping'
#

INSERT INTO `SurfPiping` (`SurfID`, `ProjectID`, `Length`, `ID`) VALUES (1, 1, 10, 5);
INSERT INTO `SurfPiping` (`SurfID`, `ProjectID`, `Length`, `ID`) VALUES (2, 1, 100, 5);
INSERT INTO `SurfPiping` (`SurfID`, `ProjectID`, `Length`, `ID`) VALUES (3, 2, 2, 6);
INSERT INTO `SurfPiping` (`SurfID`, `ProjectID`, `Length`, `ID`) VALUES (4, 3, 200, 4);
INSERT INTO `SurfPiping` (`SurfID`, `ProjectID`, `Length`, `ID`) VALUES (5, 4, 100, 3);
INSERT INTO `SurfPiping` (`SurfID`, `ProjectID`, `Length`, `ID`) VALUES (6, 5, 50, 5);
INSERT INTO `SurfPiping` (`SurfID`, `ProjectID`, `Length`, `ID`) VALUES (7, 6, 80, 6);
# 7 records

#
# Table structure for table 'Survey'
#

DROP TABLE IF EXISTS `Survey`;

CREATE TABLE `Survey` (
  `ProjectID` INTEGER DEFAULT 0, 
  `MD` FLOAT NULL DEFAULT 0, 
  `Inc` FLOAT NULL DEFAULT 0, 
  `Azimuth` FLOAT NULL DEFAULT 0, 
  `TVD` FLOAT NULL DEFAULT 0, 
  `North` FLOAT NULL DEFAULT 0, 
  `East` FLOAT NULL DEFAULT 0, 
  INDEX (`ProjectID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Survey'
#

INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 0, 0, 0, 0, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 100, 0, 150.45, 100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 200, 0, 150.45, 200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 300, 0, 150.45, 300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 400, 0, 150.45, 400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 500, 0, 150.45, 500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 600, 0, 150.45, 600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 700, 0, 150.45, 700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 800, 0, 150.45, 800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 900, 0, 150.45, 900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 1000, 0, 150.45, 1000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 1100, 0, 150.45, 1100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 1200, 0, 150.45, 1200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 1300, 0, 150.45, 1300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 1400, 0, 150.45, 1400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 1500, 0, 150.45, 1500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 1600, 0, 150.45, 1600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 1700, 0, 150.45, 1700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 1800, 0, 150.45, 1800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 1900, 0, 150.45, 1900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 2000, 0, 150.45, 2000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 2100, 0, 150.45, 2100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 2200, 0, 150.45, 2200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 2300, 0, 150.45, 2300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 2400, 0, 150.45, 2400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 2500, 0, 150.45, 2500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 2600, 0, 150.45, 2600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 2700, 0, 150.45, 2700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 2800, 0, 150.45, 2800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 2900, 0, 150.45, 2900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 3000, 0, 150.45, 3000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 3100, 0, 150.45, 3100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 3200, 0, 150.45, 3200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 3300, 0, 150.45, 3300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 3400, 0, 150.45, 3400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 3500, 0, 150.45, 3500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 3600, 0, 150.45, 3600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 3700, 0, 150.45, 3700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 3800, 0, 150.45, 3800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 3900, 0, 150.45, 3900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 4000, 0, 150.45, 4000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 4100, 0, 150.45, 4100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 4200, 0, 150.45, 4200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 4300, 0, 150.45, 4300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 4400, 0, 150.45, 4400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 4500, 0, 150.45, 4500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 4600, 0, 150.45, 4600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 4700, 0, 150.45, 4700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 4800, 0, 150.45, 4800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 4900, 0, 150.45, 4900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5000, 0, 150.45, 5000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5100, 0, 150.45, 5100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5200, 0, 150.45, 5200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5300, 0, 150.45, 5300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5400, 0, 150.45, 5400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5500, 0, 150.45, 5500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5533, 0, 150.45, 5533, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5600, .67, 150.45, 5600, -.3, .2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5700, 1.67, 150.45, 5700, -2.1, 1.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5800, 2.67, 150.45, 5799.9, -5.4, 3.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 5900, 3.67, 150.45, 5899.7, -10.2, 5.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6000, 4.67, 150.45, 5999.4, -16.5, 9.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6100, 5.67, 150.45, 6099, -24.3, 13.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6200, 6.67, 150.45, 6198.4, -33.6, 19.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6300, 7.67, 150.45, 6297.6, -44.5, 25.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6400, 8.67, 150.45, 6396.6, -56.9, 32.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6500, 9.67, 150.45, 6495.3, -70.8, 40.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6600, 10.67, 150.45, 6593.7, -86.2, 48.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6687.91, 11.55, 150.45, 6680, -100.9, 57.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6700, 11.55, 150.45, 6691.8, -103, 58.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6800, 11.55, 150.45, 6789.8, -120.4, 68.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 6900, 11.55, 150.45, 6887.8, -137.8, 78.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7000, 11.55, 150.45, 6985.8, -155.2, 88.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7100, 11.55, 150.45, 7083.8, -172.6, 98.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7200, 11.55, 150.45, 7181.8, -190, 108);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7219.47, 11.55, 150.45, 7200.9, -193.4, 109.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7300, 10.19, 190.17, 7280.1, -207.4, 112.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7400, 14.85, 228.41, 7377.9, -224.7, 101.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7500, 22.51, 245.04, 7472.6, -241.3, 74.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7600, 31.03, 253.22, 7561.8, -256.9, 32.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7700, 39.85, 258.09, 7643.2, -271, -23.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7800, 48.82, 261.43, 7714.7, -283.2, -92.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7900, 57.85, 263.95, 7774.4, -293.3, -172);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 7973.36, 64.51, 265.5, 7809.7, -299.2, -236);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8000, 67.4, 266.03, 7820.6, -301, -260.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8100, 78.25, 267.86, 7850.1, -306, -355.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8200, 89.12, 269.55, 7861.1, -308.2, -454.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8216.13, 90.87, 269.82, 7861.1, -308.3, -470.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8300, 90.87, 269.82, 7859.8, -308.6, -554.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8400, 90.87, 269.82, 7858.3, -308.9, -654.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8500, 90.87, 269.82, 7856.8, -309.2, -754.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8600, 90.87, 269.82, 7855.3, -309.5, -854.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8700, 90.87, 269.82, 7853.8, -309.8, -954.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8800, 90.87, 269.82, 7852.3, -310.1, -1054.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 8900, 90.87, 269.82, 7850.8, -310.4, -1154.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 9000, 90.87, 269.82, 7849.3, -310.7, -1254.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 9100, 90.87, 269.82, 7847.8, -311, -1354.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 9200, 90.87, 269.82, 7846.3, -311.3, -1454.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 9300, 90.87, 269.82, 7844.8, -311.6, -1554.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 9400, 90.87, 269.82, 7843.3, -311.9, -1654.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 9500, 90.87, 269.82, 7841.8, -312.2, -1754.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 9600, 90.87, 269.82, 7840.3, -312.5, -1854.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 9700, 90.87, 269.82, 7838.8, -312.8, -1954.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 9800, 90.87, 269.82, 7837.3, -313.1, -2054.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 9900, 90.87, 269.82, 7835.8, -313.4, -2154.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 10000, 90.87, 269.82, 7834.3, -313.7, -2254.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 10100, 90.87, 269.82, 7832.8, -314, -2354.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 10200, 90.87, 269.82, 7831.3, -314.3, -2454.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 10300, 90.87, 269.82, 7829.8, -314.6, -2554.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 10400, 90.87, 269.82, 7828.3, -314.9, -2654.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 10500, 90.87, 269.82, 7826.8, -315.2, -2754.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 10600, 90.87, 269.82, 7825.3, -315.5, -2854.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 10700, 90.87, 269.82, 7823.8, -315.8, -2954.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 10800, 90.87, 269.82, 7822.3, -316.1, -3054.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 10900, 90.87, 269.82, 7820.8, -316.4, -3154.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 11000, 90.87, 269.82, 7819.3, -316.7, -3254.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 11100, 90.87, 269.82, 7817.8, -317, -3354.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 11200, 90.87, 269.82, 7816.3, -317.3, -3454.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 11300, 90.87, 269.82, 7814.8, -317.6, -3554.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 11400, 90.87, 269.82, 7813.3, -317.9, -3654.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 11500, 90.87, 269.82, 7811.8, -318.2, -3754.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 11600, 90.87, 269.82, 7810.3, -318.5, -3854.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 11700, 90.87, 269.82, 7808.8, -318.8, -3954.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 11800, 90.87, 269.82, 7807.3, -319.1, -4054.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 11900, 90.87, 269.82, 7805.8, -319.4, -4154.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 12000, 90.87, 269.82, 7804.3, -319.7, -4254.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 12100, 90.87, 269.82, 7802.8, -320, -4354.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 12200, 90.87, 269.82, 7801.3, -320.3, -4454.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 12300, 90.87, 269.82, 7799.8, -320.6, -4554.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 12400, 90.87, 269.82, 7798.3, -320.9, -4654.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 12500, 90.87, 269.82, 7796.8, -321.2, -4754.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 12600, 90.87, 269.82, 7795.3, -321.5, -4854.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 12700, 90.87, 269.82, 7793.8, -321.8, -4954.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 12800, 90.87, 269.82, 7792.3, -322.1, -5054.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 12900, 90.87, 269.82, 7790.8, -322.4, -5154.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 13000, 90.87, 269.82, 7789.3, -322.7, -5254.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 13100, 90.87, 269.82, 7787.8, -323, -5354.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 13200, 90.87, 269.82, 7786.3, -323.3, -5454.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 13300, 90.87, 269.82, 7784.8, -323.6, -5554.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 13400, 90.87, 269.82, 7783.3, -323.9, -5654.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 13500, 90.87, 269.82, 7781.8, -324.2, -5754.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 13600, 90.87, 269.82, 7780.3, -324.5, -5854.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 13700, 90.87, 269.82, 7778.8, -324.8, -5954.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 13800, 90.87, 269.82, 7777.3, -325.1, -6054.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 13900, 90.87, 269.82, 7775.8, -325.4, -6154.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 14000, 90.87, 269.82, 7774.3, -325.7, -6254.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 14100, 90.87, 269.82, 7772.8, -326, -6354.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 14200, 90.87, 269.82, 7771.3, -326.3, -6454.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 14300, 90.87, 269.82, 7769.8, -326.6, -6554.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 14400, 90.87, 269.82, 7768.3, -326.9, -6654.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 14500, 90.87, 269.82, 7766.8, -327.2, -6754.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 14600, 90.87, 269.82, 7765.3, -327.5, -6854.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 14700, 90.87, 269.82, 7763.8, -327.8, -6954.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 14800, 90.87, 269.82, 7762.3, -328.1, -7054.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 14900, 90.87, 269.82, 7760.8, -328.4, -7154.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 15000, 90.87, 269.82, 7759.3, -328.7, -7254.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 15100, 90.87, 269.82, 7757.8, -329, -7354.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 15200, 90.87, 269.82, 7756.3, -329.3, -7454.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 15300, 90.87, 269.82, 7754.8, -329.6, -7554.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 15400, 90.87, 269.82, 7753.3, -329.9, -7654.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 15500, 90.87, 269.82, 7751.8, -330.2, -7754.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 15508.63, 90.87, 269.82, 7751.7, -330.2, -7763.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (1, 18930, 90.87, 269.82, 7699.8, -340.9, -11184.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 0, 0, 0, 0, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 100, 0, 0, 100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 200, 0, 0, 200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 300, 0, 0, 300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 400, 0, 0, 400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 500, 0, 0, 500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 600, 0, 0, 600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 700, 0, 0, 700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 800, 0, 0, 800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 900, 0, 0, 900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 1000, 0, 0, 1000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 1100, 0, 0, 1100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 1200, 0, 0, 1200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 1300, 0, 0, 1300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 1400, 0, 0, 1400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 1500, 0, 0, 1500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 1600, 0, 0, 1600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 1700, 0, 0, 1700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 1800, 0, 0, 1800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 1900, 0, 0, 1900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 2000, 0, 0, 2000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 2100, 0, 0, 2100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 2200, 0, 0, 2200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 2300, 0, 0, 2300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 2400, 0, 0, 2400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 2500, 0, 0, 2500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 2600, 0, 0, 2600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 2700, 0, 0, 2700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 2800, 0, 0, 2800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 2900, 0, 0, 2900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3000, 0, 0, 3000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3100, 0, 0, 3100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3200, 0, 0, 3200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3300, 0, 0, 3300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3400, 0, 0, 3400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3500, 0, 0, 3500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3600, 0, 0, 3600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3650, 0, 0, 3650, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3700, .75, 331.878, 3700, .29, -.15);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3800, 2.25, 331.878, 3800, 2.6, -1.38);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 3900, 3.75, 331.878, 3899.9, 7.22, -3.85);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 4000, 5.25, 331.878, 3999.6, 14.14, -7.55);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 4100, 6.75, 331.878, 4099, 23.36, -12.48);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 4200, 8.25, 331.878, 4198.1, 34.87, -18.63);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 4300, 9.75, 331.878, 4296.9, 48.67, -26);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 4400.37, 11.256, 331.878, 4395.6, 64.81, -34.62);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 4500, 11.256, 331.878, 4493.3, 81.96, -43.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 4600, 11.256, 331.878, 4591.4, 99.17, -52.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 4700, 11.256, 331.878, 4689.5, 116.38, -62.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 4800, 11.256, 331.878, 4787.6, 133.59, -71.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 4900, 11.256, 331.878, 4885.7, 150.8, -80.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 5000, 11.256, 331.878, 4983.8, 168.01, -89.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 5100, 11.256, 331.878, 5081.9, 185.22, -98.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 5200, 11.256, 331.878, 5180, 202.43, -108.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 5300, 11.256, 331.878, 5278.1, 219.64, -117.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 5400, 11.256, 331.878, 5376.2, 236.85, -126.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 5500, 11.256, 331.878, 5474.3, 254.06, -135.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 5600, 11.256, 331.878, 5572.4, 271.27, -144.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 5700, 11.256, 331.878, 5670.5, 288.48, -154.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 5800, 11.256, 331.878, 5768.6, 305.69, -163.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 5900, 11.256, 331.878, 5866.7, 322.9, -172.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 6000, 11.256, 331.878, 5964.8, 340.11, -181.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 6100, 11.256, 331.878, 6062.9, 357.32, -190.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 6200, 11.256, 331.878, 6161, 374.53, -200.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 6300, 11.256, 331.878, 6259.1, 391.74, -209.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 6400, 11.256, 331.878, 6357.2, 408.95, -218.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 6500, 11.256, 331.878, 6455.3, 426.16, -227.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 6600, 11.256, 331.878, 6553.4, 443.37, -236.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 6700, 11.256, 331.878, 6651.5, 460.58, -246.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 6800, 11.256, 331.878, 6749.6, 477.79, -255.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 6900, 11.256, 331.878, 6847.7, 495, -264.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 7000, 11.256, 331.878, 6945.8, 512.21, -273.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 7100, 11.256, 331.878, 7043.9, 529.42, -282.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 7200, 11.256, 331.878, 7142, 546.63, -292.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 7300, 11.256, 331.878, 7240.1, 563.84, -301.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 7400, 11.256, 331.878, 7338.2, 581.05, -310.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 7500, 11.256, 331.878, 7436.3, 598.26, -319.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 7600, 11.256, 331.878, 7534.4, 615.47, -328.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 7700, 11.256, 331.878, 7632.5, 632.68, -338.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 7800, 11.256, 331.878, 7730.6, 649.89, -347.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 7900, 11.256, 331.878, 7828.7, 667.1, -356.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8000, 11.256, 331.878, 7926.8, 684.31, -365.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8100, 11.256, 331.878, 8024.9, 701.52, -374.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8200, 11.256, 331.878, 8123, 718.73, -384.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8300, 11.256, 331.878, 8221.1, 735.94, -393.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8400, 11.256, 331.878, 8319.2, 753.15, -402.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8500, 11.256, 331.878, 8417.3, 770.36, -411.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8538.86, 11.256, 331.878, 8455.4, 777.05, -415.37);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8600, 10.338, 331.878, 8515.5, 787.15, -420.77);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8700, 8.838, 331.878, 8614.1, 801.84, -428.62);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8800, 7.338, 331.878, 8713.1, 814.25, -435.25);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 8900, 5.838, 331.878, 8812.4, 824.37, -440.66);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9000, 4.338, 331.878, 8912, 832.19, -444.84);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9100, 2.838, 331.878, 9011.8, 837.71, -447.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9200, 1.338, 331.878, 9111.7, 840.92, -449.51);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9289.23, 0, 360, 9200.9, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9300, 0, 0, 9211.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9400, 0, 0, 9311.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9500, 0, 0, 9411.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9600, 0, 0, 9511.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9700, 0, 0, 9611.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9800, 0, 0, 9711.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 9900, 0, 0, 9811.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 10000, 0, 0, 9911.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 10100, 0, 0, 10011.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 10200, 0, 0, 10111.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 10300, 0, 0, 10211.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 10400, 0, 0, 10311.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 10500, 0, 0, 10411.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 10600, 0, 0, 10511.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 10700, 0, 0, 10611.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 10800, 0, 0, 10711.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 10900, 0, 0, 10811.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11000, 0, 0, 10911.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11100, 0, 0, 11011.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11200, 0, 0, 11111.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11233.98, 0, 360, 11145.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11250, 1.602, 122.861, 11161.7, 841.72, -449.81);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11300, 6.602, 122.861, 11211.6, 839.78, -446.81);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11350, 11.602, 122.861, 11261, 835.49, -440.17);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11400, 16.602, 122.861, 11309.5, 828.88, -429.94);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11450, 21.602, 122.861, 11356.7, 820, -416.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11500, 26.602, 122.861, 11402.3, 808.92, -399.05);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11550, 31.602, 122.861, 11446, 795.73, -378.63);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11600, 36.602, 122.861, 11487.4, 780.52, -355.09);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11650, 41.602, 122.861, 11526.2, 763.41, -328.61);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11700, 46.602, 122.861, 11562.1, 744.54, -299.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11750, 51.602, 122.861, 11594.8, 724.04, -267.65);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11800, 56.602, 122.861, 11624.1, 702.07, -233.64);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11850, 61.602, 122.861, 11649.8, 678.8, -197.61);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11900, 66.602, 122.861, 11671.6, 654.4, -159.84);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 11950, 71.602, 122.861, 11689.4, 629.06, -120.62);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 12000, 76.602, 122.861, 11703.1, 602.98, -80.24);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 12050, 81.602, 122.861, 11712.6, 576.35, -39.01);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 12100, 86.602, 122.861, 11717.7, 549.37, 2.75);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 12116.43, 88.245, 122.861, 11718.4, 540.46, 16.54);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (2, 12200, 88.245, 122.861, 11721, 495.14, 86.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 0, 0, 0, 0, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 100, 0, 0, 100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 200, 0, 0, 200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 300, 0, 0, 300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 400, 0, 0, 400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 500, 0, 0, 500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 600, 0, 0, 600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 700, 0, 0, 700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 800, 0, 0, 800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 900, 0, 0, 900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 1000, 0, 0, 1000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 1100, 0, 0, 1100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 1200, 0, 0, 1200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 1300, 0, 0, 1300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 1400, 0, 0, 1400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 1500, 0, 0, 1500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 1600, 0, 0, 1600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 1700, 0, 0, 1700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 1800, 0, 0, 1800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 1900, 0, 0, 1900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 2000, 0, 0, 2000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 2100, 0, 0, 2100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 2200, 0, 0, 2200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 2300, 0, 0, 2300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 2400, 0, 0, 2400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 2500, 0, 0, 2500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 2600, 0, 0, 2600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 2700, 0, 0, 2700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 2800, 0, 0, 2800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 2900, 0, 0, 2900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3000, 0, 0, 3000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3100, 0, 0, 3100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3200, 0, 0, 3200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3300, 0, 0, 3300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3400, 0, 0, 3400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3500, 0, 0, 3500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3600, 0, 0, 3600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3650, 0, 0, 3650, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3700, .75, 331.878, 3700, .29, -.15);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3800, 2.25, 331.878, 3800, 2.6, -1.38);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 3900, 3.75, 331.878, 3899.9, 7.22, -3.85);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 4000, 5.25, 331.878, 3999.6, 14.14, -7.55);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 4100, 6.75, 331.878, 4099, 23.36, -12.48);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 4200, 8.25, 331.878, 4198.1, 34.87, -18.63);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 4300, 9.75, 331.878, 4296.9, 48.67, -26);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 4400.37, 11.256, 331.878, 4395.6, 64.81, -34.62);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 4500, 11.256, 331.878, 4493.3, 81.96, -43.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 4600, 11.256, 331.878, 4591.4, 99.17, -52.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 4700, 11.256, 331.878, 4689.5, 116.38, -62.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 4800, 11.256, 331.878, 4787.6, 133.59, -71.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 4900, 11.256, 331.878, 4885.7, 150.8, -80.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 5000, 11.256, 331.878, 4983.8, 168.01, -89.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 5100, 11.256, 331.878, 5081.9, 185.22, -98.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 5200, 11.256, 331.878, 5180, 202.43, -108.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 5300, 11.256, 331.878, 5278.1, 219.64, -117.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 5400, 11.256, 331.878, 5376.2, 236.85, -126.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 5500, 11.256, 331.878, 5474.3, 254.06, -135.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 5600, 11.256, 331.878, 5572.4, 271.27, -144.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 5700, 11.256, 331.878, 5670.5, 288.48, -154.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 5800, 11.256, 331.878, 5768.6, 305.69, -163.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 5900, 11.256, 331.878, 5866.7, 322.9, -172.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 6000, 11.256, 331.878, 5964.8, 340.11, -181.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 6100, 11.256, 331.878, 6062.9, 357.32, -190.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 6200, 11.256, 331.878, 6161, 374.53, -200.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 6300, 11.256, 331.878, 6259.1, 391.74, -209.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 6400, 11.256, 331.878, 6357.2, 408.95, -218.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 6500, 11.256, 331.878, 6455.3, 426.16, -227.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 6600, 11.256, 331.878, 6553.4, 443.37, -236.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 6700, 11.256, 331.878, 6651.5, 460.58, -246.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 6800, 11.256, 331.878, 6749.6, 477.79, -255.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 6900, 11.256, 331.878, 6847.7, 495, -264.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 7000, 11.256, 331.878, 6945.8, 512.21, -273.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 7100, 11.256, 331.878, 7043.9, 529.42, -282.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 7200, 11.256, 331.878, 7142, 546.63, -292.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 7300, 11.256, 331.878, 7240.1, 563.84, -301.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 7400, 11.256, 331.878, 7338.2, 581.05, -310.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 7500, 11.256, 331.878, 7436.3, 598.26, -319.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 7600, 11.256, 331.878, 7534.4, 615.47, -328.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 7700, 11.256, 331.878, 7632.5, 632.68, -338.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 7800, 11.256, 331.878, 7730.6, 649.89, -347.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 7900, 11.256, 331.878, 7828.7, 667.1, -356.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8000, 11.256, 331.878, 7926.8, 684.31, -365.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8100, 11.256, 331.878, 8024.9, 701.52, -374.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8200, 11.256, 331.878, 8123, 718.73, -384.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8300, 11.256, 331.878, 8221.1, 735.94, -393.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8400, 11.256, 331.878, 8319.2, 753.15, -402.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8500, 11.256, 331.878, 8417.3, 770.36, -411.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8538.86, 11.256, 331.878, 8455.4, 777.05, -415.37);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8600, 10.338, 331.878, 8515.5, 787.15, -420.77);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8700, 8.838, 331.878, 8614.1, 801.84, -428.62);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8800, 7.338, 331.878, 8713.1, 814.25, -435.25);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 8900, 5.838, 331.878, 8812.4, 824.37, -440.66);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9000, 4.338, 331.878, 8912, 832.19, -444.84);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9100, 2.838, 331.878, 9011.8, 837.71, -447.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9200, 1.338, 331.878, 9111.7, 840.92, -449.51);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9289.23, 0, 360, 9200.9, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9300, 0, 0, 9211.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9400, 0, 0, 9311.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9500, 0, 0, 9411.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9600, 0, 0, 9511.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9700, 0, 0, 9611.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9800, 0, 0, 9711.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 9900, 0, 0, 9811.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (3, 10000, 0, 0, 9911.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 0, 0, 0, 0, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 100, 0, 0, 100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 200, 0, 0, 200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 300, 0, 0, 300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 400, 0, 0, 400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 500, 0, 0, 500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 600, 0, 0, 600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 700, 0, 0, 700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 800, 0, 0, 800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 900, 0, 0, 900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 1000, 0, 0, 1000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 1100, 0, 0, 1100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 1200, 0, 0, 1200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 1300, 0, 0, 1300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 1400, 0, 0, 1400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 1500, 0, 0, 1500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 1600, 0, 0, 1600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 1700, 0, 0, 1700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 1800, 0, 0, 1800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 1900, 0, 0, 1900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 2000, 0, 0, 2000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 2100, 0, 0, 2100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 2200, 0, 0, 2200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 2300, 0, 0, 2300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 2400, 0, 0, 2400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 2500, 0, 0, 2500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 2600, 0, 0, 2600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 2700, 0, 0, 2700, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 2800, 0, 0, 2800, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 2900, 0, 0, 2900, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3000, 0, 0, 3000, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3100, 0, 0, 3100, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3200, 0, 0, 3200, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3300, 0, 0, 3300, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3400, 0, 0, 3400, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3500, 0, 0, 3500, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3600, 0, 0, 3600, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3650, 0, 0, 3650, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3700, .75, 331.878, 3700, .29, -.15);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3800, 2.25, 331.878, 3800, 2.6, -1.38);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 3900, 3.75, 331.878, 3899.9, 7.22, -3.85);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 4000, 5.25, 331.878, 3999.6, 14.14, -7.55);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 4100, 6.75, 331.878, 4099, 23.36, -12.48);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 4200, 8.25, 331.878, 4198.1, 34.87, -18.63);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 4300, 9.75, 331.878, 4296.9, 48.67, -26);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 4400.37, 11.256, 331.878, 4395.6, 64.81, -34.62);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 4500, 11.256, 331.878, 4493.3, 81.96, -43.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 4600, 11.256, 331.878, 4591.4, 99.17, -52.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 4700, 11.256, 331.878, 4689.5, 116.38, -62.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 4800, 11.256, 331.878, 4787.6, 133.59, -71.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 4900, 11.256, 331.878, 4885.7, 150.8, -80.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 5000, 11.256, 331.878, 4983.8, 168.01, -89.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 5100, 11.256, 331.878, 5081.9, 185.22, -98.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 5200, 11.256, 331.878, 5180, 202.43, -108.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 5300, 11.256, 331.878, 5278.1, 219.64, -117.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 5400, 11.256, 331.878, 5376.2, 236.85, -126.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 5500, 11.256, 331.878, 5474.3, 254.06, -135.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 5600, 11.256, 331.878, 5572.4, 271.27, -144.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 5700, 11.256, 331.878, 5670.5, 288.48, -154.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 5800, 11.256, 331.878, 5768.6, 305.69, -163.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 5900, 11.256, 331.878, 5866.7, 322.9, -172.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 6000, 11.256, 331.878, 5964.8, 340.11, -181.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 6100, 11.256, 331.878, 6062.9, 357.32, -190.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 6200, 11.256, 331.878, 6161, 374.53, -200.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 6300, 11.256, 331.878, 6259.1, 391.74, -209.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 6400, 11.256, 331.878, 6357.2, 408.95, -218.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 6500, 11.256, 331.878, 6455.3, 426.16, -227.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 6600, 11.256, 331.878, 6553.4, 443.37, -236.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 6700, 11.256, 331.878, 6651.5, 460.58, -246.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 6800, 11.256, 331.878, 6749.6, 477.79, -255.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 6900, 11.256, 331.878, 6847.7, 495, -264.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 7000, 11.256, 331.878, 6945.8, 512.21, -273.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 7100, 11.256, 331.878, 7043.9, 529.42, -282.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 7200, 11.256, 331.878, 7142, 546.63, -292.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 7300, 11.256, 331.878, 7240.1, 563.84, -301.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 7400, 11.256, 331.878, 7338.2, 581.05, -310.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 7500, 11.256, 331.878, 7436.3, 598.26, -319.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 7600, 11.256, 331.878, 7534.4, 615.47, -328.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 7700, 11.256, 331.878, 7632.5, 632.68, -338.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 7800, 11.256, 331.878, 7730.6, 649.89, -347.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 7900, 11.256, 331.878, 7828.7, 667.1, -356.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8000, 11.256, 331.878, 7926.8, 684.31, -365.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8100, 11.256, 331.878, 8024.9, 701.52, -374.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8200, 11.256, 331.878, 8123, 718.73, -384.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8300, 11.256, 331.878, 8221.1, 735.94, -393.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8400, 11.256, 331.878, 8319.2, 753.15, -402.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8500, 11.256, 331.878, 8417.3, 770.36, -411.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8538.86, 11.256, 331.878, 8455.4, 777.05, -415.37);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8600, 10.338, 331.878, 8515.5, 787.15, -420.77);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8700, 8.838, 331.878, 8614.1, 801.84, -428.62);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8800, 7.338, 331.878, 8713.1, 814.25, -435.25);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 8900, 5.838, 331.878, 8812.4, 824.37, -440.66);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9000, 4.338, 331.878, 8912, 832.19, -444.84);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9100, 2.838, 331.878, 9011.8, 837.71, -447.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9200, 1.338, 331.878, 9111.7, 840.92, -449.51);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9289.23, 0, 360, 9200.9, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9300, 0, 0, 9211.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9400, 0, 0, 9311.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9500, 0, 0, 9411.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9600, 0, 0, 9511.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9700, 0, 0, 9611.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9800, 0, 0, 9711.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 9900, 0, 0, 9811.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 10000, 0, 0, 9911.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 10100, 0, 0, 10011.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 10200, 0, 0, 10111.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 10300, 0, 0, 10211.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 10400, 0, 0, 10311.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 10500, 0, 0, 10411.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 10600, 0, 0, 10511.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 10700, 0, 0, 10611.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 10800, 0, 0, 10711.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 10900, 0, 0, 10811.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11000, 0, 0, 10911.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11100, 0, 0, 11011.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11200, 0, 0, 11111.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11233.98, 0, 360, 11145.7, 841.84, -450);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11250, 1.602, 122.861, 11161.7, 841.72, -449.81);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11300, 6.602, 122.861, 11211.6, 839.78, -446.81);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11350, 11.602, 122.861, 11261, 835.49, -440.17);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11400, 16.602, 122.861, 11309.5, 828.88, -429.94);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11450, 21.602, 122.861, 11356.7, 820, -416.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11500, 26.602, 122.861, 11402.3, 808.92, -399.05);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11550, 31.602, 122.861, 11446, 795.73, -378.63);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11600, 36.602, 122.861, 11487.4, 780.52, -355.09);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11650, 41.602, 122.861, 11526.2, 763.41, -328.61);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11700, 46.602, 122.861, 11562.1, 744.54, -299.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11750, 51.602, 122.861, 11594.8, 724.04, -267.65);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11800, 56.602, 122.861, 11624.1, 702.07, -233.64);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11850, 61.602, 122.861, 11649.8, 678.8, -197.61);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11900, 66.602, 122.861, 11671.6, 654.4, -159.84);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 11950, 71.602, 122.861, 11689.4, 629.06, -120.62);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12000, 76.602, 122.861, 11703.1, 602.98, -80.24);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12050, 81.602, 122.861, 11712.6, 576.35, -39.01);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12100, 86.602, 122.861, 11717.7, 549.37, 2.75);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12116.43, 88.245, 122.861, 11718.4, 540.46, 16.54);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12200, 88.245, 122.861, 11721, 495.14, 86.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12300, 88.245, 122.861, 11724.1, 440.91, 170.66);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12400, 88.245, 122.861, 11727.2, 386.68, 254.62);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12500, 88.245, 122.861, 11730.3, 332.45, 338.58);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12600, 88.245, 122.861, 11733.4, 278.22, 422.54);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12700, 88.245, 122.861, 11736.5, 223.99, 506.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12800, 88.245, 122.861, 11739.6, 169.76, 590.46);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 12900, 88.245, 122.861, 11742.7, 115.53, 674.42);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 13000, 88.245, 122.861, 11745.8, 61.3, 758.38);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 13100, 88.245, 122.861, 11748.9, 7.07, 842.34);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 13200, 88.245, 122.861, 11752, -47.16, 926.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 13300, 88.245, 122.861, 11755.1, -101.39, 1010.26);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 13400, 88.245, 122.861, 11758.2, -155.62, 1094.22);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 13500, 88.245, 122.861, 11761.3, -209.85, 1178.18);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 13600, 88.245, 122.861, 11764.4, -264.08, 1262.14);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 13700, 88.245, 122.861, 11767.5, -318.31, 1346.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 13800, 88.245, 122.861, 11770.6, -372.54, 1430.06);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 13900, 88.245, 122.861, 11773.7, -426.77, 1514.02);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 14000, 88.245, 122.861, 11776.8, -481, 1597.98);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 14100, 88.245, 122.861, 11779.9, -535.23, 1681.94);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 14200, 88.245, 122.861, 11783, -589.46, 1765.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 14300, 88.245, 122.861, 11786.1, -643.69, 1849.86);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 14400, 88.245, 122.861, 11789.2, -697.92, 1933.82);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 14500, 88.245, 122.861, 11792.3, -752.15, 2017.78);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 14600, 88.245, 122.861, 11795.4, -806.38, 2101.74);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 14700, 88.245, 122.861, 11798.5, -860.61, 2185.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 14800, 88.245, 122.861, 11801.6, -914.84, 2269.66);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 14900, 88.245, 122.861, 11804.7, -969.07, 2353.62);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15000, 88.245, 122.861, 11807.8, -1023.3, 2437.58);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15100, 88.245, 122.861, 11810.9, -1077.53, 2521.54);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15200, 88.245, 122.861, 11814, -1131.76, 2605.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15300, 88.245, 122.861, 11817.1, -1185.99, 2689.46);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15400, 88.245, 122.861, 11820.2, -1240.22, 2773.42);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15497.47, 88.245, 122.861, 11823.2, -1293.08, 2855.26);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15503.01, 88.356, 122.861, 11823.4, -1296.08, 2859.91);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15600, 88.356, 122.861, 11826.2, -1348.69, 2941.35);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15700, 88.356, 122.861, 11829.1, -1402.93, 3025.31);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15800, 88.356, 122.861, 11832, -1457.17, 3109.27);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 15900, 88.356, 122.861, 11834.9, -1511.41, 3193.23);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 16000, 88.356, 122.861, 11837.8, -1565.65, 3277.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 16100, 88.356, 122.861, 11840.7, -1619.89, 3361.15);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 16200, 88.356, 122.861, 11843.6, -1674.13, 3445.11);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 16300, 88.356, 122.861, 11846.5, -1728.37, 3529.07);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 16400, 88.356, 122.861, 11849.4, -1782.61, 3613.03);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 16500, 88.356, 122.861, 11852.3, -1836.85, 3696.99);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 16600, 88.356, 122.861, 11855.2, -1891.09, 3780.95);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 16700, 88.356, 122.861, 11858.1, -1945.33, 3864.91);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 16800, 88.356, 122.861, 11861, -1999.57, 3948.87);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 16900, 88.356, 122.861, 11863.9, -2053.81, 4032.83);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 17000, 88.356, 122.861, 11866.8, -2108.05, 4116.79);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 17100, 88.356, 122.861, 11869.7, -2162.29, 4200.75);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 17200, 88.356, 122.861, 11872.6, -2216.53, 4284.71);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 17300, 88.356, 122.861, 11875.5, -2270.77, 4368.67);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 17400, 88.356, 122.861, 11878.4, -2325.01, 4452.63);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 17500, 88.356, 122.861, 11881.3, -2379.25, 4536.59);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 17600, 88.356, 122.861, 11884.2, -2433.49, 4620.55);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 17700, 88.356, 122.861, 11887.1, -2487.73, 4704.51);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 17800, 88.356, 122.861, 11890, -2541.97, 4788.47);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 17900, 88.356, 122.861, 11892.9, -2596.21, 4872.43);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 18000, 88.356, 122.861, 11895.8, -2650.45, 4956.39);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 18100, 88.356, 122.861, 11898.7, -2704.69, 5040.35);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 18200, 88.356, 122.861, 11901.6, -2758.93, 5124.31);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 18300, 88.356, 122.861, 11904.5, -2813.17, 5208.27);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 18400, 88.356, 122.861, 11907.4, -2867.41, 5292.23);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 18500, 88.356, 122.861, 11910.3, -2921.65, 5376.19);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 18600, 88.356, 122.861, 11913.2, -2975.89, 5460.15);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 18700, 88.356, 122.861, 11916.1, -3030.13, 5544.11);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 18749.73, 88.356, 122.861, 11917.5, -3057.1, 5585.87);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (4, 18800, 88.356, 122.861, 11918.92, -3057.1, 5585.87);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 0, 0, 0, 0, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 213, .17, 119.01, 213, -.2, .3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 304, .19, 138.1, 304, -.4, .5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 394, .22, 134.24, 394, -.6, .7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 485, .31, 174.09, 485, -1, .9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 575, .53, 160.04, 575, -1.6, 1.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 666, .33, 154.37, 666, -2.2, 1.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 757, .45, 159.9, 757, -2.8, 1.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 847, .36, 159.69, 847, -3.4, 1.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 938, .2, 142.38, 938, -3.8, 2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 1028, .4, 21.9, 1028, -3.6, 2.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 1119, .55, 17.5, 1119, -2.9, 2.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 1209, .53, 7.79, 1209, -2.1, 2.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 1389, 1, 21.28, 1389, .2, 3.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 1479, 1.05, 30.53, 1479, 1.6, 4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 1569, .86, 47.96, 1569, 2.8, 4.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 1749, .86, 35.12, 1749, 4.8, 6.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 1929, 1.13, 47.67, 1929, 7.1, 8.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2018, 1.23, 102.19, 2018, 7.5, 10.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2108, 1.05, 83.86, 2108, 7.4, 12.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2288, .75, 81.92, 2288, 7.7, 15);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2378, 1.85, 78.11, 2378, 8.1, 17);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2468, 1.53, 83.62, 2468, 8.5, 19.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2558, .74, 316.16, 2558, 9.1, 20.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2738, .88, 298.12, 2738, 10.6, 18.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2828, .57, 260.39, 2828, 10.9, 17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2873, .56, 243.62, 2873, 10.8, 16.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2918, .44, 229.36, 2918, 10.6, 16.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 2963, .4, 246.33, 2963, 10.4, 16.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3008, .37, 217.23, 3008, 10.2, 16.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3053, .74, 206.91, 3053, 9.8, 15.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3098, .94, 180.37, 3098, 9.2, 15.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3125, .94, 185.18, 3125, 8.8, 15.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3243, .87, 175.78, 3243, 6.9, 15.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3333, 1.06, 170.66, 3333, 5.4, 16);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3423, 1.01, 171.28, 3423, 3.8, 16.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3514, 1, 159.46, 3514, 2.3, 16.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3604, .93, 154.79, 3604, .9, 17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3694, 1.19, 154.36, 3694, -.6, 18);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3784, 1.37, 149.98, 3784, -2.4, 18.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3875, .62, 148.6, 3875, -3.8, 19.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 3964, .59, 137.9, 3964, -4.6, 20.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 4055, .87, 298.12, 4055, -4.6, 20);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 4145, .93, 294.25, 4145, -4, 18.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 4235, 1.12, 300.61, 4235, -3.3, 17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 4325, .89, 295.04, 4325, -2.6, 15.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 4415, 1.36, 280.56, 4415, -2.1, 14.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 4505, .84, 292.4, 4505, -1.7, 12.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 4685, .78, 290.22, 4685, -.8, 10.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 4775, .74, 295.27, 4775, -.3, 9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 4866, .74, 291.3, 4866, .2, 7.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 4956, .88, 288.93, 4956, .6, 6.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 5046, .96, 294.67, 5046, 1.1, 5.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 5136, 1.05, 283.59, 5136, 1.6, 3.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 5226, .88, 284.33, 5226, 2, 2.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 5316, .84, 287.43, 5316, 2.4, 1.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 5496, .87, 291.79, 5496, 3.3, -1.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 5587, .86, 288.02, 5587, 3.8, -2.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 5766, .75, 264.26, 5766, 4.1, -5.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 5856, .77, 256.53, 5856, 3.9, -6.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 5946, .7, 265.03, 5946, 3.7, -7.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 6036, .7, 263.37, 6036, 3.6, -8.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 6125, .68, 267.37, 6125, 3.5, -9.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 6215, .58, 267.85, 6215, 3.5, -10.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 6305, .66, 278.87, 6305, 3.6, -11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 6395, .61, 284.17, 6395, 3.8, -12.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 6485, .57, 275.17, 6485, 4, -13.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 6575, .41, 281.6, 6575, 4.1, -14.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 6665, .47, 272.99, 6665, 4.2, -15);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 6845, .5, 291.82, 6845, 4.5, -16.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 6935, .67, 298.2, 6935, 4.9, -17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7028, .45, 277.29, 7028, 5.2, -18.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7116, .51, 284.48, 7116, 5.3, -18.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7206, .5, 284.04, 7206, 5.5, -19.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7296, .41, 291.27, 7296, 5.7, -20.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7387, .45, 301.62, 7387, 6, -20.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7477, .38, 322.63, 7477, 6.4, -21.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7567, .56, 323.48, 7567, 7, -21.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7657, .55, 339.39, 7657, 7.8, -22.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7747, .57, 355.85, 7747, 8.7, -22.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7837, .63, 1.17, 7837, 9.6, -22.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 7927, .68, 357.68, 7927, 10.6, -22.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8017, .76, 4.84, 8017, 11.7, -22.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8107, .51, 35.89, 8107, 12.6, -22.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8197, .62, 81.08, 8197, 13, -21.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8287, .86, 88.22, 8287, 13.1, -20.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8377, .62, 116.92, 8377, 12.9, -19.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8467, .62, 118.71, 8467, 12.4, -18.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8557, .68, 111, 8557, 12, -17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8647, .63, 105.88, 8647, 11.7, -16.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8737, .62, 123.82, 8737, 11.3, -15.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8826, .56, 128.16, 8826, 10.8, -14.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 8916, .66, 115.76, 8916, 10.3, -13.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9006, .75, 103.34, 9006, 9.9, -12.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9096, 1, 117.69, 9096, 9.4, -11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9187, .92, 118.96, 9187, 8.7, -10.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9277, .98, 109.97, 9277, 8.1, -8.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9367, 1, 107.89, 9367, 7.6, -7.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9457, 1, 99.69, 9457, 7.2, -5.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9547, .75, 122.67, 9547, 6.7, -4.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9637, .76, 118.54, 9637, 6.1, -3.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9727, .72, 118.23, 9727, 5.5, -2.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9817, .86, 107.17, 9817, 5, -1.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9908, .93, 99.07, 9908, 4.7, -.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 9998, .87, 98.54, 9998, 4.5, 1.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10088, .81, 94.43, 10088, 4.3, 2.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10178, .96, 93.61, 10178, 4.2, 4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10268, .86, 88.71, 10268, 4.2, 5.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10358, .96, 86.28, 10358, 4.3, 6.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10447, 1.06, 83.67, 10447, 4.4, 8.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10537, .8, 95.49, 10537, 4.4, 9.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10628, .76, 95.75, 10628, 4.3, 11.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10718, .45, 122.89, 10718, 4, 12);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10808, .38, 196.93, 10808, 3.5, 12.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10898, .47, 211.28, 10898, 2.9, 11.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 10988, .31, 201.27, 10988, 2.4, 11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11078, .19, 164.87, 11078, 2, 11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11168, 0, 139.08, 11168, 1.9, 11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11258, .28, 351.34, 11258, 2.1, 11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11347, .33, 348.29, 11347, 2.6, 11.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11437, .45, 2.09, 11437, 3.2, 11.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11528, .74, 3.53, 11528, 4.1, 11.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11618, 1.07, 4.05, 11618, 5.5, 11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11708, 1.08, 1.89, 11708, 7.2, 11.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11798, .89, 357.94, 11798, 8.7, 11.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11888, .86, 8.73, 11888, 10.1, 11.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 11979, .99, 32.32, 11979, 11.4, 12.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12070, 1.57, 18.02, 12070, 13.2, 13.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12160, 2.79, 8.37, 12159.9, 16.5, 13.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12250, 3.69, 10.48, 12249.8, 21.5, 14.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12340, 4.32, 11.66, 12339.6, 27.7, 15.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12430, 5.2, 12.21, 12429.3, 35, 17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12520, 6.07, 11.82, 12518.9, 43.6, 19.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12609, 7.18, 13.17, 12607.3, 53.6, 21.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12699, 7.39, 12.89, 12696.6, 64.7, 23.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12754, 7.7, 12.93, 12751.1, 71.7, 25.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12789, 8.36, 14.22, 12785.8, 76.5, 26.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12833, 8.82, 14.27, 12829.3, 82.9, 28.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 12874, 9.23, 13.85, 12869.8, 89.1, 29.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13011, 8.81, 13.01, 13005.1, 110, 34.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13159, 19.32, 28.09, 13148.5, 142.7, 48.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13249, 23.23, 24.16, 13232.4, 172, 63.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13294, 25.43, 23.09, 13273.4, 189, 70.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13339, 27.93, 22.32, 13313.6, 207.6, 78.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13384, 30.41, 22.65, 13352.9, 227.9, 86.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13429, 33.55, 23.28, 13391.1, 249.8, 96.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13474, 36.92, 22.53, 13427.9, 273.7, 106.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13519, 40.62, 21.31, 13463, 299.8, 116.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13564, 43.28, 21.19, 13496.5, 327.8, 127.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13609, 46.03, 21.48, 13528.5, 357.3, 139.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13654, 49.07, 21.85, 13558.9, 388.2, 151.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13699, 52.38, 22.58, 13587.4, 420.4, 164.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13743, 55.69, 23.16, 13613.2, 453.2, 178.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13788, 57.77, 23.33, 13637.9, 487.8, 193.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13833, 60.92, 23.47, 13660.8, 523.3, 208.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13878, 62.97, 23.96, 13682, 559.7, 224.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13923, 65.61, 23.37, 13701.5, 596.8, 240.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 13967, 69.27, 23.78, 13718.4, 634, 257.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14012, 71.98, 23.15, 13733.3, 672.9, 274.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14057, 73.92, 23.17, 13746.5, 712.5, 291);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14102, 77.04, 23.66, 13757.8, 752.5, 308.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14147, 80.13, 23.54, 13766.7, 792.9, 326);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14192, 82.88, 24.03, 13773.3, 833.6, 343.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14237, 85.87, 24.21, 13777.7, 874.5, 362.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14282, 88.76, 24.07, 13779.8, 915.5, 380.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14327, 90, 23.94, 13780.3, 956.6, 398.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14372, 90, 24.1, 13780.3, 997.7, 417.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14462, 90, 23.89, 13780.3, 1079.9, 453.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14558, 90, 23.99, 13780.3, 1167.6, 492.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14647, 90, 23.04, 13780.3, 1249.2, 528.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14737, 90, 22.64, 13780.3, 1332.1, 563.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14827, 90, 21.33, 13780.3, 1415.6, 596.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 14918, 90, 20.53, 13780.3, 1500.6, 629.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15008, 90, 20.11, 13780.3, 1585, 660.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15098, 90, 21.59, 13780.3, 1669.1, 692.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15188, 90, 23.5, 13780.3, 1752.2, 727.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15278, 90, 22.59, 13780.3, 1835, 762.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15368, 90, 21.9, 13780.3, 1918.3, 796.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15458, 90, 21.92, 13780.3, 2001.8, 830.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15548, 90, 21.6, 13780.3, 2085.4, 863.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15638, 90, 22.32, 13780.3, 2168.9, 897.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15728, 90, 23.38, 13780.3, 2251.8, 932.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15817, 89.94, 23.52, 13780.3, 2333.4, 967.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15907, 90, 24.51, 13780.3, 2415.6, 1004.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 15998, 90, 24.18, 13780.3, 2498.5, 1041.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 16086, 90, 24.75, 13780.3, 2578.6, 1078);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 16300, 92, 24.75, 13776.6, 2772.9, 1167.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 16745.4, 92, 24.75, 13761.1, 3177.1, 1354);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (5, 19461.3, 88, 24.75, 13761.1, 5643, 2490.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 0, 0, 0, 0, 0, 0);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 213, .17, 119.01, 213, -.2, .3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 304, .19, 138.1, 304, -.4, .5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 394, .22, 134.24, 394, -.6, .7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 485, .31, 174.09, 485, -1, .9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 575, .53, 160.04, 575, -1.6, 1.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 666, .33, 154.37, 666, -2.2, 1.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 757, .45, 159.9, 757, -2.8, 1.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 847, .36, 159.69, 847, -3.4, 1.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 938, .2, 142.38, 938, -3.8, 2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 1028, .4, 21.9, 1028, -3.6, 2.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 1119, .55, 17.5, 1119, -2.9, 2.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 1209, .53, 7.79, 1209, -2.1, 2.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 1389, 1, 21.28, 1389, .2, 3.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 1479, 1.05, 30.53, 1479, 1.6, 4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 1569, .86, 47.96, 1569, 2.8, 4.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 1749, .86, 35.12, 1749, 4.8, 6.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 1929, 1.13, 47.67, 1929, 7.1, 8.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2018, 1.23, 102.19, 2018, 7.5, 10.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2108, 1.05, 83.86, 2108, 7.4, 12.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2288, .75, 81.92, 2288, 7.7, 15);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2378, 1.85, 78.11, 2378, 8.1, 17);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2468, 1.53, 83.62, 2468, 8.5, 19.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2558, .74, 316.16, 2558, 9.1, 20.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2738, .88, 298.12, 2738, 10.6, 18.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2828, .57, 260.39, 2828, 10.9, 17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2873, .56, 243.62, 2873, 10.8, 16.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2918, .44, 229.36, 2918, 10.6, 16.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 2963, .4, 246.33, 2963, 10.4, 16.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3008, .37, 217.23, 3008, 10.2, 16.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3053, .74, 206.91, 3053, 9.8, 15.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3098, .94, 180.37, 3098, 9.2, 15.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3125, .94, 185.18, 3125, 8.8, 15.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3243, .87, 175.78, 3243, 6.9, 15.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3333, 1.06, 170.66, 3333, 5.4, 16);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3423, 1.01, 171.28, 3423, 3.8, 16.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3514, 1, 159.46, 3514, 2.3, 16.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3604, .93, 154.79, 3604, .9, 17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3694, 1.19, 154.36, 3694, -.6, 18);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3784, 1.37, 149.98, 3784, -2.4, 18.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3875, .62, 148.6, 3875, -3.8, 19.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 3964, .59, 137.9, 3964, -4.6, 20.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 4055, .87, 298.12, 4055, -4.6, 20);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 4145, .93, 294.25, 4145, -4, 18.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 4235, 1.12, 300.61, 4235, -3.3, 17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 4325, .89, 295.04, 4325, -2.6, 15.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 4415, 1.36, 280.56, 4415, -2.1, 14.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 4505, .84, 292.4, 4505, -1.7, 12.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 4685, .78, 290.22, 4685, -.8, 10.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 4775, .74, 295.27, 4775, -.3, 9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 4866, .74, 291.3, 4866, .2, 7.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 4956, .88, 288.93, 4956, .6, 6.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 5046, .96, 294.67, 5046, 1.1, 5.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 5136, 1.05, 283.59, 5136, 1.6, 3.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 5226, .88, 284.33, 5226, 2, 2.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 5316, .84, 287.43, 5316, 2.4, 1.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 5496, .87, 291.79, 5496, 3.3, -1.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 5587, .86, 288.02, 5587, 3.8, -2.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 5766, .75, 264.26, 5766, 4.1, -5.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 5856, .77, 256.53, 5856, 3.9, -6.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 5946, .7, 265.03, 5946, 3.7, -7.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 6036, .7, 263.37, 6036, 3.6, -8.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 6125, .68, 267.37, 6125, 3.5, -9.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 6215, .58, 267.85, 6215, 3.5, -10.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 6305, .66, 278.87, 6305, 3.6, -11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 6395, .61, 284.17, 6395, 3.8, -12.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 6485, .57, 275.17, 6485, 4, -13.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 6575, .41, 281.6, 6575, 4.1, -14.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 6665, .47, 272.99, 6665, 4.2, -15);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 6845, .5, 291.82, 6845, 4.5, -16.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 6935, .67, 298.2, 6935, 4.9, -17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7028, .45, 277.29, 7028, 5.2, -18.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7116, .51, 284.48, 7116, 5.3, -18.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7206, .5, 284.04, 7206, 5.5, -19.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7296, .41, 291.27, 7296, 5.7, -20.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7387, .45, 301.62, 7387, 6, -20.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7477, .38, 322.63, 7477, 6.4, -21.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7567, .56, 323.48, 7567, 7, -21.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7657, .55, 339.39, 7657, 7.8, -22.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7747, .57, 355.85, 7747, 8.7, -22.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7837, .63, 1.17, 7837, 9.6, -22.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 7927, .68, 357.68, 7927, 10.6, -22.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8017, .76, 4.84, 8017, 11.7, -22.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8107, .51, 35.89, 8107, 12.6, -22.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8197, .62, 81.08, 8197, 13, -21.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8287, .86, 88.22, 8287, 13.1, -20.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8377, .62, 116.92, 8377, 12.9, -19.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8467, .62, 118.71, 8467, 12.4, -18.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8557, .68, 111, 8557, 12, -17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8647, .63, 105.88, 8647, 11.7, -16.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8737, .62, 123.82, 8737, 11.3, -15.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8826, .56, 128.16, 8826, 10.8, -14.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 8916, .66, 115.76, 8916, 10.3, -13.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9006, .75, 103.34, 9006, 9.9, -12.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9096, 1, 117.69, 9096, 9.4, -11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9187, .92, 118.96, 9187, 8.7, -10.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9277, .98, 109.97, 9277, 8.1, -8.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9367, 1, 107.89, 9367, 7.6, -7.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9457, 1, 99.69, 9457, 7.2, -5.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9547, .75, 122.67, 9547, 6.7, -4.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9637, .76, 118.54, 9637, 6.1, -3.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9727, .72, 118.23, 9727, 5.5, -2.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9817, .86, 107.17, 9817, 5, -1.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9908, .93, 99.07, 9908, 4.7, -.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 9998, .87, 98.54, 9998, 4.5, 1.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10088, .81, 94.43, 10088, 4.3, 2.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10178, .96, 93.61, 10178, 4.2, 4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10268, .86, 88.71, 10268, 4.2, 5.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10358, .96, 86.28, 10358, 4.3, 6.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10447, 1.06, 83.67, 10447, 4.4, 8.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10537, .8, 95.49, 10537, 4.4, 9.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10628, .76, 95.75, 10628, 4.3, 11.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10718, .45, 122.89, 10718, 4, 12);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10808, .38, 196.93, 10808, 3.5, 12.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10898, .47, 211.28, 10898, 2.9, 11.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 10988, .31, 201.27, 10988, 2.4, 11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11078, .19, 164.87, 11078, 2, 11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11168, 0, 139.08, 11168, 1.9, 11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11258, .28, 351.34, 11258, 2.1, 11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11347, .33, 348.29, 11347, 2.6, 11.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11437, .45, 2.09, 11437, 3.2, 11.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11528, .74, 3.53, 11528, 4.1, 11.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11618, 1.07, 4.05, 11618, 5.5, 11.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11708, 1.08, 1.89, 11708, 7.2, 11.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11798, .89, 357.94, 11798, 8.7, 11.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11888, .86, 8.73, 11888, 10.1, 11.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 11979, .99, 32.32, 11979, 11.4, 12.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12070, 1.57, 18.02, 12070, 13.2, 13.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12160, 2.79, 8.37, 12159.9, 16.5, 13.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12250, 3.69, 10.48, 12249.8, 21.5, 14.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12340, 4.32, 11.66, 12339.6, 27.7, 15.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12430, 5.2, 12.21, 12429.3, 35, 17.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12520, 6.07, 11.82, 12518.9, 43.6, 19.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12609, 7.18, 13.17, 12607.3, 53.6, 21.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12699, 7.39, 12.89, 12696.6, 64.7, 23.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12754, 7.7, 12.93, 12751.1, 71.7, 25.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12789, 8.36, 14.22, 12785.8, 76.5, 26.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12833, 8.82, 14.27, 12829.3, 82.9, 28.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 12874, 9.23, 13.85, 12869.8, 89.1, 29.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13011, 8.81, 13.01, 13005.1, 110, 34.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13159, 19.32, 28.09, 13148.5, 142.7, 48.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13249, 23.23, 24.16, 13232.4, 172, 63.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13294, 25.43, 23.09, 13273.4, 189, 70.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13339, 27.93, 22.32, 13313.6, 207.6, 78.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13384, 30.41, 22.65, 13352.9, 227.9, 86.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13429, 33.55, 23.28, 13391.1, 249.8, 96.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13474, 36.92, 22.53, 13427.9, 273.7, 106.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13519, 40.62, 21.31, 13463, 299.8, 116.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13564, 43.28, 21.19, 13496.5, 327.8, 127.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13609, 46.03, 21.48, 13528.5, 357.3, 139.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13654, 49.07, 21.85, 13558.9, 388.2, 151.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13699, 52.38, 22.58, 13587.4, 420.4, 164.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13743, 55.69, 23.16, 13613.2, 453.2, 178.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13788, 57.77, 23.33, 13637.9, 487.8, 193.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13833, 60.92, 23.47, 13660.8, 523.3, 208.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13878, 62.97, 23.96, 13682, 559.7, 224.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13923, 65.61, 23.37, 13701.5, 596.8, 240.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 13967, 69.27, 23.78, 13718.4, 634, 257.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14012, 71.98, 23.15, 13733.3, 672.9, 274.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14057, 73.92, 23.17, 13746.5, 712.5, 291);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14102, 77.04, 23.66, 13757.8, 752.5, 308.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14147, 80.13, 23.54, 13766.7, 792.9, 326);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14192, 82.88, 24.03, 13773.3, 833.6, 343.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14237, 85.87, 24.21, 13777.7, 874.5, 362.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14282, 88.76, 24.07, 13779.8, 915.5, 380.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14327, 90, 23.94, 13780.3, 956.6, 398.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14372, 90, 24.1, 13780.3, 997.7, 417.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14462, 90, 23.89, 13780.3, 1079.9, 453.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14558, 90, 23.99, 13780.3, 1167.6, 492.8);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14647, 90, 23.04, 13780.3, 1249.2, 528.3);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14737, 90, 22.64, 13780.3, 1332.1, 563.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14827, 90, 21.33, 13780.3, 1415.6, 596.9);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 14918, 90, 20.53, 13780.3, 1500.6, 629.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15008, 90, 20.11, 13780.3, 1585, 660.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15098, 90, 21.59, 13780.3, 1669.1, 692.7);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15188, 90, 23.5, 13780.3, 1752.2, 727.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15278, 90, 22.59, 13780.3, 1835, 762.4);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15368, 90, 21.9, 13780.3, 1918.3, 796.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15458, 90, 21.92, 13780.3, 2001.8, 830.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15548, 90, 21.6, 13780.3, 2085.4, 863.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15638, 90, 22.32, 13780.3, 2168.9, 897.2);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15728, 90, 23.38, 13780.3, 2251.8, 932.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15817, 89.94, 23.52, 13780.3, 2333.4, 967.5);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15907, 90, 24.51, 13780.3, 2415.6, 1004.1);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 15998, 90, 24.18, 13780.3, 2498.5, 1041.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 16086, 90, 24.75, 13780.3, 2578.6, 1078);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 16300, 92, 24.75, 13776.6, 2772.9, 1167.6);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 16745.4, 92, 24.75, 13761.1, 3177.1, 1354);
INSERT INTO `Survey` (`ProjectID`, `MD`, `Inc`, `Azimuth`, `TVD`, `North`, `East`) VALUES (6, 19461.3, 88, 24.75, 13761.1, 5643, 2490.8);
# 987 records

#
# Table structure for table 'Temperature'
#

DROP TABLE IF EXISTS `Temperature`;

CREATE TABLE `Temperature` (
  `TempID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ProjectID` INTEGER DEFAULT 0, 
  `TVD` FLOAT NULL DEFAULT 0, 
  `TG` FLOAT NULL DEFAULT 0, 
  `Temperature` FLOAT NULL DEFAULT 0, 
  PRIMARY KEY (`TempID`), 
  INDEX (`ProjectID`), 
  INDEX (`TempID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Temperature'
#

INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (1, 1, 0, .015, 60);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (2, 1, 10000, .015, 250);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (3, 2, 0, .015, 70);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (4, 2, 10000, .015, 260);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (5, 3, 20, .02, 80);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (6, 3, 9000, .02, 360);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (7, 4, 0, .012, 67);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (8, 4, 10200, .015, 320);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (9, 5, 0, .015, 90);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (10, 5, 18000, .014, 330);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (11, 6, 20, .012, 56);
INSERT INTO `Temperature` (`TempID`, `ProjectID`, `TVD`, `TG`, `Temperature`) VALUES (12, 6, 5000, .011, 130);
# 12 records

#
# Table structure for table 'Users'
#

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `IDUser` INTEGER NOT NULL AUTO_INCREMENT, 
  `username` VARCHAR(255), 
  `useremail` VARCHAR(255), 
  `password` VARCHAR(255), 
  INDEX (`IDUser`), 
  PRIMARY KEY (`IDUser`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Users'
#

INSERT INTO `Users` (`IDUser`, `username`, `useremail`, `password`) VALUES (1, 'admin', 'admin@gmail.com', 'admin123');
INSERT INTO `Users` (`IDUser`, `username`, `useremail`, `password`) VALUES (2, 'user1', 'user1@gmail.com', 'user123');
INSERT INTO `Users` (`IDUser`, `username`, `useremail`, `password`) VALUES (3, 'user2', 'user2@gmail.com', 'user123');
# 3 records

#
# Table structure for table 'Wellbore'
#

DROP TABLE IF EXISTS `Wellbore`;

CREATE TABLE `Wellbore` (
  `WellboreID` INTEGER AUTO_INCREMENT, 
  `ProjectID` INTEGER NOT NULL DEFAULT 0, 
  `RiserDescription` VARCHAR(255), 
  `RiserOD` FLOAT NULL DEFAULT 0, 
  `RiserID` FLOAT NULL DEFAULT 0, 
  `RiserTop` FLOAT NULL DEFAULT 0, 
  `RiserWeight` FLOAT NULL DEFAULT 0, 
  `RiserActive` TINYINT(1) DEFAULT 0, 
  `CsgDescription` VARCHAR(255), 
  `CsgOD` FLOAT NULL DEFAULT 0, 
  `CsgID` FLOAT NULL DEFAULT 0, 
  `CsgTop` FLOAT NULL DEFAULT 0, 
  `CsgWeight` FLOAT NULL DEFAULT 0, 
  `L1Description` VARCHAR(255), 
  `L2Description` VARCHAR(255), 
  `HoleDescription` VARCHAR(255), 
  `HoleID` FLOAT NULL DEFAULT 0, 
  PRIMARY KEY (`ProjectID`), 
  INDEX (`ProjectID`), 
  INDEX (`RiserID`), 
  INDEX (`CsgID`), 
  INDEX (`WellboreID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Wellbore'
#

INSERT INTO `Wellbore` (`WellboreID`, `ProjectID`, `RiserDescription`, `RiserOD`, `RiserID`, `RiserTop`, `RiserWeight`, `RiserActive`, `CsgDescription`, `CsgOD`, `CsgID`, `CsgTop`, `CsgWeight`, `L1Description`, `L2Description`, `HoleDescription`, `HoleID`) VALUES (1, 1, 'Riser20\"', 18.2, 16, 0, 20, 1, 'CSG16\"', 14.3, 14, 1000, 20, 'Liner12\"', 'Liner2', 'Hole 8.5\"', 8.5);
INSERT INTO `Wellbore` (`WellboreID`, `ProjectID`, `RiserDescription`, `RiserOD`, `RiserID`, `RiserTop`, `RiserWeight`, `RiserActive`, `CsgDescription`, `CsgOD`, `CsgID`, `CsgTop`, `CsgWeight`, `L1Description`, `L2Description`, `HoleDescription`, `HoleID`) VALUES (2, 2, NULL, 0, 0, 0, 0, 0, 'CSG12 1/4\"', 13, 12.25, 0, 20, NULL, NULL, 'Hole 8.75\"', 8.75);
INSERT INTO `Wellbore` (`WellboreID`, `ProjectID`, `RiserDescription`, `RiserOD`, `RiserID`, `RiserTop`, `RiserWeight`, `RiserActive`, `CsgDescription`, `CsgOD`, `CsgID`, `CsgTop`, `CsgWeight`, `L1Description`, `L2Description`, `HoleDescription`, `HoleID`) VALUES (3, 3, 'Riser22\"', 22.2, 20, 0, 45, 1, 'CSG15.5\"', 12, 11.5, 2950, 20, NULL, NULL, 'Hole 6.5\"', 6.5);
INSERT INTO `Wellbore` (`WellboreID`, `ProjectID`, `RiserDescription`, `RiserOD`, `RiserID`, `RiserTop`, `RiserWeight`, `RiserActive`, `CsgDescription`, `CsgOD`, `CsgID`, `CsgTop`, `CsgWeight`, `L1Description`, `L2Description`, `HoleDescription`, `HoleID`) VALUES (4, 4, NULL, 0, NULL, NULL, NULL, 0, 'CSG16\"', 14.5, 12.25, 0, 20, 'Liner 11\"', 'Liner2', 'Hole 8.25\"', 8.25);
INSERT INTO `Wellbore` (`WellboreID`, `ProjectID`, `RiserDescription`, `RiserOD`, `RiserID`, `RiserTop`, `RiserWeight`, `RiserActive`, `CsgDescription`, `CsgOD`, `CsgID`, `CsgTop`, `CsgWeight`, `L1Description`, `L2Description`, `HoleDescription`, `HoleID`) VALUES (5, 5, 'Riser19\"', 19.2, 19, 0, 30, 1, 'CSG16\"', 13.675, 13.25, 1500, 20, 'Liner 12.25\"', NULL, 'Hole 6.25\"', 6.25);
INSERT INTO `Wellbore` (`WellboreID`, `ProjectID`, `RiserDescription`, `RiserOD`, `RiserID`, `RiserTop`, `RiserWeight`, `RiserActive`, `CsgDescription`, `CsgOD`, `CsgID`, `CsgTop`, `CsgWeight`, `L1Description`, `L2Description`, `HoleDescription`, `HoleID`) VALUES (6, 6, NULL, NULL, NULL, NULL, NULL, 0, 'CSG16\"', 12.678, 12.67, 0, 20, 'Liner 14\"', 'Liner2', 'Hole 6\"', 6);
# 6 records

#
# Table structure for table 'WellInfo'
#

DROP TABLE IF EXISTS `WellInfo`;

CREATE TABLE `WellInfo` (
  `ProjectID` INTEGER NOT NULL AUTO_INCREMENT, 
  `UserID` INTEGER DEFAULT 0, 
  `project_name` VARCHAR(255), 
  `location` VARCHAR(255), 
  `field` VARCHAR(255), 
  `lease` VARCHAR(255), 
  `operator` VARCHAR(255), 
  `rigcontractor` VARCHAR(255), 
  `rigtype` INTEGER DEFAULT 0, 
  `wellname` VARCHAR(255), 
  `rigname` VARCHAR(255), 
  PRIMARY KEY (`ProjectID`), 
  INDEX (`UserID`), 
  INDEX (`ProjectID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'WellInfo'
#

INSERT INTO `WellInfo` (`ProjectID`, `UserID`, `project_name`, `location`, `field`, `lease`, `operator`, `rigcontractor`, `rigtype`, `wellname`, `rigname`) VALUES (1, 1, 'Project#1', 'LocationX', 'FieldX', 'LeaseX', 'OperatorX', 'RigCX', 0, 'Well#1', 'RigX');
INSERT INTO `WellInfo` (`ProjectID`, `UserID`, `project_name`, `location`, `field`, `lease`, `operator`, `rigcontractor`, `rigtype`, `wellname`, `rigname`) VALUES (2, 1, 'Project#2', 'LocationX2', 'FieldX2', 'LeaseX2', 'OperatorX2', 'RigCX2', 0, 'Well#2', 'RigX1');
INSERT INTO `WellInfo` (`ProjectID`, `UserID`, `project_name`, `location`, `field`, `lease`, `operator`, `rigcontractor`, `rigtype`, `wellname`, `rigname`) VALUES (3, 2, 'Project#3', 'LocationX3', 'FieldX3', 'LeaseX3', 'OperatorX3', 'RigCX3', 0, 'Well#3', 'RigX3');
INSERT INTO `WellInfo` (`ProjectID`, `UserID`, `project_name`, `location`, `field`, `lease`, `operator`, `rigcontractor`, `rigtype`, `wellname`, `rigname`) VALUES (4, 2, 'Project#4', 'LocationX4', 'FieldX4', 'LeaseX4', 'OperatorX4', 'RigCX4', 0, 'Well#4', 'RigX4');
INSERT INTO `WellInfo` (`ProjectID`, `UserID`, `project_name`, `location`, `field`, `lease`, `operator`, `rigcontractor`, `rigtype`, `wellname`, `rigname`) VALUES (5, 3, 'Project#5', 'LocationX5', 'FieldX5', 'LeaseX5', 'OperatorX5', 'RigCX5', 0, 'Well#5', 'RigX5');
INSERT INTO `WellInfo` (`ProjectID`, `UserID`, `project_name`, `location`, `field`, `lease`, `operator`, `rigcontractor`, `rigtype`, `wellname`, `rigname`) VALUES (6, 3, 'Project#6', 'LocationX6', 'FieldX6', 'LeaseX6', 'OperatorX6', 'RigCX6', 0, 'Well#6', 'RigX6');
# 6 records

