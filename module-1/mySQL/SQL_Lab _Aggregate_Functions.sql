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
select loan_id,date from bank.loan      # date,count(*) loans_issued
where date < 930907
group by date 
order by date asc;

#Question 5
select loan_id,duration,date from bank.loan
where date >= 971200 and date <= 971231
group by date 
order by date asc, duration asc;

#question 6
select account_id,type as transaction_type, round(sum(amount)) as total_amount from bank.trans
where account_id = 396
group by type;

#Question 7
SELECT account_id, IF(type = 'PRIJEM', 'INCOMING', 'OUTGOING') AS transaction_type,
    FLOOR(SUM(amount)) AS total_amount
FROM trans
WHERE account_id = 396
GROUP BY account_id, transaction_type
ORDER BY transaction_type;

#Question 8
select account_id, type, round(SUM(amount)) as total_amount from bank.trans
where type NOT IN('VYBER')
group by account_id,type
order by account_id,type,round(SUM(amount));

#Question 9


