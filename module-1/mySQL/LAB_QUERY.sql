create database lab_mysql;
use lab_mysql;
DROP TABLE CARS;
DROP TABLE CUSTOMERS;
DROP TABLE SALES_PERSON;
DROP TABLE INVOICES;

create table CARS (
ID_CARS varchar(255) PRIMARY KEY,
VIN varchar(255),
MANUFACTURER varchar(255),
MODEL varchar(255),
YEAR VARCHAR(255),
COLOR varchar(255)
);

create table CUSTOMERS (
ID_CARS varchar(255) ,
FOREIGN KEY (ID_CARS) REFERENCES CARS (ID_CARS), 
ID_CUSTOMERS varchar(255) PRIMARY KEY,
NAME varchar(255) ,
PHONE VARCHAR(255),
EMAIL varchar(255),
ADDRESS varchar(255),
CITY varchar(255),
STATE_PROVIDENCE varchar(255),
COUNTRY varchar(255),
POSTAL varchar(255)
);

create table SALES_PERSON (
ID_CARS varchar(255),
FOREIGN KEY (ID_CARS) REFERENCES cars (ID_CARS),
ID_STAFF varchar(255) PRIMARY KEY,
NAME varchar(255),
Store varchar(255)
);

create table INVOICES (
ID varchar(255),
INVOICE_NUMBER VARCHAR(255) PRIMARY KEY,
DATE_INVOICE VARCHAR(255),
ID_CARS varchar(255),
FOREIGN KEY (ID_CARS) REFERENCES CARS (ID_CARS), 
ID_CUSTOMERS varchar(255),
FOREIGN KEY (ID_CUSTOMERS) REFERENCES CUSTOMERS (ID_CUSTOMERS),
ID_STAFF varchar(255),
FOREIGN KEY (ID_STAFF) REFERENCES SALES_PERSON (ID_STAFF)
);

INSERT INTO cars (ID_CARS,VIN,MANUFACTURER,MODEL,YEAR,COLOR)
VALUES 
('0','ZM8G7BEUQZ97IH46V','Peugeot','Rifter','2019','Red'),
('1','RKXVNNIHLVVZOUB4M','Ford','Fusion','2018','White'),
('2','HKNDGS7CU31E9Z7JW','Toyota','RAV4','2018','Silver'),
('3','DAM41UDN3CHU2WVF6','Volvo','V60','2019','Gray');


INSERT INTO CUSTOMERS (ID_CUSTOMERS,Name,PHONE,Email,Address,City,STATE_PROVIDENCE,Country,Postal)
VALUES
('10001','Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chopera, 14','Madrid','Madrid','Spain','28045'),
('20001','Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States','33130'),
('30001','Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France','75008'),
('40001','Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France','75008');


INSERT INTO SALES_PERSON (ID_STAFF,Name,STORE)
VALUES
('00001', 'Petey Cruiser', 'Madrid'),
('00002', 'Anna Sthesia', 'Barcelona'),
('00003', 'Paul Molive', 'Berlin'),
('00004', 'Gail Forcewind', 'Paris');

INSERT INTO INVOICES (ID,INVOICE_NUMBER,DATE_INVOICE,ID_CARS,ID_CUSTOMERS,ID_STAFF)
VALUES
('0','852399038', '10-10-2018', '0', '10001', '00001'),
('1','731166526', '12-12-2018', '3', '20001', '00002'),
('2','271135104', '12-12-2019', '2', '30001', '00003');

SELECT * FROM CARS;
SELECT * FROM CUSTOMERS;
SELECT * FROM SALES_PERSON;
SELECT * FROM INVOICES;

UPDATE CUSTOMERS
SET EMAIL = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;
