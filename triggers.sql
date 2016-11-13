/* Trigger 1 */

You should create a trigger, called adjustTicket, that adjusts the cost of a reservation when the price of one of its legs changes before the ticket is issued.

1. when update PRICE (join PRICE with FLIGHT using departure_city and arrival_city)
2. find if any reservation is using that flight( join 1 with DETAIL using flight_number)
2.b. update D.cost = new.low_price
3. find if it is ticked or not (join 2 with RESERVATIONS using reservation_number)
4. if ticketed = 'Y' do not do anything
5. if ticketed = 'N' update R.cost( find all legs from each reservation, add the D.cost(each leg) and update the final cost( R.cost)
				
create trigger adjustTicket				 
after update of low_price
on PRICE
for each row

select R2.reservation_num, SUM(R2.cost) into new_cost
from (((FLIGHT natural join PRICE) natural join DETAIL) natural join RESERVATION R2)
group by reservation_number
where D1.reservation_number IN (select D2.reservation_number
from (PRICE P2 natural join FLIGHT F2) inner join DETAIL D2 on F2.flight_number=D2.flight_number) 
where P2.departure_city=:new.departure_city and P2.arrival_city=:new.arrival_city)

when( EXISTS( 	SELECT  cid, ticketed
		FROM RESERVATION
		GROUP BY cid
		HAVING ticketed = 'N')
BEGIN
UPDATE RESERVATION R
SET R.cost = new_cost
where R.reservation_number = R1.reservation_number
END;
/

       
/* Trigger 2 */

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
where D.flight_number= :new.flight_number

declare count =  count_flight(D.flight_number)
when(EXISTS( is_full(flight_number,count))
select MAX(plane_capacity) into max_capacity
from plane
if max_capacity = count then
return;
else
UPDATE flight
set flight_type = (select flight_type
		   from PLANE
		   where flight_capacity >= count
	   	   order by flight_capacity ASC
		   fetch first row only;)
where flight_number=D.flight_number;
END IF;
end;
/

/* Trigger 3 */
You should write a trigger, called cancelReservation, that cancels(deletes)all non-ticketed reservations for a flight, 12 hours prior 
the flight (i.e., 12 hours before the flight is scheduled to depart) and if the number of ticketed passengers fits in a smaller capacity 
plane, then the plane for that flight should be switched to the smaller-capacity plane

1. find all flights that are 12h before depart in FLIGHT table(check week date and time)
2. find all reservations for those flights(join FLIGHT with DETAIL using flight_number)
3. find if it is ticked or not (join 2 with RESERVATIONS using reservation_number)
4. if ticketed = 'N' cancel reservation (cascade delete the flight from that reservation)
5. if ticketed = 'Y' count all the tickets for each flight
6. use the count to find a smaller plane if possible( select plane_type from PLANE where plane_capacity >= count , sort by min first)
7. if find a smaller plane, update FLIGHT(where F.plane_type = P.plane_type)
/*Extra Trigger */
     
     
