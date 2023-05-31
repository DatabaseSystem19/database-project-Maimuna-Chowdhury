drop table customer;
drop table hotel;
drop table tourpackage;
drop table bus;
drop table company;
drop table admin;

create table admin(
admin_id number,
password varchar(10),
primary key (admin_id));

create table company(
company_id number,
company_name varchar(20),
company_type varchar(15),
primary key (company_id));

create table bus(
bus_id number,
bus_type varchar(10) check (bus_type in('AC','NonAC','Business')),
company_id number,
sleeper_seats integer check (sleeper_seats>=5 and sleeper_seats<=20),
seater_seats integer,
no_of_customer integer,
primary key (bus_id),
foreign key (company_id) references company(company_id),
constraint check_type_seats check(
(bus_type='AC' and sleeper_seats>=5 and sleeper_seats<=15) or
(bus_type='NonAC' and sleeper_seats>=5 and sleeper_seats<=8) or
(bus_type='Business' and sleeper_seats>=5 and sleeper_seats<=20) or
seater_seats>sleeper_seats ));



create table tourpackage(
tourpackage_id number,
company_id number,
package_title varchar(20),
no_of_days number,
min_price number,
no_of_customer number,
primary key (tourpackage_id),
foreign key (company_id) references company(company_id));

create table hotel(
hotel_id number,
company_id number,
hotel_name varchar(20),
hotel_location varchar(20),
no_of_booked_rooms number,
primary key (hotel_id),
foreign key (company_id) references company(company_id));

create table customer(
customer_id number,
bus_id number,
tourpackage_id number,
hotel_id number,
customer_password varchar(20),
customer_name varchar(20),
customer_contact varchar(20),
customer_location varchar(20),
customer_destination varchar(20),
primary key (customer_id),
foreign key (bus_id) references bus(bus_id),
foreign key (tourpackage_id) references tourpackage(tourpackage_id),
foreign key (hotel_id) references hotel(hotel_id));

alter table admin add email char(20);
alter table admin modify email varchar(30);
alter table admin rename column email to admin_email;
alter table admin drop column email;
drop table admin;
 
