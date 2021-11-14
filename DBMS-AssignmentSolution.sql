create database if not exists TravelOnTheGo;
use TravelOnTheGo;

# 1) You are required to create two tables PASSENGER and PRICE with the following
# attributes and properties 

create table if not exists Passenger(
Passenger_name varchar(50) not null, Category varchar (10), Gender varchar (7),
Boarding_city varchar (100) not null, Destination_city varchar(100) not null, Distance int not null, 
Bus_Type varchar (10));

create table if not exists Price (
Bus_Type varchar (10) not null, Distance int not null, Price int not null);

# 2) Insert the following data in the tables

insert into Passenger values ("Sejal", "AC", "F", "Bengaluru", "Chennai", 350, "Sleeper");
insert into Passenger values ("Anmol", "Non-AC", "M", "Mumbai", "Hyderabad", 700, "Sitting");
insert into Passenger values ("Pallavi", "AC", "F", "Panaji", "Bengaluru", 600, "Sleeper");
insert into Passenger values ("Khusboo", "AC", "F", "Chennai", "Mumbai", 1500, "Sleeper");
insert into Passenger values ("Udit", "Non-AC", "M", "Trivandrum", "panaji", 1000, "Sleeper");
insert into Passenger values ("Ankur", "AC", "M", "Nagpur", "Hyderabad", 500, "Sitting");
insert into Passenger values ("Hemant", "Non-AC", "M", "panaji", "Mumbai", 700, "Sleeper");
insert into Passenger values ("Manish", "Non-AC", "M", "Hyderabad", "Bengaluru", 500, "Sitting");
insert into Passenger values ("Piyush", "AC", "M", "Pune", "Nagpur", 700, "Sitting");

insert into Price values("Sleeper", 350, 770);
insert into Price values("Sleeper", 500, 1100);
insert into Price values("Sleeper", 600, 1320);
insert into Price values("Sleeper", 700, 1540);
insert into Price values("Sleeper", 1000, 2200);
insert into Price values("Sleeper", 1200, 2640);
insert into Price values("Sleeper", 350, 434);
insert into Price values("Sitting", 500, 620);
insert into Price values("Sitting", 500, 620);
insert into Price values("Sitting", 600, 744);
insert into Price values("Sitting", 700, 868);
insert into Price values("Sitting", 1000, 1240);
insert into Price values("Sitting", 1200, 1488);
insert into Price values("Sitting", 1500, 1860);

# 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?

select Passenger.Gender, count(Passenger.Gender) 
from Passenger 
where Passenger.Distance >= 600 
group by Passenger.Gender;

# 4) Find the minimum ticket price for Sleeper Bus. 

select min(Price.Price) from Price where Price.Bus_Type = "Sleeper";

# 5) Select passenger names whose names start with character 'S'

select Passenger.Passenger_name from Passenger where Passenger.Passenger_name like 'S%';

# 6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
# Destination City, Bus_Type, Price in the output

select p.Passenger_name, p.Boarding_City, p.Destination_City, p.Bus_Type, pr.Price 
from Passenger p left join Price pr on p.Bus_type = pr.Bus_Type and p.Distance = pr.Distance;

# 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a
# distance of 1000 KMs

select p.Passenger_name, pr.Price from Passenger p, Price pr where p.Bus_type = "Sitting" and p.Distance = 1000;

# 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
# Panaji?

select pr.Price, pr.Bus_type from price pr join passenger p on pr.Distance=p.Distance
where (p.Boarding_city = "Panaji" and p.Destination_city = "Bengaluru");

# 9) List the distances from the "Passenger" table which are unique (non-repeated
# distances) in descending order.

select distinct(Distance) from passenger order by Distance desc;

# 10) Display the passenger name and percentage of distance travelled by that passenger
# from the total distance travelled by all passengers without using user variables

 select Passenger_name, Distance * 100 /(select SUM(distance) from passenger) as Percentage from passenger ;

# 11) Display the distance, price in three categories in table Price
# a) Expensive if the cost is more than 1000
# b) Average Cost if the cost is less than 1000 and greater than 500
# c) Cheap otherwise

select Distance, Price,
case 
when Price < 500 then "Cheap"
when Price < 1000 then "Average"
else "Expensive"
end as Category
from Price; 
