//Database schema PittTours

drop table AIRLINE cascade constraints;
drop table FLIGHT cascade constraints;
drop table PLANE cascade constraints;
drop table PRICE cascade constraints;
drop table CUSTOMER cascade constraints;
drop table RESERVATION cascade constraints;
drop table TIME cascade constraints;

create table AIRLINE(
airline_id varchar(5),
airline_name varchar(5),
airline_abbreviation varchar(10),
year_founded int,
constraint pk_airline primary key(airline_id));

create table FLIGHT(
flight_number varchar(3) not null,
airline_id varchar(5) not null,
plane_type char(4) not null,
departure_city varchar(3),
arrival_city varchar(3),
departure_time varchar(4),
arrival_time varchar(4),
weekly_schedule varchar(7),
constraint pk_flight primary key(flight_number),
constraint fk_flight1 foreign key(plane_type) references PLANE(plane_type),
constraint fk_flight1 foreign key(airline_id) references AIRLINE(airline_id));

create table PLANE(
plane_type char(4) not null,
manufacture varchar(10),
plane_capacity int,
last_service date,
year int,
owner_id varchar(5) not null,
constraint pk_plane primary key(plane_type),
constraint fk_plane foreign key(owner_id) references AIRLINE(airline_id));

create table PRICE(
departure_city varchar(3) not null,
arrival_city varchar(3) not null,
airline_id varchar(5) not null,
high_price int,
low_price int,
constraint pk_price primary key(departure_city, arrival_city),
constraint fk_price foreign key(airline_id) references AIRLINE(airline_id));

//customer table has some inconsistence in the project description, the schema does not match the description of the 
//datatype
create table CUSTOMER(
cid varchar(9) not null,
salutation varchar(3),
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
constraint pk_customer primary key(cid));

create table RESERVATION(
reservation_number varchar(5) not null,
cid varchar(9) not null,
cost int,
credit_card_num varchar(16),
reservation_date date,
ticketed varchar(1)
constraint pk_reservation(reservation_num),
constraint fk_reservation(cid) references CUSTOMER(cid));

create table DETAIL(
reservation_number varchar(5) not null,
flight_number varchar(3) not null,
fllight_date date,
leg int not null,
constraint pk_detail(reservation_number, leg),
constraint fk_detail1(reservation_number) references RESERVATION(reservation_number),
constraint fk_detail2(flight_number) references FLIGHT(flight_number));

create table TIME(
c_date date not null,
constraint pk_time(c_date));
