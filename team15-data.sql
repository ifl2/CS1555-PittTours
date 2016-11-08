-- Generate the data to represent at least 200 users, 300 reservations, 10 airlines, 30 planes and 100 flights.
/*
10 AIRLINES
Airline(airline id, airline name, airline abbreviation, year founded)

airline id, varchar(5) = generated sequentially starting at 001
airline name varchar(50) = generated sequentially starting at Airline001
airline abbreviation varchar(10) = generated sequentially starting at AAA
year founded int = generated as sequential decades starting at 1900

Here are example tuples:
001 United Airlines UAL 1931 */

insert into airlines values(001, 'Airline001', 'AAA', 1900);
insert into airlines values(002, 'Airline002', 'AAB', 1910);
insert into airlines values(003, 'Airline003', 'AAC', 1920);
insert into airlines values(004, 'Airline004', 'AAD', 1930);
insert into airlines values(005, 'Airline005', 'AAE', 1940);
insert into airlines values(006, 'Airline006', 'AAF', 1950);
insert into airlines values(007, 'Airline007', 'AAG', 1960);
insert into airlines values(008, 'Airline008', 'AAH', 1970);
insert into airlines values(009, 'Airline009', 'AAI', 1980);
insert into airlines values(010, 'Airline010', 'AAJ', 1990);

/*
100 FLIGHTS
Flight(flight number, airline id, plane type, departure city, arrival city,departure time, arrival time, weekly schedule)

flight number varchar(3) = generated randomly as unique values from 100 to 999
airline id, varchar(5) -> airline.airlineid = generated randomly from airline_id (001 to 010)
plane type char(4) -> plane.planetype = NEEDS GENERATED RANDOMLY BASED ON PLANE TYPE
departure city varchar(3) -> 3 letter airport code = generated randomly as unique values of real airport abbreviations
arrival city varchar(3) -> 3 letter airport code = generated randomly as unique values of real airport abbreviations (with different arrival from departure)
departure time varchar(4) -> 0000 to 2359 = generated randomly from 000 to 235, append 0
arrival time varchar(4) = generated randomly from 000 to 235, append 0
weekly schedule varchar(7) = generated randomly with 25% chance of each day being a -

Here are example tuples:
153 001 A320 PIT JFK 1000 1120 SMTWTFS */

