/* NOTES ON THIS SAMPLE DATA
	The following data was generated as specified above each section
	There are discontinuity errors in the data, but it works for general use

	Some data was manually created for exact testing:
		Reservations 00000 to 00009
		Detail corresponding to reservations mentioned above
		A customer by the name of Bill Bob for naming ease of use
		A customer with a cid of 123456789 for ease of use
		Flights from LAX -> MSP, LAS -> JFK, LAX -> SFO have good testing connections
		Airlines are named 'Airline001' to 'Airline010' for ease of use
*/


-- Generate the data to represent at least 200 users, 300 reservations, 10 airlines, 30 planes and 100 flights.
-- (plus 100 prices to match 100 flights and 1-4 legs for each reservation)

/* 10 AIRLINES
Airline(airline_id, airline_name, airline_abbreviation, year_founded)
	airline_id varchar(5) = generated sequentially starting at 001
	airline_name varchar(50) = generated sequentially starting at Airline001
	airline_abbreviation varchar(10) = generated as (A + airline_id)
	year_founded int = generated as sequential decades starting at 1900 */

insert into airline values('001', 'Airline001', 'A001', 1900);
insert into airline values('002', 'Airline002', 'A002', 1910);
insert into airline values('003', 'Airline003', 'A003', 1920);
insert into airline values('004', 'Airline004', 'A004', 1930);
insert into airline values('005', 'Airline005', 'A005', 1940);
insert into airline values('006', 'Airline006', 'A006', 1950);
insert into airline values('007', 'Airline007', 'A007', 1960);
insert into airline values('008', 'Airline008', 'A008', 1970);
insert into airline values('009', 'Airline009', 'A009', 1980);
insert into airline values('010', 'Airline010', 'A010', 1990);


/* 30 PLANES
Plane(plane_type, manufacture, plane_capacity, last_service_date, year, owner_id)
	plane_type char(4) = generated manually (manufacturer+capacity)
	manufacture varchar(10) = generated manually (M_ + manufacturer)
	plane_capacity int = based on plane_type
	last_service_date date = generated randomly (01/01/2010 to 12/31/2015)
	year int = generated randomly (1950 to 2000)
	owner_id varchar(5) -> airlines.airlineid = generated randomly from airline_id */

insert into plane values('A100', 'M_A', 100, to_date('02/17/2010', 'MM/DD/YYYY'), 1987, '010');
insert into plane values('A150', 'M_A', 150, to_date('07/12/2010', 'MM/DD/YYYY'), 1978, '009');
insert into plane values('A200', 'M_A', 200, to_date('07/21/2010', 'MM/DD/YYYY'), 1950, '009');
insert into plane values('A220', 'M_A', 220, to_date('09/10/2010', 'MM/DD/YYYY'), 1978, '004');
insert into plane values('A230', 'M_A', 230, to_date('10/01/2010', 'MM/DD/YYYY'), 1993, '005');
insert into plane values('A250', 'M_A', 250, to_date('10/25/2010', 'MM/DD/YYYY'), 1953, '003');
insert into plane values('A280', 'M_A', 280, to_date('02/17/2011', 'MM/DD/YYYY'), 1977, '002');
insert into plane values('A290', 'M_A', 290, to_date('07/05/2011', 'MM/DD/YYYY'), 1974, '005');
insert into plane values('A300', 'M_A', 300, to_date('09/05/2011', 'MM/DD/YYYY'), 1983, '007');
insert into plane values('A350', 'M_A', 350, to_date('09/29/2011', 'MM/DD/YYYY'), 1988, '003');
insert into plane values('B050', 'M_B',  50, to_date('01/28/2012', 'MM/DD/YYYY'), 1960, '002');
insert into plane values('B100', 'M_B', 100, to_date('03/21/2012', 'MM/DD/YYYY'), 1968, '007');
insert into plane values('B120', 'M_B', 120, to_date('11/08/2012', 'MM/DD/YYYY'), 1961, '008');
insert into plane values('B130', 'M_B', 130, to_date('02/07/2013', 'MM/DD/YYYY'), 1987, '001');
insert into plane values('B140', 'M_B', 140, to_date('02/19/2013', 'MM/DD/YYYY'), 1956, '001');
insert into plane values('B150', 'M_B', 150, to_date('06/09/2013', 'MM/DD/YYYY'), 1958, '009');
insert into plane values('B170', 'M_B', 170, to_date('11/03/2013', 'MM/DD/YYYY'), 1972, '004');
insert into plane values('B211', 'M_B', 211, to_date('02/11/2014', 'MM/DD/YYYY'), 1996, '003');
insert into plane values('B222', 'M_B', 222, to_date('08/06/2014', 'MM/DD/YYYY'), 1973, '004');
insert into plane values('B233', 'M_B', 233, to_date('08/28/2014', 'MM/DD/YYYY'), 1970, '008');
insert into plane values('C020', 'M_C',  20, to_date('10/24/2014', 'MM/DD/YYYY'), 1958, '006');
insert into plane values('C050', 'M_C',  50, to_date('06/30/2015', 'MM/DD/YYYY'), 1951, '007');
insert into plane values('C070', 'M_C',  70, to_date('07/12/2015', 'MM/DD/YYYY'), 1965, '007');
insert into plane values('C090', 'M_C',  90, to_date('09/15/2015', 'MM/DD/YYYY'), 1976, '009');
insert into plane values('C100', 'M_C', 100, to_date('12/10/2015', 'MM/DD/YYYY'), 1978, '006');
insert into plane values('C133', 'M_C', 133, to_date('04/08/2010', 'MM/DD/YYYY'), 1951, '002');
insert into plane values('D100', 'M_D', 100, to_date('07/11/2010', 'MM/DD/YYYY'), 1995, '001');
insert into plane values('D200', 'M_D', 200, to_date('11/20/2012', 'MM/DD/YYYY'), 1951, '002');
insert into plane values('D300', 'M_D', 300, to_date('10/20/2013', 'MM/DD/YYYY'), 1991, '002');
insert into plane values('D400', 'M_D', 400, to_date('02/14/2015', 'MM/DD/YYYY'), 1984, '004');


/* 100 FLIGHTS
Flight(flight_number, airline_id, plane_type, departure_city, arrival_city, departure_time, arrival_time, weekly_schedule)
	flight_number varchar(3) = generated sequentially starting at 001
	airline_id, varchar(5) -> plane.ownerid = matches planes
	plane_type char(4) -> plane.planetype = generated randomly from planes
	departure_city varchar(3) -> 3 letter airport code = generated randomly from the top 20 busiest US airports
	arrival_city varchar(3) -> 3 letter airport code = generated randomly from the top 20 busiest US airports (with different arrival from departure)
	departure_time varchar(4) -> 0000 to 2359 = generated randomly (000 to 235), append 0
	arrival_time varchar(4) -> 0000 to 2359 = generated randomly (000 to 235), append 0
	weekly_schedule varchar(7) = generated randomly with 25% chance of each day being a - */

insert into flight values('000', '003', 'A250', 'LAX', 'LAS', '0590', '2220', '--TWTFS');
insert into flight values('001', '007', 'A300', 'PHX', 'SEA', '1800', '1670', '--TW--S');
insert into flight values('002', '003', 'A350', 'MCO', 'ATL', '1010', '0320', 'SM-WTFS');
insert into flight values('003', '009', 'C090', 'CLT', 'MCO', '0900', '1740', 'SMT-TFS');
insert into flight values('004', '009', 'A150', 'DFW', 'MIA', '2250', '0420', '-MTW--S');
insert into flight values('005', '008', 'B233', 'JFK', 'LAX', '2260', '1450', 'SMTWTFS');
insert into flight values('006', '003', 'A250', 'LAS', 'MSP', '0650', '0110', 'S--WTFS');
insert into flight values('007', '006', 'C100', 'MSP', 'PHX', '0580', '1020', '-MTWTF-');
insert into flight values('008', '004', 'D400', 'SFO', 'LAS', '1180', '0530', 'SMTW-FS');
insert into flight values('009', '009', 'A200', 'IAH', 'LAS', '0850', '1350', 'SMTWTFS');
insert into flight values('010', '005', 'A290', 'BOS', 'DFW', '1210', '1980', '-MTWTFS');
insert into flight values('011', '001', 'B130', 'DTW', 'BOS', '2020', '1020', '-MTW-FS');
insert into flight values('012', '007', 'C070', 'MIA', 'SEA', '0940', '0070', 'SMT-TFS');
insert into flight values('013', '006', 'C020', 'PHL', 'DFW', '0560', '2250', 'SMTWT-S');
insert into flight values('014', '004', 'B222', 'SEA', 'MCO', '0500', '0480', 'SMTW--S');
insert into flight values('015', '007', 'C050', 'ATL', 'LAX', '0170', '1200', 'SMTWTF-');
insert into flight values('016', '005', 'A230', 'LGA', 'CLT', '2350', '0580', 'SMTW--S');
insert into flight values('017', '010', 'A100', 'EWR', 'IAH', '2320', '0140', 'S-T--FS');
insert into flight values('018', '003', 'B211', 'DEN', 'MSP', '1800', '1670', 'SMTWT-S');
insert into flight values('019', '001', 'D100', 'ORD', 'DTW', '1210', '0770', 'S-TWTFS');
insert into flight values('020', '001', 'B140', 'MCO', 'MIA', '1450', '0590', 'SMTW-FS');
insert into flight values('021', '002', 'B050', 'BOS', 'EWR', '0920', '0120', 'S-TW-FS');
insert into flight values('022', '004', 'A220', 'ATL', 'SEA', '1490', '0510', 'SMT--FS');
insert into flight values('023', '009', 'B150', 'SEA', 'IAH', '0970', '1450', 'S--WTFS');
insert into flight values('024', '007', 'B100', 'IAH', 'MIA', '0540', '2200', '-MTWTFS');
insert into flight values('025', '008', 'B120', 'CLT', 'PHX', '1910', '0660', 'SMT-T-S');
insert into flight values('026', '002', 'C133', 'LAS', 'DEN', '1900', '0150', 'SMTWTF-');
insert into flight values('027', '002', 'A280', 'PHX', 'MCO', '0830', '1710', 'SMTWT--');
insert into flight values('028', '002', 'D300', 'LGA', 'PHL', '0060', '1900', 'S-TWTFS');
insert into flight values('029', '004', 'B170', 'MIA', 'SFO', '0630', '1590', 'SMTWTF-');
insert into flight values('030', '007', 'C050', 'JFK', 'BOS', '1900', '1980', 'SMTWTF-');
insert into flight values('031', '006', 'C100', 'DTW', 'LGA', '1530', '1680', 'S-TWT-S');
insert into flight values('032', '006', 'C020', 'MSP', 'DEN', '0630', '2350', 'SMTWTFS');
insert into flight values('033', '007', 'A300', 'DFW', 'PHL', '1500', '1500', 'SMTW-FS');
insert into flight values('034', '004', 'B170', 'EWR', 'ATL', '0110', '0370', '--TWT--');
insert into flight values('035', '009', 'A150', 'SFO', 'EWR', '0840', '0230', 'SMT-T--');
insert into flight values('036', '002', 'D200', 'LAX', 'SFO', '2340', '1380', '-MTWTFS');
insert into flight values('037', '009', 'B150', 'PHL', 'MSP', '0850', '1000', 'SMT-TFS');
insert into flight values('038', '010', 'A100', 'ORD', 'CLT', '1780', '0370', 'SMT-TFS');
insert into flight values('039', '004', 'D400', 'DEN', 'PHL', '0070', '1510', 'S-T-TFS');
insert into flight values('040', '005', 'A230', 'SFO', 'JFK', '1460', '0330', 'S-TWT-S');
insert into flight values('041', '002', 'B050', 'EWR', 'CLT', '0910', '0000', '-MT--FS');
insert into flight values('042', '001', 'B130', 'IAH', 'DTW', '1600', '0430', 'SM--T-S');
insert into flight values('043', '004', 'B222', 'JFK', 'DTW', '1300', '0730', 'SMTWTF-');
insert into flight values('044', '001', 'B140', 'ATL', 'PHL', '1940', '0680', '-MT-TFS');
insert into flight values('045', '001', 'D100', 'ORD', 'MSP', '0140', '1540', 'SMT-TFS');
insert into flight values('046', '008', 'B233', 'SEA', 'DTW', '2280', '0760', 'SM-WTFS');
insert into flight values('047', '003', 'A350', 'MSP', 'ATL', '0410', '0690', 'S-TW-FS');
insert into flight values('048', '002', 'A280', 'PHL', 'LGA', '0410', '2020', 'S-TW-FS');
insert into flight values('049', '009', 'C090', 'DTW', 'JFK', '1660', '0740', '-MT--FS');
insert into flight values('050', '005', 'A290', 'DEN', 'ATL', '0970', '2170', 'SM-WTFS');
insert into flight values('051', '007', 'C070', 'BOS', 'IAH', '0230', '0880', '--TWT-S');
insert into flight values('052', '009', 'A200', 'LAX', 'SEA', '2170', '1100', 'S--W--S');
insert into flight values('053', '002', 'C133', 'LAS', 'SFO', '0810', '1240', 'SM--T-S');
insert into flight values('054', '004', 'A220', 'LGA', 'SFO', '2030', '1770', 'SMTWTF-');
insert into flight values('055', '002', 'D300', 'MIA', 'JFK', '1060', '0980', 'SMT--F-');
insert into flight values('056', '003', 'A250', 'CLT', 'EWR', '0680', '1030', '----TF-');
insert into flight values('057', '003', 'B211', 'DFW', 'LAX', '2040', '0820', 'SM-WTF-');
insert into flight values('058', '008', 'B120', 'PHX', 'SFO', '1860', '0180', 'SMTW-FS');
insert into flight values('059', '007', 'B100', 'MCO', 'EWR', '1110', '2120', 'SMTW--S');
insert into flight values('060', '001', 'D100', 'EWR', 'DFW', '0110', '0460', 'SMT---S');
insert into flight values('061', '007', 'A300', 'LGA', 'SEA', '1470', '1200', 'SMT-TFS');
insert into flight values('062', '001', 'B130', 'ATL', 'DFW', '1270', '0540', '-MTWT-S');
insert into flight values('063', '005', 'A290', 'DEN', 'LGA', '0620', '0670', 'SMTWTFS');
insert into flight values('064', '004', 'B170', 'CLT', 'ORD', '0730', '2240', 'SMTWTFS');
insert into flight values('065', '004', 'B222', 'MCO', 'BOS', '0890', '2160', 'S-TWTFS');
insert into flight values('066', '009', 'A150', 'LAS', 'LGA', '1970', '2230', '-M---FS');
insert into flight values('067', '007', 'B100', 'MSP', 'DFW', '2170', '2340', 'SMTWT-S');
insert into flight values('068', '006', 'C020', 'LAX', 'MIA', '2280', '1320', 'SMT--FS');
insert into flight values('069', '002', 'A280', 'DTW', 'LAS', '1250', '2350', 'S-T-TFS');
insert into flight values('070', '008', 'B120', 'SEA', 'BOS', '2010', '1970', 'SMTWT--');
insert into flight values('071', '007', 'C050', 'PHX', 'LAX', '2130', '2230', 'SM-WTFS');
insert into flight values('072', '008', 'B233', 'DFW', 'IAH', '0850', '1600', '-M-WTFS');
insert into flight values('073', '003', 'A350', 'BOS', 'EQR', '0120', '2060', '-MTWTFS');
insert into flight values('074', '003', 'B211', 'MIA', 'DTW', '1850', '1870', 'S-TWTF-');
insert into flight values('075', '002', 'D200', 'JFK', 'DEN', '0360', '1060', '-M--TFS');
insert into flight values('076', '002', 'C133', 'IAH', 'JFK', '1860', '1780', 'SMTWTFS');
insert into flight values('077', '009', 'B150', 'ORD', 'JFK', '1600', '0480', '-MTWTF-');
insert into flight values('078', '009', 'C090', 'PHL', 'LAX', '1990', '0140', 'SM-WTFS');
insert into flight values('079', '005', 'A230', 'SFO', 'LGA', '1660', '0690', '--TWT-S');
insert into flight values('080', '010', 'A100', 'CLT', 'ATL', '1910', '0100', '-MT-TF-');
insert into flight values('081', '007', 'C070', 'JFK', 'LAS', '1820', '0300', 'SMTWT-S');
insert into flight values('082', '004', 'D400', 'LAX', 'DEN', '1010', '0130', '-MTWTF-');
insert into flight values('083', '002', 'B050', 'SEA', 'PHX', '2160', '2160', 'SMTWTFS');
insert into flight values('084', '003', 'A250', 'MSP', 'ORD', '0970', '1820', 'S-TWTFS');
insert into flight values('085', '006', 'C100', 'IAH', 'MCO', '1180', '2080', '-M---FS');
insert into flight values('086', '004', 'A220', 'LGA', 'MIA', '2070', '2190', 'SMTWT-S');
insert into flight values('087', '001', 'B140', 'LAS', 'ORD', '1120', '0040', 'SMTW-F-');
insert into flight values('088', '009', 'A200', 'BOS', 'CLT', '1490', '1220', 'S---T-S');
insert into flight values('089', '002', 'D300', 'MCO', 'ORD', '1810', '0890', '--TWTFS');
insert into flight values('090', '003', 'A250', 'MIA', 'PHX', '2320', '2150', 'SMTW-F-');
insert into flight values('091', '003', 'A350', 'PHL', 'BOS', '0250', '0060', 'SMTW-FS');
insert into flight values('092', '005', 'A230', 'EWR', 'MCO', '1510', '0460', 'SM---FS');
insert into flight values('093', '002', 'B050', 'PHX', 'CLT', '1090', '1640', 'S-T-TFS');
insert into flight values('094', '001', 'B140', 'DTW', 'IAH', '1830', '0520', 'SMTWTFS');
insert into flight values('095', '004', 'D400', 'ORD', 'PHL', '2070', '0590', '--TWTFS');
insert into flight values('096', '007', 'C070', 'DFW', 'MSP', '2340', '1130', 'SMTWT-S');
insert into flight values('097', '009', 'A150', 'SFO', 'DEN', '0980', '2060', '---WTFS');
insert into flight values('098', '004', 'B222', 'ATL', 'PHX', '0680', '0730', 'SMTWTFS');
insert into flight values('099', '007', 'B100', 'DEN', 'ORD', '1980', '2280', '-MT--FS');


