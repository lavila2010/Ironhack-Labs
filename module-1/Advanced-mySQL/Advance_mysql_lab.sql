use lab_mysql;
CREATE TEMPORARY TABLE summary
select sub1.title_id,sub1.price,sub1.advance,sub1.royalty,sub1.ytd_sales,sub1.title, authors.au_id,sub1.royaltyper
from(
select  titles.title_id,price,advance,royalty,ytd_sales,title, au_id,royaltyper
from publications.titles
inner join publications.titleauthor
on publications.titles.title_id = publications.titleauthor.title_id) sub1
left join publications.authors
on publications.authors.au_id = sub1.au_id;

select * from summary;

create temporary table general_numbers
select au_id as Author_ID, title_id as Title_ID, advance * royaltyper /100  as Advance , price * ytd_sales * royalty /100 as sales_royalty
from summary
group by au_id , title_id;

select * from general_numbers;

#Challenge 1 and 2
create table most_profiting_authors
select Author_ID, Title_ID, round(advance + sales_royalty,2) as Author_Profit 
from general_numbers
order by Author_Profit desc limit 3;

select * from most_profiting_authors;
