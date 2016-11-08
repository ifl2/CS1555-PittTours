/* Database schema PittTours */

/* Constraint Comments:
  All primary and foreign keys are set not null.

  All foreign keys that reference an airline will cascade on delete if the airline no longer exists.
  Being that people can't fly without an airline, deleting all connected to them makes sense.
  
  If a plane is deleted, it will cascade to set null, for a new plane could be assigned.
  
  If a flight number is deleted, it will cascade to set null, for a new flight could be taken for the reservation leg.
*/

-- DROP TABLES
drop table AIRLINE cascade constraints;
drop table PLANE cascade constraints;
drop table FLIGHT cascade constraints;
drop table PRICE cascade constraints;
drop table CUSTOMER cascade constraints;
drop table RESERVATION cascade constraints;
drop table DETAIL cascade constraints;
drop table TIME cascade constraints;

-- CREATE TABLES
-- Every airline should have a name (not null)
create table AIRLINE(
airline_id varchar(5) not null,
airline_name varchar(5) not null,
airline_abbreviation varchar(10),
year_founded int,
constraint pk_airline primary key(airline_id));

create table PLANE(
plane_type char(4) not null,
manufacture varchar(10),
plane_capacity int,
last_service date,
year int,
owner_id varchar(5) not null,
constraint pk_plane primary key(plane_type),
constraint fk_plane foreign key(owner_id) references AIRLINE(airline_id) on delete cascade);

-- Every flight should have a depearture and arrival city (not null) 
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
constraint fk_flight1 foreign key(plane_type) references PLANE(plane_type) on delete set null,
constraint fk_flight2 foreign key(airline_id) references AIRLINE(airline_id) on delete cascade);

create table PRICE(
departure_city varchar(3) not null,
arrival_city varchar(3) not null,
airline_id varchar(5) not null,
high_price int,
low_price int,
constraint pk_price primary key(departure_city, arrival_city),
constraint fk_price foreign key(airline_id) references AIRLINE(airline_id) on delete cascade);

-- Customer table has some inconsistence in the project description, the schema does not match the description of the datatype
-- Assuming salutation is not null, since it is 'one of three values' (checked)
-- Customers have a first and last name (not null)
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
constraint chk_salutation check (salutation='Mr' OR salutation='Mrs' OR salutation='Ms'));

create table RESERVATION(
reservation_number varchar(5) not null,
cid varchar(9) not null,
cost int,
credit_card_num varchar(16),
reservation_date date,
ticketed varchar(1),
constraint pk_reservation primary key(reservation_number),
constraint fk_reservation foreign key(cid) references CUSTOMER(cid) on delete cascade);

-- Added cost column, required for triggers that need the cost of a leg
create table DETAIL(
reservation_number varchar(5) not null,
flight_number varchar(3),
flight_date date,
leg int not null,
cost int,
constraint pk_detail primary key(reservation_number, leg),
constraint fk_detail1 foreign key(reservation_number) references RESERVATION(reservation_number) on delete cascade,
constraint fk_detail2 foreign key(flight_number) references FLIGHT(flight_number) on delete set null);

create table TIME(
c_date date not null,
constraint pk_time primary key(c_date));
