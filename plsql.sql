drop procedure proc;
--procedure to show hotel name and number of booked rooms through hotel id
create or replace procedure proc(
var1 in number,
var2 out number,
var3 in out varchar2
) is
begin
select no_of_booked_rooms into var2 from hotel where hotel_name =(select hotel_name from hotel where hotel_id=var1);
select hotel_name into var3 from HOTEL where hotel_id=var1;
dbms_output.put_line('Hotel Name:'||var3);
dbms_output.put_line('No of booked rooms:'||var2);
end;


drop function func;
--function to return number of customers through bus id
create or replace function func(var1 in varchar) return varchar as
value BUS.NO_OF_CUSTOMER%type;
begin
select no_of_customer into value from bus where bus_id=var1;
return value;
end;
/
set serveroutput on
declare
company_id company.company_id%type;
company_name company.company_name%type;
company_type company.company_type%type;
customer_row customer%rowtype;
cursor customer_cursor is select customer_name,customer_contact from customer;
counter number;
type namearray is varray(10) of CUSTOMER.customer_name%type;
a_name namearray:=namearray();
customer_name2 CUSTOMER.customer_name%type;
no_of_customer2 int;
hotel_id1 hotel.hotel_id%type:=33;
extra1 varchar(20):='Iraboti';
extra2 number:=20;
bus_id1 BUS.bus_id%type:=15;
value1 number;


begin
select company_id,company_name,company_type into company_id,company_name,company_type from company where company_id=3;
dbms_output.put_line('company_id:'||company_id||'company_name:'||company_name||'company_type:'||company_type);

--row type
select customer_name,customer_location,customer_destination into customer_row.customer_name,customer_row.customer_location,customer_row.customer_destination from customer where customer_id=50;

--cursor to show customer names and contacts
open customer_cursor;
fetch customer_cursor into customer_row.customer_name,customer_row.CUSTOMER_CONTACT;
while customer_cursor%found loop
dbms_output.put_line('customer name:'||customer_row.customer_name||' customer contact:'||customer_row.customer_contact);
dbms_output.put_line('Row count:'||customer_cursor%rowcount);
fetch customer_cursor into customer_row.customer_name,customer_row.CUSTOMER_CONTACT;
end loop;
close customer_cursor;

--array to store and display customer names through customer id
counter:=1;
for x in 41..50
loop
select customer_name into customer_name2 from customer where customer_id=x;
a_name.extend();
a_name(counter):=customer_name2;
counter:=counter+1;
end loop;

counter:=1;
while counter<=a_name.count
loop
dbms_output.put_line(a_name(counter));
counter:=counter+1;
end loop;

--if,elseif,else to show the states of bus seats available
for x in 11..20
loop
select no_of_customer into no_of_customer2 from BUS where bus_id=x;
if no_of_customer2<=15
   then
  dbms_output.put_line('Seats available');
  elsif no_of_customer2<25
  then
  dbms_output.put_line('Few seats availabe:');
  else
  dbms_output.put_line('No seat available');
  end if;
  end loop;
  
  
  --procedure
  proc(hotel_id1,extra2,extra1);
  
  --function
  value1:=func(bus_id1);
  dbms_output.put_line('No of customer in bus:'||value1);
  

end;
/


