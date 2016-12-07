/* METHOD SYNTAX FOR DRIVER
	ADMIN COMMANDS
		adm1();
		adm2(filename);
		adm3(filename);
		adm4L(filename):
		adm4C(departure_city, arrival_city, high_price, low_price);
			high_price & low_price -> int
		adm5(filename);
		adm6(flight_number, flight_date);
			flight_date -> date format: MM/DD/YYYY
	CUSTOMER COMMANDS
		cus1(salutation, first_name, last_name, street, city, state, phone, email, credit_card_num, credit_card_expire);
			salutation -> Mr/Mrs/Ms
			state -> 2 letter abbreviation
			credit_card_expire -> date format: MM/YYYY
		cus2(first_name, last_name);
		cus3(city_one, city_two);
		cus4(departure_city, arrival_city);
		cus5(departure_city, arrival_city, airline_name);
		cus6(departure_city, arrival_city);
		cus7(departure_city, arrival_city, airline_name);
		cus8(flight_num_1, flight_num_2, flight_num_3, flight_num_4, date_1, date_1, date_3, date_4);
			flight_num_1 -> leg one away (required)
			flight_num_2 -> leg two away (optional)
			flight_num_3 -> leg one return (optional)
			flight_num_3 -> leg two return (optional, flight_num_3 required)
			date_# -> date of corresponding flight number (date format: MM/DD/YYYY)
		cus9(reservation_number);
		cus10(reservation_number)
*/

import java.sql.*;
import java.util.*;
import java.io.*;

public class Driver {
	private Scanner scan = new Scanner(System.in);
	private static Menu menu = new Menu();

	////////////////////////////////////////////////////////
	//  DRIVER MENU : gives different driver run options  //
	////////////////////////////////////////////////////////

	public void driverMenu() {
		System.out.println(
			"\nSelect Driver run option:" +
			"\n1: Demonstration (run through each command once)" +
			"\n2: Benchmark (run through commands extensively)" +
			"\n3: Delete Database (seperated to prevent unwanted deletion)" +
			"\n4: Neither, Quit\n");
		System.out.print("Enter menu choice: ");
		String inputString = scan.nextLine();
		int choice = 0;
		try { choice = Integer.parseInt(inputString);
		} catch(NumberFormatException e) {choice = 0;}
		if(choice == 1)
			runDemonstration();
		else if(choice == 2)
			runBenchmark();
		else if(choice == 3)
			runDelete();
		else if(choice == 4) {
			System.out.println("EXITING");
			System.exit(0);
		}
		else {
			System.out.println("INVALID CHOICE");
			driverMenu();
		}
	}

	//////////////////////////////////////////////////////////
	//  RUN DEMONSTRATION : demonstrates each command once  //
	//////////////////////////////////////////////////////////