/* 100 PRICES
Price(departure_city, arrival_city, airline_id, high_price, low_price)
	departure_city varchar(3) = copied from flights
	arrival_city varchar(3) = copied from flights
	airline_id -> Airline.airline id = copied from flights
	high_price_int = generated randomly (200 to 300)
	low_price_int = generated randomly (100 to 199) */

insert into price values('LAX', 'LAS', '009', 243, 178);
insert into price values('PHX', 'SEA', '006', 233, 189);
insert into price values('MCO', 'ATL', '007', 293, 182);
insert into price values('CLT', 'MCO', '009', 227, 122);
insert into price values('DFW', 'MIA', '001', 280, 166);
insert into price values('JFK', 'LAX', '001', 225, 101);
insert into price values('LAS', 'MSP', '004', 226, 116);
insert into price values('MSP', 'PHX', '006', 279, 104);
insert into price values('SFO', 'LAS', '009', 256, 108);
insert into price values('IAH', 'LAS', '005', 212, 160);
insert into price values('BOS', 'DFW', '005', 298, 126);
insert into price values('DTW', 'BOS', '007', 234, 107);
insert into price values('MIA', 'SEA', '009', 279, 141);
insert into price values('PHL', 'DFW', '001', 251, 197);
insert into price values('SEA', 'MCO', '006', 222, 199);
insert into price values('ATL', 'LAX', '003', 236, 170);
insert into price values('LGA', 'CLT', '009', 267, 151);
insert into price values('EWR', 'IAH', '007', 269, 131);
insert into price values('DEN', 'MSP', '003', 258, 163);
insert into price values('ORD', 'DTW', '003', 223, 188);
insert into price values('MCO', 'MIA', '008', 299, 160);
insert into price values('BOS', 'EWR', '002', 218, 195);
insert into price values('ATL', 'SEA', '007', 248, 103);
insert into price values('SEA', 'IAH', '008', 215, 172);
insert into price values('IAH', 'MIA', '010', 222, 197);
insert into price values('CLT', 'PHX', '005', 202, 133);
insert into price values('LAS', 'DEN', '003', 209, 187);
insert into price values('PHX', 'MCO', '003', 237, 140);
insert into price values('LGA', 'PHL', '009', 251, 139);
insert into price values('MIA', 'SFO', '002', 243, 194);
insert into price values('JFK', 'BOS', '008', 250, 172);
insert into price values('DTW', 'LGA', '005', 242, 197);
insert into price values('MSP', 'DEN', '008', 288, 181);
insert into price values('DFW', 'PHL', '010', 283, 185);
insert into price values('EWR', 'ATL', '007', 202, 102);
insert into price values('SFO', 'EWR', '006', 225, 113);
insert into price values('LAX', 'SFO', '006', 259, 131);
insert into price values('PHL', 'MSP', '002', 227, 128);
insert into price values('ORD', 'CLT', '010', 295, 144);
insert into price values('DEN', 'PHL', '009', 281, 131);
insert into price values('SFO', 'JFK', '010', 209, 198);
insert into price values('EWR', 'CLT', '007', 237, 145);
insert into price values('IAH', 'DTW', '004', 284, 144);
insert into price values('JFK', 'DTW', '009', 219, 130);
insert into price values('ATL', 'PHL', '008', 285, 191);
insert into price values('ORD', 'MSP', '003', 275, 112);
insert into price values('SEA', 'DTW', '006', 226, 107);
insert into price values('MSP', 'ATL', '002', 277, 185);
insert into price values('PHL', 'LGA', '008', 277, 178);
insert into price values('DTW', 'JFK', '004', 203, 139);
insert into price values('DEN', 'ATL', '010', 254, 100);
insert into price values('BOS', 'IAH', '010', 266, 133);
insert into price values('LAX', 'SEA', '008', 243, 174);
insert into price values('LAS', 'SFO', '005', 273, 161);
insert into price values('LGA', 'SFO', '005', 236, 119);
insert into price values('MIA', 'JFK', '004', 274, 107);
insert into price values('CLT', 'EWR', '010', 216, 162);
insert into price values('DFW', 'LAX', '003', 221, 109);
insert into price values('PHX', 'SFO', '008', 246, 144);
insert into price values('MCO', 'EWR', '001', 213, 160);
insert into price values('EWR', 'DFW', '010', 203, 171);
insert into price values('LGA', 'SEA', '003', 288, 146);
insert into price values('ATL', 'DFW', '009', 294, 123);
insert into price values('DEN', 'LGA', '010', 209, 170);
insert into price values('CLT', 'ORD', '001', 218, 156);
insert into price values('MCO', 'BOS', '002', 212, 157);
insert into price values('LAS', 'LGA', '008', 240, 121);
insert into price values('MSP', 'DFW', '007', 202, 167);
insert into price values('LAX', 'MIA', '008', 222, 117);
insert into price values('DTW', 'LAS', '009', 242, 198);
insert into price values('SEA', 'BOS', '007', 286, 170);
insert into price values('PHX', 'LAX', '004', 250, 166);
insert into price values('DFW', 'IAH', '005', 224, 153);
insert into price values('BOS', 'EQR', '006', 235, 128);
insert into price values('MIA', 'DTW', '004', 251, 157);
insert into price values('JFK', 'DEN', '007', 300, 191);
insert into price values('IAH', 'JFK', '004', 254, 165);
insert into price values('ORD', 'JFK', '007', 249, 161);
insert into price values('PHL', 'LAX', '008', 275, 176);
insert into price values('SFO', 'LGA', '002', 280, 106);
insert into price values('CLT', 'ATL', '003', 287, 134);
insert into price values('JFK', 'LAS', '008', 258, 184);
insert into price values('LAX', 'DEN', '009', 280, 147);
insert into price values('SEA', 'PHX', '006', 248, 149);
insert into price values('MSP', 'ORD', '007', 284, 125);
insert into price values('IAH', 'MCO', '003', 243, 131);
insert into price values('LGA', 'MIA', '003', 252, 119);
insert into price values('LAS', 'ORD', '003', 201, 165);
insert into price values('BOS', 'CLT', '005', 252, 136);
insert into price values('MCO', 'ORD', '006', 241, 185);
insert into price values('MIA', 'PHX', '010', 209, 195);
insert into price values('PHL', 'BOS', '008', 212, 120);
insert into price values('EWR', 'MCO', '009', 230, 191);
insert into price values('PHX', 'CLT', '008', 223, 111);
insert into price values('DTW', 'IAH', '005', 295, 116);
insert into price values('ORD', 'PHL', '004', 279, 183);
insert into price values('DFW', 'MSP', '005', 241, 157);
insert into price values('SFO', 'DEN', '001', 225, 155);
insert into price values('ATL', 'PHX', '007', 290, 184);
insert into price values('DEN', 'ORD', '010', 292, 175);


/* 200 USERS
Customer(cid, salutation, first_name, last_name, credit_card_num, street, credit_card_expire, city, state, phone, email, frequent_miles)
	cid varchar(9) = generated randomly as unique values of length=9
	salutation varchar(3) -> Mr, Mrs, Ms = females generated randomly between Mrs and Ms, males set to Mr
	first_name varchar(30) = generated randomly, 100 males and 100 females
	last_name varchar(30) = generated randomly
	credit_card_num varchar(16) = generated randomly as unique values of length=16
	credit_card_expire date = generated randomly (01/2016 to 12/2020)
	street varchar(30) = generated as street + first 2 digits of cid
	city varchar(30) = generated randomly from the top 50 US cities by population
	state varchar(2) = matches state of city
	phone varchar(10) = generated randomly of length=7, prefix by 555
	email varchar(30) = generated as first 2 letters of first name + first 2 letters of last name + last 2 digits of cid + @email.com
	frequent_miles varchar(5) -> null or airline id = generated randomly from airlines (001 to 010) with 50% chance of null */

