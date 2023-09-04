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

CREATE TABLE dolar_prices (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  price float(11,2)
);

CREATE TABLE budgets (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  total_end float(11,2)
);

CREATE TABLE doctors (
  id INT(11) AUTO_INCREMENT,
  test_type_id INT,
  document_type_id INT,
  doctor_type_id INT,
  id_number INT,
  name VARCHAR(50),
  cell_phone_number VARCHAR(20),
  email VARCHAR(40),
  ls_doctors BOOLEAN,
  PRIMARY KEY(id),
  FOREIGN KEY(test_type_id) REFERENCES test(id),
  FOREIGN KEY(document_type_id) REFERENCES document_type(id),
  FOREIGN KEY(doctor_type_id) REFERENCES doctors_type(id)
);

CREATE TABLE patients (
  id INT(11) AUTO_INCREMENT,
  document_type_id INT,
  id_number INT,
  name VARCHAR(50),
  cell_phone_number VARCHAR(20),
  email VARCHAR(40),
  adress VARCHAR(200),
  PRIMARY KEY(id),
  FOREIGN KEY(document_type_id) REFERENCES document_type(id)
);

CREATE TABLE consult (
  id INT(11) AUTO_INCREMENT,
  patient_id INT,
  doctor_id INT,
  test_id INT,
  budgets_id INT,
  date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  time VARCHAR(20),
  result VARCHAR(300),
  PRIMARY KEY(id),
  FOREIGN KEY(patient_id) REFERENCES patients(id),
  FOREIGN KEY(doctor_id) REFERENCES doctors(id),
  FOREIGN KEY(test_id) REFERENCES test(id),
  FOREIGN KEY(budgets_id) REFERENCES budgets(id)
);

CREATE TABLE recipes (
  id INT(11) AUTO_INCREMENT,
  consult_id INT,
  doctor_id INT,
  name VARCHAR(50),
  description VARCHAR(200),
  PRIMARY KEY(id),
  FOREIGN KEY(consult_id) REFERENCES consult(id),
  FOREIGN KEY(doctor_id) REFERENCES doctors(id)
);

CREATE TABLE medicines (
  id INT(11) AUTO_INCREMENT,
  recipes_id INT,
  dolar_prices_id INT,
  name VARCHAR(50),
  description VARCHAR(200),
  PRIMARY KEY(id),
  FOREIGN KEY(recipes_id) REFERENCES recipes(id),
  FOREIGN KEY(dolar_prices_id) REFERENCES dolar_prices(id)
);