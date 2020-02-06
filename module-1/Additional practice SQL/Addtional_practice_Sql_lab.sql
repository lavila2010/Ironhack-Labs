use olist;
#Question 1A
-- 1= Highest price 6735 @ freight_value '194.31'
select * 
from order_items
order by price desc limit 1;


#Question 1B
-- 1= Highest price 0.85 @ freight_value '18.23'
select * 
from order_items
order by price asc limit 1;

#Question 2A
SELECT *
FROM olist.order_items
ORDER BY shipping_limit_date
LIMIT 10;

#Question 2B
SELECT *
FROM olist.order_items
ORDER BY shipping_limit_date DESC
LIMIT 100;

#Question 3
SELECT customer_state, COUNT(customer_state) as num_cust_state
FROM olist.customers
	GROUP BY customer_state
	ORDER BY num_cust_state DESC
LIMIT 10;

#Question 4
SELECT customer_state, customer_city, COUNT(customer_city)
FROM olist.customers
WHERE customer_state = 'SP'
GROUP BY customer_state,
         customer_city
ORDER BY COUNT(customer_city) DESC;

#Question 5
select count(distinct(business_segment)) as Unique_Business_Segment
from closed_deals;

#Question 6
SELECT business_segment,SUM(declared_monthly_revenue) AS total_declared_monthly_revenue
FROM olist.closed_deals
GROUP BY business_segment
ORDER BY total_declared_monthly_revenue DESC limit 3;

#Question 7
SELECT COUNT(DISTINCT review_score) AS unique_review_score
FROM olist.order_reviews;

#Question 8
SELECT
       review_score,
    IF(review_score = 1, 'very dissatisfied',
    IF(review_score = 2, 'moderately dissatisfied',
    IF(review_score = 3, 'neutral',
    IF(review_score = 4, 'moderately satisfied', 'very satisfied')))) AS review_category
FROM olist.order_reviews
ORDER BY review_category DESC
LIMIT 100;

#Question 9
SELECT COUNT(review_id), review_score
FROM olist.order_reviews
GROUP BY review_score
ORDER BY COUNT(review_id) DESC;