insert into flights values('692', '009', 'PLANETYPEHERE', 'BAK', 'WWD', '0590', '2220', "--TWTFS");
insert into flights values('591', '006', 'PLANETYPEHERE', 'SBA', 'HXD', '1800', '1670', "--TW--S");
insert into flights values('854', '007', 'PLANETYPEHERE', 'BWI', 'TRI', '1010', '0320', "SM-WTFS");
insert into flights values('937', '009', 'PLANETYPEHERE', 'LFT', 'MTM', '0900', '1740', "SMT-TFS");
insert into flights values('522', '001', 'PLANETYPEHERE', 'LEX', 'MCO', '2250', '0420', "-MTW--S");
insert into flights values('678', '001', 'PLANETYPEHERE', 'BRD', 'GEG', '2260', '1450', "SMTWTFS");
insert into flights values('239', '004', 'PLANETYPEHERE', 'SOW', 'SMX', '0650', '0110', "S--WTFS");
insert into flights values('519', '006', 'PLANETYPEHERE', 'WLK', 'HSV', '0580', '1020', "-MTWTF-");
insert into flights values('829', '009', 'PLANETYPEHERE', 'SMF', 'SLN', '1180', '0530', "SMTW-FS");
insert into flights values('992', '005', 'PLANETYPEHERE', 'WWD', 'LAF', '0850', '1350', "SMTWTFS");
insert into flights values('480', '005', 'PLANETYPEHERE', 'ROA', '2A3', '1210', '1980', "-MTWTFS");
insert into flights values('889', '007', 'PLANETYPEHERE', 'AUK', 'BRD', '2020', '1020', "-MTW-FS");
insert into flights values('386', '009', 'PLANETYPEHERE', 'GRR', 'SPI', '0940', '0070', "SMT-TFS");
insert into flights values('981', '001', 'PLANETYPEHERE', 'BNA', 'MTJ', '0560', '2250', "SMTWT-S");
insert into flights values('876', '006', 'PLANETYPEHERE', 'OFK', 'HPN', '0500', '0480', "SMTW--S");
insert into flights values('186', '003', 'PLANETYPEHERE', 'BOI', 'HOT', '0170', '1200', "SMTWTF-");
insert into flights values('928', '009', 'PLANETYPEHERE', 'RKS', 'VAK', '2350', '0580', "SMTW--S");
insert into flights values('346', '007', 'PLANETYPEHERE', 'MTH', 'BHB', '2320', '0140', "S-T--FS");
insert into flights values('740', '003', 'PLANETYPEHERE', 'APN', 'IAD', '1800', '1670', "SMTWT-S");
insert into flights values('348', '003', 'PLANETYPEHERE', 'PGM', 'GBD', '1210', '0770', "S-TWTFS");
insert into flights values('219', '008', 'PLANETYPEHERE', 'SUS', 'AIZ', '1450', '0590', "SMTW-FS");
insert into flights values('191', '002', 'PLANETYPEHERE', 'HSV', 'PLN', '0920', '0120', "S-TW-FS");
insert into flights values('235', '007', 'PLANETYPEHERE', 'SAF', 'IWA', '1490', '0510', "SMT--FS");
insert into flights values('336', '008', 'PLANETYPEHERE', 'MTM', 'LBF', '0970', '1450', "S--WTFS");
insert into flights values('224', '010', 'PLANETYPEHERE', 'INL', 'ROA', '0540', '2200', "-MTWTFS");
insert into flights values('746', '005', 'PLANETYPEHERE', 'SKX', 'TVL', '1910', '0660', "SMT-T-S");
insert into flights values('364', '003', 'PLANETYPEHERE', 'OKC', 'MBS', '1900', '0150', "SMTWTF-");
insert into flights values('831', '003', 'PLANETYPEHERE', 'HOT', 'KKA', '0830', '1710', "SMTWT--");
insert into flights values('497', '009', 'PLANETYPEHERE', 'BGM', 'LEB', '0060', '1900', "S-TWTFS");
insert into flights values('621', '002', 'PLANETYPEHERE', 'AGN', 'OKC', '0630', '1590', "SMTWTF-");
insert into flights values('528', '008', 'PLANETYPEHERE', 'OAJ', 'PBI', '1900', '1980', "SMTWTF-");
insert into flights values('246', '005', 'PLANETYPEHERE', 'GBD', 'SKX', '1530', '1680', "S-TWT-S");
insert into flights values('301', '008', 'PLANETYPEHERE', 'BLV', 'RWI', '0630', '2350', "SMTWTFS");
insert into flights values('338', '010', 'PLANETYPEHERE', 'RWI', 'YAK', '1500', '1500', "SMTW-FS");
insert into flights values('477', '007', 'PLANETYPEHERE', 'IXD', 'JVL', '0110', '0370', "--TWT--");
insert into flights values('215', '006', 'PLANETYPEHERE', 'SPI', 'KVL', '0840', '0230', "SMT-T--");
insert into flights values('232', '006', 'PLANETYPEHERE', 'STT', 'BOI', '2340', '1380', "-MTWTFS");
insert into flights values('646', '002', 'PLANETYPEHERE', 'WRL', 'LEX', '0850', '1000', "SMT-TFS");
insert into flights values('806', '010', 'PLANETYPEHERE', 'TVL', 'LAR', '1780', '0370', "SMT-TFS");
insert into flights values('151', '009', 'PLANETYPEHERE', 'TWF', 'SBA', '0070', '1510', "S-T-TFS");
insert into flights values('254', '010', 'PLANETYPEHERE', 'LEB', 'BGM', '1460', '0330', "S-TWT-S");
insert into flights values('830', '007', 'PLANETYPEHERE', 'TYR', 'LAA', '0910', '0000', "-MT--FS");
insert into flights values('690', '004', 'PLANETYPEHERE', 'BHB', 'PHL', '1600', '0430', "SM--T-S");
insert into flights values('880', '009', 'PLANETYPEHERE', 'SMX', 'ILE', '1300', '0730', "SMTWTF-");
insert into flights values('998', '008', 'PLANETYPEHERE', 'ORV', 'INL', '1940', '0680', "-MT-TFS");
insert into flights values('216', '003', 'PLANETYPEHERE', 'LAR', 'PGM', '0140', '1540', "SMT-TFS");
insert into flights values('727', '006', 'PLANETYPEHERE', 'ILG', 'IXD', '2280', '0760', "SM-WTFS");
insert into flights values('533', '002', 'PLANETYPEHERE', 'LHD', 'IMT', '0410', '0690', "S-TW-FS");
insert into flights values('570', '008', 'PLANETYPEHERE', 'EKO', 'OAJ', '0410', '2020', "S-TW-FS");
insert into flights values('574', '004', 'PLANETYPEHERE', 'IAD', 'SAF', '1660', '0740', "-MT--FS");
insert into flights values('147', '010', 'PLANETYPEHERE', 'KVL', 'SDP', '0970', '2170', "SM-WTFS");
insert into flights values('669', '010', 'PLANETYPEHERE', 'AGS', 'SHG', '0230', '0880', "--TWT-S");
insert into flights values('452', '008', 'PLANETYPEHERE', 'JVL', 'AUK', '2170', '1100', "S--W--S");
insert into flights values('699', '005', 'PLANETYPEHERE', 'PAH', 'MSY', '0810', '1240', "SM--T-S");
insert into flights values('321', '005', 'PLANETYPEHERE', 'LIT', 'STT', '2030', '1770', "SMTWTF-");
insert into flights values('846', '004', 'PLANETYPEHERE', 'SUN', 'AGS', '1060', '0980', "SMT--F-");
insert into flights values('149', '010', 'PLANETYPEHERE', 'SDP', 'SUN', '0680', '1030', "----TF-");
insert into flights values('475', '003', 'PLANETYPEHERE', 'MSY', 'BRO', '2040', '0820', "SM-WTF-");
insert into flights values('921', '008', 'PLANETYPEHERE', 'Z08', 'BNA', '1860', '0180', "SMTW-FS");
insert into flights values('453', '001', 'PLANETYPEHERE', 'IMT', 'OFK', '1110', '2120', "SMTW--S");
insert into flights values('729', '010', 'PLANETYPEHERE', 'HSL', 'SMF', '0110', '0460', "SMT---S");
insert into flights values('217', '003', 'PLANETYPEHERE', 'LAA', 'RHI', '1470', '1200', "SMT-TFS");
insert into flights values('412', '009', 'PLANETYPEHERE', 'IRK', 'ILG', '1270', '0540', "-MTWT-S");
insert into flights values('180', '010', 'PLANETYPEHERE', 'CVO', 'PAH', '0620', '0670', "SMTWTFS");
insert into flights values('500', '001', 'PLANETYPEHERE', 'VAK', 'BLV', '0730', '2240', "SMTWTFS");
insert into flights values('590', '002', 'PLANETYPEHERE', 'SBN', 'CWI', '0890', '2160', "S-TWTFS");
insert into flights values('103', '008', 'PLANETYPEHERE', 'YAK', 'IRK', '1970', '2230', "-M---FS");
insert into flights values('237', '007', 'PLANETYPEHERE', '2A3', 'YNG', '2170', '2340', "SMTWT-S");
insert into flights values('138', '008', 'PLANETYPEHERE', 'HPN', 'A61', '2280', '1320', "SMT--FS");
insert into flights values('947', '009', 'PLANETYPEHERE', '74S', 'UIN', '1250', '2350', "S-T-TFS");
insert into flights values('994', '007', 'PLANETYPEHERE', 'CWI', 'LFT', '2010', '1970', "SMTWT--");
insert into flights values('565', '004', 'PLANETYPEHERE', 'RHI', 'CVO', '2130', '2230', "SM-WTFS");
insert into flights values('432', '005', 'PLANETYPEHERE', 'IWA', 'MGW', '0850', '1600', "-M-WTFS");
insert into flights values('773', '006', 'PLANETYPEHERE', 'PBI', 'RKS', '0120', '2060', "-MTWTFS");
insert into flights values('573', '004', 'PLANETYPEHERE', 'PLN', 'TEB', '1850', '1870', "S-TWTF-");
insert into flights values('681', '007', 'PLANETYPEHERE', 'LBF', 'GSP', '0360', '1060', "-M--TFS");
insert into flights values('320', '004', 'PLANETYPEHERE', 'GSP', 'LIT', '1860', '1780', "SMTWTFS");
insert into flights values('341', '007', 'PLANETYPEHERE', 'ILE', '74S', '1600', '0480', "-MTWTF-");
insert into flights values('970', '008', 'PLANETYPEHERE', 'BRO', 'SOW', '1990', '0140', "SM-WTFS");
insert into flights values('503', '002', 'PLANETYPEHERE', 'MGW', 'WRL', '1660', '0690', "--TWT-S");
insert into flights values('397', '003', 'PLANETYPEHERE', 'FHR', 'MTH', '1910', '0100', "-MT-TF-");
insert into flights values('511', '008', 'PLANETYPEHERE', 'MBS', 'Z08', '1820', '0300', "SMTWT-S");
insert into flights values('407', '009', 'PLANETYPEHERE', 'CEZ', 'BWI', '1010', '0130', "-MTWTF-");
insert into flights values('618', '006', 'PLANETYPEHERE', 'LAF', 'LHD', '2160', '2160', "SMTWTFS");
insert into flights values('633', '007', 'PLANETYPEHERE', 'MCO', 'WLK', '0970', '1820', "S-TWTFS");
insert into flights values('437', '003', 'PLANETYPEHERE', 'YNG', 'BAK', '1180', '2080', "-M---FS");
insert into flights values('295', '003', 'PLANETYPEHERE', 'HXD', 'ORV', '2070', '2190', "SMTWT-S");
insert into flights values('488', '003', 'PLANETYPEHERE', 'MTJ', 'TWF', '1120', '0040', "SMTW-F-");
insert into flights values('262', '005', 'PLANETYPEHERE', 'SLN', 'TYR', '1490', '1220', "S---T-S");
insert into flights values('516', '006', 'PLANETYPEHERE', 'UIN', 'SJC', '1810', '0890', "--TWTFS");
insert into flights values('294', '010', 'PLANETYPEHERE', 'SJC', 'GRR', '2320', '2150', "SMTW-F-");
insert into flights values('199', '008', 'PLANETYPEHERE', 'JXN', 'EKO', '0250', '0060', "SMTW-FS");
insert into flights values('941', '009', 'PLANETYPEHERE', 'KKA', 'HSL', '1510', '0460', "SM---FS");
insert into flights values('654', '008', 'PLANETYPEHERE', 'GEG', 'SUS', '1090', '1640', "S-T-TFS");
insert into flights values('807', '005', 'PLANETYPEHERE', 'PHL', 'AGN', '1830', '0520', "SMTWTFS");
insert into flights values('929', '004', 'PLANETYPEHERE', 'A61', 'SBN', '2070', '0590', "--TWTFS");
insert into flights values('893', '005', 'PLANETYPEHERE', 'TRI', 'JXN', '2340', '1130', "SMTWT-S");
insert into flights values('399', '001', 'PLANETYPEHERE', 'AIZ', 'CEZ', '0980', '2060', "---WTFS");
insert into flights values('515', '007', 'PLANETYPEHERE', 'SHG', 'APN', '0680', '0730', "SMTWTFS");
insert into flights values('868', '010', 'PLANETYPEHERE', 'TEB', 'FHR', '1980', '2280', "-MT--FS");

