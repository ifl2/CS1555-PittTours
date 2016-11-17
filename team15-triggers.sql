/* Trigger 1

You should create a trigger, called adjustTicket, that adjusts the cost of a reservation when the price of one of its legs changes before the ticket is issued.

1. when update PRICE (join PRICE with FLIGHT using departure_city and arrival_city)
2. find if any reservation is using that flight( join 1 with DETAIL using flight_number)
2.b. update D.cost = new.low_price
3. find if it is ticked or not (join 2 with RESERVATIONS using reservation_number)
4. if ticketed = 'Y' do not do anything
5. if ticketed = 'N' update R.cost( find all legs from each reservation, add the D.cost(each leg) and update the final cost( R.cost)*/
				
create trigger adjustTicket				 
after update of low_price
on PRICE
for each row

select r.reservation_number, SUM(r.cost) as new_cost
from (((FLIGHT f1 full join PRICE p1 on p1.departure_city=f1.departure_city and p1.arrival_city=f1.arrival_city) full join DETAIL d1 on f1.flight_number = d1.flight_number) full join reservation r on d1.reservation_number=r.reservation_number)
where d1.reservation_number IN (select d.reservation_number
from (price p full join flight f on p.departure_city=f.departure_city and p.arrival_city=f.arrival_city) full join detail d on f.flight_number = d.flight_number
where p.departure_city=:new.departure_city and p.arrival_city=:new.arrival_city)
group by r.reservation_number;

when( EXISTS( 	SELECT  cid, ticketed
		FROM RESERVATION
		WHERE = 'N')
BEGIN
UPDATE RESERVATION R4
SET R4.cost = new_cost
where R4.reservation_number = r.reservation_number AND 'N' = (select ticketed from RESERVATION R1
where R1.reservation_num = r.reservation_number)
END;
/
show errors;
       
/* Trigger 2 */

create or replace procedure count_flight(in number varchar(3), out a_count integer)
AS
BEGIN
select count(flight_number) into a_count
from DETAILS
where DETAILS.flight_number =number;
end;
/
show errors;

create or replace function is_full(IN number varchar(3), IN capacity int)
returns boolean
begin
select plane_type, flight_capacity
From(FIGHT F INNER JOIN PLANE P on F.plane_type = P.plane_type)
where flight_number = number
return flight_capacity = capacity;
end;
/
show errors;

create or replace trigger planeUpgrade
before update of reservation_number
on RESERVATION
for each row
begin
select flight_number
from DETAIL D
where D.flight_number= :new.flight_number


declare count =  count_flight(D.flight_number)
when(EXISTS( is_full(flight_number,count)))
select MAX(plane_capacity) into max_capacity
from plane
if max_capacity = count then
return;
else
UPDATE flight
set plane_type = (select plane_type
		   from PLANE
		   where flight_capacity > count AND owner_id =(select airline_id from FLIGHT F where F.flight_number = (select D1.flight_number from DETAIL D1 where D1.reservation_number = :new.reservation_number)
	   	   order by flight_capacity DESC
		   fetch first row only;))
where flight_number=D.flight_number;
END IF;
end;
/
show errors;
/* Trigger 3 
You should write a trigger, called cancelReservation, that cancels(deletes)all non-ticketed reservations for a flight, 12 hours prior 
the flight (i.e., 12 hours before the flight is scheduled to depart) and if the number of ticketed passengers fits in a smaller capacity 
plane, then the plane for that flight should be switched to the smaller-capacity plane

1. find all flights that are 12h before depart in FLIGHT table(check week date and time)
2. find all reservations for those flights(join FLIGHT with DETAIL using flight_number)
3. find if it is ticked or not (join 2 with RESERVATIONS using reservation_number)
4. if ticketed = 'N' cancel reservation (cascade delete the flight from that reservation)
5. if ticketed = 'Y' count all the tickets for each flight
6. use the count to find a smaller plane if possible( select plane_type from PLANE where plane_capacity >= count , sort by min first)
7. if find a smaller plane, update FLIGHT(where F.plane_type = P.plane_type) */
  
create or replace trigger CancelReservation				 
after update of c_date
on TIME
for each row
     
DELETE FROM RESERVATION
where reservation_number IN (select R.reservation_number
group by R.reservation_number
from RESERVATION R
where ticketed = 'N' AND R.reservation_number IN (select D.reservation_number
from FLIGHT natural join DETAIL
where D.flight_number IN (select flight_number 
from FLIGHT natural join RESERVATION
where (reservation_date <= dateadd(HOUR, 12, c_date)))))

declare count = count_flight(D.flight_number)
UPDATE FLIGHT
set plane_type = (select plane_type
from PLANE
where plane_capacity >= count AND owner_id =(select airline_id from FLIGHT F where F.flight_number = (select D1.flight_number from DETAIL D1 where D1.flight_number = D.flight_number)
order by flight_capacity DESC
fetch first row only;))
end;
/
show errors;					  
						  
						  
/*Trigger extra*/
create or replace trigger ten_percent
after insert of reservation_number
on RESERVATION
for each row

update reservation
set cost=cost*0.9
where cid = (select cid from customer
where frequent_miles != null)

end;
/
show errors;
