create or replace procedure count_flight(in number varchar(3), out a_count integer)
AS
BEGIN
select count(flight_number) into a_count
from DETAILS
where DETAILS.flight_number =number;
end;
/


create or replace function is_full(IN number varchar(3), IN capacity int)
returns boolean
begin
select flight_type, flight_capacity
From(FIGHT F INNER JOIN PLANE P on F.plane_type = P.plane_type)
where flight_number = number
return flight_capacity = capacity;
end;
/

create trigger planeUpgrade
before update of reservation_number
on RESERVATION
for each row
begin
select flight_number
from DETAIL D
where D.reservation_number= :new.reservation_number

declare count =  count_flight(flight_number)
when(EXISTS( is_full(flight_number,count))
UPDATE flight
set flight_type = (select MAX(flight_type) from PLANE)
end;
/
