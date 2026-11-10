-- Data Deduplication System: safe local demo schema
-- Creates empty tables only. No accounts, passwords, or uploaded files are included.

CREATE DATABASE IF NOT EXISTS `Datadeduplication-2024`;
USE `Datadeduplication-2024`;

CREATE TABLE IF NOT EXISTS `user` (
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `age` VARCHAR(10) NOT NULL,
  `gen` VARCHAR(20) NOT NULL,
  `pword` VARCHAR(255) NOT NULL,
  `status1` VARCHAR(20) NOT NULL DEFAULT 'Pending',
  `logins` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`email`)
);

CREATE TABLE IF NOT EXISTS `owner` (
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `age` VARCHAR(10) NOT NULL,
  `gen` VARCHAR(20) NOT NULL,
  `pword` VARCHAR(255) NOT NULL,
  `logins` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`email`)
);

CREATE TABLE IF NOT EXISTS `upload` (
  `fid` VARCHAR(80) NOT NULL,
  `uid` VARCHAR(150) NOT NULL,
  `fname` VARCHAR(255) NOT NULL,
  `part1` LONGBLOB,
  `part2` LONGBLOB,
  `type` VARCHAR(150),
  `fdes` TEXT,
  `f1key` VARCHAR(255),
  `f2key` VARCHAR(255),
  PRIMARY KEY (`fid`)
);

CREATE TABLE IF NOT EXISTS `upload1` (
  `fid` VARCHAR(80) NOT NULL,
  `uid` VARCHAR(150) NOT NULL,
  `fname` VARCHAR(255) NOT NULL,
  `Part` LONGBLOB,
  `type` VARCHAR(150),
  `fdes` TEXT,
  `f1key` VARCHAR(255),
  `f2key` VARCHAR(255),
  PRIMARY KEY (`fid`)
);

CREATE TABLE IF NOT EXISTS `keyreq` (
  `fid` VARCHAR(80) NOT NULL,
  `owner` VARCHAR(150) NOT NULL,
  `userid` VARCHAR(150) NOT NULL,
  `status1` VARCHAR(20) NOT NULL DEFAULT 'pending',
  `Date1` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`fid`, `userid`)
);

CREATE TABLE IF NOT EXISTS `ukeys` (
  `fid` VARCHAR(80) NOT NULL,
  `userid` VARCHAR(150) NOT NULL,
  `f1key` VARCHAR(255) NOT NULL,
  `f2key` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`fid`, `userid`)
);

CREATE TABLE IF NOT EXISTS `fcount` (
  `fid` VARCHAR(80) NOT NULL,
  `uid` VARCHAR(150) NOT NULL,
  `fcount` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`fid`, `uid`)
);

CREATE TABLE IF NOT EXISTS `attack` (
  `fid` VARCHAR(80) NOT NULL,
  `owner` VARCHAR(150),
  `userid` VARCHAR(150) NOT NULL,
  `ip` VARCHAR(80),
  `date1` VARCHAR(120),
  `fcount` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`fid`, `userid`)
);

CREATE TABLE IF NOT EXISTS `req` (
  `email` VARCHAR(150) NOT NULL,
  `request` VARCHAR(20) NOT NULL DEFAULT 'false',
  PRIMARY KEY (`email`)
);
