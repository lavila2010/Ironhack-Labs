use lab_mysql;
select * from apple;
select count(*) from apple; # to check all the row in 
SELECT * FROM lab_mysql.apple;
# Question 1
select count(distinct prime_genre) from apple; # Result= 23 Genres
# Question 2
select track_name, max(rating_count_tot) from apple; # Restul =Pac-Man Premium , Value 2974676
#Question 3
select prime_genre,count(track_name) from apple group by prime_genre order by count(track_name) desc; # Resul Games with 3862 apps
#Question 4
select prime_genre,count(track_name) from apple group by prime_genre order by count(track_name) asc; # Resul Catalogs with 10 apps
#question 5
select * from apple order by rating_count_tot desc limit 10; # top most rated apps
#Question 6
select * from apple order by user_rating desc limit 10; # top most rated apps by user
#question 7
# Insights = Price = Free Apps, Genre= Music,Games and Social Media.
#Question 8
# Insights = Price = Paid Apps, Genre= Business , Games and Education 
#Question 9
# Insights = Users rate apps mostly paid versions.
#Question 10 

#Question 11 - Free apps are more attractive to user total raiting # highest total Rating paid app = 698.516 and free 2.974.676
select * from apple where price = 0 order by rating_count_tot desc;
select * from apple where price > 0 order by rating_count_tot desc;