insert into customer values('572723715',  'Mr', 'Theron',     'Broadwa',     '4297678776294822', to_date('07/2016', 'MM/YYYY'), 'Street57', 'Omaha',            'NE', '5555816834', 'ThBr15@email.com', 'null');
insert into customer values('047686725',  'Mr', 'Trinidad',   'Fasano',      '5404510461415169', to_date('05/2018', 'MM/YYYY'), 'Street04', 'Atlanta',          'GA', '5553673646', 'TrFa25@email.com', 'null');
insert into customer values('117069523',  'Mr', 'Ezequiel',   'Coco',        '7903044332117935', to_date('05/2020', 'MM/YYYY'), 'Street11', 'Baltimore',        'MD', '5556700617', 'EzCo23@email.com', '008' );
insert into customer values('496499705',  'Mr', 'Shirley',    'Topper',      '7203376066184929', to_date('10/2018', 'MM/YYYY'), 'Street49', 'Washington',       'DC', '5554689426', 'ShTo05@email.com', '005' );
insert into customer values('744202758',  'Mr', 'Edison',     'Shireman',    '6544878526228429', to_date('10/2016', 'MM/YYYY'), 'Street74', 'Mesa',             'AZ', '5559944096', 'EdSh58@email.com', 'null');
insert into customer values('806864707',  'Mr', 'Seth',       'Hardie',      '9511289760767009', to_date('07/2016', 'MM/YYYY'), 'Street80', 'Arlington',        'TX', '5557857418', 'SeHa07@email.com', 'null');
insert into customer values('563329299',  'Mr', 'Chris',      'Fisler',      '9053898698770807', to_date('01/2020', 'MM/YYYY'), 'Street56', 'San Jose',         'CA', '5553709560', 'ChFi99@email.com', '002' );
insert into customer values('702121112',  'Mr', 'Gregorio',   'Philippe',    '7800207770280064', to_date('03/2020', 'MM/YYYY'), 'Street70', 'Jacksonville',     'FL', '5559588226', 'GrPh12@email.com', 'null');
insert into customer values('607981624',  'Mr', 'Darron',     'Trejo',       '7008813286111441', to_date('10/2018', 'MM/YYYY'), 'Street60', 'Charlotte',        'NC', '5551425563', 'DaTr24@email.com', 'null');
insert into customer values('421396222',  'Mr', 'Dexter',     'Ferro',       '4167330172642269', to_date('09/2018', 'MM/YYYY'), 'Street42', 'Indianapolis',     'IN', '5551472444', 'DeFe22@email.com', 'null');
insert into customer values('435756181',  'Mr', 'Rayford',    'Crouch',      '4938229136232376', to_date('03/2018', 'MM/YYYY'), 'Street43', 'Colorado Springs', 'CO', '5556369603', 'RaCr81@email.com', '005' );
insert into customer values('695052883',  'Mr', 'Derrick',    'Lydick',      '3635845493608133', to_date('05/2019', 'MM/YYYY'), 'Street69', 'Virginia Beach',   'VA', '5554799311', 'DeLy83@email.com', 'null');
insert into customer values('609224582',  'Mr', 'Randolph',   'Queen',       '5362764729419569', to_date('10/2016', 'MM/YYYY'), 'Street60', 'Austin',           'TX', '5555773077', 'RaQu82@email.com', 'null');
insert into customer values('959779967',  'Mr', 'Cristopher', 'Radosevich',  '4976672648895937', to_date('09/2020', 'MM/YYYY'), 'Street95', 'Oakland',          'CA', '5556302455', 'CrRa67@email.com', '009' );
insert into customer values('975437112',  'Mr', 'Floyd',      'Magwood',     '9549711671896132', to_date('12/2020', 'MM/YYYY'), 'Street97', 'Portland',         'OR', '5555506946', 'FlMa12@email.com', 'null');
insert into customer values('827643735',  'Mr', 'Seymour',    'Mattox',      '8957002782632114', to_date('10/2016', 'MM/YYYY'), 'Street82', 'Nashville',        'TN', '5558286490', 'SeMa35@email.com', 'null');
insert into customer values('005218189',  'Mr', 'Wilford',    'Fails',       '2671280836766098', to_date('03/2019', 'MM/YYYY'), 'Street00', 'Dallas',           'TX', '5556001862', 'WiFa89@email.com', 'null');
insert into customer values('599806989',  'Mr', 'Enoch',      'Wittenberg',  '7959376524393901', to_date('05/2019', 'MM/YYYY'), 'Street59', 'Miami',            'FL', '5558179816', 'EnWi89@email.com', 'null');
insert into customer values('803972516',  'Mr', 'Harris',     'Bame',        '9410849182449467', to_date('07/2019', 'MM/YYYY'), 'Street80', 'Houston',          'TX', '5552153245', 'HaBa16@email.com', 'null');
insert into customer values('485353537',  'Mr', 'Max',        'Lobaugh',     '1666183329601255', to_date('07/2016', 'MM/YYYY'), 'Street48', 'Seattle',          'WA', '5559772669', 'MaLo37@email.com', '008' );
insert into customer values('510956524',  'Mr', 'Mauro',      'Tewksbury',   '6057497854488507', to_date('03/2019', 'MM/YYYY'), 'Street51', 'San Francisco',    'CA', '5559394572', 'MaTe24@email.com', '003' );
insert into customer values('122855678',  'Mr', 'Robin',      'Bonn',        '6116998799698062', to_date('05/2019', 'MM/YYYY'), 'Street12', 'Boston',           'MA', '5557751291', 'RoBo78@email.com', '002' );
insert into customer values('492151602',  'Mr', 'Kory',       'Hobart',      '1257503582752954', to_date('10/2019', 'MM/YYYY'), 'Street49', 'Los Angeles',      'CA', '5555208169', 'KoHo02@email.com', 'null');
insert into customer values('333820028',  'Mr', 'Edgar',      'Dolan',       '9277378734998449', to_date('06/2017', 'MM/YYYY'), 'Street33', 'Sacramento',       'CA', '5552742033', 'EdDo28@email.com', '001' );
insert into customer values('315389743',  'Mr', 'Jamaal',     'Mersch',      '8246518713467860', to_date('01/2016', 'MM/YYYY'), 'Street31', 'Las Vegas',        'NV', '5551460351', 'JaMe43@email.com', 'null');
insert into customer values('652552938',  'Mr', 'Alec',       'Rattler',     '6907472375769657', to_date('11/2016', 'MM/YYYY'), 'Street65', 'Chicago',          'IL', '5557507402', 'AlRa38@email.com', '009' );
insert into customer values('141994383',  'Mr', 'Chong',      'Volker',      '9785217322057043', to_date('02/2017', 'MM/YYYY'), 'Street14', 'Kansas City',      'MO', '5559371826', 'ChVo83@email.com', '005' );
insert into customer values('677214712',  'Mr', 'Jonas',      'Giraldo',     '7086500829214752', to_date('06/2018', 'MM/YYYY'), 'Street67', 'Long Beach',       'CA', '5554227328', 'JoGi12@email.com', 'null');
insert into customer values('948596499',  'Mr', 'Markus',     'Cole',        '7435534710574565', to_date('02/2016', 'MM/YYYY'), 'Street94', 'Detroit',          'MI', '5559039088', 'MaCo99@email.com', '002' );
insert into customer values('410709438',  'Mr', 'Scottie',    'Fisch',       '1891714215954422', to_date('11/2017', 'MM/YYYY'), 'Street41', 'Minneapolis',      'MN', '5555506695', 'ScFi38@email.com', 'null');
insert into customer values('910900016',  'Mr', 'Reinaldo',   'Linthicum',   '9372115691960778', to_date('07/2020', 'MM/YYYY'), 'Street91', 'Philadelphia',     'PA', '5557555627', 'ReLi16@email.com', 'null');
insert into customer values('750670965',  'Mr', 'Bryant',     'Hougen',      '3740232255497666', to_date('08/2019', 'MM/YYYY'), 'Street75', 'Phoenix',          'AZ', '5557992033', 'BrHo65@email.com', '005' );
insert into customer values('859462681',  'Mr', 'Andreas',    'Nathanson',   '4858982142004045', to_date('02/2019', 'MM/YYYY'), 'Street85', 'Memphis',          'TN', '5558543206', 'AnNa81@email.com', 'null');
insert into customer values('057684994',  'Mr', 'Thomas',     'Morse',       '5536480731060912', to_date('05/2018', 'MM/YYYY'), 'Street05', 'Louisville',       'KY', '5553100248', 'ThMo94@email.com', '006' );
insert into customer values('430172894',  'Mr', 'Everett',    'Dixion',      '1648989326298575', to_date('01/2017', 'MM/YYYY'), 'Street43', 'New Orleans',      'LA', '5558148008', 'EvDi94@email.com', 'null');
insert into customer values('104805364',  'Mr', 'Antone',     'Ontiveros',   '1112934056273073', to_date('03/2017', 'MM/YYYY'), 'Street10', 'San Diego',        'CA', '5555817760', 'AnOn64@email.com', '008' );
insert into customer values('019619898',  'Mr', 'Freeman',    'Weitzel',     '2183005969403234', to_date('05/2019', 'MM/YYYY'), 'Street01', 'New York',         'NY', '5553085782', 'FrWe98@email.com', '005' );
insert into customer values('944199143',  'Mr', 'Edmundo',    'Lagos',       '8051511764477303', to_date('10/2017', 'MM/YYYY'), 'Street94', 'Denver',           'CO', '5555498469', 'EdLa43@email.com', '003' );
insert into customer values('823383916',  'Mr', 'Garth',      'Rapier',      '5463301179603301', to_date('04/2017', 'MM/YYYY'), 'Street82', 'Tulsa',            'OK', '5552345872', 'GaRa16@email.com', 'null');
insert into customer values('559139624',  'Mr', 'Logan',      'Hottle',      '5474432624517607', to_date('05/2018', 'MM/YYYY'), 'Street55', 'Oklahoma City',    'OK', '5553993728', 'LoHo24@email.com', 'null');
insert into customer values('655209852',  'Mr', 'Moises',     'Sikes',       '1806996998822748', to_date('01/2018', 'MM/YYYY'), 'Street65', 'Fort Worth',       'TX', '5557323695', 'MoSi52@email.com', 'null');
insert into customer values('245413592',  'Mr', 'Tory',       'Sammet',      '5914978986241013', to_date('06/2020', 'MM/YYYY'), 'Street24', 'Raleigh',          'NC', '5557284037', 'ToSa92@email.com', '002' );
insert into customer values('835666211',  'Mr', 'Vince',      'Stancill',    '7950542230006090', to_date('09/2018', 'MM/YYYY'), 'Street83', 'Milwaukee',        'WI', '5556369017', 'ViSt11@email.com', '004' );
insert into customer values('655989783',  'Mr', 'Alberto',    'Sinquefield', '9826297317611262', to_date('09/2018', 'MM/YYYY'), 'Street65', 'Fresno',           'CA', '5554374121', 'AlSi83@email.com', 'null');
insert into customer values('346439992',  'Mr', 'Franklyn',   'Tatem',       '9757237542937578', to_date('11/2020', 'MM/YYYY'), 'Street34', 'Albuquerque',      'NM', '5551635331', 'FrTa92@email.com', 'null');
insert into customer values('462231604',  'Mr', 'Edgardo',    'Treadwell',   '9689970682258009', to_date('07/2019', 'MM/YYYY'), 'Street46', 'El Paso',          'TX', '5552570100', 'EdTr04@email.com', 'null');
insert into customer values('528684751',  'Mr', 'Milford',    'Kinkead',     '5841137818503085', to_date('09/2019', 'MM/YYYY'), 'Street52', 'Tucson',           'AZ', '5556128748', 'MiKi51@email.com', '010' );
insert into customer values('473579802',  'Mr', 'Martin',     'Pinner',      '5622521417527406', to_date('04/2018', 'MM/YYYY'), 'Street47', 'Columbus',         'OH', '5553636778', 'MaPi02@email.com', 'null');
insert into customer values('841807618',  'Mr', 'Rocky',      'Heide',       '9688197662069657', to_date('06/2020', 'MM/YYYY'), 'Street84', 'Wichita',          'KS', '5554352528', 'RoHe18@email.com', 'null');
insert into customer values('842399847', 'Mrs', 'Lizbeth',    'Wendler',     '7131720974652720', to_date('03/2017', 'MM/YYYY'), 'Street84', 'San Antonio',      'TX', '5557924268', 'LiWe47@email.com', '004' );
insert into customer values('937413879',  'Ms', 'Diamond',    'Runkle',      '4502332468872346', to_date('03/2017', 'MM/YYYY'), 'Street93', 'Boston',           'MA', '5551457982', 'DiRu79@email.com', '003' );
insert into customer values('010463426', 'Mrs', 'Marilou',    'Halpin',      '2813288396818727', to_date('09/2017', 'MM/YYYY'), 'Street01', 'Fresno',           'CA', '5554602250', 'MaHa26@email.com', 'null');
insert into customer values('878581803', 'Mrs', 'Tiesha',     'Speece',      '3178071959529148', to_date('08/2020', 'MM/YYYY'), 'Street87', 'Tucson',           'AZ', '5556761902', 'TiSp03@email.com', '010' );
insert into customer values('821346916', 'Mrs', 'Sherita',    'Allgeier',    '5694015983779931', to_date('03/2019', 'MM/YYYY'), 'Street82', 'New Orleans',      'LA', '5557496672', 'ShAl16@email.com', 'null');
insert into customer values('495146877',  'Ms', 'Manie',      'Hasan',       '3854330056391653', to_date('04/2020', 'MM/YYYY'), 'Street49', 'Albuquerque',      'NM', '5554921888', 'MaHa77@email.com', 'null');
insert into customer values('513958766',  'Ms', 'Luci',       'Moton',       '9305418453068164', to_date('07/2016', 'MM/YYYY'), 'Street51', 'Minneapolis',      'MN', '5558248894', 'LuMo66@email.com', 'null');
insert into customer values('247591186', 'Mrs', 'Isidra',     'Carberry',    '6343594773653241', to_date('12/2017', 'MM/YYYY'), 'Street24', 'San Francisco',    'CA', '5555125954', 'IsCa86@email.com', '010' );
insert into customer values('044815309', 'Mrs', 'Belle',      'Pizer',       '4752445326795266', to_date('04/2016', 'MM/YYYY'), 'Street04', 'San Diego',        'CA', '5556415388', 'BePi09@email.com', '002' );
insert into customer values('743260368', 'Mrs', 'Shanice',    'Scheidt',     '4603663089297520', to_date('12/2017', 'MM/YYYY'), 'Street74', 'Los Angeles',      'CA', '5559601544', 'ShSc68@email.com', 'null');
insert into customer values('275550901',  'Ms', 'Daysi',      'Ohm',         '1378562143332086', to_date('09/2016', 'MM/YYYY'), 'Street27', 'Austin',           'TX', '5551919240', 'DaOh01@email.com', '007' );
insert into customer values('164291643', 'Mrs', 'Vanesa',     'Letcher',     '1650640854365357', to_date('12/2016', 'MM/YYYY'), 'Street16', 'Colorado Springs', 'CO', '5555594121', 'VaLe43@email.com', '004' );
insert into customer values('603344158',  'Ms', 'Delois',     'Boykins',     '5909425282632267', to_date('01/2019', 'MM/YYYY'), 'Street60', 'Arlington',        'TX', '5558827706', 'DeBo58@email.com', 'null');
insert into customer values('065138982',  'Ms', 'Marnie',     'Saechao',     '5297533356046253', to_date('03/2020', 'MM/YYYY'), 'Street06', 'Kansas City',      'MO', '5552528960', 'MaSa82@email.com', 'null');
insert into customer values('227583552',  'Ms', 'Joyce',      'Finlayson',   '7541844283864425', to_date('12/2019', 'MM/YYYY'), 'Street22', 'San Antonio',      'TX', '5558260754', 'JoFi52@email.com', 'null');
insert into customer values('493230818',  'Ms', 'Veronica',   'Gilreath',    '9891574976034119', to_date('01/2019', 'MM/YYYY'), 'Street49', 'Washington',       'DC', '5552885591', 'VeGi18@email.com', 'null');
insert into customer values('512300405', 'Mrs', 'Devora',     'Hynek',       '1948874127498468', to_date('09/2017', 'MM/YYYY'), 'Street51', 'Chicago',          'IL', '5557766409', 'DeHy05@email.com', '001' );
insert into customer values('031325149', 'Mrs', 'Marcella',   'Kula',        '1970732981296904', to_date('04/2017', 'MM/YYYY'), 'Street03', 'Virginia Beach',   'VA', '5553198005', 'MaKu49@email.com', '005' );
insert into customer values('874304029',  'Ms', 'Jacqueline', 'Jetter',      '5866327620706496', to_date('01/2017', 'MM/YYYY'), 'Street87', 'Tulsa',            'OK', '5557276239', 'JaJe29@email.com', 'null');
insert into customer values('064626778',  'Ms', 'Celinda',    'Merriman',    '1075225832998379', to_date('01/2019', 'MM/YYYY'), 'Street06', 'Seattle',          'WA', '5555701314', 'CeMe78@email.com', '005' );
insert into customer values('060010524', 'Mrs', 'Genoveva',   'Teets',       '8487479088262113', to_date('10/2017', 'MM/YYYY'), 'Street06', 'Oakland',          'CA', '5555569272', 'GeTe24@email.com', 'null');
insert into customer values('772550346',  'Ms', 'Karina',     'Mannix',      '4787411435096659', to_date('06/2019', 'MM/YYYY'), 'Street77', 'Philadelphia',     'PA', '5553328235', 'KaMa46@email.com', '003' );
insert into customer values('980868245',  'Ms', 'Jonelle',    'Orrell',      '2847140034936343', to_date('05/2020', 'MM/YYYY'), 'Street98', 'Miami',            'FL', '5559499919', 'JoOr45@email.com', 'null');
insert into customer values('099883738',  'Ms', 'Zora',       'Donmoyer',    '7542828453632217', to_date('09/2017', 'MM/YYYY'), 'Street09', 'Denver',           'CO', '5552428302', 'ZoDo38@email.com', '004' );
insert into customer values('076279338',  'Ms', 'Shavonda',   'Griffieth',   '5056995166638032', to_date('11/2020', 'MM/YYYY'), 'Street07', 'Mesa',             'AZ', '5559899183', 'ShGr38@email.com', 'null');
insert into customer values('681854013', 'Mrs', 'Larhonda',   'Hund',        '8932547910029121', to_date('10/2019', 'MM/YYYY'), 'Street68', 'Jacksonville',     'FL', '5557777415', 'LaHu13@email.com', '001' );
insert into customer values('734036121',  'Ms', 'Jolene',     'Maharaj',     '3069146691426388', to_date('12/2020', 'MM/YYYY'), 'Street73', 'Fort Worth',       'TX', '5556130857', 'JoMa21@email.com', 'null');
insert into customer values('861952229',  'Ms', 'Melodi',     'Pop',         '9852547260513247', to_date('02/2017', 'MM/YYYY'), 'Street86', 'Charlotte',        'NC', '5556676610', 'MePo29@email.com', '004' );
insert into customer values('064158647',  'Ms', 'Raymonde',   'Marshell',    '7487753978719813', to_date('06/2019', 'MM/YYYY'), 'Street06', 'Memphis',          'TN', '5557468534', 'RaMa47@email.com', '007' );
insert into customer values('514292149',  'Ms', 'Renetta',    'Wilt',        '8910144454459145', to_date('07/2019', 'MM/YYYY'), 'Street51', 'Columbus',         'OH', '5556486735', 'ReWi49@email.com', 'null');
insert into customer values('241137861',  'Ms', 'Regine',     'Wester',      '1821784755440719', to_date('03/2017', 'MM/YYYY'), 'Street24', 'Nashville',        'TN', '5556501950', 'ReWe61@email.com', '009' );
insert into customer values('089759674',  'Ms', 'Martina',    'Bess',        '2594706342048375', to_date('03/2019', 'MM/YYYY'), 'Street08', 'Sacramento',       'CA', '5559850766', 'MaBe74@email.com', 'null');
insert into customer values('811862332',  'Ms', 'Yen',        'Boye',        '6800390184429557', to_date('05/2016', 'MM/YYYY'), 'Street81', 'El Paso',          'TX', '5557563450', 'YeBo32@email.com', '003' );
insert into customer values('938642591',  'Ms', 'Gidget',     'Dolce',       '4465277614689601', to_date('03/2019', 'MM/YYYY'), 'Street93', 'Raleigh',          'NC', '5552694442', 'GiDo91@email.com', '001' );
insert into customer values('495267605', 'Mrs', 'Glenda',     'Desoto',      '9193698212477563', to_date('04/2017', 'MM/YYYY'), 'Street49', 'Wichita',          'KS', '5553838051', 'GlDe05@email.com', '005' );
insert into customer values('541644681', 'Mrs', 'Stephaine',  'Carns',       '3938574621695295', to_date('12/2016', 'MM/YYYY'), 'Street54', 'New York',         'NW', '5559756949', 'StCa81@email.com', 'null');
insert into customer values('027674342',  'Ms', 'Staci',      'Pizzuto',     '8546353822058733', to_date('02/2020', 'MM/YYYY'), 'Street02', 'Detroit',          'MI', '5555262332', 'StPi42@email.com', '003' );
insert into customer values('940008409', 'Mrs', 'Fiona',      'Cobian',      '2803600632692308', to_date('07/2018', 'MM/YYYY'), 'Street94', 'Houston',          'TX', '5556575916', 'FiCo09@email.com', '004' );
insert into customer values('415825484', 'Mrs', 'Lianne',     'Claybrook',   '4893777264286347', to_date('11/2016', 'MM/YYYY'), 'Street41', 'Las Vegas',        'NV', '5551001418', 'LiCl84@email.com', '004' );
insert into customer values('762252848', 'Mrs', 'Keli',       'Sproul',      '8193911125078285', to_date('12/2018', 'MM/YYYY'), 'Street76', 'Omaha',            'NE', '5554578162', 'KeSp48@email.com', '005' );
insert into customer values('771043703',  'Ms', 'Tamra',      'Lasiter',     '4992929343072007', to_date('12/2020', 'MM/YYYY'), 'Street77', 'Baltimore',        'MD', '5557129868', 'TaLa03@email.com', '004' );
insert into customer values('572625127',  'Ms', 'Genia',      'Gorham',      '4182745284798419', to_date('01/2019', 'MM/YYYY'), 'Street57', 'Dallas',           'TX', '5558119667', 'GeGo27@email.com', '003' );
insert into customer values('390298013', 'Mrs', 'Natalya',    'Arnone',      '9261875281238207', to_date('02/2016', 'MM/YYYY'), 'Street39', 'Phoenix',          'AZ', '5558876908', 'NaAr13@email.com', '005' );
insert into customer values('482126047', 'Mrs', 'Lynetta',    'Hamler',      '9709562643272737', to_date('09/2017', 'MM/YYYY'), 'Street48', 'Long Beach',       'CA', '5553568210', 'LyHa47@email.com', 'null');
insert into customer values('577900935',  'Ms', 'Micki',      'Morphis',     '1730895858346096', to_date('12/2018', 'MM/YYYY'), 'Street57', 'Milwaukee',        'WI', '5555153436', 'MiMo35@email.com', 'null');
insert into customer values('375428778',  'Ms', 'Sylvie',     'Frutos',      '9466785272913634', to_date('05/2017', 'MM/YYYY'), 'Street37', 'Oklahoma City',    'OK', '5553531288', 'SyFr78@email.com', 'null');
insert into customer values('853759923',  'Ms', 'Serita',     'Gleason',     '6894961993971968', to_date('01/2017', 'MM/YYYY'), 'Street85', 'Atlanta',          'GA', '5557007907', 'SeGl23@email.com', '005' );
insert into customer values('596958885', 'Mrs', 'Solange',    'Sikora',      '2095425138131365', to_date('08/2018', 'MM/YYYY'), 'Street59', 'Indianapolis',     'IN', '5556690423', 'SoSi85@email.com', 'null');
insert into customer values('406636105', 'Mrs', 'Deborah',    'Burkhard',    '2697047227405430', to_date('12/2019', 'MM/YYYY'), 'Street40', 'San Jose',         'CA', '5554200087', 'DeBu05@email.com', '006' );
insert into customer values('799420182',  'Ms', 'Denisha',    'Tarkington',  '7498128161999310', to_date('07/2016', 'MM/YYYY'), 'Street79', 'Louisville',       'KY', '5555597397', 'DeTa82@email.com', '010' );
insert into customer values('237155722',  'Mr', 'Henry',      'Scicchitano', '9503775411113173', to_date('04/2017', 'MM/YYYY'), 'Street23', 'Portland',         'OR', '5554117054', 'HeSc22@email.com', '007' );
insert into customer values('867250478',  'Mr', 'Thad',       'Fett',        '4358002187071897', to_date('09/2020', 'MM/YYYY'), 'Street86', 'El Paso',          'TX', '5551947190', 'ThFe78@email.com', '006' );
insert into customer values('695231176',  'Mr', 'Howard',     'Rocca',       '8011932649983031', to_date('09/2016', 'MM/YYYY'), 'Street69', 'Boston',           'MA', '5557707082', 'HoRo76@email.com', 'null');
insert into customer values('997054969',  'Mr', 'Deangelo',   'Dewalt',      '4369072454009478', to_date('03/2018', 'MM/YYYY'), 'Street99', 'Dallas',           'TX', '5557253682', 'DeDe69@email.com', 'null');
insert into customer values('027587440',  'Mr', 'Johnie',     'Legros',      '1624839719145791', to_date('03/2018', 'MM/YYYY'), 'Street02', 'Minneapolis',      'MN', '5559821923', 'JoLe40@email.com', '009' );
insert into customer values('647078066',  'Mr', 'Emmitt',     'Cardillo',    '2141126616370239', to_date('02/2019', 'MM/YYYY'), 'Street64', 'San Diego',        'CA', '5555353488', 'EmCa66@email.com', 'null');
insert into customer values('292995632',  'Mr', 'Barney',     'Mealer',      '8345851277455064', to_date('04/2018', 'MM/YYYY'), 'Street29', 'New York',         'NY', '5555931174', 'BaMe32@email.com', '009' );
insert into customer values('211127022',  'Mr', 'Demarcus',   'Cape',        '4142474654768159', to_date('05/2018', 'MM/YYYY'), 'Street21', 'Nashville',        'TN', '5557337981', 'DeCa22@email.com', 'null');
insert into customer values('816246078',  'Mr', 'Jospeh',     'Nock',        '6371836951396811', to_date('07/2018', 'MM/YYYY'), 'Street81', 'Washington',       'DC', '5557396994', 'JoNo78@email.com', '003' );
insert into customer values('962224219',  'Mr', 'Mohammad',   'Eberle',      '7037541068020785', to_date('06/2019', 'MM/YYYY'), 'Street96', 'Chicago',          'IL', '5555865726', 'MoEb19@email.com', '005' );
insert into customer values('561814355',  'Mr', 'Roosevelt',  'Durbin',      '1622471779543982', to_date('09/2018', 'MM/YYYY'), 'Street56', 'Charlotte',        'NC', '5553131545', 'RoDu55@email.com', '001' );
insert into customer values('528836955',  'Mr', 'Bernard',    'Remigio',     '6178065020603266', to_date('09/2018', 'MM/YYYY'), 'Street52', 'Baltimore',        'MD', '5559992269', 'BeRe55@email.com', 'null');
insert into customer values('245826092',  'Mr', 'Sandy',      'Olsen',       '3593672160811790', to_date('04/2020', 'MM/YYYY'), 'Street24', 'Raleigh',          'NC', '5553598841', 'SaOl92@email.com', '007' );
insert into customer values('799679597',  'Mr', 'Darius',     'Anthony',     '1025620644047638', to_date('12/2016', 'MM/YYYY'), 'Street79', 'Jacksonville',     'FL', '5559916951', 'DaAn97@email.com', 'null');
insert into customer values('371129753',  'Mr', 'Blaine',     'Bailer',      '6733435512611104', to_date('12/2019', 'MM/YYYY'), 'Street37', 'Oakland',          'CA', '5557824494', 'BlBa53@email.com', 'null');
insert into customer values('437358274',  'Mr', 'Bud',        'Seamans',     '5247188150778519', to_date('01/2017', 'MM/YYYY'), 'Street43', 'Albuquerque',      'NM', '5555932717', 'BuSe74@email.com', 'null');
insert into customer values('181890051',  'Mr', 'Buster',     'Easterling',  '9670796327909709', to_date('09/2016', 'MM/YYYY'), 'Street18', 'Colorado Springs', 'CO', '5559749370', 'BuEa51@email.com', '008' );
insert into customer values('069895990',  'Mr', 'Roman',      'Nolton',      '2829273792973819', to_date('08/2020', 'MM/YYYY'), 'Street06', 'Tulsa',            'OK', '5554896494', 'RoNo90@email.com', 'null');
insert into customer values('725168037',  'Mr', 'Bradly',     'Jiggetts',    '8832194553153009', to_date('09/2018', 'MM/YYYY'), 'Street72', 'Denver',           'CO', '5556667303', 'BrJi37@email.com', '005' );
insert into customer values('535374855',  'Mr', 'Del',        'Sessions',    '4934620052685782', to_date('03/2019', 'MM/YYYY'), 'Street53', 'Austin',           'TX', '5555819992', 'DeSe55@email.com', 'null');
insert into customer values('565245105',  'Mr', 'Alfonzo',    'Stuber',      '3956369272838789', to_date('03/2019', 'MM/YYYY'), 'Street56', 'Tucson',           'AZ', '5552359098', 'AlSt05@email.com', '006' );
insert into customer values('556781225',  'Mr', 'Merle',      'Hadden',      '7665846160031553', to_date('10/2016', 'MM/YYYY'), 'Street55', 'Las Vegas',        'NV', '5559940069', 'MeHa25@email.com', '010' );
insert into customer values('516024925',  'Mr', 'Miguel',     'Bowland',     '7468087886671318', to_date('04/2018', 'MM/YYYY'), 'Street51', 'Atlanta',          'GA', '5551573843', 'MiBo25@email.com', 'null');
insert into customer values('200283332',  'Mr', 'Salvador',   'Frances',     '1989671174568359', to_date('02/2018', 'MM/YYYY'), 'Street20', 'Omaha',            'NE', '5551892484', 'SaFr32@email.com', 'null');
insert into customer values('897433158',  'Mr', 'Sammy',      'Booth',       '4774151791182665', to_date('03/2016', 'MM/YYYY'), 'Street89', 'San Jose',         'CA', '5554701840', 'SaBo58@email.com', 'null');
insert into customer values('529386525',  'Mr', 'Pat',        'Ficklin',     '4430891279147659', to_date('09/2016', 'MM/YYYY'), 'Street52', 'Louisville',       'KY', '5554807679', 'PaFi25@email.com', 'null');
insert into customer values('943831419',  'Mr', 'Troy',       'Lustig',      '2954689957623143', to_date('01/2016', 'MM/YYYY'), 'Street94', 'Fresno',           'CA', '5558286370', 'TrLu19@email.com', '009' );
insert into customer values('147126771',  'Mr', 'Anton',      'Heiser',      '8719928735197498', to_date('09/2020', 'MM/YYYY'), 'Street14', 'Long Beach',       'CA', '5553035303', 'AnHe71@email.com', 'null');
insert into customer values('964999489',  'Mr', 'Brooks',     'Spector',     '9547273870991315', to_date('01/2017', 'MM/YYYY'), 'Street96', 'Mesa',             'AZ', '5559646123', 'BrSp89@email.com', '002' );
insert into customer values('094384100',  'Mr', 'Hollis',     'Viggiano',    '6428245828101365', to_date('10/2016', 'MM/YYYY'), 'Street09', 'Seattle',          'WA', '5553622970', 'HoVi00@email.com', 'null');
insert into customer values('000169100',  'Mr', 'Abe',        'Azure',       '5982520582435285', to_date('09/2018', 'MM/YYYY'), 'Street00', 'Columbus',         'OH', '5558706502', 'AbAz00@email.com', '002' );
insert into customer values('709657507',  'Mr', 'Odis',       'Edberg',      '8344502033813692', to_date('10/2018', 'MM/YYYY'), 'Street70', 'Portland',         'OR', '5558524569', 'OdEd07@email.com', '006' );
insert into customer values('626818596',  'Mr', 'Jesse',      'Troxel',      '9585959966374964', to_date('05/2018', 'MM/YYYY'), 'Street62', 'Virginia Beach',   'VA', '5552193576', 'JeTr96@email.com', '010' );
insert into customer values('849940578',  'Mr', 'Virgilio',   'Machnik',     '4644347154497080', to_date('08/2017', 'MM/YYYY'), 'Street84', 'Memphis',          'TN', '5557858532', 'ViMa78@email.com', '008' );
insert into customer values('728944307',  'Mr', 'Graham',     'Waldroup',    '4253086735269476', to_date('05/2020', 'MM/YYYY'), 'Street72', 'Miami',            'FL', '5554312130', 'GrWa07@email.com', '006' );
insert into customer values('053641040',  'Mr', 'Ike',        'Desjardins',  '1402042719508649', to_date('10/2016', 'MM/YYYY'), 'Street05', 'Wichita',          'KS', '5551468086', 'IkDe40@email.com', '004' );
insert into customer values('198980191',  'Mr', 'Ahmed',      'Saraiva',     '9690889997851194', to_date('10/2020', 'MM/YYYY'), 'Street19', 'Milwaukee',        'WI', '5551957333', 'AhSa91@email.com', 'null');
insert into customer values('991439449',  'Mr', 'Carl',       'Gillispie',   '1960641863172072', to_date('11/2019', 'MM/YYYY'), 'Street99', 'Houston',          'TX', '5555155489', 'CaGi49@email.com', '006' );
insert into customer values('839168238',  'Mr', 'Omar',       'Sato',        '9219944977358431', to_date('12/2016', 'MM/YYYY'), 'Street83', 'Detroit',          'MI', '5553339830', 'OmSa38@email.com', '001' );
insert into customer values('396245593',  'Mr', 'Jae',        'Nygard',      '8728875842988214', to_date('03/2018', 'MM/YYYY'), 'Street39', 'Oklahoma City',    'OK', '5552148860', 'JaNy93@email.com', 'null');
insert into customer values('098526550',  'Mr', 'Michal',     'Talkington',  '4412659428226007', to_date('01/2016', 'MM/YYYY'), 'Street09', 'Kansas City',      'MO', '5559970645', 'MiTa50@email.com', '007' );
insert into customer values('135922451',  'Mr', 'Ian',        'Karlson',     '8239436247204045', to_date('09/2020', 'MM/YYYY'), 'Street13', 'Philadelphia',     'PA', '5559178236', 'IaKa51@email.com', 'null');
insert into customer values('662118356',  'Mr', 'Quinton',    'Wickman',     '4131806611151979', to_date('07/2017', 'MM/YYYY'), 'Street66', 'Fort Worth',       'TX', '5554202883', 'QuWi56@email.com', 'null');
insert into customer values('897836558',  'Mr', 'Delmer',     'Laurin',      '9129198197521336', to_date('12/2018', 'MM/YYYY'), 'Street89', 'San Antonio',      'TX', '5555868421', 'DeLa58@email.com', '008' );
insert into customer values('399923463',  'Mr', 'Virgil',     'Coghlan',     '4417564491275548', to_date('12/2020', 'MM/YYYY'), 'Street39', 'Los Angeles',      'CA', '5554000096', 'ViCo63@email.com', '003' );
insert into customer values('316044623',  'Mr', 'Dario',      'Kuchera',     '9340051676161355', to_date('01/2016', 'MM/YYYY'), 'Street31', 'San Francisco',    'CA', '5555084289', 'DaKu23@email.com', '002' );
insert into customer values('847515288',  'Mr', 'Elisha',     'Giblin',      '7676463528494517', to_date('02/2016', 'MM/YYYY'), 'Street84', 'Indianapolis',     'IN', '5559903730', 'ElGi88@email.com', 'null');
insert into customer values('798024737',  'Mr', 'Morgan',     'Litten',      '9904222263449208', to_date('10/2019', 'MM/YYYY'), 'Street79', 'Arlington',        'TX', '5559126466', 'MoLi37@email.com', '004' );
insert into customer values('076188410',  'Mr', 'Roberto',    'Danforth',    '1213971645731411', to_date('02/2016', 'MM/YYYY'), 'Street07', 'Sacramento',       'CA', '5558227335', 'RoDa10@email.com', 'null');
insert into customer values('998478429',  'Mr', 'Dwight',     'Tindell',     '4812826559412031', to_date('04/2017', 'MM/YYYY'), 'Street99', 'Phoenix',          'AZ', '5556468381', 'DwTi29@email.com', 'null');
insert into customer values('138799371',  'Mr', 'Jay',        'Waid',        '5472440426064841', to_date('05/2020', 'MM/YYYY'), 'Street13', 'New Orleans',      'LA', '5552251570', 'JaWa71@email.com', 'null');
insert into customer values('634260106',  'Ms', 'Evangelina', 'Kania',       '5652375080489865', to_date('09/2017', 'MM/YYYY'), 'Street63', 'Dallas',           'TX', '5553831744', 'EvKa06@email.com', '004' );
insert into customer values('818038788', 'Mrs', 'Casie',      'Decker',      '7791037510570699', to_date('12/2020', 'MM/YYYY'), 'Street81', 'Seattle',          'WA', '5559646683', 'CaDe88@email.com', '002' );
insert into customer values('469168214', 'Mrs', 'Dinah',      'Hilden',      '1068560883004338', to_date('04/2018', 'MM/YYYY'), 'Street46', 'Fresno',           'CA', '5557505162', 'DiHi14@email.com', '009' );
insert into customer values('468774954',  'Ms', 'Birdie',     'Lozier',      '6543578694429235', to_date('09/2017', 'MM/YYYY'), 'Street46', 'Chicago',          'IL', '5556072127', 'BiLo54@email.com', 'null');
insert into customer values('587665135', 'Mrs', 'Delisa',     'Camarillo',   '6781291337541097', to_date('10/2017', 'MM/YYYY'), 'Street58', 'San Diego',        'CA', '5556449726', 'DeCa35@email.com', '005' );
insert into customer values('911862479', 'Mrs', 'Augusta',    'Lomeli',      '6882808855212824', to_date('03/2019', 'MM/YYYY'), 'Street91', 'Wichita',          'KS', '5557810817', 'AuLo79@email.com', 'null');
insert into customer values('153090441', 'Mrs', 'Isadora',    'Heminger',    '4940608756507432', to_date('06/2020', 'MM/YYYY'), 'Street15', 'Tucson',           'AZ', '5555743648', 'IsHe41@email.com', '001' );
insert into customer values('603687436',  'Ms', 'Shanelle',   'Bernstein',   '2551121947318015', to_date('10/2016', 'MM/YYYY'), 'Street60', 'Miami',            'FL', '5554466875', 'ShBe36@email.com', 'null');
insert into customer values('509012755',  'Ms', 'Cherlyn',    'Gallimore',   '7791168265985588', to_date('09/2019', 'MM/YYYY'), 'Street50', 'Detroit',          'MI', '5555730043', 'ChGa55@email.com', '007' );
insert into customer values('916431649',  'Ms', 'Trish',      'Marchese',    '9421987667168226', to_date('10/2019', 'MM/YYYY'), 'Street91', 'San Antonio',      'TX', '5552868207', 'TrMa49@email.com', 'null');
insert into customer values('441586034',  'Ms', 'Carolee',    'Dunston',     '2555225264001183', to_date('06/2020', 'MM/YYYY'), 'Street44', 'Washington',       'DC', '5557328610', 'CaDu34@email.com', '006' );
insert into customer values('389820653',  'Ms', 'Margarette', 'Stumbo',      '3675507446671692', to_date('08/2018', 'MM/YYYY'), 'Street38', 'Nashville',        'TN', '5553863946', 'MaSt53@email.com', 'null');
insert into customer values('835522278', 'Mrs', 'Shana',      'Demaria',     '3926718664648241', to_date('09/2016', 'MM/YYYY'), 'Street83', 'Oakland',          'CA', '5557319077', 'ShDe78@email.com', '007' );
insert into customer values('308184933',  'Ms', 'Robbin',     'Liles',       '4801837140483257', to_date('07/2018', 'MM/YYYY'), 'Street30', 'Minneapolis',      'MN', '5558971137', 'RoLi33@email.com', 'null');
insert into customer values('004055120',  'Ms', 'Lila',       'Pelosi',      '4993808541163288', to_date('11/2016', 'MM/YYYY'), 'Street00', 'Sacramento',       'CA', '5553814460', 'LiPe20@email.com', '005' );
insert into customer values('251490312', 'Mrs', 'Kristina',   'Mcgruder',    '8515525971555743', to_date('03/2016', 'MM/YYYY'), 'Street25', 'El Paso',          'TX', '5551359085', 'KrMc12@email.com', '001' );
insert into customer values('040298740',  'Ms', 'Carolynn',   'Falcone',     '1021058159097630', to_date('05/2017', 'MM/YYYY'), 'Street04', 'Los Angeles',      'CA', '5559825217', 'CaFa40@email.com', 'null');
insert into customer values('267780642',  'Ms', 'Tenesha',    'Stillwell',   '8241076817701491', to_date('03/2019', 'MM/YYYY'), 'Street26', 'New York',         'NY', '5559929144', 'TeSt42@email.com', '008' );
insert into customer values('105240601',  'Ms', 'Lyla',       'Huntsman',    '5005360211577537', to_date('08/2018', 'MM/YYYY'), 'Street10', 'Atlanta',          'GA', '5559724149', 'LyHu01@email.com', 'null');
insert into customer values('503467725', 'Mrs', 'Latashia',   'Swihart',     '5613257479580471', to_date('10/2016', 'MM/YYYY'), 'Street50', 'Indianapolis',     'IN', '5559730600', 'LaSw25@email.com', 'null');
insert into customer values('682459806',  'Ms', 'Arvilla',    'Ravenscroft', '8831332932897091', to_date('06/2017', 'MM/YYYY'), 'Street68', 'Phoenix',          'AZ', '5553503207', 'ArRa06@email.com', '005' );
insert into customer values('837380998',  'Ms', 'Tijuana',    'Meriwether',  '4999090811506560', to_date('12/2020', 'MM/YYYY'), 'Street83', 'Louisville',       'KY', '5552008236', 'TiMe98@email.com', 'null');
insert into customer values('793380767',  'Ms', 'Janice',     'Maine',       '6702259620990131', to_date('12/2016', 'MM/YYYY'), 'Street79', 'Raleigh',          'NC', '5554749260', 'JaMa67@email.com', 'null');
insert into customer values('540136815',  'Ms', 'Maia',       'Clair',       '4926498495727527', to_date('05/2018', 'MM/YYYY'), 'Street54', 'San Jose',         'CA', '5556333020', 'MaCl15@email.com', '002' );
insert into customer values('361217343', 'Mrs', 'Bebe',       'Maio',        '3008311844040642', to_date('04/2019', 'MM/YYYY'), 'Street36', 'Memphis',          'TN', '5556991474', 'BeMa43@email.com', 'null');
insert into customer values('522298615', 'Mrs', 'Digna',      'Stayer',      '5966648024279991', to_date('12/2020', 'MM/YYYY'), 'Street52', 'Houston',          'TX', '5553601930', 'DiSt15@email.com', '006' );
insert into customer values('586470645',  'Ms', 'Lona',       'Durso',       '5303806261419972', to_date('03/2017', 'MM/YYYY'), 'Street58', 'Oklahoma City',    'OK', '5559927465', 'LoDu45@email.com', '003' );
insert into customer values('921495149', 'Mrs', 'Marica',     'Mikelson',    '3341262042014002', to_date('12/2019', 'MM/YYYY'), 'Street92', 'Mesa',             'AZ', '5553130722', 'MaMi49@email.com', '001' );
insert into customer values('378612413',  'Ms', 'Shaniqua',   'Hart',        '1755922065558640', to_date('11/2019', 'MM/YYYY'), 'Street37', 'Milwaukee',        'WI', '5553885510', 'ShHa13@email.com', '005' );
insert into customer values('596740895',  'Ms', 'Rikki',      'Mahar',       '4251477330255098', to_date('10/2019', 'MM/YYYY'), 'Street59', 'Portland',         'OR', '5554654768', 'RiMa95@email.com', '003' );
insert into customer values('623328116',  'Ms', 'Jami',       'Lafollette',  '8871856075094282', to_date('05/2016', 'MM/YYYY'), 'Street62', 'Kansas City',      'MO', '5554818178', 'JaLa16@email.com', '006' );
insert into customer values('425919384',  'Ms', 'Elisabeth',  'Peppers',     '9373379176020910', to_date('08/2018', 'MM/YYYY'), 'Street42', 'Baltimore',        'MD', '5552314412', 'ElPe84@email.com', '005' );
insert into customer values('676054956',  'Ms', 'Shin',       'Lettinga',    '2541946452916763', to_date('07/2018', 'MM/YYYY'), 'Street67', 'Tulsa',            'OK', '5557395383', 'ShLe56@email.com', 'null');
insert into customer values('446815414',  'Ms', 'Pauline',    'Bollman',     '6038218913503585', to_date('03/2018', 'MM/YYYY'), 'Street44', 'Albuquerque',      'NM', '5551423461', 'PaBo14@email.com', 'null');
insert into customer values('743420277',  'Ms', 'Gena',       'Desch',       '4900631530680262', to_date('06/2020', 'MM/YYYY'), 'Street74', 'San Francisco',    'CA', '5554962141', 'GeDe77@email.com', '007' );
insert into customer values('084099400',  'Ms', 'Pamela',     'Roesch',      '3846261850454486', to_date('03/2020', 'MM/YYYY'), 'Street08', 'Denver',           'CO', '5556380802', 'PaRo00@email.com', 'null');
insert into customer values('254844152',  'Ms', 'Libbie',     'Shimek',      '2032765389488873', to_date('11/2016', 'MM/YYYY'), 'Street25', 'Columbus',         'OH', '5552750982', 'LiSh52@email.com', '002' );
insert into customer values('528487625', 'Mrs', 'Cecila',     'Strausbaugh', '7261740698362601', to_date('01/2017', 'MM/YYYY'), 'Street52', 'Charlotte',        'NC', '5555743012', 'CeSt25@email.com', '007' );
insert into customer values('437037714',  'Ms', 'Jolanda',    'Loera',       '2795707981231382', to_date('01/2018', 'MM/YYYY'), 'Street43', 'Philadelphia',     'PA', '5556600844', 'JoLo14@email.com', '003' );
insert into customer values('251275722', 'Mrs', 'Meta',       'Alberti',     '1307863341448090', to_date('04/2020', 'MM/YYYY'), 'Street25', 'Fort Worth',       'TX', '5553625375', 'MeAl22@email.com', 'null');
insert into customer values('980133909',  'Ms', 'Cindie',     'Maxim',       '3103397968606662', to_date('07/2018', 'MM/YYYY'), 'Street98', 'Colorado Springs', 'CO', '5554122550', 'CiMa09@email.com', 'null');
insert into customer values('260474822',  'Ms', 'Voncile',    'Diego',       '6082793689151948', to_date('11/2019', 'MM/YYYY'), 'Street26', 'Austin',           'TX', '5558257683', 'VoDi22@email.com', '003' );
insert into customer values('009355770',  'Ms', 'Zella',      'Hice',        '1563655533641037', to_date('12/2016', 'MM/YYYY'), 'Street00', 'New Orleans',      'LA', '5555445147', 'ZeHi70@email.com', '010' );
insert into customer values('287783752', 'Mrs', 'Gabrielle',  'Lenderman',   '5198749096861759', to_date('07/2017', 'MM/YYYY'), 'Street28', 'Virginia Beach',   'VA', '5552389976', 'GaLe52@email.com', '003' );
insert into customer values('599238535',  'Ms', 'Brinda',     'Rand',        '5998458077560519', to_date('11/2018', 'MM/YYYY'), 'Street59', 'Jacksonville',     'FL', '5552874624', 'BrRa35@email.com', '009' );
insert into customer values('588855965', 'Mrs', 'Le',         'Shadle',      '6699993543410734', to_date('11/2018', 'MM/YYYY'), 'Street58', 'Boston',           'MA', '5553425254', 'LeSh65@email.com', '002' );
insert into customer values('361054063', 'Mrs', 'Felisha',    'Mitchel',     '1140117927331712', to_date('05/2017', 'MM/YYYY'), 'Street36', 'Las Vegas',        'NV', '5558731232', 'FeMi63@email.com', 'null');
insert into customer values('201827992',  'Ms', 'Argentina',  'Adelman',     '7516871596299021', to_date('01/2018', 'MM/YYYY'), 'Street20', 'Arlington',        'TX', '5559605278', 'ArAd92@email.com', '009' );
insert into customer values('123456789',  'Ms', 'Nettie',     'Twitchell',   '7050194499100249', to_date('12/2020', 'MM/YYYY'), 'Street12', 'Omaha',            'NE', '5552036978', 'NeTw89@email.com', 'null');
insert into customer values('987654321',  'Mr', 'Bill',       'Bob',         '5138465813536888', to_date('10/2019', 'MM/YYYY'), 'Street98', 'Long Beach',       'CA', '5556462254', 'BiBo21@email.com', '007' );


