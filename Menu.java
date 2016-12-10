import java.sql.*;
import java.util.*;
import java.io.*;
import java.text.ParseException;

public class Menu {
	private static Menu menu = new Menu();
	private static Connection connection;
	private Statement statement;
	private ResultSet resultSet, resultSet2;
	private Scanner scan = new Scanner(System.in);
	private String inputString, query, username, password;
	private String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";
	private int choice;
	private boolean exit, flight_connection;

	//////////////////////////////////////////////////////////////
	//  CONNECTION TO DATABASE : makes necessary db connection  //
	//////////////////////////////////////////////////////////////

	public void connectDB() {
		System.out.println("CONNECTING TO DB");
		System.out.print("Username: ");
		username = scan.nextLine();
		Console console = System.console(); // Hides password input in console
		password = new String(console.readPassword("Password: "));
		try {
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
			connection = DriverManager.getConnection(url, username, password);
		} catch(Exception Ex) {
			System.out.println("Error connecting to database.  Machine Error: " + Ex.toString());
			Ex.printStackTrace();
			System.out.println("\nCONNECTION IS REQUIRED: EXITING");
			System.exit(0); // No need to make sure connection is closed since it wasn't made
		}
	}

	///////////////////////////////////////////////////////////////////////////////
	//  RESET CONNECTION : used by driver to avoid 'maximum cursors open' error  //
	///////////////////////////////////////////////////////////////////////////////

	public void resetConnection() {
		try {
			connection.close();
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
			connection = DriverManager.getConnection(url, username, password);
		} catch(Exception Ex) {
			System.out.println("Error connecting to database.  Machine Error: " + Ex.toString());
			Ex.printStackTrace();
			System.out.println("\nCONNECTION IS REQUIRED: EXITING");
			System.exit(0); // No need to make sure connection is closed since it wasn't made
		}
	}

	/////////////////////////////////////////////////////
	//  ACCESS TYPE : gets admin/customer access type  //
	/////////////////////////////////////////////////////

	public void getAccess() {
		// Display menu options
		System.out.println(
			"\nWelcome to PittTours are you a:" +
			"\n1: Administrator" +
			"\n2: Customer" +
			"\n3: Neither, Quit\n");

		// Get user input
		System.out.print("Enter menu choice: ");
		inputString = scan.nextLine();
		// Convert input to integer, if not convertable, set to 0 (invalid)
		try { choice = Integer.parseInt(inputString);
		} catch(NumberFormatException e) {choice = 0;}

		// Handle user choices
		if(choice == 1)
			displayAdmInterface();
		else if(choice == 2)
			displayCusInterface();
		else if(choice == 3) {} // Simply drops back to main to properly exit
		else { // If invalid choice, recall method
			System.out.println("INVALID CHOICE");
			getAccess();
		}
	}

	///////////////////////////////////////////////////////////
	//  ADMINISTRATOR INTERFACE : handles all admin queries  //
	///////////////////////////////////////////////////////////

	public void displayAdmInterface() {
		// Display menu options
		System.out.println(
			"\nAVAILABLE ADMINISTRATOR COMMANDS:" +
			"\n1: Erase the Database" +
			"\n2: Load airline information" +
			"\n3: Load schedule information" +
			"\n4: Load pricing information" +
			"\n5: Load plane information" +
			"\n6: Generate passenger manifest of flight on day" +
			"\n7: Quit\n");

		// Get user input
		System.out.print("Enter command number: ");
		inputString = scan.nextLine();
		// Convert input to integer, if not convertable, set to 0 (invalid)
		try { choice = Integer.parseInt(inputString);
		} catch(NumberFormatException e) {choice = 0;}

		// Handle user choices
		if(choice == 1) {
			// Get user verification
			System.out.print("Are you sure you want to delete the database? (Y/N): ");
			inputString = scan.nextLine();
			// If user verifies database deletion
			if(inputString.equals("Y") || inputString.equals("y"))
				adm1();
			else System.out.println("DATABASE ERASURE CANCELLED");
		}
		else if(choice == 2) {
			System.out.print("Please enter file name with airline information: ");
			String filename = scan.nextLine();
			adm2(filename);
		}
		else if(choice == 3) {
			System.out.print("Please enter file name with schedule information: ");
			String filename = scan.nextLine();
			adm3(filename);
		}
		else if(choice == 4) {
			// Display menu options
			System.out.println(
				"WOULD YOU LIKE TO:\n" +
				"L: Load pricing information\n" +
				"C: Change flight price\n");
			System.out.print("Enter Command: ");
			inputString = scan.nextLine();
			// If load pricing information option was selected (L)
			if(inputString.equals("L") || inputString.equals("l")) {
				System.out.print("Please enter file name with pricing information: ");
				String filename = scan.nextLine();
				adm4L(filename);
			}
			// If change flight pricing information was selected (C)
			else if(inputString.equals("C") || inputString.equals("c")) {
				String dCity, aCity;
				System.out.println("YOU HAVE CHOSEN TO CHANGE A FLIGHT PRICE");
				System.out.print("What is the departure city of the flight you wish to change?: ");
				dCity = scan.nextLine();
				System.out.print("And the arrival city of this flight?: ");
				aCity = scan.nextLine();
				System.out.print("What is the new high price for this flight?: ");
				inputString = scan.nextLine();
				int hPrice = 0, lPrice = 0;
				boolean invalidPrice = false;
				try { hPrice = Integer.parseInt(inputString);
				} catch(NumberFormatException e) {invalidPrice = true;}
				System.out.print("And the low price?: ");
				inputString = scan.nextLine();
				try { lPrice = Integer.parseInt(inputString);
				} catch(NumberFormatException e) {invalidPrice = true;}
				if(!invalidPrice) { // Continue only if price is valid
					System.out.println( // Display entered data for confirmation before execution
						"\n You have entered the following information:" +
						"\nDeparture City: " + dCity +
						"\nArrival City: " + aCity +
						"\nHigh Price: " + hPrice +
						"\nLow Price: " + lPrice +
						"\nIs this this correct? (Y/N)");
					inputString = scan.nextLine();
					// If input data is confirmed, execute
					if(inputString.equals("Y") || inputString.equals("y"))
						adm4C(dCity, aCity, hPrice, lPrice);
					else System.out.println("NOTHING CHANGED");
				} else System.out.println("ERROR: Price must be a number!");
			} else System.out.println("INVALID CHOICE");
		}
		else if(choice == 5) {
			System.out.print("Please enter file name with plane information: ");
			String filename = scan.nextLine();
			adm5(filename);
		}
		else if(choice == 6) {
			String flightNum, flightDate;
			System.out.print("Enter flight number: ");
			flightNum = scan.nextLine();
			System.out.print("Enter flight date (MM/DD/YYYY): ");
			flightDate = scan.nextLine();
			adm6(flightNum, flightDate);
		}
		else if(choice == 7) exit = true;
		else System.out.println("INVALID CHOICE");

		if(!exit) { // Exiting will ignore loop and drop to main to exit properly
			// Repeat menu after user controlled pause
			System.out.print("Press Enter to Continue... ");
			scan.nextLine();
			displayAdmInterface();
		}
	}

