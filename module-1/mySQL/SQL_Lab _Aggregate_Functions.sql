select * from bank.client;

#Question 1 - Results below
select count(district_id), district_id 
from bank.client 
where district_id < 10
group by district_id
order by district_id asc ;

#Question 2
select count(type), type from bank.card
group by type;

#Question 3
select account_id , sum(amount) from bank.loan
group by account_id
order by amount desc limit 10;

#Question 4
select loan_id,date from bank.loan 
where date < 930907
group by date 
order by date asc;

#Question 5
select loan_id,duration,date from bank.loan
where date >= 971200 and date <= 971231
group by date 
order by date asc, duration asc;

#question 6
select account_id,type, sum(amount)  from bank.trans
where account_id = 396
group by type;

#Question 7
select account_id,type as transaction_type, round(sum(amount)) as total_amount from bank.trans
where account_id = 396
group by type;

#Question 8
select account_id,type as transaction_type, round(sum(amount)) as total_amount from bank.trans
where account_id = 396 
group by type;

#Question 9



