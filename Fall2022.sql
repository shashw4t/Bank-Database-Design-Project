Create Table Bank(
BankName	Varchar(15) Not Null,
Primary Key (BankName));/

Create Table Employee( 
Ssn		Varchar(9)	Not Null,
PhoneNo	Varchar(10),
FName		Varchar(15),
LName		Varchar(15),
StartDate	Date,
DependentNames	Varchar(60),
BankName	Varchar(15),
Primary Key (Ssn),
Foreign Key (BankName) References Bank (BankName) On Delete Set Null);/

CREATE TABLE Manager(
Essn Varchar(9) Not Null,
Primary Key (Essn),
FOREIGN KEY (Essn)
             REFERENCES Employee(Ssn)
             ON DELETE CASCADE
);/

CREATE TABLE AsstManager(
Essn Varchar(9) Not Null,
Primary Key (Essn),
FOREIGN KEY (Essn)
             REFERENCES Employee(Ssn)
             ON DELETE CASCADE
);/

CREATE TABLE PersonalBanker(
Essn Varchar(9) Not Null,
Primary Key (Essn),
FOREIGN KEY (Essn)
             REFERENCES Employee(Ssn)
             ON DELETE CASCADE
);/

CREATE TABLE Branches(
	BranchId INT NOT NULL,
	BankName Varchar(15) NOT NULL,
	BranchCity VARCHAR(15),
	Address VARCHAR(20),
	Assets Long,
	Primary Key(BranchId),
	Foreign Key(BankName) References  Bank (BankName)
             On Delete Set Null);/
             
Create Table Account(
	AccNo INT NOT NULL,
	AccBalance FLOAT,
	AccType VARCHAR(10),
	BranchId Int,
Primary Key (AccNo),
Foreign Key (BranchId) References Branches(BranchId)
On Delete Cascade);/

Create Table Savings (
AccNo 	Int	Not Null,
Interest Float, 
Primary Key (AccNo),
Foreign Key (AccNo) References Account (AccNo) On Delete Cascade);/

Create Table Checking(
AccNo 	Int	Not Null,
OverdraftFee	Float, 
Primary Key (AccNo),
Foreign Key (AccNo) References Account (AccNo) On Delete Cascade);/

Create Table MoneyMkt(
AccNo 	Int	Not Null,
VariableInterest	Float, 
Primary Key (AccNo),
Foreign Key (AccNo) References Account (AccNo) On Delete Cascade);/

Create Table Customer(
	Ssn		Varchar(9)	Not Null,
	FName		Varchar(15),
           LName		Varchar(15),
           PhoneNo	Varchar(10),
	Street		Varchar(10),
	City		Varchar(10),
	State		Varchar(10),
	Zipcode 	Varchar(9),
	Pbssn		Varchar(9),
	Primary Key (Ssn),
	Foreign Key (Pbssn) References PersonalBanker(Essn) On Delete Cascade);/
    
Create Table Transaction(
	TransactionId Varchar(12) Not Null,
	DateTime TIMESTAMP,
	Type Varchar(15),
	Amount Float,
	AccNo Int Not Null,
	Charges Float,
	Primary Key(TransactionId, AccNo),
	Foreign Key (AccNo) References Account(AccNo) On Delete Cascade);/

Create Table LoanAccount(
LoanNo 	Varchar(15)	Not Null,
LoanAmount	Float,
Interest 	Float,
AccNo		Int,
Primary Key (LoanNo),
Foreign Key (AccNo) References Account (AccNo) On Delete Cascade);/

Create Table WorksIn(
BranchId	 Int	 Not Null,
Essn	Varchar(9)	Not Null,
Primary Key (BranchId, Essn),
Foreign Key (BranchId) References Branches (BranchId) On Delete Cascade,
Foreign Key (Essn) References Employee (Ssn) On Delete Cascade);/

Create Table Borrower (
Cssn 	Varchar(9) 	Not Null,
LoanNo	Varchar(15) Not Null,
Primary Key (Cssn, LoanNo),
Foreign Key (Cssn) References Customer (Ssn) On Delete Cascade,
Foreign Key (LoanNo) References LoanAccount (LoanNo) On Delete Cascade);/

Create Table HoldsAccount (
Cssn 	Varchar(9) 	Not Null,
AccNo		Int 	Not Null,
Primary Key(Cssn, AccNo),
Foreign Key (Cssn) References Customer (Ssn) On Delete Cascade,
Foreign Key (AccNo) References Account (AccNo) On Delete Cascade);/

Create Table Manages(
	BranchId int Not Null,
	Mssn Varchar(9) Not Null,
	Essn Varchar(9) Not Null,
	NumEmployees int,
	Primary Key(BranchId, Mssn, Essn),
	Foreign Key (BranchId) References Branches (BranchId) On Delete Cascade,
 	Foreign Key (Mssn) References Employee (Ssn) On Delete Cascade,
	Foreign Key (Essn) References Employee (Ssn) On Delete Cascade);/