	public void runDemonstration() {
		System.out.println("\nA2: LOADING AIRLINES...");
		menu.adm2("airlines.txt");
		System.out.println("\nA3: LOADING FLIGHTS...");
		menu.adm3("flights.txt");
		System.out.println("\nA5: LOADING PLANES...");
		menu.adm5("planes.txt");
		System.out.println("\nA4L: LOADING PRICES...");
		menu.adm4L("prices.txt");
		System.out.println("\nA4C: CHANGING FLIGHT PRICE...");
		menu.adm4C("LAX", "LAS", 250, 200);
		System.out.print("\nA6: GENERATING PASSENGER MANIFEST...");
		menu.adm6("000", "12/25/2016");
		System.out.println("C1: ADDING CUSTOMER...");
		menu.cus1("Mr", "John", "Smith", "Main Street", "CityTown", "NY", "5551234567", "js@email.com", "123123123", "02/20");
		System.out.print("C2: SHOWING CUSTOMER INFO...");
		menu.cus2("John", "Smith");
		System.out.print("C3: CHECKING FLIGHT PRICE...");
		menu.cus3("LAS", "JFK");
		System.out.println("C4: SHOWING AVAILABLE ROUTES...");
		menu.cus4("LAS", "JFK");
		System.out.println("\nC5: SHOWING AVAILABLE ROUTES GIVEN AIRLINE...");
		menu.cus5("LAS", "JFK", "Airline005");
		System.out.println("\nC6: SHOWING AVAILABLE ROUTES...");
		menu.cus6("LAS", "JFK"); // Will have data added
		System.out.println("\nC7: SHOWING AVAILABLE ROUTES GIVEN AIRLINE...");
		menu.cus7("LAS", "JFK", "Airline005"); // Will have date added
		//System.out.println("C8: ADDING RESERVAION...");
		//menu.cus8(); // Add once command is complete
		System.out.print("\nC9: SHOWING RESERVATION INFO...");
		menu.cus9("00000");
		System.out.println("\nC10: BUYING TICKET FOR RESERVATION...");
		menu.cus10("00000");
		System.out.println("\nDEMONSTRATION COMPLETE");
		System.out.print("Press Enter to Continue... ");
		scan.nextLine();
		driverMenu();
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//  RUN BENCHMARK : runs each command hundreds of times. File load commands run once but on larger files  //
	////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public void runBenchmark() {
		System.out.println("\nA2: LOADING AIRLINES...");
		menu.adm2("airlines2.txt");
		System.out.println("\nA3: LOADING FLIGHTS...");
		menu.adm3("flights2.txt"); // Make flights2.txt
		System.out.println("\nA5: LOADING PLANES...");
		menu.adm5("planes2.txt"); // Make planes2.txt
		System.out.println("\nA4L: LOADING PRICES...");
		menu.adm4L("prices2.txt"); // Make prices2.txt
		System.out.println("\nA4C: CHANGING FLIGHT PRICES...");
		runadm4C();
		System.out.print("\nA6: GENERATING PASSENGER MANIFESTS...");
		runadm6();
		// Finish customer benchmarks
		// Fills maximum open cursors, after each command reset connection
		System.out.println("\BENCHMARK COMPLETE");
		System.out.print("Press Enter to Continue... ");
		scan.nextLine();
		driverMenu();
	}

	//////////////////////////////////////////////////////////////
	//  RUN DELETE : demonstrates database deletion seperately  //
	//////////////////////////////////////////////////////////////

	public void runDelete() {
		System.out.println("\nDELETING DATABASE...");
		menu.adm1();
		System.out.print("Press Enter to Continue... ");
		scan.nextLine();
		driverMenu();
	}

	////////////////////////////////////////////
	//  MAIN : handles primary method calls   //
	////////////////////////////////////////////

	public static void main(String args[]) throws SQLException {
		// Connect to the Database
		menu.connectDB();
		// Go to driver menu
		Driver driver = new Driver();
		driver.driverMenu();
	}

	////////////////////////////////////////////////////////////////////////////
	//  BENCHMARK METHODS : the below methods run commands hundreds of times  //
	////////////////////////////////////////////////////////////////////////////

