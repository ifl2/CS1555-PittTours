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

insert into airlines values('001', 'Airline001', 'AAA', 1900);
insert into airlines values('002', 'Airline002', 'AAB', 1910);
insert into airlines values('003', 'Airline003', 'AAC', 1920);
insert into airlines values('004', 'Airline004', 'AAD', 1930);
insert into airlines values('005', 'Airline005', 'AAE', 1940);
insert into airlines values('006', 'Airline006', 'AAF', 1950);
insert into airlines values('007', 'Airline007', 'AAG', 1960);
insert into airlines values('008', 'Airline008', 'AAH', 1970);
insert into airlines values('009', 'Airline009', 'AAI', 1980);
insert into airlines values('010', 'Airline010', 'AAJ', 1990);


/*
30 PLANES
Plane(plane type, manufacture, plane capacity, last service date, year, owner id)

plane type char(4) = generated manually (format is manufacturer+capacity)
manufacture varchar(10) = generated manually (manufacturer A to D)
plane capacity int = generated manually based on plane type
last service date = generated randomly (01/01/2010 to 12/31/2015)
year int = generated randomly (1950 to 2000)
owner id varchar(5) -> airlines.airlineid = generated randomly from airline_id

Here are example tuples:
B737 Boeing 125 09/09/2009 1996 001 */

insert into planes values('A100', 'ManufacturerA', 100, '02/17/2010', 1987, '010');
insert into planes values('A150', 'ManufacturerA', 150, '07/12/2010', 1978, '009');
insert into planes values('A200', 'ManufacturerA', 200, '07/21/2010', 1950, '009');
insert into planes values('A220', 'ManufacturerA', 220, '09/10/2010', 1978, '004');
insert into planes values('A230', 'ManufacturerA', 230, '10/01/2010', 1993, '005');
insert into planes values('A250', 'ManufacturerA', 250, '10/25/2010', 1953, '003');
insert into planes values('A280', 'ManufacturerA', 280, '02/17/2011', 1977, '002');
insert into planes values('A290', 'ManufacturerA', 290, '07/05/2011', 1974, '005');
insert into planes values('A300', 'ManufacturerA', 300, '09/05/2011', 1983, '007');
insert into planes values('A999', 'ManufacturerA', 999, '09/29/2011', 1988, '003');
insert into planes values('B050', 'ManufacturerB',  50, '01/28/2012', 1960, '002');
insert into planes values('B100', 'ManufacturerB', 100, '03/21/2012', 1968, '007');
insert into planes values('B120', 'ManufacturerB', 120, '11/08/2012', 1961, '008');
insert into planes values('B130', 'ManufacturerB', 130, '02/07/2013', 1987, '001');
insert into planes values('B140', 'ManufacturerB', 140, '02/19/2013', 1956, '001');
insert into planes values('B150', 'ManufacturerB', 150, '06/09/2013', 1958, '009');
insert into planes values('B170', 'ManufacturerB', 170, '11/03/2013', 1972, '004');
insert into planes values('B211', 'ManufacturerB', 211, '02/11/2014', 1996, '003');
insert into planes values('B222', 'ManufacturerB', 222, '08/06/2014', 1973, '004');
insert into planes values('B999', 'ManufacturerB', 999, '08/28/2014', 1970, '008');
insert into planes values('C020', 'ManufacturerC',  20, '10/24/2014', 1958, '006');
insert into planes values('C050', 'ManufacturerC',  50, '06/30/2015', 1951, '007');
insert into planes values('C070', 'ManufacturerC',  70, '07/12/2015', 1965, '007');
insert into planes values('C090', 'ManufacturerC',  90, '09/15/2015', 1976, '009');
insert into planes values('C100', 'ManufacturerC', 100, '12/10/2015', 1978, '006');
insert into planes values('C999', 'ManufacturerC', 999, '04/08/2010', 1951, '002');
insert into planes values('D100', 'ManufacturerD', 100, '07/11/2010', 1995, '001');
insert into planes values('D200', 'ManufacturerD', 200, '11/20/2012', 1951, '002');
insert into planes values('D300', 'ManufacturerD', 300, '10/20/2013', 1991, '002');
insert into planes values('D999', 'ManufacturerD', 999, '02/14/2015', 1984, '004');


/*
100 FLIGHTS
Flight(flight number, airline id, plane type, departure city, arrival city,departure time, arrival time, weekly schedule)

flight number varchar(3) = generated randomly as unique values (100 to 999)
airline id, varchar(5) -> airline.airlineid = generated randomly from airline_id (001 to 010)
plane type char(4) -> plane.planetype = generated randomly from planes
departure city varchar(3) -> 3 letter airport code = generated randomly as unique values of real airport abbreviations
arrival city varchar(3) -> 3 letter airport code = generated randomly as unique values of real airport abbreviations (with different arrival from departure)
departure time varchar(4) -> 0000 to 2359 = generated randomly (000 to 235), append 0
arrival time varchar(4) = generated randomly (000 to 235), append 0
weekly schedule varchar(7) = generated randomly with 25% chance of each day being a -

Here are example tuples:
153 001 A320 PIT JFK 1000 1120 SMTWTFS */

insert into flights values('692', '009', 'D200', 'BAK', 'WWD', '0590', '2220', "--TWTFS");
insert into flights values('591', '006', 'C020', 'SBA', 'HXD', '1800', '1670', "--TW--S");
insert into flights values('854', '007', 'B170', 'BWI', 'TRI', '1010', '0320', "SM-WTFS");
insert into flights values('937', '009', 'A220', 'LFT', 'MTM', '0900', '1740', "SMT-TFS");
insert into flights values('522', '001', 'A999', 'LEX', 'MCO', '2250', '0420', "-MTW--S");
insert into flights values('678', '001', 'B150', 'BRD', 'GEG', '2260', '1450', "SMTWTFS");
insert into flights values('239', '004', 'B211', 'SOW', 'SMX', '0650', '0110', "S--WTFS");
insert into flights values('519', '006', 'A250', 'WLK', 'HSV', '0580', '1020', "-MTWTF-");
insert into flights values('829', '009', 'D300', 'SMF', 'SLN', '1180', '0530', "SMTW-FS");
insert into flights values('992', '005', 'C050', 'WWD', 'LAF', '0850', '1350', "SMTWTFS");
insert into flights values('480', '005', 'A300', 'ROA', '2A3', '1210', '1980', "-MTWTFS");
insert into flights values('889', '007', 'A100', 'AUK', 'BRD', '2020', '1020', "-MTW-FS");
insert into flights values('386', '009', 'A200', 'GRR', 'SPI', '0940', '0070', "SMT-TFS");
insert into flights values('981', '001', 'A280', 'BNA', 'MTJ', '0560', '2250', "SMTWT-S");
insert into flights values('876', '006', 'D100', 'OFK', 'HPN', '0500', '0480', "SMTW--S");
insert into flights values('186', '003', 'C070', 'BOI', 'HOT', '0170', '1200', "SMTWTF-");
insert into flights values('928', '009', 'C090', 'RKS', 'VAK', '2350', '0580', "SMTW--S");
insert into flights values('346', '007', 'B140', 'MTH', 'BHB', '2320', '0140', "S-T--FS");
insert into flights values('740', '003', 'A150', 'APN', 'IAD', '1800', '1670', "SMTWT-S");
insert into flights values('348', '003', 'B100', 'PGM', 'GBD', '1210', '0770', "S-TWTFS");
insert into flights values('219', '008', 'A290', 'SUS', 'AIZ', '1450', '0590', "SMTW-FS");
insert into flights values('191', '002', 'C100', 'HSV', 'PLN', '0920', '0120', "S-TW-FS");
insert into flights values('235', '007', 'B222', 'SAF', 'IWA', '1490', '0510', "SMT--FS");
insert into flights values('336', '008', 'B120', 'MTM', 'LBF', '0970', '1450', "S--WTFS");
insert into flights values('224', '010', 'A230', 'INL', 'ROA', '0540', '2200', "-MTWTFS");
insert into flights values('746', '005', 'B130', 'SKX', 'TVL', '1910', '0660', "SMT-T-S");
insert into flights values('364', '003', 'B050', 'OKC', 'MBS', '1900', '0150', "SMTWTF-");
insert into flights values('831', '003', 'A200', 'HOT', 'KKA', '0830', '1710', "SMTWT--");
insert into flights values('497', '009', 'D300', 'BGM', 'LEB', '0060', '1900', "S-TWTFS");
insert into flights values('621', '002', 'A290', 'AGN', 'OKC', '0630', '1590', "SMTWTF-");
insert into flights values('528', '008', 'A230', 'OAJ', 'PBI', '1900', '1980', "SMTWTF-");
insert into flights values('246', '005', 'A280', 'GBD', 'SKX', '1530', '1680', "S-TWT-S");
insert into flights values('301', '008', 'B170', 'BLV', 'RWI', '0630', '2350', "SMTWTFS");
insert into flights values('338', '010', 'B222', 'RWI', 'YAK', '1500', '1500', "SMTW-FS");
insert into flights values('477', '007', 'C070', 'IXD', 'JVL', '0110', '0370', "--TWT--");
insert into flights values('215', '006', 'B211', 'SPI', 'KVL', '0840', '0230', "SMT-T--");
insert into flights values('232', '006', 'A150', 'STT', 'BOI', '2340', '1380', "-MTWTFS");
insert into flights values('646', '002', 'B120', 'WRL', 'LEX', '0850', '1000', "SMT-TFS");
insert into flights values('806', '010', 'C090', 'TVL', 'LAR', '1780', '0370', "SMT-TFS");
insert into flights values('151', '009', 'D200', 'TWF', 'SBA', '0070', '1510', "S-T-TFS");
insert into flights values('254', '010', 'A100', 'LEB', 'BGM', '1460', '0330', "S-TWT-S");
insert into flights values('830', '007', 'A250', 'TYR', 'LAA', '0910', '0000', "-MT--FS");
insert into flights values('690', '004', 'A999', 'BHB', 'PHL', '1600', '0430', "SM--T-S");
insert into flights values('880', '009', 'B050', 'SMX', 'ILE', '1300', '0730', "SMTWTF-");
insert into flights values('998', '008', 'D100', 'ORV', 'INL', '1940', '0680', "-MT-TFS");
insert into flights values('216', '003', 'B100', 'LAR', 'PGM', '0140', '1540', "SMT-TFS");
insert into flights values('727', '006', 'A220', 'ILG', 'IXD', '2280', '0760', "SM-WTFS");
insert into flights values('533', '002', 'B130', 'LHD', 'IMT', '0410', '0690', "S-TW-FS");
insert into flights values('570', '008', 'C050', 'EKO', 'OAJ', '0410', '2020', "S-TW-FS");
insert into flights values('574', '004', 'A300', 'IAD', 'SAF', '1660', '0740', "-MT--FS");
insert into flights values('147', '010', 'C100', 'KVL', 'SDP', '0970', '2170', "SM-WTFS");
insert into flights values('669', '010', 'B140', 'AGS', 'SHG', '0230', '0880', "--TWT-S");
insert into flights values('452', '008', 'C020', 'JVL', 'AUK', '2170', '1100', "S--W--S");
insert into flights values('699', '005', 'B150', 'PAH', 'MSY', '0810', '1240', "SM--T-S");
insert into flights values('321', '005', 'D200', 'LIT', 'STT', '2030', '1770', "SMTWTF-");
insert into flights values('846', '004', 'A280', 'SUN', 'AGS', '1060', '0980', "SMT--F-");
insert into flights values('149', '010', 'A220', 'SDP', 'SUN', '0680', '1030', "----TF-");
insert into flights values('475', '003', 'B100', 'MSY', 'BRO', '2040', '0820', "SM-WTF-");
insert into flights values('921', '008', 'C090', 'Z08', 'BNA', '1860', '0180', "SMTW-FS");
insert into flights values('453', '001', 'A100', 'IMT', 'OFK', '1110', '2120', "SMTW--S");
insert into flights values('729', '010', 'B120', 'HSL', 'SMF', '0110', '0460', "SMT---S");
insert into flights values('217', '003', 'B130', 'LAA', 'RHI', '1470', '1200', "SMT-TFS");
insert into flights values('412', '009', 'A150', 'IRK', 'ILG', '1270', '0540', "-MTWT-S");
insert into flights values('180', '010', 'A200', 'CVO', 'PAH', '0620', '0670', "SMTWTFS");
insert into flights values('500', '001', 'B150', 'VAK', 'BLV', '0730', '2240', "SMTWTFS");
insert into flights values('590', '002', 'C070', 'SBN', 'CWI', '0890', '2160', "S-TWTFS");
insert into flights values('103', '008', 'B050', 'YAK', 'IRK', '1970', '2230', "-M---FS");
insert into flights values('237', '007', 'D300', '2A3', 'YNG', '2170', '2340', "SMTWT-S");
insert into flights values('138', '008', 'B170', 'HPN', 'A61', '2280', '1320', "SMT--FS");
insert into flights values('947', '009', 'A250', '74S', 'UIN', '1250', '2350', "S-T-TFS");
insert into flights values('994', '007', 'A290', 'CWI', 'LFT', '2010', '1970', "SMTWT--");
insert into flights values('565', '004', 'B211', 'RHI', 'CVO', '2130', '2230', "SM-WTFS");
insert into flights values('432', '005', 'A999', 'IWA', 'MGW', '0850', '1600', "-M-WTFS");
insert into flights values('773', '006', 'D100', 'PBI', 'RKS', '0120', '2060', "-MTWTFS");
insert into flights values('573', '004', 'B222', 'PLN', 'TEB', '1850', '1870', "S-TWTF-");
insert into flights values('681', '007', 'C020', 'LBF', 'GSP', '0360', '1060', "-M--TFS");
insert into flights values('320', '004', 'C050', 'GSP', 'LIT', '1860', '1780', "SMTWTFS");
insert into flights values('341', '007', 'C100', 'ILE', '74S', '1600', '0480', "-MTWTF-");
insert into flights values('970', '008', 'A230', 'BRO', 'SOW', '1990', '0140', "SM-WTFS");
insert into flights values('503', '002', 'A300', 'MGW', 'WRL', '1660', '0690', "--TWT-S");
insert into flights values('397', '003', 'B140', 'FHR', 'MTH', '1910', '0100', "-MT-TF-");
insert into flights values('511', '008', 'C090', 'MBS', 'Z08', '1820', '0300', "SMTWT-S");
insert into flights values('407', '009', 'B222', 'CEZ', 'BWI', '1010', '0130', "-MTWTF-");
insert into flights values('618', '006', 'A230', 'LAF', 'LHD', '2160', '2160', "SMTWTFS");
insert into flights values('633', '007', 'D300', 'MCO', 'WLK', '0970', '1820', "S-TWTFS");
insert into flights values('437', '003', 'A300', 'YNG', 'BAK', '1180', '2080', "-M---FS");
insert into flights values('295', '003', 'A290', 'HXD', 'ORV', '2070', '2190', "SMTWT-S");
insert into flights values('488', '003', 'A200', 'MTJ', 'TWF', '1120', '0040', "SMTW-F-");
insert into flights values('262', '005', 'B140', 'SLN', 'TYR', '1490', '1220', "S---T-S");
insert into flights values('516', '006', 'B170', 'UIN', 'SJC', '1810', '0890', "--TWTFS");
insert into flights values('294', '010', 'A220', 'SJC', 'GRR', '2320', '2150', "SMTW-F-");
insert into flights values('199', '008', 'D200', 'JXN', 'EKO', '0250', '0060', "SMTW-FS");
insert into flights values('941', '009', 'B120', 'KKA', 'HSL', '1510', '0460', "SM---FS");
insert into flights values('654', '008', 'A100', 'GEG', 'SUS', '1090', '1640', "S-T-TFS");
insert into flights values('807', '005', 'A999', 'PHL', 'AGN', '1830', '0520', "SMTWTFS");
insert into flights values('929', '004', 'B050', 'A61', 'SBN', '2070', '0590', "--TWTFS");
insert into flights values('893', '005', 'C100', 'TRI', 'JXN', '2340', '1130', "SMTWT-S");
insert into flights values('399', '001', 'A280', 'AIZ', 'CEZ', '0980', '2060', "---WTFS");
insert into flights values('515', '007', 'B130', 'SHG', 'APN', '0680', '0730', "SMTWTFS");
insert into flights values('868', '010', 'A280', 'TEB', 'FHR', '1980', '2280', "-MT--FS");


