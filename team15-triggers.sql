/* Trigger 1

You should create a trigger, called adjustTicket, that adjusts the cost of a reservation when the price of one of its legs changes before the ticket is issued.

1. when update PRICE (join PRICE with FLIGHT using departure_city and arrival_city)
2. find if any reservation is using that flight( join 1 with DETAIL using flight_number)
2.b. update D.cost = new.low_price
3. find if it is ticked or not (join 2 with RESERVATIONS using reservation_number)
4. if ticketed = 'Y' do not do anything
5. if ticketed = 'N' update R.cost( find all legs from each reservation, add the D.cost(each leg) and update the final cost( R.cost)*/

-- BROKEN
create trigger adjustTicket				 
after update of low_price
on PRICE
for each row

BEGIN
Create or replace view price_view as select r.reservation_number, SUM(r.cost) as new_cost
from (((FLIGHT f1 full join PRICE p1 on p1.departure_city=f1.departure_city and p1.arrival_city=f1.arrival_city) full join DETAIL d1 on f1.flight_number = d1.flight_number) full join reservation r on d1.reservation_number=r.reservation_number)
where d1.reservation_number IN (select d.reservation_number
from (price p full join flight f on p.departure_city=f.departure_city and p.arrival_city=f.arrival_city) full join detail d on f.flight_number = d.flight_number
where p.departure_city=:new.departure_city and p.arrival_city=:new.arrival_city)
group by r.reservation_number;

UPDATE RESERVATION R4
SET R4.cost = new_cost
where R4.reservation_number = (Select reservation_number from price_view) AND 'N' = (select ticketed from RESERVATION R1
where R1.reservation_num = (Select reservation_number from price_view)
END;
/

/* Trigger 2 */

create or replace procedure count_flight(f_number in varchar, a_count out int)
as
begin
	select count(flight_number) into a_count
	from detail
	where flight_number = f_number;
end;
/

create or replace function is_full(f_number in varchar, capacity in int)
return boolean
as
p_cap int;
begin
	select plane.plane_capacity into p_cap
	from flight, plane
	where flight_number = f_number and flight.plane_type = plane.plane_type;
	return (p_cap = capacity);
end;
/

create or replace trigger planeUpgrade
before update
on detail
for each row
declare
	flight_n varchar(3);
	flight_c int;
	max_capacity int;
begin
	select flight_number into flight_n
	from detail
	where flight_number = :new.flight_number;

	count_flight(flight_n, flight_c);

	if is_full(flight_n, flight_c) then
		select max(plane_capacity) into max_capacity
		from plane;
		if max_capacity != flight_c then
			update flight
			set plane_type = (
				select plane_type
				from plane
				where plane_capacity > flight_c and owner_id = (select airline_id from flight where flight.flight_number = (select detail.flight_number from detail where reservation_number = :new.reservation_number and flight_number = :new.flight_number)
				order by plane_capacity desc
				fetch first row only))
			where flight_n = :new.flight_number;
		end if;
	end if;
end;
/

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

-- BROKEN
create or replace trigger CancelReservation
after update
on Our_Date
for each row
declare
	flight_c int;
begin
	delete from reservation
	where reservation_number in (
		select reservation_number
		from reservation R
		group by reservation_number
		where ticketed = 'N' and reservation_number in (
			select reservation_number
			from flight natural join detail
			where flight_number in (
				select flight_number
				from flight natural join reservation
				where (reservation_date <= dateadd(HOUR, 12, c_date))
			)
		)
	)

	count_flight(flight_n, flight_c);

	update flight
	set plane_type =
		(select plane_type
		from PLANE
		where plane_capacity >= flight_c and owner_id = (select airline_id from flight where flight.flight_number = (select detail.flight_number from detail where reservation_number = :new.reservation_number and flight_number = :new.flight_number)
		order by plane_capacity desc
		fetch first row only));
end;
/


/*Trigger extra*/
create or replace trigger ten_percent
after insert
on reservation
for each row
begin
update reservation
set cost = (cost * 0.9)
where cid =
	(select cid from customer
	where frequent_miles != null);
end;
/