	public void runadm4C() {
		menu.adm4C("LAX", "LAS", 1243, 1178);
		menu.adm4C("PHX", "SEA", 1233, 1189);
		menu.adm4C("MCO", "ATL", 1293, 1182);
		menu.adm4C("CLT", "MCO", 1227, 1122);
		menu.adm4C("DFW", "MIA", 1280, 1166);
		menu.adm4C("JFK", "LAX", 1225, 1101);
		menu.adm4C("LAS", "MSP", 1226, 1116);
		menu.adm4C("MSP", "PHX", 1279, 1104);
		menu.adm4C("SFO", "LAS", 1256, 1108);
		menu.adm4C("IAH", "LAS", 1212, 1160);
		menu.adm4C("BOS", "DFW", 1298, 1126);
		menu.adm4C("DTW", "BOS", 1234, 1107);
		menu.adm4C("MIA", "SEA", 1279, 1141);
		menu.adm4C("PHL", "DFW", 1251, 1197);
		menu.adm4C("SEA", "MCO", 1222, 1199);
		menu.adm4C("ATL", "LAX", 1236, 1170);
		menu.adm4C("LGA", "CLT", 1267, 1151);
		menu.adm4C("EWR", "IAH", 1269, 1131);
		menu.adm4C("DEN", "MSP", 1258, 1163);
		menu.adm4C("ORD", "DTW", 1223, 1188);
		menu.adm4C("MCO", "MIA", 1299, 1160);
		menu.adm4C("BOS", "EWR", 1218, 1195);
		menu.adm4C("ATL", "SEA", 1248, 1103);
		menu.adm4C("SEA", "IAH", 1215, 1172);
		menu.adm4C("IAH", "MIA", 1222, 1197);
		menu.adm4C("CLT", "PHX", 1202, 1133);
		menu.adm4C("LAS", "DEN", 1209, 1187);
		menu.adm4C("PHX", "MCO", 1237, 1140);
		menu.adm4C("LGA", "PHL", 1251, 1139);
		menu.adm4C("MIA", "SFO", 1243, 1194);
		menu.adm4C("JFK", "BOS", 1250, 1172);
		menu.adm4C("DTW", "LGA", 1242, 1197);
		menu.adm4C("MSP", "DEN", 1288, 1181);
		menu.adm4C("DFW", "PHL", 1283, 1185);
		menu.adm4C("EWR", "ATL", 1202, 1102);
		menu.adm4C("SFO", "EWR", 1225, 1113);
		menu.adm4C("LAX", "SFO", 1259, 1131);
		menu.adm4C("PHL", "MSP", 1227, 1128);
		menu.adm4C("ORD", "CLT", 1295, 1144);
		menu.adm4C("DEN", "PHL", 1281, 1131);
		menu.adm4C("SFO", "JFK", 1209, 1198);
		menu.adm4C("EWR", "CLT", 1237, 1145);
		menu.adm4C("IAH", "DTW", 1284, 1144);
		menu.adm4C("JFK", "DTW", 1219, 1130);
		menu.adm4C("ATL", "PHL", 1285, 1191);
		menu.adm4C("ORD", "MSP", 1275, 1112);
		menu.adm4C("SEA", "DTW", 1226, 1107);
		menu.adm4C("MSP", "ATL", 1277, 1185);
		menu.adm4C("PHL", "LGA", 1277, 1178);
		menu.adm4C("DTW", "JFK", 1203, 1139);
		menu.adm4C("DEN", "ATL", 1254, 1100);
		menu.adm4C("BOS", "IAH", 1266, 1133);
		menu.adm4C("LAX", "SEA", 1243, 1174);
		menu.adm4C("LAS", "SFO", 1273, 1161);
		menu.adm4C("LGA", "SFO", 1236, 1119);
		menu.adm4C("MIA", "JFK", 1274, 1107);
		menu.adm4C("CLT", "EWR", 1216, 1162);
		menu.adm4C("DFW", "LAX", 1221, 1109);
		menu.adm4C("PHX", "SFO", 1246, 1144);
		menu.adm4C("MCO", "EWR", 1213, 1160);
		menu.adm4C("EWR", "DFW", 1203, 1171);
		menu.adm4C("LGA", "SEA", 1288, 1146);
		menu.adm4C("ATL", "DFW", 1294, 1123);
		menu.adm4C("DEN", "LGA", 1209, 1170);
		menu.adm4C("CLT", "ORD", 1218, 1156);
		menu.adm4C("MCO", "BOS", 1212, 1157);
		menu.adm4C("LAS", "LGA", 1240, 1121);
		menu.adm4C("MSP", "DFW", 1202, 1167);
		menu.adm4C("LAX", "MIA", 1222, 1117);
		menu.adm4C("DTW", "LAS", 1242, 1198);
		menu.adm4C("SEA", "BOS", 1286, 1170);
		menu.adm4C("PHX", "LAX", 1250, 1166);
		menu.adm4C("DFW", "IAH", 1224, 1153);
		menu.adm4C("BOS", "EQR", 1235, 1128);
		menu.adm4C("MIA", "DTW", 1251, 1157);
		menu.adm4C("JFK", "DEN", 1300, 1191);
		menu.adm4C("IAH", "JFK", 1254, 1165);
		menu.adm4C("ORD", "JFK", 1249, 1161);
		menu.adm4C("PHL", "LAX", 1275, 1176);
		menu.adm4C("SFO", "LGA", 1280, 1106);
		menu.adm4C("CLT", "ATL", 1287, 1134);
		menu.adm4C("JFK", "LAS", 1258, 1184);
		menu.adm4C("LAX", "DEN", 1280, 1147);
		menu.adm4C("SEA", "PHX", 1248, 1149);
		menu.adm4C("MSP", "ORD", 1284, 1125);
		menu.adm4C("IAH", "MCO", 1243, 1131);
		menu.adm4C("LGA", "MIA", 1252, 1119);
		menu.adm4C("LAS", "ORD", 1201, 1165);
		menu.adm4C("BOS", "CLT", 1252, 1136);
		menu.adm4C("MCO", "ORD", 1241, 1185);
		menu.adm4C("MIA", "PHX", 1209, 1195);
		menu.adm4C("PHL", "BOS", 1212, 1120);
		menu.adm4C("EWR", "MCO", 1230, 1191);
		menu.adm4C("PHX", "CLT", 1223, 1111);
		menu.adm4C("DTW", "IAH", 1295, 1116);
		menu.adm4C("ORD", "PHL", 1279, 1183);
		menu.adm4C("DFW", "MSP", 1241, 1157);
		menu.adm4C("SFO", "DEN", 1225, 1155);
		menu.adm4C("ATL", "PHX", 1290, 1184);
		menu.adm4C("DEN", "ORD", 1292, 1175);
	}