	/////////////////////////////////////////////////////////
	//  CUSTOMER INTERFACE : handles all customer queries  //
	/////////////////////////////////////////////////////////

	private void displayCusInterface() {
		// Display menu options
		System.out.println(
			"\nAVAILABLE CUSTOMER COMMANDS:" +
			"\n1: Add customer" +
			"\n2: Show customer info, given customer name" +
			"\n3: Find price for flights between two cities" +
			"\n4: Find all routes between two cities" +
			"\n5: Find all routes between two cities of a given airline" +
			"\n6: Find all routes with available seats between two cities on given day" +
			"\n7: For a given airline, find all routes with available seats between two cities on given day" +
			"\n8: Add reservation" +
			"\n9: Show reservation info, given reservation number" +
			"\n10: Buy ticket from existing reservation" +
			"\n11: Quit\n");

		// Get user input
		System.out.print("Enter command number: ");
		inputString = scan.nextLine();
		// Convert input to integer, if not convertable, set to 0 (invalid)
		try { choice = Integer.parseInt(inputString);
		} catch(NumberFormatException e) {choice = 0;}

		// Handle user choices
		if(choice == 1) {
			System.out.print("Please enter Salutation (Mr/Mrs/Ms): ");
			String salutation = scan.nextLine();
			System.out.print("Please enter First Name: ");
			String first = scan.nextLine();
			System.out.print("Please enter Last Name: ");
			String last = scan.nextLine();
			try { // Check if customer already exists
				query = "select * from CUSTOMER where first_name = ? and last_name = ?";
				PreparedStatement updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,first);
				updateStatement.setString(2,last);
				updateStatement.executeUpdate();
				resultSet = updateStatement.executeQuery(query);
				// If name doesn't exist, continue and get additional user input
				if(!resultSet.next()) {
					System.out.print("Please enter Street Address: ");
					String street = scan.nextLine();
					System.out.print("Please enter City: ");
					String city = scan.nextLine();
					System.out.print("Please enter State (2 letter): ");
					String state = scan.nextLine();
					System.out.print("Please enter Phone Number: ");
					String phone = scan.nextLine();
					System.out.print("Please enter Email address: ");
					String email = scan.nextLine();
					System.out.print("Please enter Credit Card Number: ");
					String cardNum = scan.nextLine();
					System.out.print("Please enter Credit Card Expiration Date (MM/YYYY): ");
					String expire = scan.nextLine();
					cus1(salutation, first, last, street, city, state, phone, email, cardNum, expire);
				} else System.out.println("ERROR: Customer already exists!");
			} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
		}
		else if(choice == 2) {
			System.out.print("Please enter Customer First Name: ");
			String first = scan.nextLine();
			System.out.print("Please enter Last Name: ");
			String last = scan.nextLine();
			cus2(first, last);
		}
		else if(choice == 3) {
			System.out.print("Please enter City One (3 letter): ");
			String one = scan.nextLine();
			System.out.print("Please enter City Two (3 letter): ");
			String two = scan.nextLine();
			cus3(one, two);
		}
		else if(choice == 4) {
			System.out.print("Please enter Departure City (3 letter): ");
			String depart = scan.nextLine();
			System.out.print("Please enter Arrival City (3 letter): ");
			String arrive = scan.nextLine();
			cus4(depart, arrive);
		}
		else if(choice == 5) {
			System.out.print("Please enter Departure City (3 letter): ");
			String depart = scan.nextLine();
			System.out.print("Please enter Arrival City (3 letter): ");
			String arrive = scan.nextLine();
			System.out.print("Please enter Airline name (full name): ");
			String airline = scan.nextLine();
			cus5(depart, arrive, airline);
		}
		else if(choice == 6) {
			System.out.print("Please enter Departure City (3 letter): ");
			String depart = scan.nextLine();
			System.out.print("Please enter Arrival City (3 letter): ");
			String arrive = scan.nextLine();
			System.out.print("Please enter Date (MM/DD/YYYY): ");
			String date = scan.nextLine();
			cus6(depart, arrive, date);
		}
		else if(choice == 7) {
			System.out.print("Please enter Departure City (3 letter): ");
			String depart = scan.nextLine();
			System.out.print("Please enter Arrival City (3 letter): ");
			String arrive = scan.nextLine();
			System.out.print("Please enter Date (MM/DD/YYYY): ");
			String date = scan.nextLine();
			System.out.print("Please enter Airline name (full name): ");
			String airline = scan.nextLine();
			cus7(depart, arrive, date, airline);
		}
		else if(choice == 8) {
			// Flight numbers
			String flight1 = null, flight2 = null, flight3 = null, flight4 = null;
			// Flight dates
			String dateN1 = null, dateN2 = null, dateN3 = null, dateN4 = null;
			// Booleans for if flight is available or wasn't entered
			boolean flight1A = false, flight2A = false, flight3A = false, flight4A = false;
			System.out.println("ADDING RESERVATION:\nAdd first flight:");
			// Get first leg (required)
			System.out.print(" Flight Number: ");
			flight1 = scan.nextLine();
			System.out.print(" Departure Date (MM/DD/YYYY): ");
			dateN1 = scan.nextLine();
			// Get second leg (optional)
			System.out.print("Add another leg in this direction? (Y/N): ");
			inputString = scan.nextLine();
			if(inputString.equals("Y") || inputString.equals("y")) {
				System.out.print(" Flight Number: ");
				flight2 = scan.nextLine();
				System.out.print(" Departure Date (MM/DD/YYYY): ");
				dateN2 = scan.nextLine();
			}
			// Get return trip first leg (optional)
			System.out.print("Add return trip? (Y/N): ");
			inputString = scan.nextLine();
			if(inputString.equals("Y") || inputString.equals("y")) {
				System.out.print(" Flight Number: ");
				flight3 = scan.nextLine();
				System.out.print(" Departure Date (MM/DD/YYYY): ");
				dateN3 = scan.nextLine();
				// Get return trip second leg (optional, requires return trip first leg)
				System.out.print("Add another leg in this direction? (Y/N): ");
				inputString = scan.nextLine();
				if(inputString.equals("Y") || inputString.equals("y")) {
					System.out.print(" Flight Number: ");
					flight4 = scan.nextLine();
					System.out.print(" Departure Date (MM/DD/YYYY): ");
					dateN4 = scan.nextLine();
				}
			}
			try { // Check if seats are available in non-null flights
				PreparedStatement updateStatement;
				if(flight2 != null && !flight1.isEmpty()) { // Check if flight1 seat is available
					query = "select flight_number from flight f1, plane where f1.flight_number = ? AND plane.plane_capacity > (select count(D.flight_number) from DETAIL D where D.flight_number = ?)";
					updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,flight1);
					updateStatement.setString(2,flight1);
					updateStatement.executeUpdate();
					resultSet = updateStatement.executeQuery(query);
					if(resultSet.next())
						flight1A = true;
				}
				else
					flight1A = true;
				if(flight2 != null && !flight2.isEmpty()) { // Check if flight2 seat is available
					query = "select flight_number from flight f1, plane where f1.flight_number = ? AND plane.plane_capacity > (select count(D.flight_number) from DETAIL D where D.flight_number = ?)";
					updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,flight2);
					updateStatement.setString(2,flight2);
					updateStatement.executeUpdate();
					resultSet = updateStatement.executeQuery(query);
					if(resultSet.next())
						flight2A = true;
				}
				else
					flight2A = true;
				if(flight3 != null && !flight3.isEmpty()) { // Check if flight3 seat is available
					query = "select flight_number from flight f1, plane where f1.flight_number = ? AND plane.plane_capacity > (select count(D.flight_number) from DETAIL D where D.flight_number = ?)";
					updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,flight3);
					updateStatement.setString(2,flight3);
					updateStatement.executeUpdate();
					resultSet = updateStatement.executeQuery(query);
					if(resultSet.next())
						flight3A = true;
				}
				else
					flight3A = true;
				if(flight4 != null && !flight4.isEmpty()) { // Check if flight4 seat is available
					query = "select flight_number from flight f1, plane where f1.flight_number = ? AND plane.plane_capacity > (select count(D.flight_number) from DETAIL D where D.flight_number = ?)";
					updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,flight4);
					updateStatement.setString(2,flight4);
					updateStatement.executeUpdate();
					resultSet = updateStatement.executeQuery(query);
					if(resultSet.next())
						flight4A = true;
				}
				else
					flight4A = true;
				// If all non-null flights are available, get cid and call cus8 to gather data and make reservation
				if(flight1A && flight2A && flight3A && flight4A) {
					// Get customer CID
					System.out.print("Seating available!\n Please enter CID: ");
					String cid = scan.nextLine();
					cus8(flight1, flight2, flight3, flight4, dateN1, dateN2, dateN3, dateN4, cid);
				}
				else
					System.out.println("SEATING UNAVAILABLE ON ONE OR MORE FLIGHTS");
			} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
		}
		else if(choice == 9) {
			System.out.print("Please enter reservation number: ");
			String num = scan.nextLine();
			cus9(num);
		}
		else if(choice == 10) {
			System.out.print("Please enter reservation number: ");
			String num = scan.nextLine();
			cus10(num);
		}
		else if(choice == 11) exit = true;
		else System.out.println("INVALID CHOICE");

		if(!exit) { // Exiting will ignore loop and drop to main to exit properly
			// Repeat menu after user controlled pause
			System.out.print("Press Enter to Continue... ");
			scan.nextLine();
			displayCusInterface();
		}
	}

	//////////////////////////////////////////////////////////////////
	//  METHODS : can be run from driver, contains no user queries  //
	//////////////////////////////////////////////////////////////////

	// Administrator Command #1
	public void adm1() {
		try { // Delete all table contents
			statement = connection.createStatement();
			statement.executeQuery("delete from PLANE");
			statement.executeQuery("delete from FLIGHT");
			statement.executeQuery("delete from PRICE");
			statement.executeQuery("delete from CUSTOMER");
			statement.executeQuery("delete from RESERVATION");
			statement.executeQuery("delete from DETAIL");
			statement.executeQuery("delete from OUR_DATE");
			statement.executeQuery("delete from AIRLINE");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
		System.out.println("DATABASE ERASED");
	}

	// Administrator Command #2
	public void adm2(String filename) {
		try { // Read from file
			FileInputStream fstream = new FileInputStream(filename);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String strLine;
			try { // Insert into airline table
				while((strLine = br.readLine()) != null) {
					String[] tokens = strLine.split(",");
					int year_founded = 0;
					try { year_founded = Integer.parseInt(tokens[3]);
					} catch(NumberFormatException e) {System.out.println("STATEMENT CONTAINS INVALID DATA");}
					query = "insert into AIRLINE values(?,?,?,?)";
					PreparedStatement updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,tokens[0]);
					updateStatement.setString(2,tokens[1]);
					updateStatement.setString(3,tokens[2]);
					updateStatement.setInt(4,year_founded);
					updateStatement.executeUpdate();
				}
				System.out.println("AIRLINES LOADED");
			} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
		} catch(IOException e) {System.out.println("FILE NOT FOUND");}
	}

	// Administrator Command #3
	public void adm3(String filename) {
		try { // Read from file
			FileInputStream fstream = new FileInputStream(filename);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String strLine;
			try { // Insert into flight table
				while((strLine = br.readLine()) != null) {
					String[] tokens = strLine.split(",");
					query = "insert into FLIGHT values(?,?,?,?,?,?,?,?)";
					PreparedStatement updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,tokens[0]);
					updateStatement.setString(2,tokens[1]);
					updateStatement.setString(3,tokens[2]);
					updateStatement.setString(4,tokens[3]);
					updateStatement.setString(5,tokens[4]);
					updateStatement.setString(6,tokens[5]);
					updateStatement.setString(7,tokens[6]);
					updateStatement.setString(8,tokens[7]);
					updateStatement.executeUpdate();
				}
				System.out.println("SCHEDULES LOADED");
			} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
		} catch(IOException e) {System.out.println("FILE NOT FOUND");}
	}

	// Administrator Command #4, Option L
	public void adm4L(String filename) {
		try { // Read from file
			FileInputStream fstream = new FileInputStream(filename);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String strLine;
			try { // Insert into price table
				while((strLine = br.readLine()) != null) {
					String[] tokens = strLine.split(",");
					int high_price = 0;
					try { high_price = Integer.parseInt(tokens[3]);
					} catch(NumberFormatException e) {System.out.println("STATEMENT CONTAINS INVALID DATA");}
					int low_price = 0;
					try { high_price = Integer.parseInt(tokens[4]);
					} catch(NumberFormatException e) {System.out.println("STATEMENT CONTAINS INVALID DATA");}
					query = "insert into PRICE values(?,?,?,?,?)";
					PreparedStatement updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,tokens[0]);
					updateStatement.setString(2,tokens[1]);
					updateStatement.setString(3,tokens[2]);
					updateStatement.setInt(4,high_price);
					updateStatement.setInt(5,low_price);
					updateStatement.executeUpdate();
				}
				System.out.println("PRICES LOADED");
			} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
		} catch(IOException e) {System.out.println("FILE NOT FOUND");}
	}

	// Administrator Command #4, Option C
	public void adm4C(String dCity, String aCity, int hPrice, int lPrice) {
		try { // Update prices
			query = "UPDATE price SET high_price = ? ,low_price = ? WHERE departure_city = ? AND arrival_city = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setInt(1,hPrice);
			updateStatement.setInt(2,lPrice);
			updateStatement.setString(3,dCity);
			updateStatement.setString(4,aCity);
			updateStatement.executeUpdate();
			System.out.println("PRICES CHANGED");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Administrator Command #5
	public void adm5(String filename) {
		try { // Read from file
			FileInputStream fstream = new FileInputStream(filename);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String strLine;
			try { // Insert into plane table
				while((strLine = br.readLine()) != null) {
					String[] tokens = strLine.split(",");
					int capacity = 0;
					try { capacity = Integer.parseInt(tokens[2]);
					} catch(NumberFormatException e) {System.out.println("STATEMENT CONTAINS INVALID DATA");}
					int year = 0;
					try { year = Integer.parseInt(tokens[4]);
					} catch(NumberFormatException e) {System.out.println("STATEMENT CONTAINS INVALID DATA");}
					java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");
					java.sql.Date date = null;
					try { date = new java.sql.Date(df.parse(tokens[3]).getTime());
					} catch(Exception e) {System.out.println("INVALID DATE");}
					query = "insert into PLANE values(?,?,?,?,?,?)";
					PreparedStatement updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,tokens[0]);
					updateStatement.setString(2,tokens[1]);
					updateStatement.setInt(3,capacity);
					updateStatement.setDate(4,date);
					updateStatement.setInt(5,year);
					updateStatement.setString(6,tokens[5]);
					updateStatement.executeUpdate();
				}
				System.out.println("PLANES LOADED");
			} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
		} catch(IOException e) {System.out.println("FILE NOT FOUND");}
	}

	// Administrator Command #6
	public void adm6(String flightNum, String flightDate) {
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");
		java.sql.Date date = null;
		try { date = new java.sql.Date(df.parse(flightDate).getTime());
		} catch(Exception e) {System.out.println("INVALID DATE");}
		try { // Get passengers of flight on date
			query = "SELECT salutation, first_name, last_name " +
					"FROM (customer c full join reservation r on c.cid = r.cid) " +
					"full join detail d on r.reservation_number = d.reservation_number " +
					"WHERE d.flight_number = ? AND d.flight_date = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,flightNum);
			updateStatement.setDate(2,date);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			int counter = 1;
			System.out.println("\nPASSENGERS OF FLIGHT " + flightNum + " ON " + flightDate + ":");
			while(resultSet.next()) {
				System.out.println("Passenger " + counter + ": " + resultSet.getString(1) + ". " + resultSet.getString(2) + " " + resultSet.getString(3));
				counter ++;
			}
			System.out.println(""); // For formatting
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #1
	public void cus1(String... inputs) {
		// Store inputs
		String salutation = inputs[0], first = inputs[1], last = inputs[2], street = inputs[3], city = inputs[4],
			state = inputs[5], phone = inputs[6], email = inputs[7], cardNum = inputs[8], expire = inputs[9], miles = null;
		// Convert Date
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/yyyy");
		java.sql.Date date = null;
		try { date = new java.sql.Date(df.parse(expire).getTime());
		} catch(Exception e) {System.out.println("INVALID DATE");}
		try {
			// Generate a CID for customer
			boolean flag = false;
			String cid = "";
			while(!flag) {
				// Generate random 9 digit number
				char[] chars = "0123456789".toCharArray();
				Random rnd = new Random();
				StringBuilder sb = new StringBuilder();
				for (int i = 0; i < 9; i++)
					sb.append(chars[rnd.nextInt(chars.length)]);
				cid = sb.toString();
				// Check if random value for cid already exists in the database
				query = "select * from CUSTOMER where cid = ?";
				PreparedStatement updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,cid);
				updateStatement.executeUpdate();
				resultSet = updateStatement.executeQuery(query);
				// Exits while loop once we obtain a cid that doesn't already exist
				flag = true;
				if(resultSet.next())
					flag = false;
			}
			// Insert User
			query = "insert into CUSTOMER values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,cid);
			updateStatement.setString(2,salutation);
			updateStatement.setString(3,first);
			updateStatement.setString(4,last);
			updateStatement.setString(5,cardNum);
			updateStatement.setDate(6,date);
			updateStatement.setString(7,street);
			updateStatement.setString(8,city);
			updateStatement.setString(9,state);
			updateStatement.setString(10,phone);
			updateStatement.setString(11,email);
			updateStatement.setString(12,miles);
			updateStatement.executeUpdate();
			System.out.println("Customer successfully added to the database!\nPittRewards number: " + cid + "\n");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #2
	public void cus2(String first, String last) {
		try { // Get customer data
			query = "select * from CUSTOMER where first_name = ? and last_name = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,first);
			updateStatement.setString(2,last);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			boolean customer_exists = false;
			while(resultSet.next()) {
				System.out.println(
					"\n CID: " + resultSet.getString(1) +
					"\n Salutation: " + resultSet.getString(2) +
					"\n First Name: " + resultSet.getString(3) +
					"\n Last Name: " + resultSet.getString(4) +
					"\n Credit Card Number: " + resultSet.getString(5) +
					"\n Credit Card Expiration: " + resultSet.getString(6) +
					"\n Street address: " + resultSet.getString(7) +
					"\n City: " + resultSet.getString(8) +
					"\n State: " + resultSet.getString(9) +
					"\n Phone Number: " + resultSet.getString(10) +
					"\n Email: " + resultSet.getString(11) +
					"\n Frequent Miles: " +resultSet.getString(12) + "\n");
				customer_exists = true;
			}
			if(!customer_exists)
				System.out.println("\nNo customer with that name exists");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #3
	public void cus3(String one, String two) {
		try {
			int highSum1 = 0, lowSum1 = 0, highSum2 = 0, lowSum2 = 0;
			// City 1 -> City 2
			query = "select high_price, low_price from price where arrival_city = ? and departure_city = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,one);
			updateStatement.setString(2,two);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			System.out.println(""); // For formatting
			if(resultSet.next()) {
				System.out.println(one + " -> " + two);
				System.out.println(" High Price: " + resultSet.getString(1) + "\n Low Price: " + resultSet.getString(2));
				highSum1 = Integer.parseInt(resultSet.getString(1));
				lowSum1 = Integer.parseInt(resultSet.getString(2));
			}
			else
				System.out.println("No pricing entry found for " + one + " -> " + two + ".");
			// City 2 -> City 1
			query = "select high_price, low_price from price where arrival_city = ? and departure_city = ?";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,two);
			updateStatement.setString(2,one);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			if(resultSet.next()) {
				System.out.println(two + " -> " + one);
				System.out.println(" High Price: " + resultSet.getString(1) + "\n Low Price: " + resultSet.getString(2));
				highSum2 = Integer.parseInt(resultSet.getString(1));
				lowSum2 = Integer.parseInt(resultSet.getString(2));
				// Get round trip prices
				highSum1 = highSum1 + highSum2;
				lowSum1 = lowSum1 + lowSum2;
				System.out.println("Round Trip from " + one + " to " + two + ":");
				System.out.println(" High Price: " + highSum1 + "\n Low Price: " + lowSum1 + "\n");
			}
			else
				System.out.println("No pricing entry found for " + two + " -> " + one + ".");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #4
	public void cus4(String depart, String arrive) {
		try {
			// Get direct flights
			query = "select flight_number, departure_time, arrival_time from FLIGHT where departure_city = ? and arrival_city = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,arrive);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			int counter = 1;
			while(resultSet.next()) {
				if(counter == 1) // Display only if first time, but not at all if no direct routes
					System.out.println("\nAll direct routes between " + depart + " -> " + arrive + ":");
				System.out.println(
					"Route " + counter + ": " +
					"\n Flight number: " + resultSet.getString(1) +
					"\n Departure Time: " + resultSet.getString(2) +
					"\n Arrival Time: " + resultSet.getString(3) + "\n");
				counter++;
			}
			if(counter == 1) // Display only if we found no direct routes
				System.out.println("\nNo direct routes between " + depart + " -> " + arrive + ".\n");
			// Get connected flights
			flight_connection = false;
			query = "SELECT f.flight_number, f.departure_time, f.arrival_time, f.arrival_city FROM flight f WHERE f.departure_city = ? AND f.arrival_city in (SELECT arrival_city from (SELECT f1.arrival_city FROM flight f1 where f1.departure_city = ?) natural join (SELECT f2.departure_city from flight f2 where f2.arrival_city = ?) where arrival_city = departure_city)";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,depart);
			updateStatement.setString(3,arrive);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			while(resultSet.next()) { // This loop goes through all legs with stated departure city
				query = "SELECT f.flight_number, f.departure_time, f.departure_time, f.departure_city FROM flight f WHERE f.arrival_city = ? AND f.departure_city in (SELECT departure_city from (SELECT f1.departure_city FROM flight f1 where f1.arrival_city = ?) natural join (SELECT f2.arrival_city from flight f2 where f2.departure_city = ?) where arrival_city = departure_city)";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,arrive);
				updateStatement.setString(2,arrive);
				updateStatement.setString(3,depart);
				updateStatement.executeUpdate();
				resultSet2 = updateStatement.executeQuery(query);
				while(resultSet2.next()) { // This loop goes through all legs with stated arrival city
					// If arrival city of leg one matches departure city of leg two, we have a valid connection!
					if(resultSet.getString(4).equals(resultSet2.getString(4))) {
						System.out.println(
							"\nRoute with connection: " + depart + " -> " + resultSet.getString(4) + " -> " + arrive + ":" +
							"\nFirst Leg:" +
							"\n Flight number: " + resultSet.getString(1) +
							"\n Departure Time: " + resultSet.getString(2) +
							"\n Departure City: " + depart +
							"\n Arrival Time: " + resultSet.getString(3) +
							"\n Arrival City: " + resultSet.getString(4) +
							"\nSecond Leg:" +
							"\n Flight number: " + resultSet2.getString(1) +
							"\n Departure Time: " + resultSet2.getString(2) +
							"\n Departure City: " + resultSet2.getString(4) +
							"\n Arrival Time: " + resultSet2.getString(3) +
							"\n Arrival City: " + arrive);
						flight_connection = true;
					}
				}
				System.out.println(""); // For formatting
			}
			if(!flight_connection) // Display only if no connected flights were found
				System.out.println("No connected flights between " + depart + " -> " + arrive + ".\n");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #5
	public void cus5(String depart, String arrive, String airline) {
		try {
			// Get direct flights
			query = "SELECT flight_number, departure_time, arrival_time FROM flight f full join airline a on f.airline_id = a.airline_id WHERE departure_city = ? AND arrival_city = ? and airline_name = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,arrive);
			updateStatement.setString(3,airline);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			int counter = 1;
			while(resultSet.next()) {
				if(counter == 1) // Display only if first time, but not at all if no direct routes
					System.out.println("\nAll direct routes between " + depart + " -> " + arrive + " for airline " + airline + ":");
				System.out.println(
					"Route " + counter + ": " +
					"\n Flight number: " + resultSet.getString(1) +
					"\n Departure Time: " + resultSet.getString(2) +
					"\n Arrival Time: " + resultSet.getString(3) + "\n");
				counter++;
			}
			if(counter == 1) // Display only if we found no direct routes
				System.out.println("\nNo direct routes between " + depart + " -> " + arrive + " for airline " + airline + ".\n");
			// Get connected flights
			flight_connection = false;
			query = "SELECT f.flight_number, f.departure_time, f.arrival_time, f.arrival_city, f.airline_id FROM flight f full join airline a on f.airline_id = a.airline_id WHERE departure_city = ? AND airline_name = ? AND arrival_city in (SELECT arrival_city from (SELECT f1.arrival_city FROM flight f1 where f1.departure_city = ?) natural join (SELECT f2.departure_city from flight f2 where f2.arrival_city = ?) where arrival_city = departure_city)";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,airline);
			updateStatement.setString(3,depart);
			updateStatement.setString(4,arrive);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			while(resultSet.next()) { // This loop goes through all legs with stated departure city and airport
				query = "SELECT f.flight_number, f.departure_time, f.arrival_time, f.departure_city, f.airline_id FROM flight f full join airline a on f.airline_id = a.airline_id WHERE arrival_city = ? AND airline_name = ? AND departure_city in (SELECT departure_city from (SELECT f1.departure_city FROM flight f1 where f1.arrival_city = ?) natural join (SELECT f2.arrival_city from flight f2 where f2.departure_city = ?) where arrival_city = departure_city)";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,arrive);
				updateStatement.setString(2,airline);
				updateStatement.setString(3,arrive);
				updateStatement.setString(4,depart);
				updateStatement.executeUpdate();
				resultSet2 = updateStatement.executeQuery(query);
				while(resultSet2.next()) { // This loop goes through all legs with stated arrival city and airport
					// If arrival city of leg one matches departure city of leg two, we have a valid connection!
					if(resultSet.getString(4).equals(resultSet2.getString(4))) {
						System.out.println(
							"\nRoute with connection: " + depart + " -> " + resultSet.getString(4) + " -> " + arrive + " for airline " + airline + ":" +
							"\nFirst Leg:" +
							"\n Flight number: " + resultSet.getString(1) +
							"\n Departure Time: " + resultSet.getString(2) +
							"\n Departure City: " + depart +
							"\n Arrival Time: " + resultSet.getString(3) +
							"\n Arrival City: " + resultSet.getString(4) +
							"\nSecond Leg:" +
							"\n Flight number: " + resultSet2.getString(1) +
							"\n Departure Time: " + resultSet2.getString(2) +
							"\n Departure City: " + resultSet2.getString(4) +
							"\n Arrival Time: " + resultSet2.getString(3) +
							"\n Arrival City: " + arrive);
						flight_connection = true;
					}
				}
				System.out.println(""); // For formatting
			}
			if(!flight_connection) // Display only if no connected flights were found
				System.out.println("No connected flights between " + depart + " -> " + arrive + " for airline " + airline + ".\n");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #6
	public void cus6(String depart, String arrive, String dateInput) {
		// Convert date
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");
		java.sql.Date date = null;
		try { date = new java.sql.Date(df.parse(dateInput).getTime());
		} catch(Exception e) {System.out.println("INVALID DATE");}
		try {
			// Get direct flights
			query = "SELECT f.flight_number, f.departure_time, f.arrival_time FROM detail d full join flight f on d.flight_number = f.flight_number where f.flight_number in (select F1.flight_number from FLIGHT F1, PLANE where F1.flight_number in (select F2.flight_number from flight F2 where F2.departure_city = ? AND F2.arrival_city = ?) AND F1.plane_type = plane.plane_type AND plane.plane_capacity > (select count(D1.flight_number) from DETAIL D1 where D1.flight_number in (select F3.flight_number from flight F3 where F3.departure_city = ? AND F3.arrival_city = ?)) AND flight_date = ?)";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,arrive);
			updateStatement.setString(3,depart);
			updateStatement.setString(4,arrive);
			updateStatement.setDate(5,date);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			int counter = 1;
			while(resultSet.next()) {
				if(counter == 1) // Display only if first time, but not at all if no direct routes
					System.out.println("\nAll direct routes between " + depart + " -> " + arrive + ":");
				System.out.println(
					"Route " + counter + ": " +
					"\n Flight number: " + resultSet.getString(1) +
					"\n Departure Time: " + resultSet.getString(2) +
					"\n Arrival Time: " + resultSet.getString(3) + "\n");
				counter++;
			}
			if(counter == 1) // Display only if we found no direct routes
				System.out.println("\nNo direct routes between " + depart + " -> " + arrive + ".\n");
			// Get connected flights
			flight_connection = false;
			query = "SELECT f.flight_number, f.departure_time, f.arrival_time, f.arrival_city FROM detail d full join flight f on d.flight_number = f.flight_number where f.flight_number in (select F1.flight_number from FLIGHT F1, PLANE where F1.flight_number in (select F2.flight_number from flight F2 where F2.departure_city = ? AND F2.arrival_city in (SELECT arrival_city from (SELECT f4.arrival_city FROM flight f4 where f4.departure_city = ?) natural join (SELECT f5.departure_city from flight f5 where f5.arrival_city = ?) where arrival_city = departure_city)) AND F1.plane_type = plane.plane_type AND plane.plane_capacity > (select count(D1.flight_number) from DETAIL D1 where D1.flight_number in (select F3.flight_number from flight F3 where F3.departure_city = ? AND F3.arrival_city = ?)) AND flight_date = ?)";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,depart);
			updateStatement.setString(3,arrive);
			updateStatement.setString(4,depart);
			updateStatement.setString(5,arrive);
			updateStatement.setDate(6,date);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			while(resultSet.next()) { // This loop goes through all legs with stated departure city
				query = "SELECT f.flight_number, f.departure_time, f.arrival_time, f.departure_city FROM detail d full join flight f on d.flight_number = f.flight_number where f.flight_number in (select F1.flight_number from FLIGHT F1, PLANE where F1.flight_number in (select F2.flight_number from flight F2 where F2.arrival_city = ? AND F2.departure_city in (SELECT departure_city from (SELECT f4.departure_city FROM flight f4 where f4.arrival_city = ?) natural join (SELECT f5.arrival_city from flight f5 where f5.departure_city = ?) where arrival_city = departure_city)) AND F1.plane_type = plane.plane_type AND plane.plane_capacity > (select count(D1.flight_number) from DETAIL D1 where D1.flight_number in (select F3.flight_number from flight F3 where F3.departure_city = ? AND F3.arrival_city = ?)) AND flight_date = ?)";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,arrive);
				updateStatement.setString(2,arrive);
				updateStatement.setString(3,depart);
				updateStatement.setString(4,depart);
				updateStatement.setString(5,arrive);
				updateStatement.setDate(6,date);
				updateStatement.executeUpdate();
				resultSet2 = updateStatement.executeQuery(query);
				while(resultSet2.next()) { // This loop goes through all legs with stated arrival city
					// If arrival city of leg one matches departure city of leg two, we have a valid connection!
					if(resultSet.getString(4).equals(resultSet2.getString(4))) {
						System.out.println(
							"\nRoute with connection: " + depart + " -> " + resultSet.getString(4) + " -> " + arrive + ":" +
							"\nFirst Leg:" +
							"\n Flight number: " + resultSet.getString(1) +
							"\n Departure Time: " + resultSet.getString(2) +
							"\n Departure City: " + depart +
							"\n Arrival Time: " + resultSet.getString(3) +
							"\n Arrival City: " + resultSet.getString(4) +
							"\nSecond Leg:" +
							"\n Flight number: " + resultSet2.getString(1) +
							"\n Departure Time: " + resultSet2.getString(2) +
							"\n Departure City: " + resultSet2.getString(4) +
							"\n Arrival Time: " + resultSet2.getString(3) +
							"\n Arrival City: " + arrive);
						flight_connection = true;
					}
				}
				System.out.println(""); // For formatting
			}
			if(!flight_connection) // Display only if no connected flights were found
				System.out.println("No connected flights between " + depart + " -> " + arrive + ".\n");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #7
	public void cus7(String depart, String arrive, String dateInput, String airline) {
		// Convert date
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");
		java.sql.Date date = null;
		try { date = new java.sql.Date(df.parse(dateInput).getTime());
		} catch(Exception e) {System.out.println("INVALID DATE");}
		try {
			// Get direct flights
			query = "SELECT f.flight_number, f.departure_time, f.arrival_time, f.airline_id FROM (detail d full join flight f on d.flight_number = f.flight_number) full join airline a on f.airline_id = a.airline_id where f.flight_number in (select F1.flight_number from FLIGHT F1, PLANE where F1.flight_number in (select F2.flight_number from flight F2 where F2.departure_city = ? AND F2.arrival_city = ?) AND F1.plane_type = plane.plane_type AND plane.plane_capacity > (select count(D.flight_number) from DETAIL D where D.flight_number in (select F3.flight_number from flight F3 where F3.departure_city = ? AND F3.arrival_city = ?)) AND flight_date = ? and airline_name = ?)";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,arrive);
			updateStatement.setString(3,depart);
			updateStatement.setString(4,arrive);
			updateStatement.setDate(5,date);
			updateStatement.setString(6,airline);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			int counter = 1;
			while(resultSet.next()) {
				if(counter == 1) // Display only if first time, but not at all if no direct routes
					System.out.println("\nAll direct routes between " + depart + " -> " + arrive + " for airline " + airline + ":");
				System.out.println(
					"Route " + counter + ": " +
					"\n Flight number: " + resultSet.getString(1) +
					"\n Departure Time: " + resultSet.getString(2) +
					"\n Arrival Time: " + resultSet.getString(3) + "\n");
				counter++;
			}
			if(counter == 1) // Display only if we found no direct routes
				System.out.println("\nNo direct routes between " + depart + " -> " + arrive + " for airline " + airline + ".\n");
			// Get connected flights
			flight_connection = false;
			query = "SELECT f.flight_number, f.departure_time, f.arrival_time, f.arrival_city, f.airline_id FROM (detail d full join flight f on d.flight_number = f.flight_number) full join airline a on f.airline_id = a.airline_id where f.flight_number in (select F1.flight_number from FLIGHT F1, PLANE where F1.flight_number in (select F2.flight_number from flight F2 where F2.departure_city = ? AND F2.arrival_city in (SELECT arrival_city from (SELECT f4.arrival_city FROM flight f4 where f4.departure_city = ?) natural join (SELECT f5.departure_city from flight f5 where f5.arrival_city = ?) where arrival_city = departure_city)) AND F1.plane_type = plane.plane_type AND plane.plane_capacity > (select count(D1.flight_number) from DETAIL D1 where D1.flight_number in (select F3.flight_number from flight F3 where F3.departure_city = ? AND F3.arrival_city = ?)) AND flight_date = ? AND a.airline_name = ?)";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,depart);
			updateStatement.setString(3,arrive);
			updateStatement.setString(4,depart);
			updateStatement.setString(5,arrive);
			updateStatement.setDate(6,date);
			updateStatement.setString(7,airline);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			while(resultSet.next()) { // This loop goes through all legs with stated departure city
				query = "SELECT f.flight_number, f.departure_time, f.arrival_time, f.departure_city, f.airline_id FROM (detail d full join flight f on d.flight_number = f.flight_number) full join airline a on f.airline_id = a.airline_id where f.flight_number in (select F1.flight_number from FLIGHT F1, PLANE where F1.flight_number in (select F2.flight_number from flight F2 where F2.arrival_city = ? AND F2.departure_city in (SELECT departure_city from (SELECT f4.departure_city FROM flight f4 where f4.arrival_city = ?) natural join (SELECT f5.arrival_city from flight f5 where f5.departure_city = ?) where arrival_city = departure_city)) AND F1.plane_type = plane.plane_type AND plane.plane_capacity > (select count(D1.flight_number) from DETAIL D1 where D1.flight_number in (select F3.flight_number from flight F3 where F3.departure_city = ? AND F3.arrival_city = ?)) AND flight_date = ? AND a.airline_name = ?)";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,arrive);
				updateStatement.setString(2,arrive);
				updateStatement.setString(3,depart);
				updateStatement.setString(4,depart);
				updateStatement.setString(5,arrive);
				updateStatement.setDate(6,date);
				updateStatement.setString(7,airline);
				updateStatement.executeUpdate();
				resultSet2 = updateStatement.executeQuery(query);
				while(resultSet2.next()) { // This loop goes through all legs with stated arrival city and airport
					// If arrival city of leg one matches departure city of leg two, we have a valid connection!
					if(resultSet.getString(4).equals(resultSet2.getString(4))) {
						System.out.println(
							"\nRoute with connection: " + depart + " -> " + resultSet.getString(4) + " -> " + arrive + " for airline " + airline + ":" +
							"\nFirst Leg:" +
							"\n Flight number: " + resultSet.getString(1) +
							"\n Departure Time: " + resultSet.getString(2) +
							"\n Departure City: " + depart +
							"\n Arrival Time: " + resultSet.getString(3) +
							"\n Arrival City: " + resultSet.getString(4) +
							"\nSecond Leg:" +
							"\n Flight number: " + resultSet2.getString(1) +
							"\n Departure Time: " + resultSet2.getString(2) +
							"\n Departure City: " + resultSet2.getString(4) +
							"\n Arrival Time: " + resultSet2.getString(3) +
							"\n Arrival City: " + arrive);
						flight_connection = true;
					}
				}
			System.out.println(""); // For formatting
			}
			if(!flight_connection) // Display only if no connected flights were found
				System.out.println("No connected flights between " + depart + " -> " + arrive + " for airline " + airline + ".\n");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #8
	public void cus8(String... inputs) {
		// Store inputs
		String flight1 = inputs[0], flight2 = inputs[1], flight3 = inputs[2], flight4 = inputs[3],
			dateN1 = inputs[4], dateN2 = inputs[5], dateN3 = inputs[6], dateN4 = inputs[7], cid = inputs[8];
		// Reservation/Detail variables
		String r_num = "", card_num, startC, endC, flightL, tick;
		int cost = 0;
		// Convert dates if they aren't null
		java.sql.Date date1 = null, date2 = null, date3 = null, date4 = null;
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");
		try {
			if(dateN1 != null && !dateN1.isEmpty())
				date1 = new java.sql.Date(df.parse(dateN1).getTime());
			if(dateN2 != null && !dateN2.isEmpty())
				date2 = new java.sql.Date(df.parse(dateN2).getTime());
			if(dateN3 != null && !dateN3.isEmpty())
				date3 = new java.sql.Date(df.parse(dateN3).getTime());
			if(dateN4 != null && !dateN4.isEmpty())
				date4 = new java.sql.Date(df.parse(dateN4).getTime());
		} catch(Exception e) {System.out.println("INVALID DATE");}
		try{
			PreparedStatement updateStatement;
			// Generate a Reservation Number
			boolean flag = false;
			while(!flag) {
				// Generate random 5 digit number
				char[] chars = "0123456789".toCharArray();
				Random rnd = new Random();
				StringBuilder sb = new StringBuilder();
				for (int i = 0; i < 5; i++)
					sb.append(chars[rnd.nextInt(chars.length)]);
				r_num = sb.toString();
				// Check if random value for r_num already exists in the database
				query = "select * from RESERVATION where reservation_number = ?";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,r_num);
				updateStatement.executeUpdate();
				resultSet = updateStatement.executeQuery(query);
				// Exits while loop once we obtain an r_num that doesn't already exist
				flag = true;
				if(resultSet.next())
					flag = false;
			}
			// Calculate costs
			// If only fight1
			if(!(flight2 != null && !flight2.isEmpty()) && !(flight3 != null && !flight3.isEmpty()) && !(flight4 != null && !flight4.isEmpty())) {
				query = "select SUM(p1.low_price) as new_cost from (FLIGHT f1 full join PRICE p1 on p1.departure_city=f1.departure_city and p1.arrival_city=f1.arrival_city) where f1.flight_number = ?";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,flight1);
				updateStatement.executeUpdate();
				resultSet = updateStatement.executeQuery(query);
				resultSet.next();
				cost = resultSet.getInt(1);
			}
			// If only fight1 & flight2
			else if(!(flight3 != null && !flight3.isEmpty()) && !(flight4 != null && !flight4.isEmpty())) {
				query = "select SUM(p1.low_price) as new_cost from (FLIGHT f1 full join PRICE p1 on p1.departure_city=f1.departure_city and p1.arrival_city=f1.arrival_city) where f1.flight_number = ? or f1.flight_number = ?";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,flight1);
				updateStatement.setString(2,flight2);
				updateStatement.executeUpdate();
				resultSet = updateStatement.executeQuery(query);
				resultSet.next();
				cost = resultSet.getInt(1);
			}
			// If only fight1 & flight3
			else if(!(flight2 != null && !flight2.isEmpty()) && !(flight4 != null && !flight4.isEmpty())) {
				query = "select SUM(p1.low_price) as new_cost from (FLIGHT f1 full join PRICE p1 on p1.departure_city=f1.departure_city and p1.arrival_city=f1.arrival_city) where f1.flight_number = ? or f1.flight_number = ?";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,flight1);
				updateStatement.setString(2,flight3);
				updateStatement.executeUpdate();
				resultSet = updateStatement.executeQuery(query);
				resultSet.next();
				cost = resultSet.getInt(1);
			}
			// If only fight1 & flight2 & flight3
			else if(!(flight4 != null && !flight4.isEmpty())) {
				query = "select SUM(p1.low_price) as new_cost from (FLIGHT f1 full join PRICE p1 on p1.departure_city=f1.departure_city and p1.arrival_city=f1.arrival_city) where f1.flight_number = ? or f1.flight_number = ? or f1.flight_number = ?";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,flight1);
				updateStatement.setString(2,flight2);
				updateStatement.setString(3,flight3);
				updateStatement.executeUpdate();
				resultSet = updateStatement.executeQuery(query);
				resultSet.next();
				cost = resultSet.getInt(1);
			}
			// If only fight1 & flight3 & flight4
			else if(!(flight2 != null && !flight2.isEmpty())) {
				query = "select SUM(p1.low_price) as new_cost from (FLIGHT f1 full join PRICE p1 on p1.departure_city=f1.departure_city and p1.arrival_city=f1.arrival_city) where f1.flight_number = ? or f1.flight_number = ? or f1.flight_number = ?";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,flight1);
				updateStatement.setString(2,flight3);
				updateStatement.setString(3,flight4);
				updateStatement.executeUpdate();
				resultSet = updateStatement.executeQuery(query);
				resultSet.next();
				cost = resultSet.getInt(1);
			}
			// If all flights
			else {
				query = "select SUM(p1.low_price) as new_cost from (FLIGHT f1 full join PRICE p1 on p1.departure_city=f1.departure_city and p1.arrival_city=f1.arrival_city) where f1.flight_number = ? or f1.flight_number = ? or f1.flight_number = ? or f1.flight_number = ?";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,flight1);
				updateStatement.setString(2,flight2);
				updateStatement.setString(3,flight3);
				updateStatement.setString(4,flight4);
				updateStatement.executeUpdate();
				resultSet = updateStatement.executeQuery(query);
				resultSet.next();
				cost = resultSet.getInt(1);
			}
			// Get credit card number of CID
			query = "select credit_card_num from customer where cid = ?";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,cid);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			resultSet.next();
			card_num = resultSet.getString(1);
			// Get start city of first flight
			query = "SELECT departure_city from flight where flight_number = ?";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,flight1); // First flight
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			resultSet.next();
			startC = resultSet.getString(1);
			// Determine last flight
			if(flight4 != null && !flight4.isEmpty())
				flightL = flight4;
			else if(flight3 != null && !flight3.isEmpty())
				flightL = flight3;
			else if(flight2 != null && !flight2.isEmpty())
				flightL = flight2;
			else
				flightL = flight1;
			// Get end city of last flight
			query = "SELECT arrival_city from flight where flight_number = ?";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,flightL); // Last flight
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			resultSet.next();
			endC = resultSet.getString(1);
			// Ticketed?
			tick = "N";
			// Insert reservation
			query = "INSERT INTO reservation VALUES(?,?,?,?,?,?,?,?)";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,r_num);
			updateStatement.setString(2,cid);
			updateStatement.setInt(3,cost);
			updateStatement.setString(4,card_num);
			updateStatement.setDate(5,date1); // DATE OF FIRST FLIGHT, INSTEAD MAKE CURRENT DATE
			updateStatement.setString(6,startC);
			updateStatement.setString(7,endC);
			updateStatement.setString(8,tick);
			updateStatement.executeUpdate();
			int leg = 0; // Keep track of legs
			// Insert flight1 if it exists (it should)
			if(flight1 != null && !flight1.isEmpty()) {
				query = "INSERT INTO detail VALUES(?,?,?,?)";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,r_num);
				updateStatement.setString(2,flight1);
				updateStatement.setDate(3,date1);
				updateStatement.setInt(4,leg);
				updateStatement.executeUpdate();
				leg++;
			}
			// Insert flight2 if it exists
			if(flight2 != null && !flight2.isEmpty()) {
				query = "INSERT INTO detail VALUES(?,?,?,?)";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,r_num);
				updateStatement.setString(2,flight2);
				updateStatement.setDate(3,date2);
				updateStatement.setInt(4,leg);
				updateStatement.executeUpdate();
				leg++;
			}
			// Insert flight3 if it exists
			if(flight3 != null && !flight3.isEmpty()) {
				query = "INSERT INTO detail VALUES(?,?,?,?)";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,r_num);
				updateStatement.setString(2,flight3);
				updateStatement.setDate(3,date3);
				updateStatement.setInt(4,leg);
				updateStatement.executeUpdate();
				leg++;
			}
			// Insert flight4 if it exists
			if(flight4 != null && !flight4.isEmpty()) {
				query = "INSERT INTO detail VALUES(?,?,?,?)";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,r_num);
				updateStatement.setString(2,flight4);
				updateStatement.setDate(3,date4);
				updateStatement.setInt(4,leg);
				updateStatement.executeUpdate();
			}
			System.out.println(
				"Reservation made for cid: " + cid + ": " +
				"\n Your reservation number is: " + r_num +
				"\n Total Cost: " + cost +
				"\n Starting City: " + startC +
				"\n Ending City: " + endC +
				"\n Number of Legs: " + leg +
				"\nThank you for reserving!");

		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString()); Ex.printStackTrace();}
	}

	// Customer Command #9
	public void cus9(String num) {
		try { // Get flights on reservation number
			query = "select flight_number from detail where reservation_number = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1, num);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			System.out.println("\nUnder the reservation " + num + " we have the following flights: ");
			boolean found = false;
			while(resultSet.next()) {
				System.out.println(" Flight Number: " + resultSet.getString(1));
				found = true;
			}
			if(!found) System.out.println("NONE. The reservation number does not exist.");
			System.out.println(""); // For formatting
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #10
	public void cus10(String num) {
		try {
			// Make sure reservation exists
			query = "select reservation_number from reservation where reservation_number = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1, num);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			if(resultSet.next()) { // Change status if reservation exists
				// Update ticketed status
				query = "update reservation set ticketed = 'Y' where reservation_number = ?";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1, num);
				updateStatement.executeUpdate();
				System.out.println("TICKET STATUS CHANGED TO PURCHASED");
			}
			else
				System.out.println("RESERVATION DOES NOT EXIST");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	///////////////////////////////////////////////////////
	//  MAIN : handles primary method calls and exiting  //
	///////////////////////////////////////////////////////

	public static void main(String args[]) throws SQLException {
		// Connect to the Database
		menu.connectDB();
		// Determine Admin or Customer access, then run interface
		menu.getAccess();
		// If exit option is selected, will drop out of interface and continue below
		connection.close();
		System.out.println("EXITING");
		System.exit(0);
	}
}
//EOF