/* 300 RESERVATIONS
Reservation(reservation_number, cid, cost, credit_card_num, reservation_date, ticketed)
	reservation_number varchar(5) = generated sequentially starting at 00000
	cid varchar(9) -> customer.cid = generated randomly from cid
	cost int = calculated from cost and flight time in details
	credit_card_num varchar(16) = matches credit_card_num of cid
	reservation_date date = generated randomly (01/01/2015 to 12/31/2015) [[[[[!!NEED TIME ADDED!!]]]]]
	start_city varchar(3) = matches flight plan from details
	end_city varchar(3) = matches flight plan from details
	ticketed varchar(1) -> Y/N = generated randomly, 10% chance of N */

-- 2 one-way: 2 leg
insert into reservation values('00000', '744202758', 294, '6544878526228429', to_date('12/20/2016', 'MM/DD/YYYY'), 'LAX', 'MSP', 'Y');
insert into reservation values('00001', '750670965', 280, '3740232255497666', to_date('10/27/2015', 'MM/DD/YYYY'), 'LAX', 'DEN', 'Y');
-- 2 roundtrip: 1 leg there, 1 leg back
insert into reservation values('00002', '821346916', 422, '5694015983779931', to_date('03/01/2015', 'MM/DD/YYYY'), 'JFK', 'JFK', 'Y');
insert into reservation values('00003', '390298013', 269, '9261875281238207', to_date('04/22/2016', 'MM/DD/YYYY'), 'JFK', 'JFK', 'Y');
-- 2 roundtrip: 1 leg there, 2 legs back
insert into reservation values('00004', '406636105', 422, '2697047227405430', to_date('03/09/2015', 'MM/DD/YYYY'), 'JFK', 'JFK', 'Y');
insert into reservation values('00005', '468774954', 358, '6543578694429235', to_date('01/10/2015', 'MM/DD/YYYY'), 'JFK', 'JFK', 'Y');
insert into reservation values('00006', '561814355', 333, '1622471779543982', to_date('07/01/2016', 'MM/DD/YYYY'), 'JFK', 'JFK', 'Y');
insert into reservation values('00007', '446815414', 269, '6038218913503585', to_date('03/29/2016', 'MM/DD/YYYY'), 'JFK', 'JFK', 'Y');
-- 2 roundtrip: 2 legs there, 2 legs back
insert into reservation values('00008', '437037714', 558, '2795707981231382', to_date('03/22/2015', 'MM/DD/YYYY'), 'LAX', 'LAX', 'Y');
insert into reservation values('00009', '060010524', 430, '8487479088262113', to_date('07/18/2015', 'MM/DD/YYYY'), 'LAX', 'LAX', 'Y');
-- 190 one-way: 1 leg
insert into reservation values('00010', '378612413', 298, '1755922065558640', to_date('04/02/2015', 'MM/DD/YYYY'), 'BOS', 'DFW', 'Y');
insert into reservation values('00011', '572723715', 234, '4297678776294822', to_date('10/16/2016', 'MM/DD/YYYY'), 'DTW', 'BOS', 'N');
insert into reservation values('00012', '089759674', 279, '2594706342048375', to_date('09/13/2016', 'MM/DD/YYYY'), 'MIA', 'SEA', 'Y');
insert into reservation values('00013', '117069523', 251, '7903044332117935', to_date('02/19/2015', 'MM/DD/YYYY'), 'PHL', 'DFW', 'Y');
insert into reservation values('00014', '496499705', 222, '7203376066184929', to_date('09/11/2015', 'MM/DD/YYYY'), 'SEA', 'MCO', 'Y');
insert into reservation values('00015', '245413592', 236, '5914978986241013', to_date('11/27/2015', 'MM/DD/YYYY'), 'ATL', 'LAX', 'Y');
insert into reservation values('00016', '333820028', 267, '9277378734998449', to_date('01/12/2015', 'MM/DD/YYYY'), 'LGA', 'CLT', 'Y');
insert into reservation values('00017', '104805364', 269, '1112934056273073', to_date('03/03/2016', 'MM/DD/YYYY'), 'EWR', 'IAH', 'Y');
insert into reservation values('00018', '599806989', 258, '7959376524393901', to_date('12/17/2015', 'MM/DD/YYYY'), 'DEN', 'MSP', 'Y');
insert into reservation values('00019', '771043703', 223, '4992929343072007', to_date('07/04/2016', 'MM/DD/YYYY'), 'ORD', 'DTW', 'Y');
insert into reservation values('00020', '695231176', 299, '8011932649983031', to_date('12/25/2015', 'MM/DD/YYYY'), 'MCO', 'MIA', 'Y');
insert into reservation values('00021', '816246078', 218, '6371836951396811', to_date('04/07/2016', 'MM/DD/YYYY'), 'BOS', 'EWR', 'Y');
insert into reservation values('00022', '586470645', 248, '5303806261419972', to_date('08/10/2016', 'MM/DD/YYYY'), 'ATL', 'SEA', 'Y');
insert into reservation values('00023', '516024925', 215, '7468087886671318', to_date('04/10/2016', 'MM/DD/YYYY'), 'SEA', 'IAH', 'N');
insert into reservation values('00024', '599806989', 222, '7959376524393901', to_date('08/12/2015', 'MM/DD/YYYY'), 'IAH', 'MIA', 'Y');
insert into reservation values('00025', '421396222', 202, '4167330172642269', to_date('04/04/2016', 'MM/DD/YYYY'), 'CLT', 'PHX', 'Y');
insert into reservation values('00026', '944199143', 209, '8051511764477303', to_date('01/02/2015', 'MM/DD/YYYY'), 'LAS', 'DEN', 'Y');
insert into reservation values('00027', '315389743', 237, '8246518713467860', to_date('03/06/2016', 'MM/DD/YYYY'), 'PHX', 'MCO', 'Y');
insert into reservation values('00028', '482126047', 251, '9709562643272737', to_date('08/10/2015', 'MM/DD/YYYY'), 'LGA', 'PHL', 'Y');
insert into reservation values('00029', '254844152', 243, '2032765389488873', to_date('05/08/2015', 'MM/DD/YYYY'), 'MIA', 'SFO', 'Y');
insert into reservation values('00030', '469168214', 250, '1068560883004338', to_date('02/08/2015', 'MM/DD/YYYY'), 'JFK', 'BOS', 'Y');
insert into reservation values('00031', '064158647', 242, '7487753978719813', to_date('08/26/2015', 'MM/DD/YYYY'), 'DTW', 'LGA', 'Y');
insert into reservation values('00032', '607981624', 288, '7008813286111441', to_date('01/20/2016', 'MM/DD/YYYY'), 'MSP', 'DEN', 'Y');
insert into reservation values('00033', '251490312', 283, '8515525971555743', to_date('11/08/2016', 'MM/DD/YYYY'), 'DFW', 'PHL', 'Y');
insert into reservation values('00034', '462231604', 202, '9689970682258009', to_date('01/11/2016', 'MM/DD/YYYY'), 'EWR', 'ATL', 'Y');
insert into reservation values('00035', '275550901', 225, '1378562143332086', to_date('02/13/2016', 'MM/DD/YYYY'), 'SFO', 'EWR', 'Y');
insert into reservation values('00036', '040298740', 259, '1021058159097630', to_date('02/13/2015', 'MM/DD/YYYY'), 'LAX', 'SFO', 'Y');
insert into reservation values('00037', '473579802', 227, '5622521417527406', to_date('08/13/2015', 'MM/DD/YYYY'), 'PHL', 'MSP', 'Y');
insert into reservation values('00038', '559139624', 295, '5474432624517607', to_date('07/21/2016', 'MM/DD/YYYY'), 'ORD', 'CLT', 'Y');
insert into reservation values('00039', '572625127', 281, '4182745284798419', to_date('03/07/2016', 'MM/DD/YYYY'), 'DEN', 'PHL', 'N');
insert into reservation values('00040', '959779967', 209, '4976672648895937', to_date('12/01/2016', 'MM/DD/YYYY'), 'SFO', 'JFK', 'Y');
insert into reservation values('00041', '849940578', 237, '4644347154497080', to_date('05/28/2016', 'MM/DD/YYYY'), 'EWR', 'CLT', 'Y');
insert into reservation values('00042', '201827992', 284, '7516871596299021', to_date('06/30/2015', 'MM/DD/YYYY'), 'IAH', 'DTW', 'Y');
insert into reservation values('00043', '609224582', 219, '5362764729419569', to_date('12/09/2016', 'MM/DD/YYYY'), 'JFK', 'DTW', 'Y');
insert into reservation values('00044', '435756181', 285, '4938229136232376', to_date('06/06/2016', 'MM/DD/YYYY'), 'ATL', 'PHL', 'Y');
insert into reservation values('00045', '859462681', 275, '4858982142004045', to_date('01/11/2016', 'MM/DD/YYYY'), 'ORD', 'MSP', 'Y');
insert into reservation values('00046', '496499705', 226, '7203376066184929', to_date('04/27/2016', 'MM/DD/YYYY'), 'SEA', 'DTW', 'Y');
insert into reservation values('00047', '031325149', 277, '1970732981296904', to_date('09/27/2015', 'MM/DD/YYYY'), 'MSP', 'ATL', 'N');
insert into reservation values('00048', '415825484', 277, '4893777264286347', to_date('10/06/2015', 'MM/DD/YYYY'), 'PHL', 'LGA', 'Y');
insert into reservation values('00049', '371129753', 203, '6733435512611104', to_date('07/06/2016', 'MM/DD/YYYY'), 'DTW', 'JFK', 'Y');
insert into reservation values('00050', '596740895', 254, '4251477330255098', to_date('06/03/2016', 'MM/DD/YYYY'), 'DEN', 'ATL', 'N');
insert into reservation values('00051', '897836558', 266, '9129198197521336', to_date('11/26/2016', 'MM/DD/YYYY'), 'BOS', 'IAH', 'Y');
insert into reservation values('00052', '577900935', 243, '1730895858346096', to_date('11/19/2016', 'MM/DD/YYYY'), 'LAX', 'SEA', 'Y');
insert into reservation values('00053', '980133909', 273, '3103397968606662', to_date('05/30/2015', 'MM/DD/YYYY'), 'LAS', 'SFO', 'Y');
insert into reservation values('00054', '005218189', 236, '2671280836766098', to_date('10/08/2016', 'MM/DD/YYYY'), 'LGA', 'SFO', 'Y');
insert into reservation values('00055', '528684751', 274, '5841137818503085', to_date('06/12/2016', 'MM/DD/YYYY'), 'MIA', 'JFK', 'Y');
insert into reservation values('00056', '944199143', 216, '8051511764477303', to_date('09/16/2016', 'MM/DD/YYYY'), 'CLT', 'EWR', 'Y');
insert into reservation values('00057', '565245105', 221, '3956369272838789', to_date('11/14/2015', 'MM/DD/YYYY'), 'DFW', 'LAX', 'N');
insert into reservation values('00058', '122855678', 246, '6116998799698062', to_date('10/15/2015', 'MM/DD/YYYY'), 'PHX', 'SFO', 'Y');
insert into reservation values('00059', '743260368', 213, '4603663089297520', to_date('11/12/2015', 'MM/DD/YYYY'), 'MCO', 'EWR', 'Y');
insert into reservation values('00060', '164291643', 203, '1650640854365357', to_date('11/06/2015', 'MM/DD/YYYY'), 'EWR', 'DFW', 'Y');
insert into reservation values('00061', '493230818', 288, '9891574976034119', to_date('03/28/2016', 'MM/DD/YYYY'), 'LGA', 'SEA', 'Y');
insert into reservation values('00062', '435756181', 294, '4938229136232376', to_date('08/08/2015', 'MM/DD/YYYY'), 'ATL', 'DFW', 'N');
insert into reservation values('00063', '798024737', 209, '9904222263449208', to_date('08/01/2015', 'MM/DD/YYYY'), 'DEN', 'LGA', 'Y');
insert into reservation values('00064', '153090441', 218, '4940608756507432', to_date('01/02/2016', 'MM/DD/YYYY'), 'CLT', 'ORD', 'Y');
insert into reservation values('00065', '495146877', 212, '3854330056391653', to_date('03/25/2016', 'MM/DD/YYYY'), 'MCO', 'BOS', 'Y');
insert into reservation values('00066', '509012755', 240, '7791168265985588', to_date('11/28/2016', 'MM/DD/YYYY'), 'LAS', 'LGA', 'Y');
insert into reservation values('00067', '375428778', 202, '9466785272913634', to_date('11/07/2015', 'MM/DD/YYYY'), 'MSP', 'DFW', 'Y');
insert into reservation values('00068', '094384100', 222, '6428245828101365', to_date('05/25/2015', 'MM/DD/YYYY'), 'LAX', 'MIA', 'Y');
insert into reservation values('00069', '806864707', 242, '9511289760767009', to_date('03/21/2016', 'MM/DD/YYYY'), 'DTW', 'LAS', 'N');
insert into reservation values('00070', '200283332', 286, '1989671174568359', to_date('11/14/2016', 'MM/DD/YYYY'), 'SEA', 'BOS', 'Y');
insert into reservation values('00071', '677214712', 250, '7086500829214752', to_date('07/19/2016', 'MM/DD/YYYY'), 'PHX', 'LAX', 'N');
insert into reservation values('00072', '415825484', 224, '4893777264286347', to_date('04/19/2016', 'MM/DD/YYYY'), 'DFW', 'IAH', 'Y');
insert into reservation values('00073', '634260106', 235, '5652375080489865', to_date('07/07/2016', 'MM/DD/YYYY'), 'BOS', 'EQR', 'Y');
insert into reservation values('00074', '772550346', 251, '4787411435096659', to_date('06/02/2015', 'MM/DD/YYYY'), 'MIA', 'DTW', 'Y');
insert into reservation values('00075', '799420182', 300, '7498128161999310', to_date('12/18/2015', 'MM/DD/YYYY'), 'JFK', 'DEN', 'Y');
insert into reservation values('00076', '572625127', 254, '4182745284798419', to_date('07/21/2016', 'MM/DD/YYYY'), 'IAH', 'JFK', 'Y');
insert into reservation values('00077', '260474822', 249, '6082793689151948', to_date('11/22/2016', 'MM/DD/YYYY'), 'ORD', 'JFK', 'Y');
insert into reservation values('00078', '911862479', 275, '6882808855212824', to_date('02/25/2016', 'MM/DD/YYYY'), 'PHL', 'LAX', 'Y');
insert into reservation values('00079', '138799371', 280, '5472440426064841', to_date('07/13/2015', 'MM/DD/YYYY'), 'SFO', 'LGA', 'Y');
insert into reservation values('00080', '492151602', 287, '1257503582752954', to_date('10/28/2015', 'MM/DD/YYYY'), 'CLT', 'ATL', 'Y');
insert into reservation values('00081', '473579802', 258, '5622521417527406', to_date('11/02/2015', 'MM/DD/YYYY'), 'JFK', 'LAS', 'Y');
insert into reservation values('00082', '164291643', 280, '1650640854365357', to_date('06/10/2015', 'MM/DD/YYYY'), 'LAX', 'DEN', 'Y');
insert into reservation values('00083', '937413879', 248, '4502332468872346', to_date('05/17/2015', 'MM/DD/YYYY'), 'SEA', 'PHX', 'Y');
insert into reservation values('00084', '940008409', 284, '2803600632692308', to_date('07/04/2015', 'MM/DD/YYYY'), 'MSP', 'ORD', 'Y');
insert into reservation values('00085', '734036121', 243, '3069146691426388', to_date('06/18/2016', 'MM/DD/YYYY'), 'IAH', 'MCO', 'Y');
insert into reservation values('00086', '004055120', 252, '4993808541163288', to_date('03/04/2016', 'MM/DD/YYYY'), 'LGA', 'MIA', 'Y');
insert into reservation values('00087', '031325149', 201, '1970732981296904', to_date('07/19/2016', 'MM/DD/YYYY'), 'LAS', 'ORD', 'Y');
insert into reservation values('00088', '603344158', 252, '5909425282632267', to_date('02/25/2015', 'MM/DD/YYYY'), 'BOS', 'CLT', 'Y');
insert into reservation values('00089', '842399847', 241, '7131720974652720', to_date('05/12/2015', 'MM/DD/YYYY'), 'MCO', 'ORD', 'Y');
insert into reservation values('00090', '910900016', 209, '9372115691960778', to_date('11/17/2015', 'MM/DD/YYYY'), 'MIA', 'PHX', 'Y');
insert into reservation values('00091', '027587440', 212, '1624839719145791', to_date('09/19/2015', 'MM/DD/YYYY'), 'PHL', 'BOS', 'N');
insert into reservation values('00092', '514292149', 230, '8910144454459145', to_date('10/25/2015', 'MM/DD/YYYY'), 'EWR', 'MCO', 'Y');
insert into reservation values('00093', '019619898', 223, '2183005969403234', to_date('06/27/2016', 'MM/DD/YYYY'), 'PHX', 'CLT', 'Y');
insert into reservation values('00094', '695052883', 295, '3635845493608133', to_date('09/16/2015', 'MM/DD/YYYY'), 'DTW', 'IAH', 'Y');
insert into reservation values('00095', '943831419', 279, '2954689957623143', to_date('01/29/2015', 'MM/DD/YYYY'), 'ORD', 'PHL', 'Y');
insert into reservation values('00096', '247591186', 241, '6343594773653241', to_date('02/28/2016', 'MM/DD/YYYY'), 'DFW', 'MSP', 'Y');
insert into reservation values('00097', '528684751', 225, '5841137818503085', to_date('04/15/2015', 'MM/DD/YYYY'), 'SFO', 'DEN', 'Y');
insert into reservation values('00098', '060010524', 290, '8487479088262113', to_date('06/17/2015', 'MM/DD/YYYY'), 'ATL', 'PHX', 'N');
insert into reservation values('00099', '861952229', 292, '9852547260513247', to_date('05/02/2016', 'MM/DD/YYYY'), 'DEN', 'ORD', 'N');
insert into reservation values('00100', '528836955', 243, '6178065020603266', to_date('05/04/2016', 'MM/DD/YYYY'), 'LAX', 'LAS', 'N');
insert into reservation values('00101', '430172894', 233, '1648989326298575', to_date('05/20/2015', 'MM/DD/YYYY'), 'PHX', 'SEA', 'Y');
insert into reservation values('00102', '655989783', 293, '9826297317611262', to_date('11/23/2016', 'MM/DD/YYYY'), 'MCO', 'ATL', 'Y');
insert into reservation values('00103', '406636105', 227, '2697047227405430', to_date('03/07/2015', 'MM/DD/YYYY'), 'CLT', 'MCO', 'Y');
insert into reservation values('00104', '577900935', 280, '1730895858346096', to_date('06/15/2016', 'MM/DD/YYYY'), 'DFW', 'MIA', 'Y');
insert into reservation values('00105', '725168037', 225, '8832194553153009', to_date('08/01/2015', 'MM/DD/YYYY'), 'JFK', 'LAX', 'Y');
insert into reservation values('00106', '652552938', 226, '6907472375769657', to_date('01/28/2016', 'MM/DD/YYYY'), 'LAS', 'MSP', 'Y');
insert into reservation values('00107', '275550901', 279, '1378562143332086', to_date('04/02/2015', 'MM/DD/YYYY'), 'MSP', 'PHX', 'Y');
insert into reservation values('00108', '897433158', 256, '4774151791182665', to_date('03/01/2016', 'MM/DD/YYYY'), 'SFO', 'LAS', 'N');
insert into reservation values('00109', '510956524', 212, '6057497854488507', to_date('01/11/2015', 'MM/DD/YYYY'), 'IAH', 'LAS', 'Y');
insert into reservation values('00110', '835666211', 298, '7950542230006090', to_date('07/24/2016', 'MM/DD/YYYY'), 'BOS', 'DFW', 'Y');
insert into reservation values('00111', '596958885', 234, '2095425138131365', to_date('05/01/2016', 'MM/DD/YYYY'), 'DTW', 'BOS', 'Y');
insert into reservation values('00112', '315389743', 279, '8246518713467860', to_date('08/10/2016', 'MM/DD/YYYY'), 'MIA', 'SEA', 'Y');
insert into reservation values('00113', '064626778', 251, '1075225832998379', to_date('02/17/2015', 'MM/DD/YYYY'), 'PHL', 'DFW', 'Y');
insert into reservation values('00114', '308184933', 222, '4801837140483257', to_date('08/21/2015', 'MM/DD/YYYY'), 'SEA', 'MCO', 'N');
insert into reservation values('00115', '823383916', 236, '5463301179603301', to_date('06/08/2015', 'MM/DD/YYYY'), 'ATL', 'LAX', 'Y');
insert into reservation values('00116', '076279338', 267, '5056995166638032', to_date('11/30/2016', 'MM/DD/YYYY'), 'LGA', 'CLT', 'Y');
insert into reservation values('00117', '181890051', 269, '9670796327909709', to_date('12/22/2015', 'MM/DD/YYYY'), 'EWR', 'IAH', 'Y');
insert into reservation values('00118', '010463426', 258, '2813288396818727', to_date('06/02/2015', 'MM/DD/YYYY'), 'DEN', 'MSP', 'Y');
insert into reservation values('00119', '771043703', 223, '4992929343072007', to_date('07/27/2015', 'MM/DD/YYYY'), 'ORD', 'DTW', 'Y');
insert into reservation values('00120', '837380998', 299, '4999090811506560', to_date('09/30/2015', 'MM/DD/YYYY'), 'MCO', 'MIA', 'Y');
insert into reservation values('00121', '057684994', 218, '5536480731060912', to_date('10/20/2016', 'MM/DD/YYYY'), 'BOS', 'EWR', 'Y');
insert into reservation values('00122', '910900016', 248, '9372115691960778', to_date('05/01/2016', 'MM/DD/YYYY'), 'ATL', 'SEA', 'Y');
insert into reservation values('00123', '513958766', 215, '9305418453068164', to_date('09/25/2015', 'MM/DD/YYYY'), 'SEA', 'IAH', 'Y');
insert into reservation values('00124', '998478429', 222, '4812826559412031', to_date('02/17/2016', 'MM/DD/YYYY'), 'IAH', 'MIA', 'Y');
insert into reservation values('00125', '053641040', 202, '1402042719508649', to_date('07/24/2015', 'MM/DD/YYYY'), 'CLT', 'PHX', 'Y');
insert into reservation values('00126', '495267605', 209, '9193698212477563', to_date('08/12/2016', 'MM/DD/YYYY'), 'LAS', 'DEN', 'Y');
insert into reservation values('00127', '399923463', 237, '4417564491275548', to_date('03/13/2016', 'MM/DD/YYYY'), 'PHX', 'MCO', 'Y');
insert into reservation values('00128', '375428778', 251, '9466785272913634', to_date('11/27/2016', 'MM/DD/YYYY'), 'LGA', 'PHL', 'Y');
insert into reservation values('00129', '811862332', 243, '6800390184429557', to_date('06/06/2016', 'MM/DD/YYYY'), 'MIA', 'SFO', 'Y');
insert into reservation values('00130', '237155722', 250, '9503775411113173', to_date('05/17/2016', 'MM/DD/YYYY'), 'JFK', 'BOS', 'Y');
insert into reservation values('00131', '997054969', 242, '4369072454009478', to_date('11/19/2015', 'MM/DD/YYYY'), 'DTW', 'LGA', 'Y');
insert into reservation values('00132', '122855678', 288, '6116998799698062', to_date('01/24/2015', 'MM/DD/YYYY'), 'MSP', 'DEN', 'Y');
insert into reservation values('00133', '147126771', 283, '8719928735197498', to_date('01/22/2016', 'MM/DD/YYYY'), 'DFW', 'PHL', 'Y');
insert into reservation values('00134', '247591186', 202, '6343594773653241', to_date('03/14/2016', 'MM/DD/YYYY'), 'EWR', 'ATL', 'Y');
insert into reservation values('00135', '237155722', 225, '9503775411113173', to_date('05/25/2016', 'MM/DD/YYYY'), 'SFO', 'EWR', 'N');
insert into reservation values('00136', '841807618', 259, '9688197662069657', to_date('03/13/2016', 'MM/DD/YYYY'), 'LAX', 'SFO', 'Y');
insert into reservation values('00137', '064158647', 227, '7487753978719813', to_date('01/22/2015', 'MM/DD/YYYY'), 'PHL', 'MSP', 'Y');
insert into reservation values('00138', '821346916', 295, '5694015983779931', to_date('08/01/2016', 'MM/DD/YYYY'), 'ORD', 'CLT', 'Y');
insert into reservation values('00139', '861952229', 281, '9852547260513247', to_date('04/28/2016', 'MM/DD/YYYY'), 'DEN', 'PHL', 'Y');
insert into reservation values('00140', '495146877', 209, '3854330056391653', to_date('08/03/2016', 'MM/DD/YYYY'), 'SFO', 'JFK', 'N');
insert into reservation values('00141', '762252848', 237, '8193911125078285', to_date('11/06/2015', 'MM/DD/YYYY'), 'EWR', 'CLT', 'Y');
insert into reservation values('00142', '867250478', 284, '4358002187071897', to_date('09/09/2015', 'MM/DD/YYYY'), 'IAH', 'DTW', 'Y');
insert into reservation values('00143', '057684994', 219, '5536480731060912', to_date('04/28/2015', 'MM/DD/YYYY'), 'JFK', 'DTW', 'Y');
insert into reservation values('00144', '245413592', 285, '5914978986241013', to_date('01/19/2015', 'MM/DD/YYYY'), 'ATL', 'PHL', 'Y');
insert into reservation values('00145', '827643735', 275, '8957002782632114', to_date('01/24/2016', 'MM/DD/YYYY'), 'ORD', 'MSP', 'Y');
insert into reservation values('00146', '878581803', 226, '3178071959529148', to_date('10/28/2015', 'MM/DD/YYYY'), 'SEA', 'DTW', 'Y');
insert into reservation values('00147', '841807618', 277, '9688197662069657', to_date('11/12/2016', 'MM/DD/YYYY'), 'MSP', 'ATL', 'Y');
insert into reservation values('00148', '495267605', 277, '9193698212477563', to_date('07/14/2015', 'MM/DD/YYYY'), 'PHL', 'LGA', 'Y');
insert into reservation values('00149', '709657507', 203, '8344502033813692', to_date('04/10/2015', 'MM/DD/YYYY'), 'DTW', 'JFK', 'Y');
insert into reservation values('00150', '853759923', 254, '6894961993971968', to_date('01/24/2016', 'MM/DD/YYYY'), 'DEN', 'ATL', 'Y');
insert into reservation values('00151', '847515288', 266, '7676463528494517', to_date('07/09/2016', 'MM/DD/YYYY'), 'BOS', 'IAH', 'Y');
insert into reservation values('00152', '874304029', 243, '5866327620706496', to_date('08/03/2015', 'MM/DD/YYYY'), 'LAX', 'SEA', 'Y');
insert into reservation values('00153', '267780642', 273, '8241076817701491', to_date('09/24/2015', 'MM/DD/YYYY'), 'LAS', 'SFO', 'Y');
insert into reservation values('00154', '835666211', 236, '7950542230006090', to_date('02/02/2016', 'MM/DD/YYYY'), 'LGA', 'SFO', 'Y');
insert into reservation values('00155', '492151602', 274, '1257503582752954', to_date('11/30/2015', 'MM/DD/YYYY'), 'MIA', 'JFK', 'Y');
insert into reservation values('00156', '750670965', 216, '3740232255497666', to_date('03/06/2016', 'MM/DD/YYYY'), 'CLT', 'EWR', 'Y');
insert into reservation values('00157', '987654321', 221, '5138465813536888', to_date('03/14/2016', 'MM/DD/YYYY'), 'DFW', 'LAX', 'Y');
insert into reservation values('00158', '859462681', 246, '4858982142004045', to_date('09/22/2015', 'MM/DD/YYYY'), 'PHX', 'SFO', 'Y');
insert into reservation values('00159', '141994383', 213, '9785217322057043', to_date('02/23/2015', 'MM/DD/YYYY'), 'MCO', 'EWR', 'Y');
insert into reservation values('00160', '623328116', 203, '8871856075094282', to_date('07/18/2016', 'MM/DD/YYYY'), 'EWR', 'DFW', 'Y');
insert into reservation values('00161', '009355770', 288, '1563655533641037', to_date('07/13/2016', 'MM/DD/YYYY'), 'LGA', 'SEA', 'Y');
insert into reservation values('00162', '227583552', 294, '7541844283864425', to_date('02/25/2015', 'MM/DD/YYYY'), 'ATL', 'DFW', 'Y');
insert into reservation values('00163', '806864707', 209, '9511289760767009', to_date('12/05/2016', 'MM/DD/YYYY'), 'DEN', 'LGA', 'Y');
insert into reservation values('00164', '227583552', 218, '7541844283864425', to_date('10/26/2016', 'MM/DD/YYYY'), 'CLT', 'ORD', 'Y');
insert into reservation values('00165', '251275722', 212, '1307863341448090', to_date('01/21/2016', 'MM/DD/YYYY'), 'MCO', 'BOS', 'Y');
insert into reservation values('00166', '010463426', 240, '2813288396818727', to_date('02/27/2016', 'MM/DD/YYYY'), 'LAS', 'LGA', 'Y');
insert into reservation values('00167', '959779967', 202, '4976672648895937', to_date('11/05/2016', 'MM/DD/YYYY'), 'MSP', 'DFW', 'Y');
insert into reservation values('00168', '390298013', 222, '9261875281238207', to_date('05/09/2015', 'MM/DD/YYYY'), 'LAX', 'MIA', 'Y');
insert into reservation values('00169', '346439992', 242, '9757237542937578', to_date('05/19/2015', 'MM/DD/YYYY'), 'DTW', 'LAS', 'Y');
insert into reservation values('00170', '098526550', 286, '4412659428226007', to_date('11/04/2015', 'MM/DD/YYYY'), 'SEA', 'BOS', 'Y');
insert into reservation values('00171', '676054956', 250, '2541946452916763', to_date('06/22/2016', 'MM/DD/YYYY'), 'PHX', 'LAX', 'Y');
insert into reservation values('00172', '818038788', 224, '7791037510570699', to_date('05/21/2016', 'MM/DD/YYYY'), 'DFW', 'IAH', 'Y');
insert into reservation values('00173', '076188410', 235, '1213971645731411', to_date('06/02/2016', 'MM/DD/YYYY'), 'BOS', 'EQR', 'Y');
insert into reservation values('00174', '485353537', 251, '1666183329601255', to_date('04/01/2016', 'MM/DD/YYYY'), 'MIA', 'DTW', 'Y');
insert into reservation values('00175', '599238535', 300, '5998458077560519', to_date('05/18/2016', 'MM/DD/YYYY'), 'JFK', 'DEN', 'Y');
insert into reservation values('00176', '410709438', 254, '1891714215954422', to_date('01/01/2015', 'MM/DD/YYYY'), 'IAH', 'JFK', 'Y');
insert into reservation values('00177', '198980191', 249, '9690889997851194', to_date('02/19/2015', 'MM/DD/YYYY'), 'ORD', 'JFK', 'N');
insert into reservation values('00178', '141994383', 275, '9785217322057043', to_date('05/24/2016', 'MM/DD/YYYY'), 'PHL', 'LAX', 'Y');
insert into reservation values('00179', '921495149', 280, '3341262042014002', to_date('03/01/2015', 'MM/DD/YYYY'), 'SFO', 'LGA', 'N');
insert into reservation values('00180', '853759923', 287, '6894961993971968', to_date('07/02/2015', 'MM/DD/YYYY'), 'CLT', 'ATL', 'Y');
insert into reservation values('00181', '514292149', 258, '8910144454459145', to_date('03/25/2015', 'MM/DD/YYYY'), 'JFK', 'LAS', 'Y');
insert into reservation values('00182', '762252848', 280, '8193911125078285', to_date('09/19/2016', 'MM/DD/YYYY'), 'LAX', 'DEN', 'Y');
insert into reservation values('00183', '104805364', 248, '1112934056273073', to_date('02/19/2015', 'MM/DD/YYYY'), 'SEA', 'PHX', 'Y');
insert into reservation values('00184', '510956524', 284, '6057497854488507', to_date('07/04/2016', 'MM/DD/YYYY'), 'MSP', 'ORD', 'Y');
insert into reservation values('00185', '027674342', 243, '8546353822058733', to_date('10/12/2015', 'MM/DD/YYYY'), 'IAH', 'MCO', 'Y');
insert into reservation values('00186', '962224219', 252, '7037541068020785', to_date('07/01/2015', 'MM/DD/YYYY'), 'LGA', 'MIA', 'Y');
insert into reservation values('00187', '874304029', 201, '5866327620706496', to_date('07/22/2015', 'MM/DD/YYYY'), 'LAS', 'ORD', 'Y');
insert into reservation values('00188', '563329299', 252, '9053898698770807', to_date('02/15/2015', 'MM/DD/YYYY'), 'BOS', 'CLT', 'Y');
insert into reservation values('00189', '529386525', 241, '4430891279147659', to_date('09/07/2016', 'MM/DD/YYYY'), 'MCO', 'ORD', 'Y');
insert into reservation values('00190', '084099400', 209, '3846261850454486', to_date('11/05/2015', 'MM/DD/YYYY'), 'MIA', 'PHX', 'Y');
insert into reservation values('00191', '528487625', 212, '7261740698362601', to_date('09/09/2015', 'MM/DD/YYYY'), 'PHL', 'BOS', 'Y');
insert into reservation values('00192', '541644681', 230, '3938574621695295', to_date('09/16/2016', 'MM/DD/YYYY'), 'EWR', 'MCO', 'Y');
insert into reservation values('00193', '099883738', 223, '7542828453632217', to_date('11/05/2016', 'MM/DD/YYYY'), 'PHX', 'CLT', 'Y');
insert into reservation values('00194', '425919384', 295, '9373379176020910', to_date('11/01/2015', 'MM/DD/YYYY'), 'DTW', 'IAH', 'Y');
insert into reservation values('00195', '105240601', 279, '5005360211577537', to_date('01/07/2016', 'MM/DD/YYYY'), 'ORD', 'PHL', 'Y');
insert into reservation values('00196', '044815309', 241, '4752445326795266', to_date('10/13/2016', 'MM/DD/YYYY'), 'DFW', 'MSP', 'Y');
insert into reservation values('00197', '655209852', 225, '1806996998822748', to_date('04/01/2015', 'MM/DD/YYYY'), 'SFO', 'DEN', 'N');
insert into reservation values('00198', '827643735', 290, '8957002782632114', to_date('12/13/2016', 'MM/DD/YYYY'), 'ATL', 'PHX', 'Y');
insert into reservation values('00199', '975437112', 292, '9549711671896132', to_date('01/12/2015', 'MM/DD/YYYY'), 'DEN', 'ORD', 'Y');
insert into reservation values('00200', '734036121', 243, '3069146691426388', to_date('09/16/2016', 'MM/DD/YYYY'), 'LAX', 'LAS', 'N');
insert into reservation values('00201', '000169100', 233, '5982520582435285', to_date('12/05/2016', 'MM/DD/YYYY'), 'PHX', 'SEA', 'Y');
insert into reservation values('00202', '005218189', 293, '2671280836766098', to_date('06/29/2015', 'MM/DD/YYYY'), 'MCO', 'ATL', 'Y');
insert into reservation values('00203', '437358274', 227, '5247188150778519', to_date('06/05/2015', 'MM/DD/YYYY'), 'CLT', 'MCO', 'Y');
insert into reservation values('00204', '799679597', 280, '1025620644047638', to_date('05/22/2016', 'MM/DD/YYYY'), 'DFW', 'MIA', 'Y');
insert into reservation values('00205', '937413879', 225, '4502332468872346', to_date('12/30/2015', 'MM/DD/YYYY'), 'JFK', 'LAX', 'Y');
insert into reservation values('00206', '803972516', 226, '9410849182449467', to_date('08/26/2016', 'MM/DD/YYYY'), 'LAS', 'MSP', 'Y');
insert into reservation values('00207', '241137861', 279, '1821784755440719', to_date('02/08/2016', 'MM/DD/YYYY'), 'MSP', 'PHX', 'Y');
insert into reservation values('00208', '535374855', 256, '4934620052685782', to_date('09/14/2015', 'MM/DD/YYYY'), 'SFO', 'LAS', 'N');
insert into reservation values('00209', '245826092', 212, '3593672160811790', to_date('06/13/2016', 'MM/DD/YYYY'), 'IAH', 'LAS', 'Y');
insert into reservation values('00210', '823383916', 298, '5463301179603301', to_date('07/10/2015', 'MM/DD/YYYY'), 'BOS', 'DFW', 'Y');
insert into reservation values('00211', '099883738', 234, '7542828453632217', to_date('08/30/2016', 'MM/DD/YYYY'), 'DTW', 'BOS', 'Y');
insert into reservation values('00212', '940008409', 279, '2803600632692308', to_date('09/29/2016', 'MM/DD/YYYY'), 'MIA', 'SEA', 'Y');
insert into reservation values('00213', '503467725', 251, '5613257479580471', to_date('05/19/2016', 'MM/DD/YYYY'), 'PHL', 'DFW', 'Y');
insert into reservation values('00214', '211127022', 222, '4142474654768159', to_date('05/02/2015', 'MM/DD/YYYY'), 'SEA', 'MCO', 'Y');
insert into reservation values('00215', '681854013', 236, '8932547910029121', to_date('07/18/2016', 'MM/DD/YYYY'), 'ATL', 'LAX', 'Y');
insert into reservation values('00216', '069895990', 267, '2829273792973819', to_date('09/18/2016', 'MM/DD/YYYY'), 'LGA', 'CLT', 'Y');
insert into reservation values('00217', '512300405', 269, '1948874127498468', to_date('12/13/2016', 'MM/DD/YYYY'), 'EWR', 'IAH', 'Y');
insert into reservation values('00218', '389820653', 258, '3675507446671692', to_date('04/11/2015', 'MM/DD/YYYY'), 'DEN', 'MSP', 'Y');
insert into reservation values('00219', '677214712', 223, '7086500829214752', to_date('10/26/2015', 'MM/DD/YYYY'), 'ORD', 'DTW', 'Y');
insert into reservation values('00220', '485353537', 299, '1666183329601255', to_date('03/11/2015', 'MM/DD/YYYY'), 'MCO', 'MIA', 'Y');
insert into reservation values('00221', '512300405', 218, '1948874127498468', to_date('04/28/2016', 'MM/DD/YYYY'), 'BOS', 'EWR', 'Y');
insert into reservation values('00222', '878581803', 248, '3178071959529148', to_date('10/21/2016', 'MM/DD/YYYY'), 'ATL', 'SEA', 'Y');
insert into reservation values('00223', '441586034', 215, '2555225264001183', to_date('07/08/2015', 'MM/DD/YYYY'), 'SEA', 'IAH', 'Y');
insert into reservation values('00224', '607981624', 222, '7008813286111441', to_date('08/06/2015', 'MM/DD/YYYY'), 'IAH', 'MIA', 'Y');
insert into reservation values('00225', '241137861', 202, '1821784755440719', to_date('03/14/2015', 'MM/DD/YYYY'), 'CLT', 'PHX', 'Y');
insert into reservation values('00226', '522298615', 209, '5966648024279991', to_date('06/06/2016', 'MM/DD/YYYY'), 'LAS', 'DEN', 'Y');
insert into reservation values('00227', '346439992', 237, '9757237542937578', to_date('04/22/2016', 'MM/DD/YYYY'), 'PHX', 'MCO', 'Y');
insert into reservation values('00228', '333820028', 251, '9277378734998449', to_date('01/03/2016', 'MM/DD/YYYY'), 'LGA', 'PHL', 'Y');
insert into reservation values('00229', '559139624', 243, '5474432624517607', to_date('11/03/2016', 'MM/DD/YYYY'), 'MIA', 'SFO', 'Y');
insert into reservation values('00230', '916431649', 250, '9421987667168226', to_date('04/11/2015', 'MM/DD/YYYY'), 'JFK', 'BOS', 'N');
insert into reservation values('00231', '948596499', 242, '7435534710574565', to_date('04/23/2015', 'MM/DD/YYYY'), 'DTW', 'LGA', 'Y');
insert into reservation values('00232', '076279338', 288, '5056995166638032', to_date('02/27/2016', 'MM/DD/YYYY'), 'MSP', 'DEN', 'Y');
insert into reservation values('00233', '803972516', 283, '9410849182449467', to_date('02/03/2016', 'MM/DD/YYYY'), 'DFW', 'PHL', 'Y');
insert into reservation values('00234', '695052883', 202, '3635845493608133', to_date('06/14/2015', 'MM/DD/YYYY'), 'EWR', 'ATL', 'Y');
insert into reservation values('00235', '292995632', 225, '8345851277455064', to_date('01/22/2016', 'MM/DD/YYYY'), 'SFO', 'EWR', 'Y');
insert into reservation values('00236', '541644681', 259, '3938574621695295', to_date('05/03/2015', 'MM/DD/YYYY'), 'LAX', 'SFO', 'Y');
insert into reservation values('00237', '064626778', 227, '1075225832998379', to_date('02/04/2015', 'MM/DD/YYYY'), 'PHL', 'MSP', 'Y');
insert into reservation values('00238', '835522278', 295, '3926718664648241', to_date('07/27/2016', 'MM/DD/YYYY'), 'ORD', 'CLT', 'Y');
insert into reservation values('00239', '513958766', 281, '9305418453068164', to_date('06/28/2016', 'MM/DD/YYYY'), 'DEN', 'PHL', 'Y');
insert into reservation values('00240', '839168238', 209, '9219944977358431', to_date('10/11/2015', 'MM/DD/YYYY'), 'SFO', 'JFK', 'Y');
insert into reservation values('00241', '702121112', 237, '7800207770280064', to_date('10/17/2015', 'MM/DD/YYYY'), 'EWR', 'CLT', 'N');
insert into reservation values('00242', '588855965', 284, '6699993543410734', to_date('02/04/2015', 'MM/DD/YYYY'), 'IAH', 'DTW', 'Y');
insert into reservation values('00243', '609224582', 219, '5362764729419569', to_date('07/24/2016', 'MM/DD/YYYY'), 'JFK', 'DTW', 'Y');
insert into reservation values('00244', '430172894', 285, '1648989326298575', to_date('12/28/2015', 'MM/DD/YYYY'), 'ATL', 'PHL', 'N');
insert into reservation values('00245', '842399847', 275, '7131720974652720', to_date('08/23/2016', 'MM/DD/YYYY'), 'ORD', 'MSP', 'Y');
insert into reservation values('00246', '728944307', 226, '4253086735269476', to_date('11/01/2015', 'MM/DD/YYYY'), 'SEA', 'DTW', 'Y');
insert into reservation values('00247', '655209852', 277, '1806996998822748', to_date('06/03/2016', 'MM/DD/YYYY'), 'MSP', 'ATL', 'Y');
insert into reservation values('00248', '980868245', 277, '2847140034936343', to_date('03/30/2015', 'MM/DD/YYYY'), 'PHL', 'LGA', 'Y');
insert into reservation values('00249', '682459806', 203, '8831332932897091', to_date('06/20/2016', 'MM/DD/YYYY'), 'DTW', 'JFK', 'Y');
insert into reservation values('00250', '047686725', 254, '5404510461415169', to_date('06/16/2016', 'MM/DD/YYYY'), 'DEN', 'ATL', 'Y');
insert into reservation values('00251', '540136815', 266, '4926498495727527', to_date('04/25/2015', 'MM/DD/YYYY'), 'BOS', 'IAH', 'Y');
insert into reservation values('00252', '975437112', 243, '9549711671896132', to_date('11/02/2016', 'MM/DD/YYYY'), 'LAX', 'SEA', 'Y');
insert into reservation values('00253', '065138982', 273, '5297533356046253', to_date('07/09/2016', 'MM/DD/YYYY'), 'LAS', 'SFO', 'Y');
insert into reservation values('00254', '462231604', 236, '9689970682258009', to_date('10/09/2015', 'MM/DD/YYYY'), 'LGA', 'SFO', 'Y');
insert into reservation values('00255', '421396222', 274, '4167330172642269', to_date('08/27/2015', 'MM/DD/YYYY'), 'MIA', 'JFK', 'Y');
insert into reservation values('00256', '556781225', 216, '7665846160031553', to_date('07/18/2015', 'MM/DD/YYYY'), 'CLT', 'EWR', 'Y');
insert into reservation values('00257', '572723715', 221, '4297678776294822', to_date('04/03/2015', 'MM/DD/YYYY'), 'DFW', 'LAX', 'Y');
insert into reservation values('00258', '938642591', 246, '4465277614689601', to_date('03/02/2016', 'MM/DD/YYYY'), 'PHX', 'SFO', 'Y');
insert into reservation values('00259', '744202758', 213, '6544878526228429', to_date('04/18/2016', 'MM/DD/YYYY'), 'MCO', 'EWR', 'Y');
insert into reservation values('00260', '396245593', 203, '8728875842988214', to_date('12/02/2016', 'MM/DD/YYYY'), 'EWR', 'DFW', 'Y');
insert into reservation values('00261', '019619898', 288, '2183005969403234', to_date('06/19/2015', 'MM/DD/YYYY'), 'LGA', 'SEA', 'Y');
insert into reservation values('00262', '647078066', 294, '2141126616370239', to_date('03/18/2015', 'MM/DD/YYYY'), 'ATL', 'DFW', 'Y');
insert into reservation values('00263', '287783752', 209, '5198749096861759', to_date('03/06/2015', 'MM/DD/YYYY'), 'DEN', 'LGA', 'Y');
insert into reservation values('00264', '702121112', 218, '7800207770280064', to_date('07/01/2016', 'MM/DD/YYYY'), 'CLT', 'ORD', 'Y');
insert into reservation values('00265', '652552938', 212, '6907472375769657', to_date('04/25/2015', 'MM/DD/YYYY'), 'MCO', 'BOS', 'Y');
insert into reservation values('00266', '410709438', 240, '1891714215954422', to_date('03/15/2015', 'MM/DD/YYYY'), 'LAS', 'LGA', 'Y');
insert into reservation values('00267', '772550346', 202, '4787411435096659', to_date('08/29/2015', 'MM/DD/YYYY'), 'MSP', 'DFW', 'N');
insert into reservation values('00268', '563329299', 222, '9053898698770807', to_date('11/24/2016', 'MM/DD/YYYY'), 'LAX', 'MIA', 'Y');
insert into reservation values('00269', '117069523', 242, '7903044332117935', to_date('11/19/2016', 'MM/DD/YYYY'), 'DTW', 'LAS', 'Y');
insert into reservation values('00270', '587665135', 286, '6781291337541097', to_date('06/09/2016', 'MM/DD/YYYY'), 'SEA', 'BOS', 'Y');
insert into reservation values('00271', '991439449', 250, '1960641863172072', to_date('03/23/2015', 'MM/DD/YYYY'), 'PHX', 'LAX', 'Y');
insert into reservation values('00272', '811862332', 224, '6800390184429557', to_date('12/25/2016', 'MM/DD/YYYY'), 'DFW', 'IAH', 'Y');
insert into reservation values('00273', '316044623', 235, '9340051676161355', to_date('10/13/2016', 'MM/DD/YYYY'), 'BOS', 'EQR', 'Y');
insert into reservation values('00274', '938642591', 251, '4465277614689601', to_date('04/17/2016', 'MM/DD/YYYY'), 'MIA', 'DTW', 'Y');
insert into reservation values('00275', '493230818', 300, '9891574976034119', to_date('08/28/2016', 'MM/DD/YYYY'), 'JFK', 'DEN', 'Y');
insert into reservation values('00276', '626818596', 254, '9585959966374964', to_date('05/22/2016', 'MM/DD/YYYY'), 'IAH', 'JFK', 'Y');
insert into reservation values('00277', '482126047', 249, '9709562643272737', to_date('11/16/2015', 'MM/DD/YYYY'), 'ORD', 'JFK', 'Y');
insert into reservation values('00278', '065138982', 275, '5297533356046253', to_date('06/19/2015', 'MM/DD/YYYY'), 'PHL', 'LAX', 'Y');
insert into reservation values('00279', '027674342', 280, '8546353822058733', to_date('03/10/2015', 'MM/DD/YYYY'), 'SFO', 'LGA', 'Y');
insert into reservation values('00280', '089759674', 287, '2594706342048375', to_date('12/07/2015', 'MM/DD/YYYY'), 'CLT', 'ATL', 'Y');
insert into reservation values('00281', '603344158', 258, '5909425282632267', to_date('08/01/2015', 'MM/DD/YYYY'), 'JFK', 'LAS', 'Y');
insert into reservation values('00282', '980868245', 280, '2847140034936343', to_date('10/06/2015', 'MM/DD/YYYY'), 'LAX', 'DEN', 'Y');
insert into reservation values('00283', '596958885', 248, '2095425138131365', to_date('11/06/2015', 'MM/DD/YYYY'), 'SEA', 'PHX', 'Y');
insert into reservation values('00284', '681854013', 284, '8932547910029121', to_date('01/29/2015', 'MM/DD/YYYY'), 'MSP', 'ORD', 'Y');
insert into reservation values('00285', '743420277', 243, '4900631530680262', to_date('11/29/2015', 'MM/DD/YYYY'), 'IAH', 'MCO', 'Y');
insert into reservation values('00286', '361054063', 252, '1140117927331712', to_date('04/04/2016', 'MM/DD/YYYY'), 'LGA', 'MIA', 'N');
insert into reservation values('00287', '743260368', 201, '4603663089297520', to_date('03/05/2016', 'MM/DD/YYYY'), 'LAS', 'ORD', 'Y');
insert into reservation values('00288', '655989783', 252, '9826297317611262', to_date('06/05/2016', 'MM/DD/YYYY'), 'BOS', 'CLT', 'Y');
insert into reservation values('00289', '662118356', 241, '4131806611151979', to_date('03/27/2016', 'MM/DD/YYYY'), 'MCO', 'ORD', 'Y');
insert into reservation values('00290', '135922451', 209, '8239436247204045', to_date('04/25/2015', 'MM/DD/YYYY'), 'MIA', 'PHX', 'Y');
insert into reservation values('00291', '793380767', 212, '6702259620990131', to_date('01/01/2016', 'MM/DD/YYYY'), 'PHL', 'BOS', 'Y');
insert into reservation values('00292', '799420182', 230, '7498128161999310', to_date('06/03/2015', 'MM/DD/YYYY'), 'EWR', 'MCO', 'Y');
insert into reservation values('00293', '603687436', 223, '2551121947318015', to_date('06/27/2016', 'MM/DD/YYYY'), 'PHX', 'CLT', 'Y');
insert into reservation values('00294', '123456789', 295, '7050194499100249', to_date('01/22/2015', 'MM/DD/YYYY'), 'DTW', 'IAH', 'Y');
insert into reservation values('00295', '948596499', 279, '7435534710574565', to_date('08/04/2015', 'MM/DD/YYYY'), 'ORD', 'PHL', 'Y');
insert into reservation values('00296', '044815309', 241, '4752445326795266', to_date('10/22/2016', 'MM/DD/YYYY'), 'DFW', 'MSP', 'Y');
insert into reservation values('00297', '047686725', 225, '5404510461415169', to_date('05/07/2016', 'MM/DD/YYYY'), 'SFO', 'DEN', 'Y');
insert into reservation values('00298', '964999489', 290, '9547273870991315', to_date('08/01/2016', 'MM/DD/YYYY'), 'ATL', 'PHX', 'Y');
insert into reservation values('00299', '361217343', 292, '3008311844040642', to_date('05/25/2016', 'MM/DD/YYYY'), 'DEN', 'ORD', 'Y');


