CREATE DATABASE php_project_hospital_juanmontill_01sep23;

USE php_project_hospital_juanmontill_01sep23;

CREATE TABLE test (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR(255)
);

CREATE TABLE document_type (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50)
);

CREATE TABLE doctors_type (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50)
);

CREATE TABLE dolar_price (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  price float(11,2)
);

CREATE TABLE budgets (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  total_end float(11,2)
);