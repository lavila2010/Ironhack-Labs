create database Lab_additional;
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
Fac_N varchar(250),
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
('IBDM' , 'Business Intelligence and Data Mining',' 3'),
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

select 