Insert into Bank values ('JPMorgan');
Insert into Bank values ('Discover');
Insert into Bank values ('CapitalOne');
Insert into Bank values ('CitiBank');
Insert into Bank values ('TDBank');/

Insert into  Employee values ('789126791', '9940903344', 'Rory','Glenn', '22-JUN-2017', 'Thomas Glenn', 'Discover');
Insert into  Employee values ('689326891', '9940903354', 'Luna','Robbins', '06-AUG-2018','Max Robbins', 'JPMorgan');
Insert into  Employee values ('589456791', '9940909344', 'Riley','Booker', '15-JUL-2016','Gina Booker', 'CapitalOne');
Insert into  Employee values ('489786791', '9940907344', 'Paityn','Dennis', '23-SEP-2017','Vincent Dennis', 'CitiBank');
Insert into  Employee values ('389129691', '9940903364', 'Zaniah','Dominguez', '18-NOV-2016','Robert Dominguez', 'TDBank');/

Insert into  Employee values ('572129691', '8146703364', 'Robert','Downey', '18-DEC-2015','Michael Downey', 'Discover');
Insert into  Employee values ('893129591', '7840905664', 'Sherlock','Holmes', '29-SEP-2017','Marvick Holmes', 'JPMorgan');
Insert into  Employee values ('900129691', '6740902984', 'Jack','Sparrow', '23-AUG-2019','Jacy Sparrow', 'CapitalOne');
Insert into  Employee values ('700129691', '9840907594', 'Vincent','Mendonza', '27-FEB-2020','Robert Mendonza', 'CitiBank');
Insert into  Employee values ('348129691', '8740909764', 'James','Watson', '04-JAN-2020','Harry Watson', 'TDBank');
Insert into  Employee values ('890569661', '8146745664', 'Arun','Shreyes', '11-DEC-2021','Michael Downey', 'Discover');
Insert into  Employee values ('243129531', '7840999964', 'Ram','Kumar', '22-MAR-2021','Marvick Holmes', 'JPMorgan');
Insert into  Employee values ('574129611', '6740988884', 'Janani','Krishna', '23-APR-2019','Jacy Sparrow', 'CapitalOne');
Insert into  Employee values ('699129671', '9840955594', 'Shakthi','Reddy', '27-OCT-2020','Robert Mendonza', 'CitiBank');
Insert into  Employee values ('984129961', '8740944064', 'Wayne','Watson', '04-MAY-2020','Jessy Watson', 'TDBank');/
Select * From EMployee;

Insert into Manager values ('572129691');
Insert into Manager values ('893129591');
Insert into Manager values ('900129691');
Insert into Manager values ('700129691');
Insert into Manager values ('348129691');/
 

Insert into AsstManager values ('789126791');
Insert into AsstManager values ('689326891');
Insert into AsstManager values ('589456791');
Insert into AsstManager values ('489786791');
Insert into AsstManager values ('389129691');/

Insert into PersonalBanker values ('789126791');
Insert into PersonalBanker values ('689326891');
Insert into PersonalBanker values ('589456791');
Insert into PersonalBanker values ('489786791');
Insert into PersonalBanker values ('389129691');/

Insert into Branches values ('4352', 'Discover', 'Newark', '9 North St', '45900.12');
Insert into Branches values ('7452', 'JPMorgan', 'Trenton', '3 West Ave', '78122.90');
Insert into Branches values ('6752', 'CapitalOne', 'Edison', '1 Main St', '23888.21');
Insert into Branches values ('6992', 'CitiBank', 'Piscataway', '5 Wan Dr', '56991.12');
Insert into Branches values ('8952', 'TDBank',  'East Brunswick', ' 12 East Way', '12339.12');/

Insert into Account values ('789156794563', '14500','SAVINGS','4352');
Insert into Account values ('657899562345', '14500','SAVINGS','7452');
Insert into Account values ('756156795453', '14500','SAVINGS','4352');
Insert into Account values ('768515678745', '22750','SAVINGS','6752');
Insert into Account values ('945634504389','89458','SAVINGS','8952');
Insert into Account values ('768515678910', '22850','CHECKING','6992');
Insert into Account values ('897515678913', '13750','CHECKING','6992');
Insert into Account values ('568315678915', '15750','CHECKING','8952');
Insert into Account values ('723115678918', '2750','CHECKING','7452');
Insert into Account values ('459815678919', '9750','CHECKING','7452');
Insert into Account values ('945634502247','7600','MONEY MKT','4352');
Insert into Account values ('935634506847','9850','MONEY MKT','8952');
Insert into Account values ('955634509577','9800','MONEY MKT','8952');
Insert into Account values ('965634503387','1523','MONEY MKT','8952');
Insert into Account values ('945634506747','9777','MONEY MKT','6992');
Insert into Account values ('893478202243', '7000','LOAN','6752');
Insert into Account values ('894478206853', '24500','LOAN','6992');
Insert into Account values ('896578209943', '8500','LOAN','6752');
Insert into Account values ('897578205322', '55000','LOAN','7452');
Insert into Account values ('657899567812', '75000','LOAN','7452');/

