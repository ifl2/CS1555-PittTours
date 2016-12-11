/* Trigger 1
You should create a trigger, called adjustTicket, that adjusts the cost of a reservation when the price of one of its legs changes before the ticket is issued.
1. when update PRICE (join PRICE with FLIGHT using departure_city and arrival_city)
2. find if any reservation is using that flight( join 1 with DETAIL using flight_number)
2.b. update D.cost = new.low_price
3. find if it is ticked or not (join 2 with RESERVATIONS using reservation_number)
4. if ticketed = 'Y' do not do anything
5. if ticketed = 'N' update R.cost( find all legs from each reservation, add the D.cost(each leg) and update the final cost( R.cost)*/

-- BROKEN
/*
create or replace trigger adjustTicket
after update of low_price
on PRICE
for each row
begin
	update RESERVATION R4 set R4.cost = (
		select new_price from (
			select r.reservation_number numb, SUM(low_price) as new_price from (
				(reservation r full join detail d on r.reservation_number = d.reservation_number)
				full join (flight f full join price p on p.departure_city = f.departure_city
				and p.arrival_city=f.arrival_city) on d.flight_number = f.flight_number)
			where r.reservation_number in (
				select d.reservation_number from (
					price p full join FLIGHT f on p.departure_city = f.departure_city
					and p.arrival_city = f.arrival_city)
				full join DETAIL d on f.flight_number = d.flight_number
				where p.departure_city=:new.departure_city
				and p.arrival_city =:new.arrival_city)
			group by r.reservation_number))
		where R4.reservation_number in numb (
			select d.reservation_number from (
				price p full join FLIGHT f on p.departure_city = f.departure_city
				and p.arrival_city = f.arrival_city)
			full join DETAIL d on f.flight_number = d.flight_number
			where p.departure_city = :new.departure_city
			and p.arrival_city = :new.arrival_city)
		and 'N' in (
			select ticketed from RESERVATION R1
			where R1.reservation_number IN (
				select d.reservation_number from (
					price p full join FLIGHT f on p.departure_city = f.departure_city
					and p.arrival_city = f.arrival_city)
				full join DETAIL d on f.flight_number = d.flight_number
				where p.departure_city = :new.departure_city
				and p.arrival_city = :new.arrival_city));
end;
/
*/

/* Trigger 2 */
--Procedure that will count the number of reservation exist for a specific flight number.
create or replace procedure count_flight(f_number in varchar, a_count out int)
as
begin
	select count(flight_number) into a_count
	from DETAIL
	where flight_number = f_number;
end;
/

-- Function will check if the plane capacity is full, and return True or false
create or replace function is_full(f_number in varchar, capacity in int)
return boolean
as p_cap int;
begin
	select plane.plane_capacity into p_cap
	from FLIGHT, PLANE
	where flight_number = f_number
	and flight.plane_type = plane.plane_type;
	return (p_cap = capacity);
end;
/

-- Trigger will use the procedure and functions to perform the required task
-- Errors, compiles but somehow fetches more than one row even though it is first row only
/*
create or replace trigger planeUpgrade
before insert
on DETAIL
for each row
declare
	flight_n varchar(3);
	flight_c int;
	max_capacity int;
begin
	select flight_number into flight_n from DETAIL
	where flight_number = :new.flight_number;
	count_flight(flight_n, flight_c);
	if is_full(flight_n, flight_c) then
		select max(plane_capacity) into max_capacity from PLANE;
		if max_capacity >= flight_c then
			update FLIGHT
			set plane_type = (
				select plane_type from PLANE
				where plane_capacity > flight_c
				and owner_id = (
					select airline_id from FLIGHT
					where flight.flight_number = (
						select detail.flight_number from DETAIL
						where reservation_number = :new.reservation_number
						and flight_number = :new.flight_number)
				order by plane_capacity desc
				fetch first row only))
			where flight_n = :new.flight_number;
		end if;
	end if;
end;
/
*/

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

/*
-- Trigger created with compilation error
create or replace trigger CancelReservation
after update
on OUR_DATE
for each row
begin
	delete from RESERVATION R1
	where R1.reservation_number in (
		select R.reservation_number from RESERVATION R
		where (R.ticketed = 'N' and R.reservation_number in (
			select D.reservation_number from FLIGHT F full join DETAIL D on f.flight_number = D.flight_number
			where F.flight_number in (
				select F4.flight_number from FLIGHT F4 full join RESERVATION R6 on F4.departure_city = R6.start_city
				and F4.arrival_city = R6.end_city
				where (R6.reservation_date < select to_char(c_date + (interval '12' hour) ,'DD-Mon-YY hh:mi') from our_date)))));
end;
/
*/

/*
-- Trigger 3 Part 2
-- Trigger created with compilation error
-- This trigger should check if there is a smaller plane that can fit all the customers for that flight.
-- After there was a deletion on RESERVATION
create or replace trigger UpdateFlight
after delete
on RESERVATION
for each row
declare
	flight_c int;
begin
	count_flight(flight_n, flight_c);
	update FLIGHT
	set plane_type = (
		select plane_type from PLANE
		where plane_capacity >= flight_c
		and owner_id = (
			select airline_id from FLIGHT
			where flight.flight_number = (
				select detail.flight_number from DETAIL
				where detail.reservation_number = :new.reservation_number
				and detail.flight_number = :new.flight_number)
			order by plane_capacity desc
			fetch first row only));
end;
/
*/