/*
30 PLANES
Plane(plane type, manufacture, plane capacity, last service date, year, owner id)

plane type char(4)
manufacture varchar(10)
plane capacity int
last service date
year int
owner id varchar(5) -> airlines.airlineid

Here are example tuples:
B737 Boeing 125 09/09/2009 1996 001 */


/*
200 USERS
Customer(cid, salutation, first name, last name, credit card num, street, credit card expire, city, state, phone, email)

cid varchar(9)
salutation varchar(3) -> Mr, Mrs, Ms
first name varchar(30)
last name varchar(30)
credit card num varchar(16)
credit card expire date
street varchar(30)
city varchar(30)
state varchar(2)
phone varchar(10)
email varchar(30)
frequent miles varchar(5) -> null or airline id */


/*
300 RESERVATIONS
Reservation(reservation number, cid, cost, credit card num, reservation date, ticketed)

reservation number varchar(5)
cid varchar(9) -> customer.cid
cost int
credit card num varchar(16)
reservation date date
ticketed varchar(1) -> Y/N

Reservation detail(reservation number, flight number, flight date, leg)

reservation number varchar(5) -> reservation.reservation_number
flight number varchar(3) -> flight.flight_number
flight date date
leg int -> 0, +1 for consecutive legs

*reservation detail contains full trip, including round trip */