/* DETAILS
*** generated as stated below except for details relating to reservations 00000-00009 which were created maually
Detail(reservation_number, flight_number, flight_date, leg)
	reservation_number varchar(5) -> reservation.reservation_number = maches reservation number
	flight_number varchar(3) -> flight.flight_number = matches flight number of above reservation
	flight_date date = same year and month as reservation, but on the last day of the month. This means that people could have reserved same day to a month in advance
	leg int -> 0, +1 for consecutive legs = set as leg 0

*one way or round trip: 0 or 1 connections for each direction (1-2 legs direct, 2-4 legs round trip)
*reservation detail contains full trip, including round trip */

-- 1 one-way: 2 leg
-- [LAX > LAS > MSP] SAME DAY
insert into detail values('00000', '000', to_date('12/25/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00000', '006', to_date('12/25/2016', 'MM/DD/YYYY'), 1);
-- [LAX > LAS > DEN] DIFFERENT DAY
insert into detail values('00001', '000', to_date('11/01/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00001', '026', to_date('11/02/2015', 'MM/DD/YYYY'), 1);

-- 2 roundtrip: 1 leg there, 1 leg back
-- [JFK > DTW > JFK] SAME DAY
insert into detail values('00002', '004', to_date('03/05/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00002', '009', to_date('03/05/2015', 'MM/DD/YYYY'), 1);
-- [JFK > DTW > JFK] DIFFERENT DAY
insert into detail values('00003', '004', to_date('04/28/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00003', '009', to_date('04/29/2016', 'MM/DD/YYYY'), 1);

-- 4 roundtrip: 1 leg there, 2 legs back
-- [JFK > DTW > IAH > JFK] SAME DAY FIRST LEG, SAME DAY SECOND LEG
insert into detail values('00004', '004', to_date('03/20/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00004', '094', to_date('03/20/2015', 'MM/DD/YYYY'), 1);
insert into detail values('00004', '076', to_date('03/20/2015', 'MM/DD/YYYY'), 2);
-- [JFK > DTW > IAH > JFK] SAME DAY FIRST LEG, DIFFERENT DAY SECOND LEG
insert into detail values('00005', '004', to_date('01/20/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00005', '094', to_date('01/20/2015', 'MM/DD/YYYY'), 1);
insert into detail values('00005', '076', to_date('01/21/2015', 'MM/DD/YYYY'), 2);
-- [JFK > DTW > IAH > JFK] DIFFERENT DAY FIRST LEG, SAME DAY SECOND LEG
insert into detail values('00006', '004', to_date('07/20/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00006', '094', to_date('07/21/2016', 'MM/DD/YYYY'), 1);
insert into detail values('00006', '076', to_date('07/21/2016', 'MM/DD/YYYY'), 2);
-- [JFK > DTW > IAH > JFK] DIFFERENT DAY FIRST LEG, DIFFERENT DAY SECOND LEG
insert into detail values('00007', '004', to_date('04/15/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00007', '094', to_date('04/16/2016', 'MM/DD/YYYY'), 1);
insert into detail values('00007', '076', to_date('04/17/2016', 'MM/DD/YYYY'), 2);

-- 2 roundtrip: 2 legs there, 2 legs back
-- [LAX > LAS > SFO > JFK > LAX] SAME DAY FULL
insert into detail values('00008', '000', to_date('04/20/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00008', '053', to_date('04/20/2015', 'MM/DD/YYYY'), 1);
insert into detail values('00008', '040', to_date('04/20/2015', 'MM/DD/YYYY'), 2);
insert into detail values('00008', '005', to_date('04/20/2015', 'MM/DD/YYYY'), 3);
-- [LAX > LAS > SFO > JFK > LAX] DIFFERENT DAY FULL
insert into detail values('00009', '000', to_date('08/01/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00009', '053', to_date('08/02/2015', 'MM/DD/YYYY'), 1);
insert into detail values('00009', '040', to_date('08/03/2015', 'MM/DD/YYYY'), 2);
insert into detail values('00009', '005', to_date('08/04/2015', 'MM/DD/YYYY'), 3);

-- 190 one-way: 1 leg
insert into detail values('00010', '010', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00011', '011', to_date('10/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00012', '012', to_date('09/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00013', '013', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00014', '014', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00015', '015', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00016', '016', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00017', '017', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00018', '018', to_date('12/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00019', '019', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00020', '020', to_date('12/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00021', '021', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00022', '022', to_date('08/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00023', '023', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00024', '024', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00025', '025', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00026', '026', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00027', '027', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00028', '028', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00029', '029', to_date('05/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00030', '030', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00031', '031', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00032', '032', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00033', '033', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00034', '034', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00035', '035', to_date('02/28/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00036', '036', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00037', '037', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00038', '038', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00039', '039', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00040', '040', to_date('12/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00041', '041', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00042', '042', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00043', '043', to_date('12/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00044', '044', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00045', '045', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00046', '046', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00047', '047', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00048', '048', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00049', '049', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00050', '050', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00051', '051', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00052', '052', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00053', '053', to_date('05/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00054', '054', to_date('10/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00055', '055', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00056', '056', to_date('09/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00057', '057', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00058', '058', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00059', '059', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00060', '060', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00061', '061', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00062', '062', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00063', '063', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00064', '064', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00065', '065', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00066', '066', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00067', '067', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00068', '068', to_date('05/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00069', '069', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00070', '070', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00071', '071', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00072', '072', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00073', '073', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00074', '074', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00075', '075', to_date('12/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00076', '076', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00077', '077', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00078', '078', to_date('02/28/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00079', '079', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00080', '080', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00081', '081', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00082', '082', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00083', '083', to_date('05/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00084', '084', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00085', '085', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00086', '086', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00087', '087', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00088', '088', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00089', '089', to_date('05/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00090', '090', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00091', '091', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00092', '092', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00093', '093', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00094', '094', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00095', '095', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00096', '096', to_date('02/28/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00097', '097', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00098', '098', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00099', '099', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00100', '000', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00101', '001', to_date('05/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00102', '002', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00103', '003', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00104', '004', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00105', '005', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00106', '006', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00107', '007', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00108', '008', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00109', '009', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00110', '010', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00111', '011', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00112', '012', to_date('08/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00113', '013', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00114', '014', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00115', '015', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00116', '016', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00117', '017', to_date('12/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00118', '018', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00119', '019', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00120', '020', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00121', '021', to_date('10/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00122', '022', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00123', '023', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00124', '024', to_date('02/28/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00125', '025', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00126', '026', to_date('08/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00127', '027', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00128', '028', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00129', '029', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00130', '030', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00131', '031', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00132', '032', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00133', '033', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00134', '034', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00135', '035', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00136', '036', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00137', '037', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00138', '038', to_date('08/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00139', '039', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00140', '040', to_date('08/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00141', '041', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00142', '042', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00143', '043', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00144', '044', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00145', '045', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00146', '046', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00147', '047', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00148', '048', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00149', '049', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00150', '050', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00151', '051', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00152', '052', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00153', '053', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00154', '054', to_date('02/28/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00155', '055', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00156', '056', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00157', '057', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00158', '058', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00159', '059', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00160', '060', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00161', '061', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00162', '062', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00163', '063', to_date('12/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00164', '064', to_date('10/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00165', '065', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00166', '066', to_date('02/28/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00167', '067', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00168', '068', to_date('05/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00169', '069', to_date('05/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00170', '070', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00171', '071', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00172', '072', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00173', '073', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00174', '074', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00175', '075', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00176', '076', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00177', '077', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00178', '078', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00179', '079', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00180', '080', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00181', '081', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00182', '082', to_date('09/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00183', '083', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00184', '084', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00185', '085', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00186', '086', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00187', '087', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00188', '088', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00189', '089', to_date('09/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00190', '090', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00191', '091', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00192', '092', to_date('09/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00193', '093', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00194', '094', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00195', '095', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00196', '096', to_date('10/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00197', '097', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00198', '098', to_date('12/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00199', '099', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00200', '000', to_date('09/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00201', '001', to_date('12/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00202', '002', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00203', '003', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00204', '004', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00205', '005', to_date('12/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00206', '006', to_date('08/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00207', '007', to_date('02/28/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00208', '008', to_date('09/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00209', '009', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00210', '010', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00211', '011', to_date('08/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00212', '012', to_date('09/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00213', '013', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00214', '014', to_date('05/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00215', '015', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00216', '016', to_date('09/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00217', '017', to_date('12/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00218', '018', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00219', '019', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00220', '020', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00221', '021', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00222', '022', to_date('10/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00223', '023', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00224', '024', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00225', '025', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00226', '026', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00227', '027', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00228', '028', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00229', '029', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00230', '030', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00231', '031', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00232', '032', to_date('02/28/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00233', '033', to_date('02/28/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00234', '034', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00235', '035', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00236', '036', to_date('05/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00237', '037', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00238', '038', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00239', '039', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00240', '040', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00241', '041', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00242', '042', to_date('02/28/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00243', '043', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00244', '044', to_date('12/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00245', '045', to_date('08/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00246', '046', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00247', '047', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00248', '048', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00249', '049', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00250', '050', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00251', '051', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00252', '052', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00253', '053', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00254', '054', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00255', '055', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00256', '056', to_date('07/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00257', '057', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00258', '058', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00259', '059', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00260', '060', to_date('12/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00261', '061', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00262', '062', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00263', '063', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00264', '064', to_date('07/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00265', '065', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00266', '066', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00267', '067', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00268', '068', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00269', '069', to_date('11/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00270', '070', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00271', '071', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00272', '072', to_date('12/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00273', '073', to_date('10/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00274', '074', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00275', '075', to_date('08/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00276', '076', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00277', '077', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00278', '078', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00279', '079', to_date('03/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00280', '080', to_date('12/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00281', '081', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00282', '082', to_date('10/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00283', '083', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00284', '084', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00285', '085', to_date('11/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00286', '086', to_date('04/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00287', '087', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00288', '088', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00289', '089', to_date('03/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00290', '090', to_date('04/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00291', '091', to_date('01/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00292', '092', to_date('06/30/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00293', '093', to_date('06/30/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00294', '094', to_date('01/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00295', '095', to_date('08/31/2015', 'MM/DD/YYYY'), 0);
insert into detail values('00296', '096', to_date('10/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00297', '097', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00298', '098', to_date('08/31/2016', 'MM/DD/YYYY'), 0);
insert into detail values('00299', '099', to_date('05/31/2016', 'MM/DD/YYYY'), 0);
