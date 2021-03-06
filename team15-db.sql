/* Database schema PittTours */

/*
Overall Constraint Comments:
	All primary and foreign keys are set not null.
	All foreign keys that reference an airline will cascade on delete if the airline no longer exists.
		Being that people can't fly without an airline, deleting all connected to them makes sense.
*/

-- DROP TABLES
drop table AIRLINE cascade constraints;
drop table PLANE cascade constraints;
drop table FLIGHT cascade constraints;
drop table PRICE cascade constraints;
drop table CUSTOMER cascade constraints;
drop table RESERVATION cascade constraints;
drop table DETAIL cascade constraints;
drop table OUR_DATE cascade constraints;

-- CREATE TABLES
-- Not Null: Every airline must have a name
create table AIRLINE(
airline_id varchar(5) not null,
airline_name varchar(50) not null,
airline_abbreviation varchar(10),
year_founded int,
constraint pk_airline primary key(airline_id));

-- Not Null: Every plane must have a listed capacity, otherwise its entry has no use to the database
create table PLANE(
plane_type char(4) not null,
manufacture varchar(10),
plane_capacity int not null,
last_service date,
year int,
owner_id varchar(5) not null,
constraint pk_plane primary key(plane_type, owner_id),
constraint fk_plane foreign key(owner_id) references AIRLINE(airline_id) on delete cascade);

-- Not Null: Every flight must have a depearture city and arrival city
-- Plane deletion cascade (this is for table data deletion)
--	 (ideally would have a trigger to replace all plane models before a plane was removed from service)
-- Check: Departure city can not match arrival city
-- Did not add check for arrival_time being before departure time, due to flights that pass over midnight
create table FLIGHT(
flight_number varchar(3) not null,
airline_id varchar(5) not null,
plane_type char(4),
departure_city varchar(3) not null,
arrival_city varchar(3) not null,
departure_time varchar(4),
arrival_time varchar(4),
weekly_schedule varchar(7),
constraint pk_flight primary key(flight_number),
constraint fk_flight foreign key(plane_type, airline_id) references PLANE(plane_type, owner_id) on delete cascade,
constraint ch_city_flight check(departure_city != arrival_city));

-- Not Null: Flights must have pricing information, otherwise a lot of things will break
-- Check: Low price must not be higher than high price
-- Check: Departure city can not match arrival city
create table PRICE(
departure_city varchar(3) not null,
arrival_city varchar(3) not null,
airline_id varchar(5) not null,
high_price int not null,
low_price int not null,
constraint pk_price primary key(departure_city, arrival_city),
constraint fk_price foreign key(airline_id) references AIRLINE(airline_id) on delete cascade,
constraint ch_price check(high_price >= low_price),
constraint ch_city_price check(departure_city != arrival_city));

-- Not Null: Customers must have a first and last name
-- Check: Assuming salutation is not null, since it is 'one of three values' (Mr, Mrs, Ms)
-- Credit Card Expire: Date will be stored as MM/YYYY, which defaults DD to 01, this would be ignored though
create table CUSTOMER(
cid varchar(9) not null,
salutation varchar(3) not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
credit_card_num varchar(16),
credit_card_expire date,
street varchar(30),
city varchar(30),
state varchar(2),
phone varchar(10),
email varchar(30),
frequent_miles varchar(5),
constraint pk_customer primary key(cid),
constraint ch_salutation check(salutation='Mr' OR salutation='Mrs' OR salutation='Ms'));

-- Not Null: A reservation must have a start city and end city. It must also have ticketed status and reservation date.
-- Customer deletion cascade: If customer is removed, his/her reservations should be as well
create table RESERVATION(
reservation_number varchar(5) not null,
cid varchar(9) not null,
cost int,
credit_card_num varchar(16),
reservation_date date not null,
start_city varchar(3) not null,
end_city varchar(3) not null,
ticketed varchar(1) not null,
constraint pk_reservation primary key(reservation_number),
constraint fk_reservation foreign key(cid) references CUSTOMER(cid) on delete cascade);

-- Flight deletion cascade to flight legs. If a flight no longer exists, a new flight leg would be found
--	 (most likely would be a trigger to switch flights of all affected legs before deletion)
create table DETAIL(
reservation_number varchar(5) not null,
flight_number varchar(3),
flight_date date,
leg int not null,
constraint pk_detail primary key(reservation_number, leg),
constraint fk_detail1 foreign key(reservation_number) references RESERVATION(reservation_number) on delete cascade,
constraint fk_detail2 foreign key(flight_number) references FLIGHT(flight_number) on delete cascade);

-- Stores our date
create table OUR_DATE(
c_date date not null,
constraint pk_time primary key(c_date));
