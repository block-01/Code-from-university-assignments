DROP DATABASE IF EXISTS `UNI_Assignment_DMDD_Testing_DB_1`;
CREATE DATABASE `UNI_Assignment_DMDD_Testing_DB_1`;

CREATE TABLE `UNI_Assignment_DMDD_Testing_DB_1`.`DateTime` (
  `TimeDateID` INT NOT NULL,
  `Date (dd/mm/yy)` VARCHAR(100),
  `Durration (mins)` INT DEFAULT NULL,
  PRIMARY KEY (`TimeDateID`)
);

CREATE TABLE `UNI_Assignment_DMDD_Testing_DB_1`.`Users` (
  `UserID` INT NOT NULL,
  `Name` VARCHAR(45) DEFAULT NULL,
  `DateCreated` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
);

CREATE TABLE `UNI_Assignment_DMDD_Testing_DB_1`.`CodeRepo` (
  `RepoID` INT NOT NULL,
  `Name` VARCHAR(45) DEFAULT NULL,
  `UserID` INT DEFAULT NULL,
  `URL` VARCHAR(150),
  PRIMARY KEY (`RepoID`),
  CONSTRAINT fk_UserID_CodeRepo FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE `UNI_Assignment_DMDD_Testing_DB_1`.`OperatingSystem` (
  `OSID` INT NOT NULL,
  `Name` VARCHAR(45) DEFAULT NULL,
  `Version` VARCHAR(45) DEFAULT NULL,
  `URL` VARCHAR(200),
  PRIMARY KEY (`OSID`)
);

CREATE TABLE `UNI_Assignment_DMDD_Testing_DB_1`.`LogPath` (
  `LogID` INT NOT NULL,
  `Path` VARCHAR(200),
  `TimeDateID` INT DEFAULT NULL,
  `UserID` INT DEFAULT NULL,
  PRIMARY KEY (`LogID`),
  CONSTRAINT fk_UserID_LogPath FOREIGN KEY (UserID) REFERENCES Users(UserID),
  CONSTRAINT fk_TimeDateID_LogPath FOREIGN KEY (TimeDateID) REFERENCES DateTime(TimeDateID)
);

CREATE TABLE `UNI_Assignment_DMDD_Testing_DB_1`.`Error` (
  `ErrorID` INT NOT NULL,
  `Name` VARCHAR(45),
  `Details` VARCHAR(400),
  PRIMARY KEY (`ErrorID`)
);

CREATE TABLE `UNI_Assignment_DMDD_Testing_DB_1`.`Main` (
  `ID` INT NOT NULL,
  `LogID` INT DEFAULT NULL,
  `UserID` INT DEFAULT NULL,
  `RepoID` INT DEFAULT NULL,
  `TimeDateID` INT DEFAULT NULL,
  `OSID` INT DEFAULT NULL,
  `Status` VARCHAR (200)  DEFAULT "Not Started",
  `ErrorID` INT DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT fk_TimeDateID_Main FOREIGN KEY (TimeDateID) REFERENCES DateTime(TimeDateID),
  CONSTRAINT fk_UserID_Main FOREIGN KEY (UserID) REFERENCES Users(UserID),
  CONSTRAINT fk_RepoID_Main FOREIGN KEY (RepoID) REFERENCES CodeRepo(RepoID),
  CONSTRAINT fk_OSID_Main FOREIGN KEY (OSID) REFERENCES OperatingSystem(OSID),
  CONSTRAINT fk_LogID_Main FOREIGN KEY (LogID) REFERENCES LogPath(LogID),
  CONSTRAINT fk_ErrorID_Main FOREIGN KEY (ErrorID) REFERENCES Error(ErrorID)
);