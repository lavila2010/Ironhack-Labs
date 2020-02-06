use publications; 
select * from authors;
select * from titleauthor;
select * from titles;

#Question 1
select sub2.au_id as Author_ID, sub2.au_lname as Last_Name,sub2.au_fname as First_Name, sub2.title as Title, publishers.pub_name as Publisher
from (

select titles.title, sub1.au_id, sub1.au_lname, sub1.au_fname, titles.pub_id
from(
select A.au_id,A.au_lname,A.au_fname,T.title_id
from publications.authors as A
inner join publications.titleauthor as T
on A.au_id = T.au_id) sub1

left join titles 
on titles.title_id = sub1.title_id) sub2
left join publishers
on publishers.pub_id = sub2.pub_id;

#Question 2
select sub2.au_id as Author_ID, sub2.au_lname as Last_Name,sub2.au_fname as First_Name, publishers.pub_name as Publisher, count(sub2.title) as Title_Count
from (

select titles.title, sub1.au_id, sub1.au_lname, sub1.au_fname, titles.pub_id
from(
select A.au_id,A.au_lname,A.au_fname,T.title_id
from publications.authors as A
inner join publications.titleauthor as T
on A.au_id = T.au_id) sub1

left join titles 
on titles.title_id = sub1.title_id) sub2
left join publishers
on publishers.pub_id = sub2.pub_id
group by sub2.title
order by sub2.au_fname asc;

#Question 3 - Cambiar a cantidad vendida obtenida por medio de ventas 
select  sub1.au_id as Author_ID,sub1.au_lname as Last_Name,sub1.au_fname as First_Name, count(titles.title) as Total_Tiles
from(
select A.au_id,A.au_lname,A.au_fname,T.title_id
from publications.authors as A
inner join publications.titleauthor as T
on A.au_id = T.au_id) sub1
left join titles 
on titles.title_id = sub1.title_id
group by sub1.au_id
order by total_tiles desc limit 3;


#Question 4 n-- Missing 4 Authors 
select sub2.au_id as Author_ID, sub2.au_lname as Last_Name,sub2.au_fname as First_Name, publishers.pub_name as Publisher, sub2.title as Title_Count
from (

select titles.title, sub1.au_id, sub1.au_lname, sub1.au_fname, titles.pub_id
from(
select A.au_id,A.au_lname,A.au_fname,T.title_id
from publications.authors as A
inner join publications.titleauthor as T
on A.au_id = T.au_id) sub1

left join titles 
on titles.title_id = sub1.title_id) sub2
left join publishers
on publishers.pub_id = sub2.pub_id
group by sub2.title
order by sub2.au_fname asc;