	public void runadm6() {
		menu.adm6("010", "04/30/2015");
		menu.adm6("011", "10/31/2016");
		menu.adm6("012", "09/30/2016");
		menu.adm6("013", "02/28/2015");
		menu.adm6("014", "09/30/2015");
		menu.adm6("015", "11/30/2015");
		menu.adm6("016", "01/31/2015");
		menu.adm6("017", "03/31/2016");
		menu.adm6("018", "12/31/2015");
		menu.adm6("019", "07/31/2016");
		menu.adm6("020", "12/31/2015");
		menu.adm6("021", "04/30/2016");
		menu.adm6("022", "08/31/2016");
		menu.adm6("023", "04/30/2016");
		menu.adm6("024", "08/31/2015");
		menu.adm6("025", "04/30/2016");
		menu.adm6("026", "01/31/2015");
		menu.adm6("027", "03/31/2016");
		menu.adm6("028", "08/31/2015");
		menu.adm6("029", "05/31/2015");
		menu.adm6("030", "02/28/2015");
		menu.adm6("031", "08/31/2015");
		menu.adm6("032", "01/31/2016");
		menu.adm6("033", "11/30/2016");
		menu.adm6("034", "01/31/2016");
		menu.adm6("035", "02/28/2016");
		menu.adm6("036", "02/28/2015");
		menu.adm6("037", "08/31/2015");
		menu.adm6("038", "07/31/2016");
		menu.adm6("039", "03/31/2016");
		menu.adm6("040", "12/31/2016");
		menu.adm6("041", "05/31/2016");
		menu.adm6("042", "06/30/2015");
		menu.adm6("043", "12/31/2016");
		menu.adm6("044", "06/30/2016");
		menu.adm6("045", "01/31/2016");
		menu.adm6("046", "04/30/2016");
		menu.adm6("047", "09/30/2015");
		menu.adm6("048", "10/31/2015");
		menu.adm6("049", "07/31/2016");
		menu.adm6("050", "06/30/2016");
		menu.adm6("051", "11/30/2016");
		menu.adm6("052", "11/30/2016");
		menu.adm6("053", "05/31/2015");
		menu.adm6("054", "10/31/2016");
		menu.adm6("055", "06/30/2016");
		menu.adm6("056", "09/30/2016");
		menu.adm6("057", "11/30/2015");
		menu.adm6("058", "10/31/2015");
		menu.adm6("059", "11/30/2015");
		menu.adm6("060", "11/30/2015");
		menu.adm6("061", "03/31/2016");
		menu.adm6("062", "08/31/2015");
		menu.adm6("063", "08/31/2015");
		menu.adm6("064", "01/31/2016");
		menu.adm6("065", "03/31/2016");
		menu.adm6("066", "11/30/2016");
		menu.adm6("067", "11/30/2015");
		menu.adm6("068", "05/31/2015");
		menu.adm6("069", "03/31/2016");
		menu.adm6("070", "11/30/2016");
		menu.adm6("071", "07/31/2016");
		menu.adm6("072", "04/30/2016");
		menu.adm6("073", "07/31/2016");
		menu.adm6("074", "06/30/2015");
		menu.adm6("075", "12/31/2015");
		menu.adm6("076", "07/31/2016");
		menu.adm6("077", "11/30/2016");
		menu.adm6("078", "02/28/2016");
		menu.adm6("079", "07/31/2015");
		menu.adm6("080", "10/31/2015");
		menu.adm6("081", "11/30/2015");
		menu.adm6("082", "06/30/2015");
		menu.adm6("083", "05/31/2015");
		menu.adm6("084", "07/31/2015");
		menu.adm6("085", "06/30/2016");
		menu.adm6("086", "03/31/2016");
		menu.adm6("087", "07/31/2016");
		menu.adm6("088", "02/28/2015");
		menu.adm6("089", "05/31/2015");
		menu.adm6("090", "11/30/2015");
		menu.adm6("091", "09/30/2015");
		menu.adm6("092", "10/31/2015");
		menu.adm6("093", "06/30/2016");
		menu.adm6("094", "09/30/2015");
		menu.adm6("095", "01/31/2015");
		menu.adm6("096", "02/28/2016");
		menu.adm6("097", "04/30/2015");
		menu.adm6("098", "06/30/2015");
		menu.adm6("099", "05/31/2016");
		menu.adm6("000", "05/31/2016");
		menu.adm6("001", "05/31/2015");
		menu.adm6("002", "11/30/2016");
		menu.adm6("003", "03/31/2015");
		menu.adm6("004", "06/30/2016");
		menu.adm6("005", "08/31/2015");
		menu.adm6("006", "01/31/2016");
		menu.adm6("007", "04/30/2015");
		menu.adm6("008", "03/31/2016");
		menu.adm6("009", "01/31/2015");
		menu.adm6("010", "07/31/2016");
		menu.adm6("011", "05/31/2016");
		menu.adm6("012", "08/31/2016");
		menu.adm6("013", "02/28/2015");
		menu.adm6("014", "08/31/2015");
		menu.adm6("015", "06/30/2015");
		menu.adm6("016", "11/30/2016");
		menu.adm6("017", "12/31/2015");
		menu.adm6("018", "06/30/2015");
		menu.adm6("019", "07/31/2015");
		menu.adm6("020", "09/30/2015");
		menu.adm6("021", "10/31/2016");
		menu.adm6("022", "05/31/2016");
		menu.adm6("023", "09/30/2015");
		menu.adm6("024", "02/28/2016");
		menu.adm6("025", "07/31/2015");
		menu.adm6("026", "08/31/2016");
		menu.adm6("027", "03/31/2016");
		menu.adm6("028", "11/30/2016");
		menu.adm6("029", "06/30/2016");
		menu.adm6("030", "05/31/2016");
		menu.adm6("031", "11/30/2015");
		menu.adm6("032", "01/31/2015");
		menu.adm6("033", "01/31/2016");
		menu.adm6("034", "03/31/2016");
		menu.adm6("035", "05/31/2016");
		menu.adm6("036", "03/31/2016");
		menu.adm6("037", "01/31/2015");
		menu.adm6("038", "08/31/2016");
		menu.adm6("039", "04/30/2016");
		menu.adm6("040", "08/31/2016");
		menu.adm6("041", "11/30/2015");
		menu.adm6("042", "09/30/2015");
		menu.adm6("043", "04/30/2015");
		menu.adm6("044", "01/31/2015");
		menu.adm6("045", "01/31/2016");
		menu.adm6("046", "10/31/2015");
		menu.adm6("047", "11/30/2016");
		menu.adm6("048", "07/31/2015");
		menu.adm6("049", "04/30/2015");
		menu.adm6("050", "01/31/2016");
		menu.adm6("051", "07/31/2016");
		menu.adm6("052", "08/31/2015");
		menu.adm6("053", "09/30/2015");
		menu.adm6("054", "02/28/2016");
		menu.adm6("055", "11/30/2015");
		menu.adm6("056", "03/31/2016");
		menu.adm6("057", "03/31/2016");
		menu.adm6("058", "09/30/2015");
		menu.adm6("059", "02/28/2015");
		menu.adm6("060", "07/31/2016");
		menu.adm6("061", "07/31/2016");
		menu.adm6("062", "02/28/2015");
		menu.adm6("063", "12/31/2016");
		menu.adm6("064", "10/31/2016");
		menu.adm6("065", "01/31/2016");
		menu.adm6("066", "02/28/2016");
		menu.adm6("067", "11/30/2016");
		menu.adm6("068", "05/31/2015");
		menu.adm6("069", "05/31/2015");
		menu.adm6("070", "11/30/2015");
		menu.adm6("071", "06/30/2016");
		menu.adm6("072", "05/31/2016");
		menu.adm6("073", "06/30/2016");
		menu.adm6("074", "04/30/2016");
		menu.adm6("075", "05/31/2016");
		menu.adm6("076", "01/31/2015");
		menu.adm6("077", "02/28/2015");
		menu.adm6("078", "05/31/2016");
		menu.adm6("079", "03/31/2015");
		menu.adm6("080", "07/31/2015");
		menu.adm6("081", "03/31/2015");
		menu.adm6("082", "09/30/2016");
		menu.adm6("083", "02/28/2015");
		menu.adm6("084", "07/31/2016");
		menu.adm6("085", "10/31/2015");
		menu.adm6("086", "07/31/2015");
		menu.adm6("087", "07/31/2015");
		menu.adm6("088", "02/28/2015");
		menu.adm6("089", "09/30/2016");
		menu.adm6("090", "11/30/2015");
		menu.adm6("091", "09/30/2015");
		menu.adm6("092", "09/30/2016");
		menu.adm6("093", "11/30/2016");
		menu.adm6("094", "11/30/2015");
		menu.adm6("095", "01/31/2016");
		menu.adm6("096", "10/31/2016");
		menu.adm6("097", "04/30/2015");
		menu.adm6("098", "12/31/2016");
		menu.adm6("099", "01/31/2015");
		menu.adm6("000", "09/30/2016");
		menu.adm6("001", "12/31/2016");
		menu.adm6("002", "06/30/2015");
		menu.adm6("003", "06/30/2015");
		menu.adm6("004", "05/31/2016");
		menu.adm6("005", "12/31/2015");
		menu.adm6("006", "08/31/2016");
		menu.adm6("007", "02/28/2016");
		menu.adm6("008", "09/30/2015");
		menu.adm6("009", "06/30/2016");
		menu.adm6("010", "07/31/2015");
		menu.adm6("011", "08/31/2016");
		menu.adm6("012", "09/30/2016");
		menu.adm6("013", "05/31/2016");
		menu.adm6("014", "05/31/2015");
		menu.adm6("015", "07/31/2016");
		menu.adm6("016", "09/30/2016");
		menu.adm6("017", "12/31/2016");
		menu.adm6("018", "04/30/2015");
		menu.adm6("019", "10/31/2015");
		menu.adm6("020", "03/31/2015");
		menu.adm6("021", "04/30/2016");
		menu.adm6("022", "10/31/2016");
		menu.adm6("023", "07/31/2015");
		menu.adm6("024", "08/31/2015");
		menu.adm6("025", "03/31/2015");
		menu.adm6("026", "06/30/2016");
		menu.adm6("027", "04/30/2016");
		menu.adm6("028", "01/31/2016");
		menu.adm6("029", "11/30/2016");
		menu.adm6("030", "04/30/2015");
		menu.adm6("031", "04/30/2015");
		menu.adm6("032", "02/28/2016");
		menu.adm6("033", "02/28/2016");
		menu.adm6("034", "06/30/2015");
		menu.adm6("035", "01/31/2016");
		menu.adm6("036", "05/31/2015");
		menu.adm6("037", "02/28/2015");
		menu.adm6("038", "07/31/2016");
		menu.adm6("039", "06/30/2016");
		menu.adm6("040", "10/31/2015");
		menu.adm6("041", "10/31/2015");
		menu.adm6("042", "02/28/2015");
		menu.adm6("043", "07/31/2016");
		menu.adm6("044", "12/31/2015");
		menu.adm6("045", "08/31/2016");
		menu.adm6("046", "11/30/2015");
		menu.adm6("047", "06/30/2016");
		menu.adm6("048", "03/31/2015");
		menu.adm6("049", "06/30/2016");
		menu.adm6("050", "06/30/2016");
		menu.adm6("051", "04/30/2015");
		menu.adm6("052", "11/30/2016");
		menu.adm6("053", "07/31/2016");
		menu.adm6("054", "10/31/2015");
		menu.adm6("055", "08/31/2015");
		menu.adm6("056", "07/31/2015");
		menu.adm6("057", "04/30/2015");
		menu.adm6("058", "03/31/2016");
		menu.adm6("059", "04/30/2016");
		menu.adm6("060", "12/31/2016");
		menu.adm6("061", "06/30/2015");
		menu.adm6("062", "03/31/2015");
		menu.adm6("063", "03/31/2015");
		menu.adm6("064", "07/31/2016");
		menu.adm6("065", "04/30/2015");
		menu.adm6("066", "03/31/2015");
		menu.adm6("067", "08/31/2015");
		menu.adm6("068", "11/30/2016");
		menu.adm6("069", "11/30/2016");
		menu.adm6("070", "06/30/2016");
		menu.adm6("071", "03/31/2015");
		menu.adm6("072", "12/31/2016");
		menu.adm6("073", "10/31/2016");
		menu.adm6("074", "04/30/2016");
		menu.adm6("075", "08/31/2016");
		menu.adm6("076", "05/31/2016");
		menu.adm6("077", "11/30/2015");
		menu.adm6("078", "06/30/2015");
		menu.adm6("079", "03/31/2015");
		menu.adm6("080", "12/31/2015");
		menu.adm6("081", "08/31/2015");
		menu.adm6("082", "10/31/2015");
		menu.adm6("083", "11/30/2015");
		menu.adm6("084", "01/31/2015");
		menu.adm6("085", "11/30/2015");
		menu.adm6("086", "04/30/2016");
		menu.adm6("087", "03/31/2016");
		menu.adm6("088", "06/30/2016");
		menu.adm6("089", "03/31/2016");
		menu.adm6("090", "04/30/2015");
		menu.adm6("091", "01/31/2016");
		menu.adm6("092", "06/30/2015");
		menu.adm6("093", "06/30/2016");
		menu.adm6("094", "01/31/2015");
		menu.adm6("095", "08/31/2015");
		menu.adm6("096", "10/31/2016");
		menu.adm6("097", "05/31/2016");
		menu.adm6("098", "08/31/2016");
		menu.adm6("099", "05/31/2016");
	}
}