create database Lab_additional;
use Lab_additional;

create table faculty (
Fac_N  varchar(250) primary key,
Fac_First_M varchar(250),
Fac_Last_M varchar(250),
Fac_Rank_C varchar(250));

create table courses (
Course_C varchar(250) primary key,
Course_M varchar(250),
Course_units varchar(250));

create table Faculty_Courses(
Course_C  varchar(250) references courses(Course_C),
Fac_N varchar(250) references Faculty(Fac_N),
Stud_Count varchar(250),
Sem_C varchar(250));

insert into faculty (Fac_N , Fac_First_M,Fac_Last_M,Fac_Rank_C)
values
('13443','iris','Martinez','ASCP'),
('66234','Aura','Matias','PROF'),
('45463','Lorelie','Grepo','ASTP'),
('44556' ,'Mickey' ,'Mancenido' ,'ASTP');

insert into Courses ( Course_C, Course_M,Course_Units)
values
('IDOE', 'Design of Experiment', '3'),
('IBDM' , 'Business Intelligence and Data Mining','3'),
('MSCM' , 'Supply Chain Management', '3'),
('SRES', 'Research Methods' ,'1'),
('SSIM', 'Simulation', '4');

insert into Faculty_Courses ( Course_C ,Fac_N,Stud_Count,Sem_C)
values
('MSCM','13443','34','2012-1'),
('MSCM' ,'66234', '32', '2012-2'),
('IDOE', '44556', '56', '2012-1'),
('SRES', '13443', '12', '2012-1'),
('IBDM', '66234', '40', '2012-2'),
('MSCM', '44556', '32', '2013-1');

select sum(stud_Count) from faculty_Courses as Student_Count
where Course_C = "MSCM";

select Fac_Last_M , Stud_Count as Num_Students
from lab_additional.faculty
inner join lab_additional.faculty_Courses
on lab_additional.faculty.Fac_N = lab_additional.faculty_Courses.Fac_N
group by Fac_Last_M
order by Fac_Last_M asc;

select Course_M as Course_Description , sub1.Fac_Rank_C as "Rank", sub1.Fac_Last_M as Last_Name, sub1.Sem_C as Semester, Course_Units as Units
from
(select Fac_Rank_C, Fac_Last_M , Sem_C, course_C
from lab_additional.faculty
inner join lab_additional.faculty_Courses
on lab_additional.faculty.Fac_N = lab_additional.faculty_Courses.Fac_N)sub1
left join lab_additional.Courses
on  lab_additional.courses.Course_C = sub1.Course_C;

drop table Rank_Description;

create table Rank_Description(
Fac_Rank_C varchar(4) not null 
references faculty(Fac_Rank_C) ,
Fac_Rank_M varchar(250),
Min_Sal_Grade varchar(1));

select * from Rank_Description;

insert into Rank_Description ( Fac_Rank_C ,Fac_Rank_M , Min_Sal_Grade)
values
('INST','Instructor','1'),
('ASTP','Assistant Professor','3'),
('ASTP','Assistant Professor','5'),
('PROF','Professor','7'),
('UPRF','Univertity Professor','7');

select Fac_First_M , Fac_Last_M, (
select Fac_Rank_M 
from Rank_Description
where Faculty.Fac_Rank_C in Rank_Description.Fac_Rank_C) as 'Rank'
from faculty;

select Fac_First_M, Fac_Last_M, (select Fac_Rank_M from Rank_Description R where R.Fac_Rank_C = f.Fac_Rank_C) as ‘RankName’
from Faculty f
where (select Fac_Rank_C from Rank_Description R where f.Fac_Rank_C = R.Fac_Rank_C) is not null