/*
200 USERS
Customer(cid, salutation, first name, last name, credit card num, street, credit card expire, city, state, phone, email)

cid varchar(9) = generated randomly as unique values of length=9
salutation varchar(3) -> Mr, Mrs, Ms = females generated randomly between Mrs and Ms, males set to Mr
first name varchar(30) = generated randomly, 100 males and 100 females
last name varchar(30) = generated randomly
credit card num varchar(16) = generated randomly as unique values of length=16
credit card expire date = generated randomly (01/2016 to 12/2020)
street varchar(30) = generated as street + first 2 digits of cid
city varchar(30) = generated randomly from the top 50 US cities by population
state varchar(2) = matches state of city
phone varchar(10) = generated randomly of length=7, prefix by 555
email varchar(30) = generated as first 2 letters of first name + first 2 letters of last name + last 2 digits of cid + @gmail.com
frequent miles varchar(5) -> null or airline id = generated randomly from airlines (001 to 010) with 50% chance of null */

insert into customer values('572723715',  'Mr', 'Theron',     'Broadwa',     '4297678776294822', '07/2016', 'Street57', 'Omaha',            'NE', '5555816834', 'ThBr15@gmail.com', 'null');
insert into customer values('047686725',  'Mr', 'Trinidad',   'Fasano',      '5404510461415169', '05/2018', 'Street04', 'Atlanta',          'GA', '5553673646', 'TrFa25@gmail.com', 'null');
insert into customer values('117069523',  'Mr', 'Ezequiel',   'Coco',        '7903044332117935', '05/2020', 'Street11', 'Baltimore',        'MD', '5556700617', 'EzCo23@gmail.com', '008' );
insert into customer values('496499705',  'Mr', 'Shirley',    'Topper',      '7203376066184929', '10/2018', 'Street49', 'Washington',       'DC', '5554689426', 'ShTo05@gmail.com', '005' );
insert into customer values('744202758',  'Mr', 'Edison',     'Shireman',    '6544878526228429', '10/2016', 'Street74', 'Mesa',             'AZ', '5559944096', 'EdSh58@gmail.com', 'null');
insert into customer values('806864707',  'Mr', 'Seth',       'Hardie',      '9511289760767009', '07/2016', 'Street80', 'Arlington',        'TX', '5557857418', 'SeHa07@gmail.com', 'null');
insert into customer values('563329299',  'Mr', 'Chris',      'Fisler',      '9053898698770807', '01/2020', 'Street56', 'San Jose',         'CA', '5553709560', 'ChFi99@gmail.com', '002' );
insert into customer values('702121112',  'Mr', 'Gregorio',   'Philippe',    '7800207770280064', '03/2020', 'Street70', 'Jacksonville',     'FL', '5559588226', 'GrPh12@gmail.com', 'null');
insert into customer values('607981624',  'Mr', 'Darron',     'Trejo',       '7008813286111441', '10/2018', 'Street60', 'Charlotte',        'NC', '5551425563', 'DaTr24@gmail.com', 'null');
insert into customer values('421396222',  'Mr', 'Dexter',     'Ferro',       '4167330172642269', '09/2018', 'Street42', 'Indianapolis',     'IN', '5551472444', 'DeFe22@gmail.com', 'null');
insert into customer values('435756181',  'Mr', 'Rayford',    'Crouch',      '4938229136232376', '03/2018', 'Street43', 'Colorado Springs', 'CO', '5556369603', 'RaCr81@gmail.com', '005' );
insert into customer values('695052883',  'Mr', 'Derrick',    'Lydick',      '3635845493608133', '05/2019', 'Street69', 'Virginia Beach',   'VA', '5554799311', 'DeLy83@gmail.com', 'null');
insert into customer values('609224582',  'Mr', 'Randolph',   'Queen',       '5362764729419569', '10/2016', 'Street60', 'Austin',           'TX', '5555773077', 'RaQu82@gmail.com', 'null');
insert into customer values('959779967',  'Mr', 'Cristopher', 'Radosevich',  '4976672648895937', '09/2020', 'Street95', 'Oakland',          'CA', '5556302455', 'CrRa67@gmail.com', '009' );
insert into customer values('975437112',  'Mr', 'Floyd',      'Magwood',     '9549711671896132', '12/2020', 'Street97', 'Portland',         'OR', '5555506946', 'FlMa12@gmail.com', 'null');
insert into customer values('827643735',  'Mr', 'Seymour',    'Mattox',      '8957002782632114', '10/2016', 'Street82', 'Nashville',        'TN', '5558286490', 'SeMa35@gmail.com', 'null');
insert into customer values('005218189',  'Mr', 'Wilford',    'Fails',       '2671280836766098', '03/2019', 'Street00', 'Dallas',           'TX', '5556001862', 'WiFa89@gmail.com', 'null');
insert into customer values('599806989',  'Mr', 'Enoch',      'Wittenberg',  '7959376524393901', '05/2019', 'Street59', 'Miami',            'FL', '5558179816', 'EnWi89@gmail.com', 'null');
insert into customer values('803972516',  'Mr', 'Harris',     'Bame',        '9410849182449467', '07/2019', 'Street80', 'Houston',          'TX', '5552153245', 'HaBa16@gmail.com', 'null');
insert into customer values('485353537',  'Mr', 'Max',        'Lobaugh',     '1666183329601255', '07/2016', 'Street48', 'Seattle',          'WA', '5559772669', 'MaLo37@gmail.com', '008' );
insert into customer values('510956524',  'Mr', 'Mauro',      'Tewksbury',   '6057497854488507', '03/2019', 'Street51', 'San Francisco',    'CA', '5559394572', 'MaTe24@gmail.com', '003' );
insert into customer values('122855678',  'Mr', 'Robin',      'Bonn',        '6116998799698062', '05/2019', 'Street12', 'Boston',           'MA', '5557751291', 'RoBo78@gmail.com', '002' );
insert into customer values('492151602',  'Mr', 'Kory',       'Hobart',      '1257503582752954', '10/2019', 'Street49', 'Los Angeles',      'CA', '5555208169', 'KoHo02@gmail.com', 'null');
insert into customer values('333820028',  'Mr', 'Edgar',      'Dolan',       '9277378734998449', '06/2017', 'Street33', 'Sacramento',       'CA', '5552742033', 'EdDo28@gmail.com', '001' );
insert into customer values('315389743',  'Mr', 'Jamaal',     'Mersch',      '8246518713467860', '01/2016', 'Street31', 'Las Vegas',        'NV', '5551460351', 'JaMe43@gmail.com', 'null');
insert into customer values('652552938',  'Mr', 'Alec',       'Rattler',     '6907472375769657', '11/2016', 'Street65', 'Chicago',          'IL', '5557507402', 'AlRa38@gmail.com', '009' );
insert into customer values('141994383',  'Mr', 'Chong',      'Volker',      '9785217322057043', '02/2017', 'Street14', 'Kansas City',      'MO', '5559371826', 'ChVo83@gmail.com', '005' );
insert into customer values('677214712',  'Mr', 'Jonas',      'Giraldo',     '7086500829214752', '06/2018', 'Street67', 'Long Beach',       'CA', '5554227328', 'JoGi12@gmail.com', 'null');
insert into customer values('948596499',  'Mr', 'Markus',     'Cole',        '7435534710574565', '02/2016', 'Street94', 'Detroit',          'MI', '5559039088', 'MaCo99@gmail.com', '002' );
insert into customer values('410709438',  'Mr', 'Scottie',    'Fisch',       '1891714215954422', '11/2017', 'Street41', 'Minneapolis',      'MN', '5555506695', 'ScFi38@gmail.com', 'null');
insert into customer values('910900016',  'Mr', 'Reinaldo',   'Linthicum',   '9372115691960778', '07/2020', 'Street91', 'Philadelphia',     'PA', '5557555627', 'ReLi16@gmail.com', 'null');
insert into customer values('750670965',  'Mr', 'Bryant',     'Hougen',      '3740232255497666', '08/2019', 'Street75', 'Phoenix',          'AZ', '5557992033', 'BrHo65@gmail.com', '005' );
insert into customer values('859462681',  'Mr', 'Andreas',    'Nathanson',   '4858982142004045', '02/2019', 'Street85', 'Memphis',          'TN', '5558543206', 'AnNa81@gmail.com', 'null');
insert into customer values('057684994',  'Mr', 'Thomas',     'Morse',       '5536480731060912', '05/2018', 'Street05', 'Louisville',       'KY', '5553100248', 'ThMo94@gmail.com', '006' );
insert into customer values('430172894',  'Mr', 'Everett',    'Dixion',      '1648989326298575', '01/2017', 'Street43', 'New Orleans',      'LA', '5558148008', 'EvDi94@gmail.com', 'null');
insert into customer values('104805364',  'Mr', 'Antone',     'Ontiveros',   '1112934056273073', '03/2017', 'Street10', 'San Diego',        'CA', '5555817760', 'AnOn64@gmail.com', '008' );
insert into customer values('019619898',  'Mr', 'Freeman',    'Weitzel',     '2183005969403234', '05/2019', 'Street01', 'New York',         'NY', '5553085782', 'FrWe98@gmail.com', '005' );
insert into customer values('944199143',  'Mr', 'Edmundo',    'Lagos',       '8051511764477303', '10/2017', 'Street94', 'Denver',           'CO', '5555498469', 'EdLa43@gmail.com', '003' );
insert into customer values('823383916',  'Mr', 'Garth',      'Rapier',      '5463301179603301', '04/2017', 'Street82', 'Tulsa',            'OK', '5552345872', 'GaRa16@gmail.com', 'null');
insert into customer values('559139624',  'Mr', 'Logan',      'Hottle',      '5474432624517607', '05/2018', 'Street55', 'Oklahoma City',    'OK', '5553993728', 'LoHo24@gmail.com', 'null');
insert into customer values('655209852',  'Mr', 'Moises',     'Sikes',       '1806996998822748', '01/2018', 'Street65', 'Fort Worth',       'TX', '5557323695', 'MoSi52@gmail.com', 'null');
insert into customer values('245413592',  'Mr', 'Tory',       'Sammet',      '5914978986241013', '06/2020', 'Street24', 'Raleigh',          'NC', '5557284037', 'ToSa92@gmail.com', '002' );
insert into customer values('835666211',  'Mr', 'Vince',      'Stancill',    '7950542230006090', '09/2018', 'Street83', 'Milwaukee',        'WI', '5556369017', 'ViSt11@gmail.com', '004' );
insert into customer values('655989783',  'Mr', 'Alberto',    'Sinquefield', '9826297317611262', '09/2018', 'Street65', 'Fresno',           'CA', '5554374121', 'AlSi83@gmail.com', 'null');
insert into customer values('346439992',  'Mr', 'Franklyn',   'Tatem',       '9757237542937578', '11/2020', 'Street34', 'Albuquerque',      'NM', '5551635331', 'FrTa92@gmail.com', 'null');
insert into customer values('462231604',  'Mr', 'Edgardo',    'Treadwell',   '9689970682258009', '07/2019', 'Street46', 'El Paso',          'TX', '5552570100', 'EdTr04@gmail.com', 'null');
insert into customer values('528684751',  'Mr', 'Milford',    'Kinkead',     '5841137818503085', '09/2019', 'Street52', 'Tucson',           'AZ', '5556128748', 'MiKi51@gmail.com', '010' );
insert into customer values('473579802',  'Mr', 'Martin',     'Pinner',      '5622521417527406', '04/2018', 'Street47', 'Columbus',         'OH', '5553636778', 'MaPi02@gmail.com', 'null');
insert into customer values('841807618',  'Mr', 'Rocky',      'Heide',       '9688197662069657', '06/2020', 'Street84', 'Wichita',          'KS', '5554352528', 'RoHe18@gmail.com', 'null');
insert into customer values('842399847', 'Mrs', 'Lizbeth',    'Wendler',     '7131720974652720', '03/2017', 'Street84', 'San Antonio',      'TX', '5557924268', 'LiWe47@gmail.com', '004' );
insert into customer values('937413879',  'Ms', 'Diamond',    'Runkle',      '4502332468872346', '03/2017', 'Street93', 'Boston',           'MA', '5551457982', 'DiRu79@gmail.com', '003' );
insert into customer values('010463426', 'Mrs', 'Marilou',    'Halpin',      '2813288396818727', '09/2017', 'Street01', 'Fresno',           'CA', '5554602250', 'MaHa26@gmail.com', 'null');
insert into customer values('878581803', 'Mrs', 'Tiesha',     'Speece',      '3178071959529148', '08/2020', 'Street87', 'Tucson',           'AZ', '5556761902', 'TiSp03@gmail.com', '010' );
insert into customer values('821346916', 'Mrs', 'Sherita',    'Allgeier',    '5694015983779931', '03/2019', 'Street82', 'New Orleans',      'LA', '5557496672', 'ShAl16@gmail.com', 'null');
insert into customer values('495146877',  'Ms', 'Manie',      'Hasan',       '3854330056391653', '04/2020', 'Street49', 'Albuquerque',      'NM', '5554921888', 'MaHa77@gmail.com', 'null');
insert into customer values('513958766',  'Ms', 'Luci',       'Moton',       '9305418453068164', '07/2016', 'Street51', 'Minneapolis',      'MN', '5558248894', 'LuMo66@gmail.com', 'null');
insert into customer values('247591186', 'Mrs', 'Isidra',     'Carberry',    '6343594773653241', '12/2017', 'Street24', 'San Francisco',    'CA', '5555125954', 'IsCa86@gmail.com', '010' );
insert into customer values('044815309', 'Mrs', 'Belle',      'Pizer',       '4752445326795266', '04/2016', 'Street04', 'San Diego',        'CA', '5556415388', 'BePi09@gmail.com', '002' );
insert into customer values('743260368', 'Mrs', 'Shanice',    'Scheidt',     '4603663089297520', '12/2017', 'Street74', 'Los Angeles',      'CA', '5559601544', 'ShSc68@gmail.com', 'null');
insert into customer values('275550901',  'Ms', 'Daysi',      'Ohm',         '1378562143332086', '09/2016', 'Street27', 'Austin',           'TX', '5551919240', 'DaOh01@gmail.com', '007' );
insert into customer values('164291643', 'Mrs', 'Vanesa',     'Letcher',     '1650640854365357', '12/2016', 'Street16', 'Colorado Springs', 'CO', '5555594121', 'VaLe43@gmail.com', '004' );
insert into customer values('603344158',  'Ms', 'Delois',     'Boykins',     '5909425282632267', '01/2019', 'Street60', 'Arlington',        'TX', '5558827706', 'DeBo58@gmail.com', 'null');
insert into customer values('065138982',  'Ms', 'Marnie',     'Saechao',     '5297533356046253', '03/2020', 'Street06', 'Kansas City',      'MO', '5552528960', 'MaSa82@gmail.com', 'null');
insert into customer values('227583552',  'Ms', 'Joyce',      'Finlayson',   '7541844283864425', '12/2019', 'Street22', 'San Antonio',      'TX', '5558260754', 'JoFi52@gmail.com', 'null');
insert into customer values('493230818',  'Ms', 'Veronica',   'Gilreath',    '9891574976034119', '01/2019', 'Street49', 'Washington',       'DC', '5552885591', 'VeGi18@gmail.com', 'null');
insert into customer values('512300405', 'Mrs', 'Devora',     'Hynek',       '1948874127498468', '09/2017', 'Street51', 'Chicago',          'IL', '5557766409', 'DeHy05@gmail.com', '001' );
insert into customer values('031325149', 'Mrs', 'Marcella',   'Kula',        '1970732981296904', '04/2017', 'Street03', 'Virginia Beach',   'VA', '5553198005', 'MaKu49@gmail.com', '005' );
insert into customer values('874304029',  'Ms', 'Jacqueline', 'Jetter',      '5866327620706496', '01/2017', 'Street87', 'Tulsa',            'OK', '5557276239', 'JaJe29@gmail.com', 'null');
insert into customer values('064626778',  'Ms', 'Celinda',    'Merriman',    '1075225832998379', '01/2019', 'Street06', 'Seattle',          'WA', '5555701314', 'CeMe78@gmail.com', '005' );
insert into customer values('060010524', 'Mrs', 'Genoveva',   'Teets',       '8487479088262113', '10/2017', 'Street06', 'Oakland',          'CA', '5555569272', 'GeTe24@gmail.com', 'null');
insert into customer values('772550346',  'Ms', 'Karina',     'Mannix',      '4787411435096659', '06/2019', 'Street77', 'Philadelphia',     'PA', '5553328235', 'KaMa46@gmail.com', '003' );
insert into customer values('980868245',  'Ms', 'Jonelle',    'Orrell',      '2847140034936343', '05/2020', 'Street98', 'Miami',            'FL', '5559499919', 'JoOr45@gmail.com', 'null');
insert into customer values('099883738',  'Ms', 'Zora',       'Donmoyer',    '7542828453632217', '09/2017', 'Street09', 'Denver',           'CO', '5552428302', 'ZoDo38@gmail.com', '004' );
insert into customer values('076279338',  'Ms', 'Shavonda',   'Griffieth',   '5056995166638032', '11/2020', 'Street07', 'Mesa',             'AZ', '5559899183', 'ShGr38@gmail.com', 'null');
insert into customer values('681854013', 'Mrs', 'Larhonda',   'Hund',        '8932547910029121', '10/2019', 'Street68', 'Jacksonville',     'FL', '5557777415', 'LaHu13@gmail.com', '001' );
insert into customer values('734036121',  'Ms', 'Jolene',     'Maharaj',     '3069146691426388', '12/2020', 'Street73', 'Fort Worth',       'TX', '5556130857', 'JoMa21@gmail.com', 'null');
insert into customer values('861952229',  'Ms', 'Melodi',     'Pop',         '9852547260513247', '02/2017', 'Street86', 'Charlotte',        'NC', '5556676610', 'MePo29@gmail.com', '004' );
insert into customer values('064158647',  'Ms', 'Raymonde',   'Marshell',    '7487753978719813', '06/2019', 'Street06', 'Memphis',          'TN', '5557468534', 'RaMa47@gmail.com', '007' );
insert into customer values('514292149',  'Ms', 'Renetta',    'Wilt',        '8910144454459145', '07/2019', 'Street51', 'Columbus',         'OH', '5556486735', 'ReWi49@gmail.com', 'null');
insert into customer values('241137861',  'Ms', 'Regine',     'Wester',      '1821784755440719', '03/2017', 'Street24', 'Nashville',        'TN', '5556501950', 'ReWe61@gmail.com', '009' );
insert into customer values('089759674',  'Ms', 'Martina',    'Bess',        '2594706342048375', '03/2019', 'Street08', 'Sacramento',       'CA', '5559850766', 'MaBe74@gmail.com', 'null');
insert into customer values('811862332',  'Ms', 'Yen',        'Boye',        '6800390184429557', '05/2016', 'Street81', 'El Paso',          'TX', '5557563450', 'YeBo32@gmail.com', '003' );
insert into customer values('938642591',  'Ms', 'Gidget',     'Dolce',       '4465277614689601', '03/2019', 'Street93', 'Raleigh',          'NC', '5552694442', 'GiDo91@gmail.com', '001' );
insert into customer values('495267605', 'Mrs', 'Glenda',     'Desoto',      '9193698212477563', '04/2017', 'Street49', 'Wichita',          'KS', '5553838051', 'GlDe05@gmail.com', '005' );
insert into customer values('541644681', 'Mrs', 'Stephaine',  'Carns',       '3938574621695295', '12/2016', 'Street54', 'New York',         'NW', '5559756949', 'StCa81@gmail.com', 'null');
insert into customer values('027674342',  'Ms', 'Staci',      'Pizzuto',     '8546353822058733', '02/2020', 'Street02', 'Detroit',          'MI', '5555262332', 'StPi42@gmail.com', '003' );
insert into customer values('940008409', 'Mrs', 'Fiona',      'Cobian',      '2803600632692308', '07/2018', 'Street94', 'Houston',          'TX', '5556575916', 'FiCo09@gmail.com', '004' );
insert into customer values('415825484', 'Mrs', 'Lianne',     'Claybrook',   '4893777264286347', '11/2016', 'Street41', 'Las Vegas',        'NV', '5551001418', 'LiCl84@gmail.com', '004' );
insert into customer values('762252848', 'Mrs', 'Keli',       'Sproul',      '8193911125078285', '12/2018', 'Street76', 'Omaha',            'NE', '5554578162', 'KeSp48@gmail.com', '005' );
insert into customer values('771043703',  'Ms', 'Tamra',      'Lasiter',     '4992929343072007', '12/2020', 'Street77', 'Baltimore',        'MD', '5557129868', 'TaLa03@gmail.com', '004' );
insert into customer values('572625127',  'Ms', 'Genia',      'Gorham',      '4182745284798419', '01/2019', 'Street57', 'Dallas',           'TX', '5558119667', 'GeGo27@gmail.com', '003' );
insert into customer values('390298013', 'Mrs', 'Natalya',    'Arnone',      '9261875281238207', '02/2016', 'Street39', 'Phoenix',          'AZ', '5558876908', 'NaAr13@gmail.com', '005' );
insert into customer values('482126047', 'Mrs', 'Lynetta',    'Hamler',      '9709562643272737', '09/2017', 'Street48', 'Long Beach',       'CA', '5553568210', 'LyHa47@gmail.com', 'null');
insert into customer values('577900935',  'Ms', 'Micki',      'Morphis',     '1730895858346096', '12/2018', 'Street57', 'Milwaukee',        'WI', '5555153436', 'MiMo35@gmail.com', 'null');
insert into customer values('375428778',  'Ms', 'Sylvie',     'Frutos',      '9466785272913634', '05/2017', 'Street37', 'Oklahoma City',    'OK', '5553531288', 'SyFr78@gmail.com', 'null');
insert into customer values('853759923',  'Ms', 'Serita',     'Gleason',     '6894961993971968', '01/2017', 'Street85', 'Atlanta',          'GA', '5557007907', 'SeGl23@gmail.com', '005' );
insert into customer values('596958885', 'Mrs', 'Solange',    'Sikora',      '2095425138131365', '08/2018', 'Street59', 'Indianapolis',     'IN', '5556690423', 'SoSi85@gmail.com', 'null');
insert into customer values('406636105', 'Mrs', 'Deborah',    'Burkhard',    '2697047227405430', '12/2019', 'Street40', 'San Jose',         'CA', '5554200087', 'DeBu05@gmail.com', '006' );
insert into customer values('799420182',  'Ms', 'Denisha',    'Tarkington',  '7498128161999310', '07/2016', 'Street79', 'Louisville',       'KY', '5555597397', 'DeTa82@gmail.com', '010' );
insert into customer values('237155722',  'Mr', 'Henry',      'Scicchitano', '9503775411113173', '04/2017', 'Street23', 'Portland',         'OR', '5554117054', 'HeSc22@gmail.com', '007' );
insert into customer values('867250478',  'Mr', 'Thad',       'Fett',        '4358002187071897', '09/2020', 'Street86', 'El Paso',          'TX', '5551947190', 'ThFe78@gmail.com', '006' );
insert into customer values('695231176',  'Mr', 'Howard',     'Rocca',       '8011932649983031', '09/2016', 'Street69', 'Boston',           'MA', '5557707082', 'HoRo76@gmail.com', 'null');
insert into customer values('997054969',  'Mr', 'Deangelo',   'Dewalt',      '4369072454009478', '03/2018', 'Street99', 'Dallas',           'TX', '5557253682', 'DeDe69@gmail.com', 'null');
insert into customer values('027587440',  'Mr', 'Johnie',     'Legros',      '1624839719145791', '03/2018', 'Street02', 'Minneapolis',      'MN', '5559821923', 'JoLe40@gmail.com', '009' );
insert into customer values('647078066',  'Mr', 'Emmitt',     'Cardillo',    '2141126616370239', '02/2019', 'Street64', 'San Diego',        'CA', '5555353488', 'EmCa66@gmail.com', 'null');
insert into customer values('292995632',  'Mr', 'Barney',     'Mealer',      '8345851277455064', '04/2018', 'Street29', 'New York',         'NY', '5555931174', 'BaMe32@gmail.com', '009' );
insert into customer values('211127022',  'Mr', 'Demarcus',   'Cape',        '4142474654768159', '05/2018', 'Street21', 'Nashville',        'TN', '5557337981', 'DeCa22@gmail.com', 'null');
insert into customer values('816246078',  'Mr', 'Jospeh',     'Nock',        '6371836951396811', '07/2018', 'Street81', 'Washington',       'DC', '5557396994', 'JoNo78@gmail.com', '003' );
insert into customer values('962224219',  'Mr', 'Mohammad',   'Eberle',      '7037541068020785', '06/2019', 'Street96', 'Chicago',          'IL', '5555865726', 'MoEb19@gmail.com', '005' );
insert into customer values('561814355',  'Mr', 'Roosevelt',  'Durbin',      '1622471779543982', '09/2018', 'Street56', 'Charlotte',        'NC', '5553131545', 'RoDu55@gmail.com', '001' );
insert into customer values('528836955',  'Mr', 'Bernard',    'Remigio',     '6178065020603266', '09/2018', 'Street52', 'Baltimore',        'MD', '5559992269', 'BeRe55@gmail.com', 'null');
insert into customer values('245826092',  'Mr', 'Sandy',      'Olsen',       '3593672160811790', '04/2020', 'Street24', 'Raleigh',          'NC', '5553598841', 'SaOl92@gmail.com', '007' );
insert into customer values('799679597',  'Mr', 'Darius',     'Anthony',     '1025620644047638', '12/2016', 'Street79', 'Jacksonville',     'FL', '5559916951', 'DaAn97@gmail.com', 'null');
insert into customer values('371129753',  'Mr', 'Blaine',     'Bailer',      '6733435512611104', '12/2019', 'Street37', 'Oakland',          'CA', '5557824494', 'BlBa53@gmail.com', 'null');
insert into customer values('437358274',  'Mr', 'Bud',        'Seamans',     '5247188150778519', '01/2017', 'Street43', 'Albuquerque',      'NM', '5555932717', 'BuSe74@gmail.com', 'null');
insert into customer values('181890051',  'Mr', 'Buster',     'Easterling',  '9670796327909709', '09/2016', 'Street18', 'Colorado Springs', 'CO', '5559749370', 'BuEa51@gmail.com', '008' );
insert into customer values('069895990',  'Mr', 'Roman',      'Nolton',      '2829273792973819', '08/2020', 'Street06', 'Tulsa',            'OK', '5554896494', 'RoNo90@gmail.com', 'null');
insert into customer values('725168037',  'Mr', 'Bradly',     'Jiggetts',    '8832194553153009', '09/2018', 'Street72', 'Denver',           'CO', '5556667303', 'BrJi37@gmail.com', '005' );
insert into customer values('535374855',  'Mr', 'Del',        'Sessions',    '4934620052685782', '03/2019', 'Street53', 'Austin',           'TX', '5555819992', 'DeSe55@gmail.com', 'null');
insert into customer values('565245105',  'Mr', 'Alfonzo',    'Stuber',      '3956369272838789', '03/2019', 'Street56', 'Tucson',           'AZ', '5552359098', 'AlSt05@gmail.com', '006' );
insert into customer values('556781225',  'Mr', 'Merle',      'Hadden',      '7665846160031553', '10/2016', 'Street55', 'Las Vegas',        'NV', '5559940069', 'MeHa25@gmail.com', '010' );
insert into customer values('516024925',  'Mr', 'Miguel',     'Bowland',     '7468087886671318', '04/2018', 'Street51', 'Atlanta',          'GA', '5551573843', 'MiBo25@gmail.com', 'null');
insert into customer values('200283332',  'Mr', 'Salvador',   'Frances',     '1989671174568359', '02/2018', 'Street20', 'Omaha',            'NE', '5551892484', 'SaFr32@gmail.com', 'null');
insert into customer values('897433158',  'Mr', 'Sammy',      'Booth',       '4774151791182665', '03/2016', 'Street89', 'San Jose',         'CA', '5554701840', 'SaBo58@gmail.com', 'null');
insert into customer values('529386525',  'Mr', 'Pat',        'Ficklin',     '4430891279147659', '09/2016', 'Street52', 'Louisville',       'KY', '5554807679', 'PaFi25@gmail.com', 'null');
insert into customer values('943831419',  'Mr', 'Troy',       'Lustig',      '2954689957623143', '01/2016', 'Street94', 'Fresno',           'CA', '5558286370', 'TrLu19@gmail.com', '009' );
insert into customer values('147126771',  'Mr', 'Anton',      'Heiser',      '8719928735197498', '09/2020', 'Street14', 'Long Beach',       'CA', '5553035303', 'AnHe71@gmail.com', 'null');
insert into customer values('964999489',  'Mr', 'Brooks',     'Spector',     '9547273870991315', '01/2017', 'Street96', 'Mesa',             'AZ', '5559646123', 'BrSp89@gmail.com', '002' );
insert into customer values('094384100',  'Mr', 'Hollis',     'Viggiano',    '6428245828101365', '10/2016', 'Street09', 'Seattle',          'WA', '5553622970', 'HoVi00@gmail.com', 'null');
insert into customer values('000169100',  'Mr', 'Abe',        'Azure',       '5982520582435285', '09/2018', 'Street00', 'Columbus',         'OH', '5558706502', 'AbAz00@gmail.com', '002' );
insert into customer values('709657507',  'Mr', 'Odis',       'Edberg',      '8344502033813692', '10/2018', 'Street70', 'Portland',         'OR', '5558524569', 'OdEd07@gmail.com', '006' );
insert into customer values('626818596',  'Mr', 'Jesse',      'Troxel',      '9585959966374964', '05/2018', 'Street62', 'Virginia Beach',   'VA', '5552193576', 'JeTr96@gmail.com', '010' );
insert into customer values('849940578',  'Mr', 'Virgilio',   'Machnik',     '4644347154497080', '08/2017', 'Street84', 'Memphis',          'TN', '5557858532', 'ViMa78@gmail.com', '008' );
insert into customer values('728944307',  'Mr', 'Graham',     'Waldroup',    '4253086735269476', '05/2020', 'Street72', 'Miami',            'FL', '5554312130', 'GrWa07@gmail.com', '006' );
insert into customer values('053641040',  'Mr', 'Ike',        'Desjardins',  '1402042719508649', '10/2016', 'Street05', 'Wichita',          'KS', '5551468086', 'IkDe40@gmail.com', '004' );
insert into customer values('198980191',  'Mr', 'Ahmed',      'Saraiva',     '9690889997851194', '10/2020', 'Street19', 'Milwaukee',        'WI', '5551957333', 'AhSa91@gmail.com', 'null');
insert into customer values('991439449',  'Mr', 'Carl',       'Gillispie',   '1960641863172072', '11/2019', 'Street99', 'Houston',          'TX', '5555155489', 'CaGi49@gmail.com', '006' );
insert into customer values('839168238',  'Mr', 'Omar',       'Sato',        '9219944977358431', '12/2016', 'Street83', 'Detroit',          'MI', '5553339830', 'OmSa38@gmail.com', '001' );
insert into customer values('396245593',  'Mr', 'Jae',        'Nygard',      '8728875842988214', '03/2018', 'Street39', 'Oklahoma City',    'OK', '5552148860', 'JaNy93@gmail.com', 'null');
insert into customer values('098526550',  'Mr', 'Michal',     'Talkington',  '4412659428226007', '01/2016', 'Street09', 'Kansas City',      'MO', '5559970645', 'MiTa50@gmail.com', '007' );
insert into customer values('135922451',  'Mr', 'Ian',        'Karlson',     '8239436247204045', '09/2020', 'Street13', 'Philadelphia',     'PA', '5559178236', 'IaKa51@gmail.com', 'null');
insert into customer values('662118356',  'Mr', 'Quinton',    'Wickman',     '4131806611151979', '07/2017', 'Street66', 'Fort Worth',       'TX', '5554202883', 'QuWi56@gmail.com', 'null');
insert into customer values('897836558',  'Mr', 'Delmer',     'Laurin',      '9129198197521336', '12/2018', 'Street89', 'San Antonio',      'TX', '5555868421', 'DeLa58@gmail.com', '008' );
insert into customer values('399923463',  'Mr', 'Virgil',     'Coghlan',     '4417564491275548', '12/2020', 'Street39', 'Los Angeles',      'CA', '5554000096', 'ViCo63@gmail.com', '003' );
insert into customer values('316044623',  'Mr', 'Dario',      'Kuchera',     '9340051676161355', '01/2016', 'Street31', 'San Francisco',    'CA', '5555084289', 'DaKu23@gmail.com', '002' );
insert into customer values('847515288',  'Mr', 'Elisha',     'Giblin',      '7676463528494517', '02/2016', 'Street84', 'Indianapolis',     'IN', '5559903730', 'ElGi88@gmail.com', 'null');
insert into customer values('798024737',  'Mr', 'Morgan',     'Litten',      '9904222263449208', '10/2019', 'Street79', 'Arlington',        'TX', '5559126466', 'MoLi37@gmail.com', '004' );
insert into customer values('076188410',  'Mr', 'Roberto',    'Danforth',    '1213971645731411', '02/2016', 'Street07', 'Sacramento',       'CA', '5558227335', 'RoDa10@gmail.com', 'null');
insert into customer values('998478429',  'Mr', 'Dwight',     'Tindell',     '4812826559412031', '04/2017', 'Street99', 'Phoenix',          'AZ', '5556468381', 'DwTi29@gmail.com', 'null');
insert into customer values('138799371',  'Mr', 'Jay',        'Waid',        '5472440426064841', '05/2020', 'Street13', 'New Orleans',      'LA', '5552251570', 'JaWa71@gmail.com', 'null');
insert into customer values('634260106',  'Ms', 'Evangelina', 'Kania',       '5652375080489865', '09/2017', 'Street63', 'Dallas',           'TX', '5553831744', 'EvKa06@gmail.com', '004' );
insert into customer values('818038788', 'Mrs', 'Casie',      'Decker',      '7791037510570699', '12/2020', 'Street81', 'Seattle',          'WA', '5559646683', 'CaDe88@gmail.com', '002' );
insert into customer values('469168214', 'Mrs', 'Dinah',      'Hilden',      '1068560883004338', '04/2018', 'Street46', 'Fresno',           'CA', '5557505162', 'DiHi14@gmail.com', '009' );
insert into customer values('468774954',  'Ms', 'Birdie',     'Lozier',      '6543578694429235', '09/2017', 'Street46', 'Chicago',          'IL', '5556072127', 'BiLo54@gmail.com', 'null');
insert into customer values('587665135', 'Mrs', 'Delisa',     'Camarillo',   '6781291337541097', '10/2017', 'Street58', 'San Diego',        'CA', '5556449726', 'DeCa35@gmail.com', '005' );
insert into customer values('911862479', 'Mrs', 'Augusta',    'Lomeli',      '6882808855212824', '03/2019', 'Street91', 'Wichita',          'KS', '5557810817', 'AuLo79@gmail.com', 'null');
insert into customer values('153090441', 'Mrs', 'Isadora',    'Heminger',    '4940608756507432', '06/2020', 'Street15', 'Tucson',           'AZ', '5555743648', 'IsHe41@gmail.com', '001' );
insert into customer values('603687436',  'Ms', 'Shanelle',   'Bernstein',   '2551121947318015', '10/2016', 'Street60', 'Miami',            'FL', '5554466875', 'ShBe36@gmail.com', 'null');
insert into customer values('509012755',  'Ms', 'Cherlyn',    'Gallimore',   '7791168265985588', '09/2019', 'Street50', 'Detroit',          'MI', '5555730043', 'ChGa55@gmail.com', '007' );
insert into customer values('916431649',  'Ms', 'Trish',      'Marchese',    '9421987667168226', '10/2019', 'Street91', 'San Antonio',      'TX', '5552868207', 'TrMa49@gmail.com', 'null');
insert into customer values('441586034',  'Ms', 'Carolee',    'Dunston',     '2555225264001183', '06/2020', 'Street44', 'Washington',       'DC', '5557328610', 'CaDu34@gmail.com', '006' );
insert into customer values('389820653',  'Ms', 'Margarette', 'Stumbo',      '3675507446671692', '08/2018', 'Street38', 'Nashville',        'TN', '5553863946', 'MaSt53@gmail.com', 'null');
insert into customer values('835522278', 'Mrs', 'Shana',      'Demaria',     '3926718664648241', '09/2016', 'Street83', 'Oakland',          'CA', '5557319077', 'ShDe78@gmail.com', '007' );
insert into customer values('308184933',  'Ms', 'Robbin',     'Liles',       '4801837140483257', '07/2018', 'Street30', 'Minneapolis',      'MN', '5558971137', 'RoLi33@gmail.com', 'null');
insert into customer values('004055120',  'Ms', 'Lila',       'Pelosi',      '4993808541163288', '11/2016', 'Street00', 'Sacramento',       'CA', '5553814460', 'LiPe20@gmail.com', '005' );
insert into customer values('251490312', 'Mrs', 'Kristina',   'Mcgruder',    '8515525971555743', '03/2016', 'Street25', 'El Paso',          'TX', '5551359085', 'KrMc12@gmail.com', '001' );
insert into customer values('040298740',  'Ms', 'Carolynn',   'Falcone',     '1021058159097630', '05/2017', 'Street04', 'Los Angeles',      'CA', '5559825217', 'CaFa40@gmail.com', 'null');
insert into customer values('267780642',  'Ms', 'Tenesha',    'Stillwell',   '8241076817701491', '03/2019', 'Street26', 'New York',         'NY', '5559929144', 'TeSt42@gmail.com', '008' );
insert into customer values('105240601',  'Ms', 'Lyla',       'Huntsman',    '5005360211577537', '08/2018', 'Street10', 'Atlanta',          'GA', '5559724149', 'LyHu01@gmail.com', 'null');
insert into customer values('503467725', 'Mrs', 'Latashia',   'Swihart',     '5613257479580471', '10/2016', 'Street50', 'Indianapolis',     'IN', '5559730600', 'LaSw25@gmail.com', 'null');
insert into customer values('682459806',  'Ms', 'Arvilla',    'Ravenscroft', '8831332932897091', '06/2017', 'Street68', 'Phoenix',          'AZ', '5553503207', 'ArRa06@gmail.com', '005' );
insert into customer values('837380998',  'Ms', 'Tijuana',    'Meriwether',  '4999090811506560', '12/2020', 'Street83', 'Louisville',       'KY', '5552008236', 'TiMe98@gmail.com', 'null');
insert into customer values('793380767',  'Ms', 'Janice',     'Maine',       '6702259620990131', '12/2016', 'Street79', 'Raleigh',          'NC', '5554749260', 'JaMa67@gmail.com', 'null');
insert into customer values('540136815',  'Ms', 'Maia',       'Clair',       '4926498495727527', '05/2018', 'Street54', 'San Jose',         'CA', '5556333020', 'MaCl15@gmail.com', '002' );
insert into customer values('361217343', 'Mrs', 'Bebe',       'Maio',        '3008311844040642', '04/2019', 'Street36', 'Memphis',          'TN', '5556991474', 'BeMa43@gmail.com', 'null');
insert into customer values('522298615', 'Mrs', 'Digna',      'Stayer',      '5966648024279991', '12/2020', 'Street52', 'Houston',          'TX', '5553601930', 'DiSt15@gmail.com', '006' );
insert into customer values('586470645',  'Ms', 'Lona',       'Durso',       '5303806261419972', '03/2017', 'Street58', 'Oklahoma City',    'OK', '5559927465', 'LoDu45@gmail.com', '003' );
insert into customer values('921495149', 'Mrs', 'Marica',     'Mikelson',    '3341262042014002', '12/2019', 'Street92', 'Mesa',             'AZ', '5553130722', 'MaMi49@gmail.com', '001' );
insert into customer values('378612413',  'Ms', 'Shaniqua',   'Hart',        '1755922065558640', '11/2019', 'Street37', 'Milwaukee',        'WI', '5553885510', 'ShHa13@gmail.com', '005' );
insert into customer values('596740895',  'Ms', 'Rikki',      'Mahar',       '4251477330255098', '10/2019', 'Street59', 'Portland',         'OR', '5554654768', 'RiMa95@gmail.com', '003' );
insert into customer values('623328116',  'Ms', 'Jami',       'Lafollette',  '8871856075094282', '05/2016', 'Street62', 'Kansas City',      'MO', '5554818178', 'JaLa16@gmail.com', '006' );
insert into customer values('425919384',  'Ms', 'Elisabeth',  'Peppers',     '9373379176020910', '08/2018', 'Street42', 'Baltimore',        'MD', '5552314412', 'ElPe84@gmail.com', '005' );
insert into customer values('676054956',  'Ms', 'Shin',       'Lettinga',    '2541946452916763', '07/2018', 'Street67', 'Tulsa',            'OK', '5557395383', 'ShLe56@gmail.com', 'null');
insert into customer values('446815414',  'Ms', 'Pauline',    'Bollman',     '6038218913503585', '03/2018', 'Street44', 'Albuquerque',      'NM', '5551423461', 'PaBo14@gmail.com', 'null');
insert into customer values('743420277',  'Ms', 'Gena',       'Desch',       '4900631530680262', '06/2020', 'Street74', 'San Francisco',    'CA', '5554962141', 'GeDe77@gmail.com', '007' );
insert into customer values('084099400',  'Ms', 'Pamela',     'Roesch',      '3846261850454486', '03/2020', 'Street08', 'Denver',           'CO', '5556380802', 'PaRo00@gmail.com', 'null');
insert into customer values('254844152',  'Ms', 'Libbie',     'Shimek',      '2032765389488873', '11/2016', 'Street25', 'Columbus',         'OH', '5552750982', 'LiSh52@gmail.com', '002' );
insert into customer values('528487625', 'Mrs', 'Cecila',     'Strausbaugh', '7261740698362601', '01/2017', 'Street52', 'Charlotte',        'NC', '5555743012', 'CeSt25@gmail.com', '007' );
insert into customer values('437037714',  'Ms', 'Jolanda',    'Loera',       '2795707981231382', '01/2018', 'Street43', 'Philadelphia',     'PA', '5556600844', 'JoLo14@gmail.com', '003' );
insert into customer values('251275722', 'Mrs', 'Meta',       'Alberti',     '1307863341448090', '04/2020', 'Street25', 'Fort Worth',       'TX', '5553625375', 'MeAl22@gmail.com', 'null');
insert into customer values('980133909',  'Ms', 'Cindie',     'Maxim',       '3103397968606662', '07/2018', 'Street98', 'Colorado Springs', 'CO', '5554122550', 'CiMa09@gmail.com', 'null');
insert into customer values('260474822',  'Ms', 'Voncile',    'Diego',       '6082793689151948', '11/2019', 'Street26', 'Austin',           'TX', '5558257683', 'VoDi22@gmail.com', '003' );
insert into customer values('009355770',  'Ms', 'Zella',      'Hice',        '1563655533641037', '12/2016', 'Street00', 'New Orleans',      'LA', '5555445147', 'ZeHi70@gmail.com', '010' );
insert into customer values('287783752', 'Mrs', 'Gabrielle',  'Lenderman',   '5198749096861759', '07/2017', 'Street28', 'Virginia Beach',   'VA', '5552389976', 'GaLe52@gmail.com', '003' );
insert into customer values('599238535',  'Ms', 'Brinda',     'Rand',        '5998458077560519', '11/2018', 'Street59', 'Jacksonville',     'FL', '5552874624', 'BrRa35@gmail.com', '009' );
insert into customer values('588855965', 'Mrs', 'Le',         'Shadle',      '6699993543410734', '11/2018', 'Street58', 'Boston',           'MA', '5553425254', 'LeSh65@gmail.com', '002' );
insert into customer values('361054063', 'Mrs', 'Felisha',    'Mitchel',     '1140117927331712', '05/2017', 'Street36', 'Las Vegas',        'NV', '5558731232', 'FeMi63@gmail.com', 'null');
insert into customer values('201827992',  'Ms', 'Argentina',  'Adelman',     '7516871596299021', '01/2018', 'Street20', 'Arlington',        'TX', '5559605278', 'ArAd92@gmail.com', '009' );
insert into customer values('123456789',  'Ms', 'Nettie',     'Twitchell',   '7050194499100249', '12/2020', 'Street12', 'Omaha',            'NE', '5552036978', 'NeTw89@gmail.com', 'null');
insert into customer values('987654321',  'Ms', 'Bill',       'Bob',         '5138465813536888', '10/2019', 'Street98', 'Long Beach',       'CA', '5556462254', 'BiBo21@gmail.com', '007' );


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