Insert into Savings values ('789156794563','5.5');
Insert into Savings values ('657899562345', '5.2');
Insert into Savings values ('756156795453', '4.3');
Insert into Savings values ('768515678745', '5.5');
Insert into Savings values ('945634504389', '6.3');/

Insert into Checking values ('768515678910', '26');
Insert into Checking values ('897515678913', '50');
Insert into Checking values ('568315678915', '200');
Insert into Checking values ('723115678918', '200');
Insert into Checking values ('459815678919', '50');/

Insert into MoneyMkt values ('945634502247','7.6');
Insert into MoneyMkt values ('935634506847','8.7');
Insert into MoneyMkt values ('955634509577','7.5');
Insert into MoneyMkt values ('965634503387','6.9');
Insert into MoneyMkt values ('945634506747','8.3');/

Insert into Customer values ('122334444', 'John', 'Smith', '1236781345', '1 West Way', 'Trenton', 'NJ', '12345', '789126791');
Insert into Customer values ('233445555', 'Wesley', 'Snipes', '7891235647', '3 Main St', 'Newark', 'NJ', '34567', '689326891');
Insert into Customer values ('344556666', 'Tony', 'Stark', '5672347892', '2 North Dr', 'Piscataway', 'NJ', '89123', '589456791');
Insert into Customer values ('455667777', 'Aki', 'Hayakawa', '3456782377', '7 East St', 'Edison', 'NJ', '12889', '489786791');
Insert into Customer values ('566778888', 'Obi wan', 'Kenobi', '9238761278', '8 West Ave', 'Brunswick', 'NJ', '08816', '389129691');/

Insert into Transaction values ('333444555666', TO_TIMESTAMP( '2020-04-01 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Deposit', ' 200.15', '945634504389', '0');
Insert into Transaction values ('888999222333', TO_TIMESTAMP( '2020-04-02 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Withdrawal', '50', '768515678910', '4'); 
Insert into Transaction values ('444555222999', TO_TIMESTAMP( '2020-04-03 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Deposit', '912.32', '897515678913', '0');
Insert into Transaction values ('888111222333', TO_TIMESTAMP( '2020-04-04 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Deposit', '1500', '756156795453', '0');
Insert into Transaction values ('555666222999', TO_TIMESTAMP( '2020-04-05 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Withdrawal', '2750', '568315678915', '10');/

Insert into LoanAccount values ('785632', '7000','9.2','893478202243');
Insert into LoanAccount values ('588357', '24500','8.7','894478206853');
Insert into LoanAccount values ('799542', '8500','7.5','896578209943');
Insert into LoanAccount values ('656211', '55000','10.3','897578205322');
Insert into LoanAccount values ('257399', '75000','8.5','657899567812');/

Insert into WorksIn values ('4352', '789126791');
Insert into WorksIn values ('7452', '689326891');
Insert into WorksIn values ('6752', '589456791');
Insert into WorksIn values ('6992', '489786791');
Insert into WorksIn values ('8952', '389129691');/

Insert into Borrower values('344556666','785632');
Insert into Borrower values('233445555','588357');
Insert into Borrower values('122334444','799542');
Insert into Borrower values('455667777','656211');
Insert into Borrower values('566778888','257399');/

Insert into HoldsAccount values ('122334444', '945634504389');
Insert into HoldsAccount values ('233445555', '768515678910');
Insert into HoldsAccount values ('344556666', '897515678913');
Insert into HoldsAccount values ('455667777', '756156795453');
Insert into HoldsAccount values ('566778888', '568315678915');/

Insert into Manages values ('4352','572129691','890569661','14');
Insert into Manages values ('7452','893129591','243129531','24');
Insert into Manages values ('6992','900129691','574129611','15');
Insert into Manages values ('8952','700129691','699129671','17');
Insert into Manages values ('6752','348129691','984129961','15');/

Select * From Manages;

Select MAX(AccBalance), AccType, BranchId
From Account 
Group By AccType, BranchId
Having BranchId = '6752';

Select M.Mssn, B.BankName
From Employee E, Manages M, Branches B 
Where E.Ssn = M.Mssn AND M.BranchId = B.BranchId
AND M.Mssn IN ( Select Mssn
			From Manages
			Where NumEmployees > 15);/

Select LoanNo, LoanAmount
From LoanAccount L, Account A
Where L.AccNo =A.AccNo
AND  LoanAmount < ALL ( 
Select AccBalance
From Account
Where AccType = 'SAVINGS');


Insert into Bank values ('Fake');
Insert into  Employee values ('1', '2', 'a','b', '22-JUN-2017','c', 'Fake');
Select* From Bank;
Select * From Employee;
Delete from Bank where BankName ='Fake';
Delete from Employee where SSN ='1';