CREATE SCHEMA BANKING;
set search_path to BANKING;
create table Customer 
(
	CIF CHAR(11) NOT NULL UNIQUE,
	fname VARCHAR(50) NOT NULL,
	midname VARCHAR(50),
	lname VARCHAR(50) NOT NULL,
	contact_no VARCHAR(50) NOT NULL,
	Pan_no CHAR(10) NOT NULL,
	Aadhaar_no CHAR(12) NOT NULL UNIQUE,
	House_No VARCHAR(5),
	Street_name VARCHAR(50),
	PINCODE CHAR(6),
	PRIMARY KEY(CIF)
);


CREATE TABLE Account_Type
(
	Ac_Type VARCHAR(50) NOT NULL,
	Interest_rate NUMERIC NOT NULL,
	PRIMARY KEY(Ac_type)
);
CREATE TABLE Branch
(
	IFSC_code CHAR(11) NOT NULL,
	Branch_name VARCHAR(50) NOT NULL,
	Branch_address VARCHAR(50) NOT NULL,
	PRIMARY KEY(IFSC_code)
);

CREATE TABLE Account
(
	Account_no CHAR(11) NOT NULL ,
	cif_no CHAR(11) NOT NULL,
	ifsc CHAR(11) NOT NULL,
	Balance NUMERIC NOT NULL,
	Account_type VARCHAR(50) NOT NULL,
	open_date DATE NOT NULL,
	PRIMARY KEY (Account_no),
	FOREIGN KEY (Account_type) REFERENCES Account_Type(Ac_type),
	FOREIGN KEY (cif_no) REFERENCES Customer(CIF),
	FOREIGN KEY (ifsc) REFERENCES Branch(IFSC_code)
	
);

CREATE TABLE Deposit
(
	Account_no CHAR(11) NOT NULL,
	deposit_amount INTEGER NOT NULL,
	deposit_time TIME NOT NULL,
	deposit_date DATE NOT NULL,
	Deposit_IFSC CHAR(11) NOT NULL,
	PRIMARY KEY(Account_no, deposit_time, deposit_date),
	FOREIGN KEY (Account_no) REFERENCES Account(Account_no),
	FOREIGN KEY (Deposit_IFSC) REFERENCES Branch(IFSC_code)
	
);


CREATE TABLE Withdraw
(
	Account_no CHAR(11) NOT NULL,
	withdraw_amt INTEGER NOT NULL,
	withdraw_time TIME NOT NULL,
	withdraw_date DATE NOT NULL,
	withdraw_IFSC CHAR(11) NOT NULL,
	PRIMARY KEY(Account_no,withdraw_time, withdraw_date),
	FOREIGN KEY (Account_no) REFERENCES Account( Account_no),
	FOREIGN KEY (withdraw_IFSC) REFERENCES Branch(IFSC_code)
);


CREATE TABLE Transfer
(
	from_account CHAR(11) NOT NULL,
	to_account CHAR(11) NOT NULL,
	amount INTEGER NOT NULL,
	transfer_time TIME NOT NULL,
	transfer_date DATE NOT NULL,
	transfer_IFSC CHAR(11) NOT NULL,
	PRIMARY KEY(from_account,to_account,transfer_time, transfer_date),
	FOREIGN KEY(from_account) REFERENCES Account(Account_no),
	FOREIGN KEY(to_account) REFERENCES Account(Account_no),
	FOREIGN KEY (transfer_IFSC) REFERENCES Branch(IFSC_code)
);

CREATE TABLE Loan
(
	Loan_no INTEGER NOT NULL,
	Amount NUMERIC NOT NULL,
	Customer_id CHAR(11) NOT NULL,
	branch_IFSC CHAR(11) NOT NULL,
	PRIMARY KEY(Loan_no),
	FOREIGN KEY(Customer_id) REFERENCES Customer(CIF),
	FOREIGN KEY (branch_IFSC) REFERENCES Branch(IFSC_code)
);

CREATE TABLE Payment
(
	Loan_no INTEGER NOT NULL,
	amount NUMERIC NOT NULL,
	pay_time TIME NOT NULL,
	pay_date DATE NOT NULL,
	PRIMARY KEY (Loan_no, pay_time,pay_date),
	FOREIGN KEY(Loan_no) REFERENCES Loan(Loan_no)
);
