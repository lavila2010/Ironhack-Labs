use lab_additional;

drop table purchase_Orders;
drop table Purchase_Order_Items;
drop table suppliers;

create table purchase_Orders(
PO_N int(7) primary key,
PO_D varchar(250),
Supplier_N int(4),
PO_Pay_Termns varchar(10) not null);

insert into purchase_Orders( PO_N  ,PO_D , Supplier_N, PO_Pay_Termns)
values
('610557','2013/27/2','1335','NET30'),
('610558','2013/27/2','2652','2/10NET20'),
('610559','2013/27/2','1335','COD'),
('610560','2013/28/2','1226','2/10NET20'),
('610561','2013/03/1','2652','2/10NET20');

create table Purchase_Order_Items (
PO_N int(6) references purchase_Orders(PO_N),
Item_Int int(6),
Item_Q int(20),
Item_Price float(20));

insert into Purchase_Order_Items( PO_N,Item_int,Item_Q,Item_Price)
values
('610557','36796','15','664.25'),
('610558','36224','21','224.54'),
('610559','36624','100','0.65'),
('610560','36547','1','10887.10'),
('610561','36869','224','336.65');


create table Suppliers (	
Supplier_N int(5) not null primary key ,
Supplier_M varchar(250),
Supplier_Tier int(1),
constraint supplier_Tier check(supplier_Tier in (1,2,3,4,5)),
Defaul_Pay_Termns varchar(250) references purchase_Order(PO_Pay_Terms));

insert into suppliers(supplier_N,Supplier_M,Supplier_Tier,Defaul_Pay_Termns)
values
('1335','MacLarens Irish Pub','4','NET30'),
('2652','Central Perk','3','NET30'),
('1226','Beltway Coffee','1','NET30');
 
 select * from purchase_Orders;
 select * from Purchase_Order_Items;
  select * from suppliers;

select supplier_M, sub1.item_INT, sub1.Item_Q, sub1.PO_N
from ( 
select Item_Int,Item_Q,supplier_N, purchase_Orders.PO_N
from lab_additional.purchase_Orders
inner join lab_additional.purchase_Order_Items
on lab_additional.purchase_Orders.PO_N = lab_additional.purchase_Order_Items.PO_N)sub1
left join lab_additional.suppliers 
on lab_additional.suppliers.supplier_N= lab_additional.sub1.supplier_N;

update suppliers
set supplier_tier = "3" 
where supplier_M = "Belway Coffee";

update suppliers
set Defaul_Pay_Termns = "2/10NET20" 
where supplier_N = "1226";

select * from suppliers;