insert into reservation values('00000', '744202758', 433, '6544878526228429', '12/20/2016', 'N'); 
insert into reservation values('00001', '750670965', 241, '3740232255497666', '10/27/2015', 'N'); 
insert into reservation values('00002', '821346916', 539, '5694015983779931', '03/01/2015', 'Y'); 
insert into reservation values('00003', '390298013', 535, '9261875281238207', '04/22/2016', 'Y'); 
insert into reservation values('00004', '406636105', 940, '2697047227405430', '03/09/2015', 'Y'); 
insert into reservation values('00005', '468774954', 294, '6543578694429235', '01/10/2015', 'N'); 
insert into reservation values('00006', '561814355', 197, '1622471779543982', '07/01/2016', 'N'); 
insert into reservation values('00007', '446815414', 942, '6038218913503585', '03/29/2016', 'N'); 
insert into reservation values('00008', '437037714', 114, '2795707981231382', '03/22/2015', 'N'); 
insert into reservation values('00009', '060010524', 359, '8487479088262113', '07/18/2015', 'N'); 
insert into reservation values('00010', '378612413', 993, '1755922065558640', '04/02/2015', 'Y'); 
insert into reservation values('00011', '572723715', 130, '4297678776294822', '10/16/2016', 'Y'); 
insert into reservation values('00012', '089759674', 990, '2594706342048375', '09/13/2016', 'N'); 
insert into reservation values('00013', '117069523', 358, '7903044332117935', '02/29/2015', 'Y'); 
insert into reservation values('00014', '496499705', 445, '7203376066184929', '09/11/2015', 'N'); 
insert into reservation values('00015', '245413592', 713, '5914978986241013', '11/27/2015', 'N'); 
insert into reservation values('00016', '333820028', 949, '9277378734998449', '01/12/2015', 'N'); 
insert into reservation values('00017', '104805364', 625, '1112934056273073', '03/03/2016', 'N'); 
insert into reservation values('00018', '599806989', 202, '7959376524393901', '12/17/2015', 'Y'); 
insert into reservation values('00019', '771043703', 682, '4992929343072007', '07/04/2016', 'N'); 
insert into reservation values('00020', '695231176', 378, '8011932649983031', '12/25/2015', 'N'); 
insert into reservation values('00021', '816246078', 965, '6371836951396811', '04/07/2016', 'Y'); 
insert into reservation values('00022', '586470645', 579, '5303806261419972', '08/10/2016', 'Y'); 
insert into reservation values('00023', '516024925', 240, '7468087886671318', '04/10/2016', 'N'); 
insert into reservation values('00024', '599806989', 637, '7959376524393901', '08/12/2015', 'N'); 
insert into reservation values('00025', '421396222', 321, '4167330172642269', '04/04/2016', 'Y'); 
insert into reservation values('00026', '944199143', 437, '8051511764477303', '01/02/2015', 'Y'); 
insert into reservation values('00027', '315389743', 128, '8246518713467860', '03/06/2016', 'N'); 
insert into reservation values('00028', '482126047', 742, '9709562643272737', '08/10/2015', 'N'); 
insert into reservation values('00029', '254844152', 757, '2032765389488873', '05/08/2015', 'Y'); 
insert into reservation values('00030', '469168214', 890, '1068560883004338', '02/08/2015', 'Y'); 
insert into reservation values('00031', '064158647', 161, '7487753978719813', '08/26/2015', 'N'); 
insert into reservation values('00032', '607981624', 630, '7008813286111441', '01/20/2016', 'N'); 
insert into reservation values('00033', '251490312', 836, '8515525971555743', '11/08/2016', 'Y'); 
insert into reservation values('00034', '462231604', 888, '9689970682258009', '01/11/2016', 'N'); 
insert into reservation values('00035', '275550901', 112, '1378562143332086', '02/13/2016', 'N'); 
insert into reservation values('00036', '040298740', 794, '1021058159097630', '02/13/2015', 'Y'); 
insert into reservation values('00037', '473579802', 499, '5622521417527406', '08/13/2015', 'Y'); 
insert into reservation values('00038', '559139624', 661, '5474432624517607', '07/21/2016', 'N'); 
insert into reservation values('00039', '572625127', 974, '4182745284798419', '03/07/2016', 'Y'); 
insert into reservation values('00040', '959779967', 860, '4976672648895937', '12/01/2016', 'Y'); 
insert into reservation values('00041', '849940578', 974, '4644347154497080', '05/28/2016', 'Y'); 
insert into reservation values('00042', '201827992', 423, '7516871596299021', '06/30/2015', 'Y'); 
insert into reservation values('00043', '609224582', 427, '5362764729419569', '12/09/2016', 'N'); 
insert into reservation values('00044', '435756181', 696, '4938229136232376', '06/06/2016', 'N'); 
insert into reservation values('00045', '859462681', 188, '4858982142004045', '01/11/2016', 'Y'); 
insert into reservation values('00046', '496499705', 954, '7203376066184929', '04/27/2016', 'N'); 
insert into reservation values('00047', '031325149', 731, '1970732981296904', '09/27/2015', 'Y'); 
insert into reservation values('00048', '415825484', 774, '4893777264286347', '10/06/2015', 'Y'); 
insert into reservation values('00049', '371129753', 806, '6733435512611104', '07/06/2016', 'N'); 
insert into reservation values('00050', '596740895', 648, '4251477330255098', '06/03/2016', 'N'); 
insert into reservation values('00051', '897836558', 336, '9129198197521336', '11/26/2016', 'Y'); 
insert into reservation values('00052', '577900935', 447, '1730895858346096', '11/19/2016', 'N'); 
insert into reservation values('00053', '980133909', 826, '3103397968606662', '05/30/2015', 'N'); 
insert into reservation values('00054', '005218189', 226, '2671280836766098', '10/08/2016', 'Y'); 
insert into reservation values('00055', '528684751', 380, '5841137818503085', '06/12/2016', 'N'); 
insert into reservation values('00056', '944199143', 431, '8051511764477303', '09/16/2016', 'Y'); 
insert into reservation values('00057', '565245105', 524, '3956369272838789', '11/14/2015', 'N'); 
insert into reservation values('00058', '122855678', 997, '6116998799698062', '10/15/2015', 'Y'); 
insert into reservation values('00059', '743260368', 752, '4603663089297520', '11/12/2015', 'N'); 
insert into reservation values('00060', '164291643', 547, '1650640854365357', '11/06/2015', 'Y'); 
insert into reservation values('00061', '493230818', 603, '9891574976034119', '03/28/2016', 'N'); 
insert into reservation values('00062', '435756181', 340, '4938229136232376', '08/08/2015', 'N'); 
insert into reservation values('00063', '798024737', 235, '9904222263449208', '08/01/2015', 'Y'); 
insert into reservation values('00064', '153090441', 957, '4940608756507432', '01/02/2016', 'Y'); 
insert into reservation values('00065', '495146877', 173, '3854330056391653', '03/25/2016', 'N'); 
insert into reservation values('00066', '509012755', 881, '7791168265985588', '11/28/2016', 'N'); 
insert into reservation values('00067', '375428778', 599, '9466785272913634', '11/07/2015', 'Y'); 
insert into reservation values('00068', '094384100', 241, '6428245828101365', '05/25/2015', 'N'); 
insert into reservation values('00069', '806864707', 436, '9511289760767009', '03/21/2016', 'N'); 
insert into reservation values('00070', '200283332', 325, '1989671174568359', '11/14/2016', 'N'); 
insert into reservation values('00071', '677214712', 567, '7086500829214752', '07/19/2016', 'N'); 
insert into reservation values('00072', '415825484', 495, '4893777264286347', '04/19/2016', 'N'); 
insert into reservation values('00073', '634260106', 462, '5652375080489865', '07/07/2016', 'N'); 
insert into reservation values('00074', '772550346', 611, '4787411435096659', '06/02/2015', 'Y'); 
insert into reservation values('00075', '799420182', 306, '7498128161999310', '12/18/2015', 'Y'); 
insert into reservation values('00076', '572625127', 371, '4182745284798419', '07/21/2016', 'N'); 
insert into reservation values('00077', '260474822', 600, '6082793689151948', '11/22/2016', 'N'); 
insert into reservation values('00078', '911862479', 845, '6882808855212824', '02/25/2016', 'N'); 
insert into reservation values('00079', '138799371', 491, '5472440426064841', '07/13/2015', 'Y'); 
insert into reservation values('00080', '492151602', 264, '1257503582752954', '10/28/2015', 'Y'); 
insert into reservation values('00081', '473579802', 401, '5622521417527406', '11/02/2015', 'Y'); 
insert into reservation values('00082', '164291643', 492, '1650640854365357', '06/10/2015', 'N'); 
insert into reservation values('00083', '937413879', 306, '4502332468872346', '05/17/2015', 'N'); 
insert into reservation values('00084', '940008409', 983, '2803600632692308', '07/04/2015', 'N'); 
insert into reservation values('00085', '734036121', 190, '3069146691426388', '06/18/2016', 'Y'); 
insert into reservation values('00086', '004055120', 721, '4993808541163288', '03/04/2016', 'N'); 
insert into reservation values('00087', '031325149', 714, '1970732981296904', '07/19/2016', 'N'); 
insert into reservation values('00088', '603344158', 115, '5909425282632267', '02/25/2015', 'N'); 
insert into reservation values('00089', '842399847', 668, '7131720974652720', '05/12/2015', 'N'); 
insert into reservation values('00090', '910900016', 916, '9372115691960778', '11/17/2015', 'N'); 
insert into reservation values('00091', '027587440', 603, '1624839719145791', '09/19/2015', 'N'); 
insert into reservation values('00092', '514292149', 542, '8910144454459145', '10/25/2015', 'Y'); 
insert into reservation values('00093', '019619898', 641, '2183005969403234', '06/27/2016', 'Y'); 
insert into reservation values('00094', '695052883', 171, '3635845493608133', '09/16/2015', 'Y'); 
insert into reservation values('00095', '943831419', 146, '2954689957623143', '01/29/2015', 'N'); 
insert into reservation values('00096', '247591186', 438, '6343594773653241', '02/28/2016', 'N'); 
insert into reservation values('00097', '528684751', 360, '5841137818503085', '04/15/2015', 'Y'); 
insert into reservation values('00098', '060010524', 116, '8487479088262113', '06/17/2015', 'N'); 
insert into reservation values('00099', '861952229', 154, '9852547260513247', '05/02/2016', 'N'); 
insert into reservation values('00100', '528836955', 360, '6178065020603266', '05/04/2016', 'Y'); 
insert into reservation values('00101', '430172894', 388, '1648989326298575', '05/20/2015', 'Y'); 
insert into reservation values('00102', '655989783', 301, '9826297317611262', '11/23/2016', 'Y'); 
insert into reservation values('00103', '406636105', 886, '2697047227405430', '03/07/2015', 'Y'); 
insert into reservation values('00104', '577900935', 923, '1730895858346096', '06/15/2016', 'N'); 
insert into reservation values('00105', '725168037', 803, '8832194553153009', '08/01/2015', 'N'); 
insert into reservation values('00106', '652552938', 297, '6907472375769657', '01/28/2016', 'Y'); 
insert into reservation values('00107', '275550901', 916, '1378562143332086', '04/02/2015', 'N'); 
insert into reservation values('00108', '897433158', 443, '4774151791182665', '03/01/2016', 'N'); 
insert into reservation values('00109', '510956524', 971, '6057497854488507', '01/11/2015', 'Y'); 
insert into reservation values('00110', '835666211', 209, '7950542230006090', '07/24/2016', 'Y'); 
insert into reservation values('00111', '596958885', 711, '2095425138131365', '05/01/2016', 'Y'); 
insert into reservation values('00112', '315389743', 459, '8246518713467860', '08/10/2016', 'Y'); 
insert into reservation values('00113', '064626778', 756, '1075225832998379', '02/17/2015', 'N'); 
insert into reservation values('00114', '308184933', 821, '4801837140483257', '08/21/2015', 'Y'); 
insert into reservation values('00115', '823383916', 810, '5463301179603301', '06/08/2015', 'N'); 
insert into reservation values('00116', '076279338', 637, '5056995166638032', '11/30/2016', 'N'); 
insert into reservation values('00117', '181890051', 467, '9670796327909709', '12/22/2015', 'N'); 
insert into reservation values('00118', '010463426', 254, '2813288396818727', '06/02/2015', 'Y'); 
insert into reservation values('00119', '771043703', 763, '4992929343072007', '07/27/2015', 'N'); 
insert into reservation values('00120', '837380998', 585, '4999090811506560', '09/30/2015', 'N'); 
insert into reservation values('00121', '057684994', 261, '5536480731060912', '10/20/2016', 'Y'); 
insert into reservation values('00122', '910900016', 596, '9372115691960778', '05/01/2016', 'Y'); 
insert into reservation values('00123', '513958766', 257, '9305418453068164', '09/25/2015', 'Y'); 
insert into reservation values('00124', '998478429', 952, '4812826559412031', '02/17/2016', 'Y'); 
insert into reservation values('00125', '053641040', 175, '1402042719508649', '07/24/2015', 'Y'); 
insert into reservation values('00126', '495267605', 816, '9193698212477563', '08/12/2016', 'N'); 
insert into reservation values('00127', '399923463', 679, '4417564491275548', '03/13/2016', 'N'); 
insert into reservation values('00128', '375428778', 932, '9466785272913634', '11/27/2016', 'Y'); 
insert into reservation values('00129', '811862332', 365, '6800390184429557', '06/06/2016', 'N'); 
insert into reservation values('00130', '237155722', 386, '9503775411113173', '05/17/2016', 'Y'); 
insert into reservation values('00131', '997054969', 201, '4369072454009478', '11/19/2015', 'N'); 
insert into reservation values('00132', '122855678', 320, '6116998799698062', '01/24/2015', 'Y'); 
insert into reservation values('00133', '147126771', 646, '8719928735197498', '01/22/2016', 'Y'); 
insert into reservation values('00134', '247591186', 294, '6343594773653241', '03/14/2016', 'Y'); 
insert into reservation values('00135', '237155722', 461, '9503775411113173', '05/25/2016', 'N'); 
insert into reservation values('00136', '841807618', 454, '9688197662069657', '03/13/2016', 'N'); 
insert into reservation values('00137', '064158647', 287, '7487753978719813', '01/22/2015', 'Y'); 
insert into reservation values('00138', '821346916', 114, '5694015983779931', '08/01/2016', 'N'); 
insert into reservation values('00139', '861952229', 194, '9852547260513247', '04/28/2016', 'N'); 
insert into reservation values('00140', '495146877', 422, '3854330056391653', '08/03/2016', 'N'); 
insert into reservation values('00141', '762252848', 100, '8193911125078285', '11/06/2015', 'Y'); 
insert into reservation values('00142', '867250478', 975, '4358002187071897', '09/09/2015', 'N'); 
insert into reservation values('00143', '057684994', 779, '5536480731060912', '04/28/2015', 'N'); 
insert into reservation values('00144', '245413592', 298, '5914978986241013', '01/19/2015', 'Y'); 
insert into reservation values('00145', '827643735', 715, '8957002782632114', '01/24/2016', 'N'); 
insert into reservation values('00146', '878581803', 215, '3178071959529148', '10/28/2015', 'Y'); 
insert into reservation values('00147', '841807618', 391, '9688197662069657', '11/12/2016', 'N'); 
insert into reservation values('00148', '495267605', 371, '9193698212477563', '07/14/2015', 'N'); 
insert into reservation values('00149', '709657507', 717, '8344502033813692', '04/10/2015', 'N'); 
insert into reservation values('00150', '853759923', 561, '6894961993971968', '01/24/2016', 'N'); 
insert into reservation values('00151', '847515288', 338, '7676463528494517', '07/09/2016', 'N'); 
insert into reservation values('00152', '874304029', 658, '5866327620706496', '08/03/2015', 'N'); 
insert into reservation values('00153', '267780642', 979, '8241076817701491', '09/24/2015', 'N'); 
insert into reservation values('00154', '835666211', 876, '7950542230006090', '02/02/2016', 'Y'); 
insert into reservation values('00155', '492151602', 549, '1257503582752954', '11/30/2015', 'N'); 
insert into reservation values('00156', '750670965', 111, '3740232255497666', '03/06/2016', 'N'); 
insert into reservation values('00157', '987654321', 601, '5138465813536888', '03/14/2016', 'N'); 
insert into reservation values('00158', '859462681', 410, '4858982142004045', '09/22/2015', 'Y'); 
insert into reservation values('00159', '141994383', 427, '9785217322057043', '02/23/2015', 'Y'); 
insert into reservation values('00160', '623328116', 505, '8871856075094282', '07/18/2016', 'N'); 
insert into reservation values('00161', '009355770', 491, '1563655533641037', '07/13/2016', 'Y'); 
insert into reservation values('00162', '227583552', 941, '7541844283864425', '02/25/2015', 'N'); 
insert into reservation values('00163', '806864707', 749, '9511289760767009', '12/05/2016', 'Y'); 
insert into reservation values('00164', '227583552', 820, '7541844283864425', '10/26/2016', 'N'); 
insert into reservation values('00165', '251275722', 262, '1307863341448090', '01/21/2016', 'Y'); 
insert into reservation values('00166', '010463426', 734, '2813288396818727', '02/27/2016', 'N'); 
insert into reservation values('00167', '959779967', 510, '4976672648895937', '11/05/2016', 'Y'); 
insert into reservation values('00168', '390298013', 760, '9261875281238207', '05/09/2015', 'Y'); 
insert into reservation values('00169', '346439992', 349, '9757237542937578', '05/19/2015', 'N'); 
insert into reservation values('00170', '098526550', 514, '4412659428226007', '11/04/2015', 'N'); 
insert into reservation values('00171', '676054956', 408, '2541946452916763', '06/22/2016', 'Y'); 
insert into reservation values('00172', '818038788', 139, '7791037510570699', '05/21/2016', 'N'); 
insert into reservation values('00173', '076188410', 240, '1213971645731411', '06/02/2016', 'N'); 
insert into reservation values('00174', '485353537', 316, '1666183329601255', '04/01/2016', 'N'); 
insert into reservation values('00175', '599238535', 773, '5998458077560519', '05/18/2016', 'N'); 
insert into reservation values('00176', '410709438', 954, '1891714215954422', '01/01/2015', 'N'); 
insert into reservation values('00177', '198980191', 733, '9690889997851194', '02/29/2015', 'N'); 
insert into reservation values('00178', '141994383', 584, '9785217322057043', '05/24/2016', 'Y'); 
insert into reservation values('00179', '921495149', 769, '3341262042014002', '03/01/2015', 'Y'); 
insert into reservation values('00180', '853759923', 742, '6894961993971968', '07/02/2015', 'Y'); 
insert into reservation values('00181', '514292149', 385, '8910144454459145', '03/25/2015', 'N'); 
insert into reservation values('00182', '762252848', 798, '8193911125078285', '09/19/2016', 'N'); 
insert into reservation values('00183', '104805364', 913, '1112934056273073', '02/19/2015', 'N'); 
insert into reservation values('00184', '510956524', 959, '6057497854488507', '07/04/2016', 'N'); 
insert into reservation values('00185', '027674342', 753, '8546353822058733', '10/12/2015', 'Y'); 
insert into reservation values('00186', '962224219', 389, '7037541068020785', '07/01/2015', 'N'); 
insert into reservation values('00187', '874304029', 467, '5866327620706496', '07/22/2015', 'N'); 
insert into reservation values('00188', '563329299', 570, '9053898698770807', '02/15/2015', 'Y'); 
insert into reservation values('00189', '529386525', 807, '4430891279147659', '09/07/2016', 'N'); 
insert into reservation values('00190', '084099400', 568, '3846261850454486', '11/05/2015', 'Y'); 
insert into reservation values('00191', '528487625', 105, '7261740698362601', '09/09/2015', 'Y'); 
insert into reservation values('00192', '541644681', 849, '3938574621695295', '09/16/2016', 'N'); 
insert into reservation values('00193', '099883738', 688, '7542828453632217', '11/05/2016', 'Y'); 
insert into reservation values('00194', '425919384', 447, '9373379176020910', '11/01/2015', 'N'); 
insert into reservation values('00195', '105240601', 391, '5005360211577537', '01/07/2016', 'Y'); 
insert into reservation values('00196', '044815309', 284, '4752445326795266', '10/13/2016', 'Y'); 
insert into reservation values('00197', '655209852', 156, '1806996998822748', '04/01/2015', 'N'); 
insert into reservation values('00198', '827643735', 707, '8957002782632114', '12/13/2016', 'Y'); 
insert into reservation values('00199', '975437112', 684, '9549711671896132', '01/12/2015', 'Y'); 
insert into reservation values('00200', '734036121', 793, '3069146691426388', '09/16/2016', 'N'); 
insert into reservation values('00201', '000169100', 475, '5982520582435285', '12/05/2016', 'N'); 
insert into reservation values('00202', '005218189', 675, '2671280836766098', '06/29/2015', 'Y'); 
insert into reservation values('00203', '437358274', 381, '5247188150778519', '06/05/2015', 'Y'); 
insert into reservation values('00204', '799679597', 298, '1025620644047638', '05/22/2016', 'Y'); 
insert into reservation values('00205', '937413879', 219, '4502332468872346', '12/30/2015', 'N'); 
insert into reservation values('00206', '803972516', 562, '9410849182449467', '08/26/2016', 'N'); 
insert into reservation values('00207', '241137861', 422, '1821784755440719', '02/08/2016', 'Y'); 
insert into reservation values('00208', '535374855', 756, '4934620052685782', '09/14/2015', 'N'); 
insert into reservation values('00209', '245826092', 547, '3593672160811790', '06/13/2016', 'N'); 
insert into reservation values('00210', '823383916', 821, '5463301179603301', '07/10/2015', 'Y'); 
insert into reservation values('00211', '099883738', 151, '7542828453632217', '08/30/2016', 'N'); 
insert into reservation values('00212', '940008409', 232, '2803600632692308', '09/29/2016', 'N'); 
insert into reservation values('00213', '503467725', 319, '5613257479580471', '05/19/2016', 'Y'); 
insert into reservation values('00214', '211127022', 232, '4142474654768159', '05/02/2015', 'Y'); 
insert into reservation values('00215', '681854013', 130, '8932547910029121', '07/18/2016', 'Y'); 
insert into reservation values('00216', '069895990', 728, '2829273792973819', '09/18/2016', 'Y'); 
insert into reservation values('00217', '512300405', 241, '1948874127498468', '12/13/2016', 'N'); 
insert into reservation values('00218', '389820653', 621, '3675507446671692', '04/11/2015', 'Y'); 
insert into reservation values('00219', '677214712', 132, '7086500829214752', '10/26/2015', 'N'); 
insert into reservation values('00220', '485353537', 955, '1666183329601255', '03/11/2015', 'Y'); 
insert into reservation values('00221', '512300405', 381, '1948874127498468', '04/28/2016', 'N'); 
insert into reservation values('00222', '878581803', 981, '3178071959529148', '10/21/2016', 'Y'); 
insert into reservation values('00223', '441586034', 623, '2555225264001183', '07/08/2015', 'Y'); 
insert into reservation values('00224', '607981624', 364, '7008813286111441', '08/06/2015', 'N'); 
insert into reservation values('00225', '241137861', 384, '1821784755440719', '03/14/2015', 'N'); 
insert into reservation values('00226', '522298615', 984, '5966648024279991', '06/06/2016', 'N'); 
insert into reservation values('00227', '346439992', 115, '9757237542937578', '04/22/2016', 'N'); 
insert into reservation values('00228', '333820028', 190, '9277378734998449', '01/03/2016', 'Y'); 
insert into reservation values('00229', '559139624', 619, '5474432624517607', '11/03/2016', 'Y'); 
insert into reservation values('00230', '916431649', 921, '9421987667168226', '04/11/2015', 'N'); 
insert into reservation values('00231', '948596499', 124, '7435534710574565', '04/23/2015', 'N'); 
insert into reservation values('00232', '076279338', 941, '5056995166638032', '02/27/2016', 'N'); 
insert into reservation values('00233', '803972516', 320, '9410849182449467', '02/03/2016', 'N'); 
insert into reservation values('00234', '695052883', 835, '3635845493608133', '06/14/2015', 'Y'); 
insert into reservation values('00235', '292995632', 871, '8345851277455064', '01/22/2016', 'Y'); 
insert into reservation values('00236', '541644681', 209, '3938574621695295', '05/03/2015', 'N'); 
insert into reservation values('00237', '064626778', 325, '1075225832998379', '02/04/2015', 'N'); 
insert into reservation values('00238', '835522278', 272, '3926718664648241', '07/27/2016', 'Y'); 
insert into reservation values('00239', '513958766', 239, '9305418453068164', '06/28/2016', 'N'); 
insert into reservation values('00240', '839168238', 330, '9219944977358431', '10/11/2015', 'N'); 
insert into reservation values('00241', '702121112', 999, '7800207770280064', '10/17/2015', 'N'); 
insert into reservation values('00242', '588855965', 964, '6699993543410734', '02/04/2015', 'Y'); 
insert into reservation values('00243', '609224582', 190, '5362764729419569', '07/24/2016', 'N'); 
insert into reservation values('00244', '430172894', 654, '1648989326298575', '12/28/2015', 'N'); 
insert into reservation values('00245', '842399847', 453, '7131720974652720', '08/23/2016', 'N'); 
insert into reservation values('00246', '728944307', 778, '4253086735269476', '11/01/2015', 'Y'); 
insert into reservation values('00247', '655209852', 332, '1806996998822748', '06/03/2016', 'N'); 
insert into reservation values('00248', '980868245', 649, '2847140034936343', '03/30/2015', 'N'); 
insert into reservation values('00249', '682459806', 159, '8831332932897091', '06/20/2016', 'Y'); 
insert into reservation values('00250', '047686725', 240, '5404510461415169', '06/16/2016', 'N'); 
insert into reservation values('00251', '540136815', 644, '4926498495727527', '04/25/2015', 'Y'); 
insert into reservation values('00252', '975437112', 584, '9549711671896132', '11/02/2016', 'Y'); 
insert into reservation values('00253', '065138982', 101, '5297533356046253', '07/09/2016', 'N'); 
insert into reservation values('00254', '462231604', 769, '9689970682258009', '10/09/2015', 'Y'); 
insert into reservation values('00255', '421396222', 488, '4167330172642269', '08/27/2015', 'N'); 
insert into reservation values('00256', '556781225', 958, '7665846160031553', '07/18/2015', 'N'); 
insert into reservation values('00257', '572723715', 916, '4297678776294822', '04/03/2015', 'N'); 
insert into reservation values('00258', '938642591', 119, '4465277614689601', '03/02/2016', 'N'); 
insert into reservation values('00259', '744202758', 960, '6544878526228429', '04/18/2016', 'Y'); 
insert into reservation values('00260', '396245593', 572, '8728875842988214', '12/02/2016', 'N'); 
insert into reservation values('00261', '019619898', 853, '2183005969403234', '06/19/2015', 'N'); 
insert into reservation values('00262', '647078066', 407, '2141126616370239', '03/18/2015', 'Y'); 
insert into reservation values('00263', '287783752', 184, '5198749096861759', '03/06/2015', 'Y'); 
insert into reservation values('00264', '702121112', 562, '7800207770280064', '07/01/2016', 'N'); 
insert into reservation values('00265', '652552938', 177, '6907472375769657', '04/25/2015', 'N'); 
insert into reservation values('00266', '410709438', 650, '1891714215954422', '03/15/2015', 'N'); 
insert into reservation values('00267', '772550346', 421, '4787411435096659', '08/29/2015', 'Y'); 
insert into reservation values('00268', '563329299', 232, '9053898698770807', '11/24/2016', 'N'); 
insert into reservation values('00269', '117069523', 206, '7903044332117935', '11/19/2016', 'Y'); 
insert into reservation values('00270', '587665135', 715, '6781291337541097', '06/09/2016', 'N'); 
insert into reservation values('00271', '991439449', 748, '1960641863172072', '03/23/2015', 'N'); 
insert into reservation values('00272', '811862332', 663, '6800390184429557', '12/25/2016', 'Y'); 
insert into reservation values('00273', '316044623', 246, '9340051676161355', '10/13/2016', 'Y'); 
insert into reservation values('00274', '938642591', 238, '4465277614689601', '04/17/2016', 'N'); 
insert into reservation values('00275', '493230818', 303, '9891574976034119', '08/28/2016', 'N'); 
insert into reservation values('00276', '626818596', 702, '9585959966374964', '05/22/2016', 'N'); 
insert into reservation values('00277', '482126047', 755, '9709562643272737', '11/16/2015', 'N'); 
insert into reservation values('00278', '065138982', 283, '5297533356046253', '06/19/2015', 'N'); 
insert into reservation values('00279', '027674342', 368, '8546353822058733', '03/10/2015', 'Y'); 
insert into reservation values('00280', '089759674', 117, '2594706342048375', '12/07/2015', 'Y'); 
insert into reservation values('00281', '603344158', 347, '5909425282632267', '08/01/2015', 'N'); 
insert into reservation values('00282', '980868245', 695, '2847140034936343', '10/06/2015', 'N'); 
insert into reservation values('00283', '596958885', 268, '2095425138131365', '11/06/2015', 'Y'); 
insert into reservation values('00284', '681854013', 877, '8932547910029121', '01/29/2015', 'Y'); 
insert into reservation values('00285', '743420277', 201, '4900631530680262', '11/29/2015', 'N'); 
insert into reservation values('00286', '361054063', 949, '1140117927331712', '04/04/2016', 'N'); 
insert into reservation values('00287', '743260368', 948, '4603663089297520', '03/05/2016', 'N'); 
insert into reservation values('00288', '655989783', 828, '9826297317611262', '06/05/2016', 'N'); 
insert into reservation values('00289', '662118356', 181, '4131806611151979', '03/27/2016', 'N'); 
insert into reservation values('00290', '135922451', 458, '8239436247204045', '04/25/2015', 'Y'); 
insert into reservation values('00291', '793380767', 888, '6702259620990131', '01/01/2016', 'N'); 
insert into reservation values('00292', '799420182', 252, '7498128161999310', '06/03/2015', 'Y'); 
insert into reservation values('00293', '603687436', 207, '2551121947318015', '06/27/2016', 'Y'); 
insert into reservation values('00294', '123456789', 487, '7050194499100249', '01/22/2015', 'N'); 
insert into reservation values('00295', '948596499', 950, '7435534710574565', '08/04/2015', 'Y'); 
insert into reservation values('00296', '044815309', 112, '4752445326795266', '10/22/2016', 'Y'); 
insert into reservation values('00297', '047686725', 454, '5404510461415169', '05/07/2016', 'N'); 
insert into reservation values('00298', '964999489', 612, '9547273870991315', '08/01/2016', 'N'); 
insert into reservation values('00299', '361217343', 192, '3008311844040642', '05/25/2016', 'N');
