
CREATE DATABASE IF NOT EXISTS banking;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS customer_acc;
DROP TABLE IF EXISTS acc;
DROP TABLE IF EXISTS branch;
DROP TABLE IF EXISTS login;
DROP TABLE IF EXISTS customer;
SET FOREIGN_KEY_CHECKS = 1;



CREATE TABLE IF NOT EXISTS customer(
	cus_id INT NOT NULL,
	cus_fname VARCHAR(30) NOT NULL,
	cus_lname VARCHAR(30) NOT NULL,
    cus_address VARCHAR(50) NOT NULL, 
	PRIMARY KEY(cus_id)
);

CREATE TABLE IF NOT EXISTS branch(
	branch_name VARCHAR(30) PRIMARY KEY,
    branch_address VARCHAR(50),
    branch_manager VARCHAR(50)
    );
            
CREATE TABLE IF NOT EXISTS acc(
	acc_number INT AUTO_INCREMENT PRIMARY KEY,
	acc_balance FLOAT(4,2),
	acc_owner INT,
	acc_brch VARCHAR(50),
	FOREIGN KEY (acc_owner) REFERENCES customer(cus_id)
	);
        
CREATE TABLE IF NOT EXISTS customer_acc(
	cus_acc_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cus_acc_cust INT,
	cus_acc INT,
	cus_acc_time DATETIME,
	cus_acc_type ENUM('deposit','withdraw','check balance'),
	cus_acc_amount FLOAT(4,2),
	cus_acc_balance FLOAT(4,2),
	FOREIGN KEY(cus_acc_cust) REFERENCES customer(cus_id),
	FOREIGN KEY(cus_acc) REFERENCES acc(acc_number) 
	);       
        
CREATE TABLE IF NOT EXISTS login(
	login_id INT  PRIMARY KEY,
	login_user INT,
	login_passw VARCHAR(30),
	FOREIGN KEY (login_user) REFERENCES customer(cus_id)
	);
        
INSERT INTO customer(cus_id,cus_fname,cus_lname,cus_address) VALUES
	(1567,"Joe","Blogs","51 Sunrise Ave"),
	(1234,"Bill","Smith", "36 Coquette st");
    
INSERT INTO branch(branch_name,branch_address,branch_manager) VALUES
	("Auckland","100 Queen Street","John Brown"),
	("Tauranga","12 Cameron road","Bob The Builder");
                
INSERT INTO acc(acc_balance,acc_owner,acc_brch) VALUES
	(2,1567,"Auckland"),
	(3,1234,"Tauranga");

INSERT INTO login(login_id,login_user,login_passw) VALUES
	(1,1567,"Password"),
	(2,1234,"root");
 INSERT INTO customer_acc(cus_acc_cust,cus_acc,cus_acc_time,cus_acc_type,cus_acc_amount,cus_acc_balance) VALUES
	(1567,1,NOW(),"Deposit",1,2),
	(1234,2,NOW(),"Deposit",1,2),
	(1234,2,NOW(),"Deposit",4,5);       

        