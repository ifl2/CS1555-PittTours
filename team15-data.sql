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
30 PLANES
Plane(plane type, manufacture, plane capacity, last service date, year, owner id)

plane type char(4) = generated manually (format is manufacturer_capacity)
manufacture varchar(10) = generated manually (manufacturer A to D)
plane capacity int = generated manually based on plane type
last service date = generated randomly starting at 01/01/2010 and ending at 12/31/2015
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

flight number varchar(3) = generated randomly as unique values from 100 to 999
airline id, varchar(5) -> airline.airlineid = generated randomly from airline_id (001 to 010)
plane type char(4) -> plane.planetype = generated randomly from planes
departure city varchar(3) -> 3 letter airport code = generated randomly as unique values of real airport abbreviations
arrival city varchar(3) -> 3 letter airport code = generated randomly as unique values of real airport abbreviations (with different arrival from departure)
departure time varchar(4) -> 0000 to 2359 = generated randomly from 000 to 235, append 0
arrival time varchar(4) = generated randomly from 000 to 235, append 0
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

insert into customer values('572723715',  'Mr', 'Theron Broadwa',
insert into customer values('047686725', 'Mrs', 'Trinidad Fasano',
insert into customer values('117069523', 'Mrs', 'Ezequiel Coco',
insert into customer values('496499705',  'Mr', 'Shirley Topper',
insert into customer values('744202758',  'Ms', 'Edison Shireman',
insert into customer values('806864707',  'Ms', 'Seth Hardie',
insert into customer values('563329299', 'Mrs', 'Chris Fisler',
insert into customer values('702121112',  'Ms', 'Gregorio Philippe',
insert into customer values('607981624',  'Mr', 'Darron Trejo',
insert into customer values('421396222',  'Ms', 'Dexter Ferro',
insert into customer values('435756181', 'Mrs', 'Rayford Crouch',
insert into customer values('695052883', 'Mrs', 'Derrick Lydick',
insert into customer values('609224582', 'Mrs', 'Randolph Queen',
insert into customer values('959779967',  'Ms', 'Cristopher Radosevich',
insert into customer values('975437112',  'Ms', 'Floyd Magwood',
insert into customer values('827643735',  'Mr', 'Seymour Mattox',
insert into customer values('005218189',  'Mr', 'Wilford Fails',
insert into customer values('599806989', 'Mrs', 'Enoch Wittenberg',
insert into customer values('803972516', 'Mrs', 'Harris Bame',
insert into customer values('485353537',  'Ms', 'Max Lobaugh',
insert into customer values('510956524',  'Ms', 'Mauro Tewksbury',
insert into customer values('122855678', 'Mrs', 'Robin Bonn',
insert into customer values('492151602',  'Mr', 'Kory Hobart',
insert into customer values('333820028',  'Ms', 'Edgar Dolan',
insert into customer values('315389743',  'Ms', 'Jamaal Mersch',
insert into customer values('652552938',  'Mr', 'Alec Rattler',
insert into customer values('141994383',  'Ms', 'Chong Volker',
insert into customer values('677214712', 'Mrs', 'Jonas Giraldo',
insert into customer values('948596499',  'Mr', 'Markus Cole',
insert into customer values('410709438',  'Mr', 'Scottie Fisch',
insert into customer values('910900016',  'Mr', 'Reinaldo Linthicum',
insert into customer values('750670965',  'Ms', 'Bryant Hougen',
insert into customer values('859462681', 'Mrs', 'Andreas Nathanson',
insert into customer values('057684994',  'Mr', 'Thomas Morse',
insert into customer values('430172894',  'Mr', 'Everett Dixion',
insert into customer values('104805364',  'Mr', 'Antone Ontiveros',
insert into customer values('019619898',  'Mr', 'Freeman Weitzel',
insert into customer values('944199143',  'Ms', 'Edmundo Lagos',
insert into customer values('823383916',  'Mr', 'Garth Rapier',
insert into customer values('559139624',  'Ms', 'Logan Hottle',
insert into customer values('655209852', 'Mrs', 'Moises Sikes',
insert into customer values('245413592', 'Mrs', 'Tory Sammet',
insert into customer values('835666211', 'Mrs', 'Vince Stancill',
insert into customer values('655989783',  'Mr', 'Alberto Sinquefield',
insert into customer values('346439992', 'Mrs', 'Franklyn Tatem',
insert into customer values('462231604', 'Mrs', 'Edgardo Treadwell',
insert into customer values('528684751',  'Ms', 'Milford Kinkead',
insert into customer values('473579802',  'Ms', 'Martin Pinner',
insert into customer values('841807618', 'Mrs', 'Rocky Heide',
insert into customer values('842399847', 'Mrs', 'Lizbeth Wendler',
insert into customer values('937413879',  'Ms', 'Diamond Runkle',
insert into customer values('010463426', 'Mrs', 'Marilou Halpin',
insert into customer values('878581803', 'Mrs', 'Tiesha Speece',
insert into customer values('821346916', 'Mrs', 'Sherita Allgeier',
insert into customer values('495146877',  'Ms', 'Manie Hasan',
insert into customer values('513958766',  'Ms', 'Luci Moton',
insert into customer values('247591186', 'Mrs', 'Isidra Carberry',
insert into customer values('044815309', 'Mrs', 'Belle Pizer',
insert into customer values('743260368', 'Mrs', 'Shanice Scheidt',
insert into customer values('275550901',  'Mr', 'Daysi Ohm',
insert into customer values('164291643', 'Mrs', 'Vanesa Letcher',
insert into customer values('603344158',  'Ms', 'Delois Boykins',
insert into customer values('065138982',  'Mr', 'Marnie Saechao',
insert into customer values('227583552',  'Mr', 'Joyce Finlayson',
insert into customer values('493230818',  'Ms', 'Veronica Gilreath',
insert into customer values('512300405', 'Mrs', 'Devora Hynek',
insert into customer values('031325149', 'Mrs', 'Marcella Kula',
insert into customer values('874304029',  'Mr', 'Jacqueline Jetter',
insert into customer values('064626778',  'Ms', 'Celinda Merriman',
insert into customer values('060010524', 'Mrs', 'Genoveva Teets',
insert into customer values('772550346',  'Mr', 'Karina Mannix',
insert into customer values('980868245',  'Mr', 'Jonelle Orrell',
insert into customer values('099883738',  'Mr', 'Zora Donmoyer',
insert into customer values('076279338',  'Ms', 'Shavonda Griffieth',
insert into customer values('681854013', 'Mrs', 'Larhonda Hund',
insert into customer values('734036121',  'Mr', 'Jolene Maharaj',
insert into customer values('861952229',  'Ms', 'Melodi Pop',
insert into customer values('064158647',  'Ms', 'Raymonde Marshell',
insert into customer values('514292149',  'Ms', 'Renetta Wilt',
insert into customer values('241137861',  'Ms', 'Regine Wester',
insert into customer values('089759674',  'Ms', 'Martina Bess',
insert into customer values('811862332',  'Mr', 'Yen Boye',
insert into customer values('938642591',  'Ms', 'Gidget Dolce',
insert into customer values('495267605', 'Mrs', 'Glenda Desoto',
insert into customer values('541644681', 'Mrs', 'Stephaine Carns',
insert into customer values('027674342',  'Mr', 'Staci Pizzuto',
insert into customer values('940008409', 'Mrs', 'Fiona Cobian',
insert into customer values('415825484', 'Mrs', 'Lianne Claybrook',
insert into customer values('762252848', 'Mrs', 'Keli Sproul',
insert into customer values('771043703',  'Mr', 'Tamra Lasiter',
insert into customer values('572625127',  'Ms', 'Genia Gorham',
insert into customer values('390298013', 'Mrs', 'Natalya Arnone',
insert into customer values('482126047', 'Mrs', 'Lynetta Hamler',
insert into customer values('577900935',  'Mr', 'Micki Morphis',
insert into customer values('375428778',  'Ms', 'Sylvie Frutos',
insert into customer values('853759923',  'Ms', 'Serita Gleason',
insert into customer values('596958885', 'Mrs', 'Solange Sikora',
insert into customer values('406636105', 'Mrs', 'Deborah Burkhard',
insert into customer values('799420182',  'Mr', 'Denisha Tarkington',
insert into customer values('237155722',  'Mr', 'Henry Scicchitano',
insert into customer values('867250478',  'Ms', 'Thad Fett',
insert into customer values('695231176',  'Mr', 'Howard Rocca',
insert into customer values('997054969', 'Mrs', 'Deangelo Dewalt',
insert into customer values('027587440', 'Mrs', 'Johnie Legros',
insert into customer values('647078066',  'Ms', 'Emmitt Cardillo',
insert into customer values('292995632', 'Mrs', 'Barney Mealer',
insert into customer values('211127022', 'Mrs', 'Demarcus Cape',
insert into customer values('816246078',  'Mr', 'Jospeh Nock',
insert into customer values('962224219',  'Ms', 'Mohammad Eberle',
insert into customer values('561814355',  'Ms', 'Roosevelt Durbin',
insert into customer values('528836955',  'Mr', 'Bernard Remigio',
insert into customer values('245826092',  'Mr', 'Sandy Olsen',
insert into customer values('799679597', 'Mrs', 'Darius Anthony',
insert into customer values('371129753', 'Mrs', 'Blaine Bailer',
insert into customer values('437358274', 'Mrs', 'Bud Seamans',
insert into customer values('181890051', 'Mrs', 'Buster Easterling',
insert into customer values('069895990',  'Mr', 'Roman Nolton',
insert into customer values('725168037', 'Mrs', 'Bradly Jiggetts',
insert into customer values('535374855',  'Mr', 'Del Sessions',
insert into customer values('565245105',  'Mr', 'Alfonzo Stuber',
insert into customer values('556781225',  'Mr', 'Merle Hadden',
insert into customer values('516024925',  'Mr', 'Miguel Bowland',
insert into customer values('200283332',  'Ms', 'Salvador Frances',
insert into customer values('897433158',  'Mr', 'Sammy Booth',
insert into customer values('529386525', 'Mrs', 'Pat Ficklin',
insert into customer values('943831419', 'Mrs', 'Troy Lustig',
insert into customer values('147126771',  'Mr', 'Anton Heiser',
insert into customer values('964999489',  'Ms', 'Brooks Spector',
insert into customer values('094384100',  'Ms', 'Hollis Viggiano',
insert into customer values('000169100',  'Mr', 'Abe Azure',
insert into customer values('709657507',  'Ms', 'Odis Edberg',
insert into customer values('626818596',  'Ms', 'Jesse Troxel',
insert into customer values('849940578',  'Mr', 'Virgilio Machnik',
insert into customer values('728944307',  'Mr', 'Graham Waldroup',
insert into customer values('053641040',  'Ms', 'Ike Desjardins',
insert into customer values('198980191',  'Mr', 'Ahmed Saraiva',
insert into customer values('991439449',  'Mr', 'Carl Gillispie',
insert into customer values('839168238',  'Mr', 'Omar Sato',
insert into customer values('396245593', 'Mrs', 'Jae Nygard',
insert into customer values('098526550', 'Mrs', 'Michal Talkington',
insert into customer values('135922451', 'Mrs', 'Ian Karlson',
insert into customer values('662118356',  'Ms', 'Quinton Wickman',
insert into customer values('897836558',  'Ms', 'Delmer Laurin',
insert into customer values('399923463',  'Mr', 'Virgil Coghlan',
insert into customer values('316044623',  'Ms', 'Dario Kuchera',
insert into customer values('847515288', 'Mrs', 'Elisha Giblin',
insert into customer values('798024737',  'Ms', 'Morgan Litten',
insert into customer values('076188410',  'Mr', 'Roberto Danforth',
insert into customer values('998478429', 'Mrs', 'Dwight Tindell',
insert into customer values('138799371',  'Mr', 'Jay Waid',
insert into customer values('634260106',  'Mr', 'Evangelina Kania',
insert into customer values('818038788', 'Mrs', 'Casie Decker',
insert into customer values('469168214', 'Mrs', 'Dinah Hilden',
insert into customer values('468774954',  'Mr', 'Birdie Lozier',
insert into customer values('587665135', 'Mrs', 'Delisa Camarillo',
insert into customer values('911862479', 'Mrs', 'Augusta Lomeli',
insert into customer values('153090441', 'Mrs', 'Isadora Heminger',
insert into customer values('603687436',  'Ms', 'Shanelle Bernstein',
insert into customer values('509012755',  'Ms', 'Cherlyn Gallimore',
insert into customer values('916431649',  'Mr', 'Trish Marchese',
insert into customer values('441586034',  'Ms', 'Carolee Dunston',
insert into customer values('389820653',  'Ms', 'Margarette Stumbo',
insert into customer values('835522278', 'Mrs', 'Shana Demaria',
insert into customer values('308184933',  'Ms', 'Robbin Liles',
insert into customer values('004055120',  'Ms', 'Lila Pelosi',
insert into customer values('251490312', 'Mrs', 'Kristina Mcgruder',
insert into customer values('040298740',  'Ms', 'Carolynn Falcone',
insert into customer values('267780642',  'Mr', 'Tenesha Stillwell',
insert into customer values('105240601',  'Mr', 'Lyla Huntsman',
insert into customer values('503467725', 'Mrs', 'Latashia Swihart',
insert into customer values('682459806',  'Ms', 'Arvilla Ravenscroft',
insert into customer values('837380998',  'Ms', 'Tijuana Meriwether',
insert into customer values('793380767',  'Mr', 'Janice Maine',
insert into customer values('540136815',  'Mr', 'Maia Clair',
insert into customer values('361217343', 'Mrs', 'Bebe Maio',
insert into customer values('522298615', 'Mrs', 'Digna Stayer',
insert into customer values('586470645',  'Mr', 'Lona Durso',
insert into customer values('921495149', 'Mrs', 'Marica Mikelson',
insert into customer values('378612413',  'Ms', 'Shaniqua Hart',
insert into customer values('596740895',  'Mr', 'Rikki Mahar',
insert into customer values('623328116',  'Ms', 'Jami Lafollette',
insert into customer values('425919384',  'Ms', 'Elisabeth Peppers',
insert into customer values('676054956',  'Mr', 'Shin Lettinga',
insert into customer values('446815414',  'Ms', 'Pauline Bollman',
insert into customer values('743420277',  'Mr', 'Gena Desch',
insert into customer values('084099400',  'Ms', 'Pamela Roesch',
insert into customer values('254844152',  'Ms', 'Libbie Shimek',
insert into customer values('528487625', 'Mrs', 'Cecila Strausbaugh',
insert into customer values('437037714',  'Mr', 'Jolanda Loera',
insert into customer values('251275722', 'Mrs', 'Meta Alberti',
insert into customer values('980133909',  'Mr', 'Cindie Maxim',
insert into customer values('260474822',  'Ms', 'Voncile Diego',
insert into customer values('009355770',  'Mr', 'Zella Hice',
insert into customer values('287783752', 'Mrs', 'Gabrielle Lenderman',
insert into customer values('599238535',  'Mr', 'Brinda Rand',
insert into customer values('588855965', 'Mrs', 'Le Shadle',
insert into customer values('361054063', 'Mrs', 'Felisha Mitchel',
insert into customer values('201827992',  'Mr', 'Argentina Adelman',
insert into customer values('123456789',  'Ms', 'Nettie Twitchell', 
/*                                              'Oma Masten',
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
