use bank;
#Question 1- first 10 clients 
select * from client order by client_id desc limit 10;
#Question 2 = Client ID 13576 
select * from client where district_id = 72 order by client_id desc;
#Question 3 = $4980,$5148,$7656
select * from loan order by amount asc limit 3;
#Question 4 = A,B,C,D
select distinct (status) from loan order by status asc;
# Question 5 = Loan_id 5314
select loan_id,max(payments) from loan;
#Question 6 -Result Below
select account_id,amount from loan order by amount asc limit 5;
#Question 7 = Account ID 9188
select account_id ,min(amount) from loan where duration = 60;
#Question 8 - Results below
select distinct(k_symbol) from bank.order;
#Question 9 = 29445,29446,29447
select order_id from bank.order where account_id = 34;
#Question 10 = Account_id from 88 to 97
select account_id from bank.order where order_id > 29540 and order_id < 29560;
#Question 11= 5123
select amount from bank.order where account_to = 30067122;
#Question 12 - Restult Below
select trans_id,date,type,amount from bank.trans where account_id = 793 order by date desc limit 10;