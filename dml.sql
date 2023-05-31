insert into admin values(1,'1234');

insert into company values(1,'Hanif','Bus');
insert into company values(2,'Emad','Bus');
insert into company values(3,'shareTrip','Tourpackage');
insert into company values(4,'FlightExpert','Tourpackage');
insert into company values(5,'Obokash','Tourpackage');
insert into company values(6,'Ena','Bus');
insert into company values(7,'GreenLine','Bus');
insert into company values(8,'RoyalCoach','Bus');
insert into company values(9,'Talon','Tourpackage');
insert into company values(10,'AmyBD','Tourpackage');


insert into bus values(11,'Business',1,10,15,20);
insert into bus values(12,'AC',1,5,20,18);
insert into bus values(13,'NonAC',1,5,20,14);
insert into bus values(14,'Business',2,12,13,13);
insert into bus values(15,'AC',2,5,20,21);
insert into bus values(16,'NonAC',2,12,13,14);
insert into bus values(17,'Business',7,10,15,17);
insert into bus values(18,'AC',7,10,15,22);
insert into bus values(19,'NonAC',7,12,13,25);
insert into bus values(20,'AC',6,14,6,23);


insert into tourpackage values(21,3,'TanguarHaor',3,4000,10);
insert into tourpackage values(22,3,'ChittagongHill',2,4500,15);
insert into tourpackage values(23,3,'SundarbansSafari',2,4000,13);
insert into tourpackage values(24,5,'SylhetTour',3,6000,18);
insert into tourpackage values(25,5,'ExploringCoxs',3,5500,16);
insert into tourpackage values(26,5,'Bagerhat',1,2000,20);
insert into tourpackage values(27,5,'SrimangalAdventure',2,4000,23);
insert into tourpackage values(28,9,'TanguarHaor',3,4500,14);
insert into tourpackage values(29,10,'BarisalBackwaterTour',2,3500,12);
insert into tourpackage values(30,10,'KuakataTrip',2,4000,11);



insert into hotel values(31,3,'TheGrandHotel','Sylhet',4);
insert into hotel values(32,3,'HeritageBR','Chittagong',13);
insert into hotel values(33,3,'Iraboti','Sundarbans',26);
insert into hotel values(34,5,'MiraGraden','Sylhet',14);
insert into hotel values(35,5,'HotelCitizen','Bagerhat',19);
insert into hotel values(36,5,'LongBeachHotel','Coxs Bazar',5);
insert into hotel values(37,10,'GrandPark','Barisal',7);
insert into hotel values(38,10,'HotelAthena','Barisal',11);
insert into hotel values(39,3,'GoldenInn','Chittagong',6);
insert into hotel values(40,5,'PushpoBilash','Bagerhat',8);



insert into customer values(41,12,21,31,'1234','A','01858450776','Dhaka','Sylhet');
insert into customer values(42,13,22,32,'4567','B','01958450776','Chittagong','Sundarbans');
insert into customer values(43,12,22,39,'7891','C','01558450776','Dhaka','Chittagong');
insert into customer values(44,18,25,36,'1231','D','01857450776','Barisal','Sylhet');
insert into customer values(45,12,22,35,'1232','E','01858440776','Dhaka','Bagerhat');
insert into customer values(46,13,26,31,'1233','F','01858451776','Khulna','Coxs Bazar');
insert into customer values(47,16,21,32,'1235','G','01858450777','Tangail','Barisal');
insert into customer values(48,14,22,37,'1236','H','01858450998','Sylhet','Barisal');
insert into customer values(49,12,21,31,'1237','I','01858450776','Dhaka','Sylhet');
insert into customer values(50,12,21,31,'1238','J','01858451256','Savar','Coxs Bazar');
insert into customer values(51,13,21,31,'1239','K','01858451256','Savar','Barisal');


select * from company;
select * from bus;
select * from tourpackage;
select * from hotel;
select * from customer;

--selecting buses from bus where no of sleeper seats>5
select * from bus where sleeper_seats>5;


--selecting customers who have booked hotel 'TheGrandHotel' using subquery 
select customer_name from  customer where hotel_id=(select hotel_id from hotel where hotel_name='TheGrandHotel');


--updating column data
update tourpackage set package_title='Bagherhat' where package_title='Bagerhat';

--deleting row
delete from customer where customer_name='K';

--union,intersect,except
select company_name from company where company_type='Bus' union select company_name from company where company_name like '%ani%';
select company_name from company where company_type='Bus' intersect select company_name from company where company_name like '%ani%';
--with clause to find the bus with maximum no of customer
with max_customer(val) as (select max(no_of_customer) from bus) select * from bus,max_customer where bus.no_of_customer=max_customer.val;

--aggregate functions
    --count
	select count(*) from company;
	select count(company_name)  as no_of_companies from company;
	select count(distinct bus_type) as no_of_bues from bus;

	--max
	select max(no_of_customer) from bus;


   --groupby and having
   select bus_type,avg(no_of_customer) from bus group by bus_type;
   select bus_type,avg(no_of_customer) from bus group by bus_type having avg(no_of_customer)>17;

   --nested subquery
   select company_name from company where company_id in(select company_id from hotel where hotel_location in(select customer_destination from customer where customer_destination='Sylhet' ) );


   --and,or
   select no_of_customer from tourpackage where package_title='TanguarHaor' and company_id=3;
      select no_of_customer from tourpackage where package_title='TanguarHaor' or company_id=3;

--some,all,exists
  select bus_type from bus where no_of_customer<some(select no_of_customer from tourpackage);
  select bus_type from bus where no_of_customer<all(select no_of_customer from tourpackage);
  select * from hotel where hotel_name='Iraboti' and exists(select * from hotel where hotel_location='Sundarbans');



 --string operations
 select bus_id from bus where bus_type like '%A%C%' or bus_type like '%Non%';

 --join operations
 select * from tourpackage natural join hotel where no_of_customer>20;

 select package_title,hotel_name from tourpackage join hotel on tourpackage.company_id=hotel.company_id where no_of_customer>20;
  select package_title,hotel_name from tourpackage join hotel using(company_id) where no_of_customer>20;
    select package_title,hotel_name from tourpackage left outer join hotel using(company_id) where no_of_customer>20;
	  select package_title,hotel_name from tourpackage right outer join hotel using(company_id) where no_of_customer>20;
	    select package_title,hotel_name from tourpackage full outer join hotel using(company_id) where no_of_customer>20;


--view
 create view company_details as select company_id,company_name from company;

 create view shareTrip_Tour as select package_title from tourpackage where company_id=(select company_id from company where company_name='shareTrip');  
  create view custom as select * from company_details where company_id>=2;