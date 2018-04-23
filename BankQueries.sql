

1)Find the withdraws occured for  ac_n=xxxx after may, 2016.

SELECT Account_no,withdraw_time, withdraw_date from Withdraw where
 withdraw_date > '2011-01-01';


2)Find fname, contact_no, deposit_date the deposits occured for accounts after
 2005-06-25 amount of deposited amount > 1500;

SELECT fname, contact_no, deposit_date from  Account as a JOIN Deposit as d 
ON (a.Account_no = d.Account_no) JOIN Customer as c ON c.CIF = a.cif_no 
where d.deposit_date > '2005-06-25' and d.deposit_amount > 1500;


3)Find account no, fname, contact_no of customers who got money more than 50K
 after 08-NOV-2016 from transfer.

SELECT fname, contact_no, transfer_date from  Account as a JOIN Transfer as t 
ON (a.Account_no = t.to_account) JOIN Customer as c ON c.CIF = a.cif_no where
 t.transfer_date > '2005-06-25' and t.amount > 1500;


4)Find the total number of  withdrawals and total number of deposits being done by
 each customer.

select d.Account_no,count(deposit_time) from Deposit  as d   natural join 
 (select Account_no,count(withdraw_time)   from Withdraw group by 
Account_no )as w group by d.Account_no;


5) find name of customer,contact no. and account number , amount in account 
who have taken loans till now.

SELECT fname, contact_no, amount from Customer as c JOIN (SELECT Amount,
 customer_id from Loan where Amount > 1000) as l ON  (l.customer_id = c.CIF) 
JOIN Account as a ON c.CIF = a.cif_no;


6)find name of customer,contact no. and account number who have not taken loans till now.

SELECT fname, contact_no ,Account_no from (SELECT CIF, fname, contact_no from 
Customer where CIF NOT IN (SELECT customer_id from Loan)) as d JOIN Account as 
a ON a.cif_no = d.CIF;


7)find name of customer and account number who has received amount by transfer and
 withdrawn on same date.

SELECT to_account as Acc, transfer_date from 
(SELECT to_account, transfer_date from Transfer as t JOIN Withdraw as w ON t.to_account = w.Account_no) 
as s JOIN Withdraw as n ON s.transfer_date = n.Withdraw_date;



8) List the amount paid by each Loan by the customer.

select Loan_no,sum(amount) from Payment group by Loan_no;



9) Find fname,midname,lname of customer with account number 40212356823.

SELECT DISTINCT fname,midname,lname FROM Customer JOIN Account ON 
(Customer.CIF=Account.cif_no) WHERE  Account.Account_no='40212356823';



10) List out the account_types whose Interest rate is less than 2.0

SELECT Account_type,Interest_rate from Account_Type where Interest_rate<2;



11) Get the name and balance of the customer with account number 40212356183;

   SELECT Balance FROM Account JOIN Customer ON (CIF=cif_no) where 
   Account_no='40212356183';



12) Customers with balance more than 3000.

 Select account_no,fname,midname,lname,Balance FROM Account JOIN 
Customer ON(cif_no=CIF) WHERE Account.Balance>3000;


13)List out the accounts that are taken in Branch 'Kinnal Branch'

   SELECT Account_no FROM Account JOIN Branch ON(ifsc=IFSC_code) 
   WHERE Branch_name='Kinnal Branch';


  

