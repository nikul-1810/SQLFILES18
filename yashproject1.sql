create database transport;
use transport;
create table driver
(
dr_date int primary key,
dr_id int,
dr_name varchar(20),
dr_pickup varchar(20),
dr_dropoff varchar(20),
dr_fare int

);
create table passenger
(
pa_id int primary key,
pa_name varchar (20),
pa_vahicle enum ("available","cancelled","reserved")

);

select * from driver
left join passenger
on driver.dr_id = passenger.pa_id;



describe driver;






