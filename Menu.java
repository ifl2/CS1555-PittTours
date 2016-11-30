import java.sql.*;
import java.util.*;
import java.io.*;
import java.text.ParseException;

public class Menu {
	private static Connection connection;
	private Statement statement;
	private ResultSet resultSet, resultSet2;
	private Scanner scan = new Scanner(System.in);
	private String inputString, query;
	private int choice;

	// CONNECT TO THE DATABASE
	public void connectDB() {
		System.out.println("CONNECTING TO DB");
		System.out.print("Username: ");
		String username = scan.nextLine();
		Console console = System.console(); // Hides password input in console
		String password = new String(console.readPassword("Password: "));
		String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";
		try {
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
			connection = DriverManager.getConnection(url, username, password);
		} catch(Exception Ex) {
			System.out.println("Error connecting to database.  Machine Error: " + Ex.toString());
			Ex.printStackTrace();
			System.out.println("CONNECTION REQUIRED: EXITING");
			System.exit(0);
		}
	}

	// GET ACCESS TYPE (ADMINISTRATOR/CUSTOMER)
	public void getAccess() {
		System.out.println("\nWelcome to PittTours are you a: ");
		System.out.println("1: Administrator");
		System.out.println("2: Customer");
		System.out.println("3: Neither, Quit\n");

		// Get user input
		System.out.print("Enter menu choice: ");
		inputString = scan.nextLine();
		try { choice = Integer.parseInt(inputString);
		} catch(NumberFormatException e) {choice = 0;}

		// Handle user input
		if(choice == 1)
			displayAdmInterface();
		else if(choice == 2)
			displayCusInterface();
		else if(choice == 3) {
			System.out.println("EXITING");
			System.exit(0);
		}
		else { // If invalid choice, recall method
			System.out.println("INVALID CHOICE");
			getAccess();
		}
	}

	// ADMINISTRATOR INTERFACE
	public void displayAdmInterface() {
		System.out.println("\nAVAILABLE ADMINISTRATOR COMMANDS:");
		System.out.println("1: Erase the Database");
		System.out.println("2: Load airline information");
		System.out.println("3: Load schedule information");
		System.out.println("4: Load pricing information");
		System.out.println("5: Load plane information");
		System.out.println("6: Generate passenger manifest of flight on day");
		System.out.println("7: Quit\n");

		// Get user input
		System.out.print("Enter command number: ");
		inputString = scan.nextLine();
		try { choice = Integer.parseInt(inputString);
		} catch(NumberFormatException e) {choice = 0;}

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
			System.out.println(
				"WOULD YOU LIKE TO:\n" +
				"L: Load pricing information\n" +
				"C: Change flight price\n");
			System.out.print("Enter Command: ");
			inputString = scan.nextLine();
			// If load pricing information option was selected
			if(inputString.equals("L") || inputString.equals("l")) {
				System.out.print("Please enter file name with pricing information: ");
				String filename = scan.nextLine();
				adm4L(filename);
			}
			// If change flight pricing information was selected
			else if(inputString.equals("C") || inputString.equals("c")) {
				String dCity, aCity;
				int hPrice = 0, lPrice = 0;
				boolean invalidPrice = false;
				System.out.println("YOU HAVE CHOSEN TO CHANGE A FLIGHT PRICE");
				System.out.print("What is the departure city of the flight you wish to change?: ");
				dCity = scan.nextLine();
				System.out.print("And the arrival city of this flight?: ");
				aCity = scan.nextLine();
				System.out.print("What is the new high price for this flight?: ");
				inputString = scan.nextLine();
				try { hPrice = Integer.parseInt(inputString);
				} catch(NumberFormatException e) {invalidPrice = true;}
				System.out.print("And the low price?: ");
				inputString = scan.nextLine();
				try { lPrice = Integer.parseInt(inputString);
				} catch(NumberFormatException e) {invalidPrice = true;}
				if(!invalidPrice) { // Don't run if price isn't an integer
					System.out.println( // Display entered data for confirmation before execution
						"\n You have entered the following information:" +
						"\nDeparture City: " + dCity +
						"\nArrival City: " + aCity +
						"\nHigh Price: " + hPrice +
						"\nLow Price: " + lPrice +
						"\nIs this this correct? (Y/N)");
					inputString = scan.nextLine();
					// If input data is confirmed
					if(inputString.equals("Y") || inputString.equals("y"))
						adm4C(dCity, aCity, hPrice, lPrice);
					else System.out.println("NOTHING CHANGED");
				} else System.out.println("ERROR: Price must be a number!");
			} else System.out.println("INVALID CHOICE");
		}
		else if(choice == 5) {
			// Get user input
			System.out.print("Please enter file name with plane information: ");
			String filename = scan.nextLine();
			adm5(filename);
		}
		else if(choice == 6) {
			// Get user input
			String flightNum, flightDate;
			System.out.print("Enter flight number: ");
			flightNum = scan.nextLine();
			System.out.print("Enter flight date (MM/DD/YYYY): ");
			flightDate = scan.nextLine();
			adm6(flightNum, flightDate);
		}
		else if(choice == 7) {
			System.out.println("EXITING");
			System.exit(0);
		}
		else System.out.println("INVALID CHOICE");

		// Repeat menu after user controlled pause
		System.out.print("Press Enter to Continue... ");
		inputString = scan.nextLine();
		displayAdmInterface();
	}

	// CUSTOMER INTERFACE
	private void displayCusInterface() {
		System.out.println("\nAVAILABLE CUSTOMER COMMANDS:");
		System.out.println("1: Add customer");
		System.out.println("2: Show customer info, given customer name");
		System.out.println("3: Find price for flights between two cities");
		System.out.println("4: Find all routes between two cities");
		System.out.println("5: Find all routes between two cities of a given airline");
		System.out.println("6: Find all routes with available seats between two cities on given day");
		System.out.println("7: For a given airline, find all routes with available seats between two cities on given day");
		System.out.println("8: Add reservation");
		System.out.println("9: Show reservation info, given reservation number");
		System.out.println("10: Buy ticket from existing reservation");
		System.out.println("11: Quit\n");

		// Get user input
		System.out.print("Enter command number: ");
		inputString = scan.nextLine();
		try { choice = Integer.parseInt(inputString);
		} catch(NumberFormatException e) {choice = 0;}

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
			// Get user input
			System.out.print("Please enter City One (3 letter): ");
			String one = scan.nextLine();
			System.out.print("Please enter City Two (3 letter): ");
			String two = scan.nextLine();
			System.out.println(""); // For formatting
			cus3(one, two);
		}
		else if(choice == 4) {
			// Get user input
			System.out.print("Please enter Departure City (3 letter): ");
			String depart = scan.nextLine();
			System.out.print("Please enter Arrival City (3 letter): ");
			String arrive = scan.nextLine();
			cus4(depart, arrive);
		}
		else if(choice == 5) {
			// Get user input
			System.out.print("Please enter Departure City (3 letter): ");
			String depart = scan.nextLine();
			System.out.print("Please enter Arrival City (3 letter): ");
			String arrive = scan.nextLine();
			System.out.print("Please enter Airline name (full name): ");
			String airline = scan.nextLine();
			cus5(depart, arrive, airline);
		}
		else if(choice == 6) {
			// Get user input
			System.out.print("Please enter Departure City (3 letter): ");
			String depart = scan.nextLine();
			System.out.print("Please enter Arrival City (3 letter): ");
			String arrive = scan.nextLine();
			cus6(depart, arrive);
		}
		else if(choice == 7) {
			// Get user input
			System.out.print("Please enter Departure City (3 letter): ");
			String depart = scan.nextLine();
			System.out.print("Please enter Arrival City (3 letter): ");
			String arrive = scan.nextLine();
			System.out.print("Please enter Airline name (full name): ");
			String airline = scan.nextLine();
			cus7(depart, arrive, airline);
		}
		else if(choice == 8) { // WORK IN PROGRESS
			String flightN1 = null, flightN2 = null, flightN3 = null, flightN4 = null;
			String dateN1 = null, dateN2 = null, dateN3 = null, dateN4 = null;
			// Get user input
			System.out.println("ADDING RESERVATION:\nAdd first flight:");
			System.out.print(" Flight Number: ");
			flightN1 = scan.nextLine();
			System.out.print(" Departure Date: ");
			dateN1 = scan.nextLine();
			System.out.print("\nAdd another leg in this direction? (Y/N): ");
			inputString = scan.nextLine();
			if(inputString.equals("Y") || inputString.equals("y")) {
				System.out.print(" Flight Number: ");
				flightN2 = scan.nextLine();
				System.out.print(" Departure Date: ");
				dateN2 = scan.nextLine();
			}
			System.out.print("\nAdd return trip? (Y/N): ");
			inputString = scan.nextLine();
			if(inputString.equals("Y") || inputString.equals("y")) {
				System.out.print(" Flight Number: ");
				flightN3 = scan.nextLine();
				System.out.print(" Departure Date: ");
				dateN3 = scan.nextLine();
			}
			System.out.print("\nAdd another leg in this direction? (Y/N): ");
			inputString = scan.nextLine();
			if(inputString.equals("Y") || inputString.equals("y")) {
				System.out.print(" Flight Number: ");
				flightN4 = scan.nextLine();
				System.out.print(" Departure Date: ");
				dateN4 = scan.nextLine();
			}
			cus8(flightN1, flightN2, flightN3, flightN4, dateN1, dateN2, dateN3, dateN4);
		}
		else if(choice == 9) {
			// Get user input
			System.out.print("Please enter reservation number: ");
			String num = scan.nextLine();
			cus9(num);
		}
		else if(choice == 10) {
			// Get user input
			System.out.print("Please enter reservation number: ");
			String num = scan.nextLine();
			cus10(num);
		}
		else if(choice == 11) {
			System.out.println("EXITING");
			System.exit(0);
		}
		else System.out.println("INVALID CHOICE");

		// Repeat menu after user controlled pause
		System.out.print("Press Enter to Continue... ");
		inputString = scan.nextLine();
		displayCusInterface();
	}

	// Administrator Command #1
	public void adm1() {
		try { // Drop all tables
			statement = connection.createStatement();
			statement.executeQuery("drop table PLANE cascade constraints");
			statement.executeQuery("drop table FLIGHT cascade constraints");
			statement.executeQuery("drop table PRICE cascade constraints");
			statement.executeQuery("drop table CUSTOMER cascade constraints");
			statement.executeQuery("drop table RESERVATION cascade constraints");
			statement.executeQuery("drop table DETAIL cascade constraints");
			statement.executeQuery("drop table OUR_DATE cascade constraints");
			statement.executeQuery("drop table AIRLINE cascade constraints");
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
					query = "insert into AIRLINE values(?,?,?,?)";
					PreparedStatement updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,tokens[0]);
					updateStatement.setString(2,tokens[1]);
					updateStatement.setString(3,tokens[2]);
					updateStatement.setInt(4,Integer.parseInt(tokens[3]));
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
					query = "insert into PRICE values(?,?,?,?,?)";
					PreparedStatement updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,tokens[0]);
					updateStatement.setString(2,tokens[1]);
					updateStatement.setString(3,tokens[2]);
					updateStatement.setInt(4,Integer.parseInt(tokens[3]));
					updateStatement.setInt(5,Integer.parseInt(tokens[4]));
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
					java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");
					java.sql.Date date = null;
					try { date = new java.sql.Date(df.parse(tokens[3]).getTime());
					} catch(Exception e) {System.out.println("INVALID DATE");}
					query = "insert into PLANE values(?,?,?,?,?,?)";
					PreparedStatement updateStatement = connection.prepareStatement(query);
					updateStatement.setString(1,tokens[0]);
					updateStatement.setString(2,tokens[1]);
					updateStatement.setInt(3,Integer.parseInt(tokens[2]));
					updateStatement.setDate(4,date);
					updateStatement.setInt(5,Integer.parseInt(tokens[4]));
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
				System.out.println(
					"Passenger " + counter + ": " +
					resultSet.getString(1) + ". " +
					resultSet.getString(2) + " " +
					resultSet.getString(3));
				counter ++;
			}
			System.out.println(""); // For formatting
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #1
	public void cus1(String... inputs) {
		// Store inputs
		String salutation = inputs[0];
		String first = inputs[1];
		String last = inputs[2];
		String street = inputs[3];
		String city = inputs[4];
		String state = inputs[5];
		String phone = inputs[6];
		String email = inputs[7];
		String cardNum = inputs[8];
		String expire = inputs[9];
		String miles = null;
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
			updateStatement.setString(10, phone);
			updateStatement.setString(11, email);
			updateStatement.setString(12, miles);
			updateStatement.executeUpdate();
			System.out.println("Customer successfully added to the database!");
			System.out.println("PittRewards number: " + cid + "\n");
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
			}
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
			while(resultSet.next()) {
				System.out.println(one + " -> " + two);
				System.out.println(" High Price: " + resultSet.getString(1) + "\n Low Price: " + resultSet.getString(2));
				highSum1 = Integer.parseInt(resultSet.getString(1));
				lowSum1 = Integer.parseInt(resultSet.getString(2));
			}
			// City 2 -> City 1
			query = "select high_price, low_price from price where arrival_city = ? and departure_city = ?";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,two);
			updateStatement.setString(2,one);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			while(resultSet.next()) {
				System.out.println(two + " -> " + one);
				System.out.println(" High Price: " + resultSet.getString(1) + "\n Low Price: " + resultSet.getString(2));
				highSum2 = Integer.parseInt(resultSet.getString(1));
				lowSum2 = Integer.parseInt(resultSet.getString(2));
			}
			// Get round trip prices
			System.out.println("Round Trip from " + one + " to " + two + ":");
			highSum1 = highSum1 + highSum2;
			lowSum1 = lowSum1 + lowSum2;
			System.out.println(" High Price: " + highSum1 + "\n Low Price: " + lowSum1 + "\n");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #4
	public void cus4(String arrive, String depart) {
		try {
			// Get direct flights
			query = "select flight_number, departure_time, arrival_time from FLIGHT where departure_city = ? and arrival_city = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,arrive);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			System.out.println("\nAll direct routes between " + depart + " -> " + arrive + ":");
			int counter = 1;
			while(resultSet.next()) {
				System.out.println("Route " + counter + ": ");
				System.out.println(
					" Flight number: " + resultSet.getString(1) +
					"\n Departure Time: " + resultSet.getString(2) +
					"\n Arrival Time: " + resultSet.getString(3));
				counter++;
			}
			// Get connected flights
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
						System.out.println("\nRoute with connection: " + depart + " -> " + resultSet.getString(4) + " -> " + arrive + ":");
						System.out.println(
							"First Leg:" +
							"\n Flight number: " + resultSet.getString(1) +
							"\n Departure Time: " + resultSet.getString(2) +
							"\n Departure City: " + depart +
							"\n Arrival Time: " + resultSet.getString(3) +
							"\n Arrival City: " + resultSet.getString(4));
						System.out.println(
							"Second Leg:" +
							"\n Flight number: " + resultSet2.getString(1) +
							"\n Departure Time: " + resultSet2.getString(2) +
							"\n Departure City: " + resultSet2.getString(4) +
							"\n Arrival Time: " + resultSet2.getString(3) +
							"\n Arrival City: " + arrive);
					}
				}
				System.out.println(""); // For formatting
			}
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #5
	public void cus5(String depart, String arrive, String airline) {
		try {
			// Get direct flights
			query = "SELECT flight_number, departure_time, arrival_time FROM flight f full join airline a on f.airline_id = a.airline_id WHERE departure_city = ? AND arrival_city = ? and airline_name = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1, depart);
			updateStatement.setString(2, arrive);
			updateStatement.setString(3, airline);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			System.out.println("\nAll direct routes between " + depart + " -> " + arrive + " for airline " + airline + ":");
			int counter = 1;
			while(resultSet.next()) {
				System.out.println("Route " + counter + ": ");
				System.out.println(
					" Flight number: " + resultSet.getString(1) +
					"\n Departure Time: " + resultSet.getString(2) +
					"\n Arrival Time: " + resultSet.getString(3));
				counter++;
			}
			// Get connected flights
			query = "SELECT f.airline_id, f.flight_number, f.departure_time, f.arrival_time, f.arrival_city FROM flight f full join airline a on f.airline_id = a.airline_id WHERE departure_city = ? AND airline_name = ? AND arrival_city in (SELECT arrival_city from (SELECT f1.arrival_city FROM flight f1 where f1.departure_city = ?) natural join (SELECT f2.departure_city from flight f2 where f2.arrival_city = ?) where arrival_city = departure_city)";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,airline);
			updateStatement.setString(3,depart);
			updateStatement.setString(4,arrive);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			while(resultSet.next()) { // This loop goes through all legs with stated departure city and airport
				query = "SELECT f.airline_id, f.flight_number, f.departure_time, f.arrival_time, f.departure_city FROM flight f full join airline a on f.airline_id = a.airline_id WHERE arrival_city = ? AND airline_name = ? AND departure_city in (SELECT departure_city from (SELECT f1.departure_city FROM flight f1 where f1.arrival_city = ?) natural join (SELECT f2.arrival_city from flight f2 where f2.departure_city = ?) where arrival_city = departure_city)";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,arrive);
				updateStatement.setString(2,airline);
				updateStatement.setString(3,arrive);
				updateStatement.setString(4,depart);
				updateStatement.executeUpdate();
				resultSet2 = statement.executeQuery(query);
				while(resultSet2.next()) { // This loop goes through all legs with stated arrival city and airport
					// If arrival city of leg one matches departure city of leg two, we have a valid connection!
					if(resultSet.getString(4).equals(resultSet2.getString(4))) {
						System.out.println("\nRoute with connection: " + depart + " -> " + resultSet.getString(4) + " -> " + arrive + ":");
						System.out.println(
							"First Leg:" +
							"\n Flight number: " + resultSet.getString(1) +
							"\n Departure Time: " + resultSet.getString(2) +
							"\n Departure City: " + depart +
							"\n Arrival Time: " + resultSet.getString(3) +
							"\n Arrival City: " + resultSet.getString(4));
						System.out.println(
							"Second Leg:" +
							"\n Flight number: " + resultSet2.getString(1) +
							"\n Departure Time: " + resultSet2.getString(2) +
							"\n Departure City: " + resultSet2.getString(4) +
							"\n Arrival Time: " + resultSet2.getString(3) +
							"\n Arrival City: " + arrive);
					}
				}
				System.out.println(""); // For formatting
			}
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #6 - WORK IN PROGRESS: NEEDS TO CHECK AVAILABLE SEATING
	public void cus6(String arrive, String depart) {
		try {
			// Get direct flights
			query = "select flight_number, departure_time, arrival_time from FLIGHT where departure_city = ? and arrival_city = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,arrive);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			System.out.println("\nAll direct routes between " + depart + " -> " + arrive + ":");
			int counter = 1;
			while(resultSet.next()) {
				System.out.println("Route " + counter + ": ");
				System.out.println(
					" Flight number: " + resultSet.getString(1) +
					"\n Departure Time: " + resultSet.getString(2) +
					"\n Arrival Time: " + resultSet.getString(3));
				counter++;
			}
			// Get connected flights
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
						System.out.println("\nRoute with connection: " + depart + " -> " + resultSet.getString(4) + " -> " + arrive + ":");
						System.out.println(
							"First Leg:" +
							"\n Flight number: " + resultSet.getString(1) +
							"\n Departure Time: " + resultSet.getString(2) +
							"\n Departure City: " + depart +
							"\n Arrival Time: " + resultSet.getString(3) +
							"\n Arrival City: " + resultSet.getString(4));
						System.out.println(
							"Second Leg:" +
							"\n Flight number: " + resultSet2.getString(1) +
							"\n Departure Time: " + resultSet2.getString(2) +
							"\n Departure City: " + resultSet2.getString(4) +
							"\n Arrival Time: " + resultSet2.getString(3) +
							"\n Arrival City: " + arrive);
					}
				}
				System.out.println(""); // For formatting
			}
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #7 - WORK IN PROGRESS: NEEDS TO CHECK AVAILABLE SEATING
	public void cus7(String depart, String arrive, String airline) {
		try {
			// Get direct flights
			query = "SELECT flight_number, departure_time, arrival_time FROM flight f full join airline a on f.airline_id = a.airline_id WHERE departure_city = ? AND arrival_city = ? and airline_name = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1, depart);
			updateStatement.setString(2, arrive);
			updateStatement.setString(3, airline);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			System.out.println("\nAll direct routes between " + depart + " -> " + arrive + " for airline " + airline + ":");
			int counter = 1;
			while(resultSet.next()) {
				System.out.println("Route " + counter + ": ");
				System.out.println(
					" Flight number: " + resultSet.getString(1) +
					"\n Departure Time: " + resultSet.getString(2) +
					"\n Arrival Time: " + resultSet.getString(3));
				counter++;
			}
			// Get connected flights
			query = "SELECT f.airline_id, f.flight_number, f.departure_time, f.arrival_time, f.arrival_city FROM flight f full join airline a on f.airline_id = a.airline_id WHERE departure_city = ? AND airline_name = ? AND arrival_city in (SELECT arrival_city from (SELECT f1.arrival_city FROM flight f1 where f1.departure_city = ?) natural join (SELECT f2.departure_city from flight f2 where f2.arrival_city = ?) where arrival_city = departure_city)";
			updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1,depart);
			updateStatement.setString(2,airline);
			updateStatement.setString(3,depart);
			updateStatement.setString(4,arrive);
			updateStatement.executeUpdate();
			resultSet = updateStatement.executeQuery(query);
			while(resultSet.next()) { // This loop goes through all legs with stated departure city and airport
				query = "SELECT f.airline_id, f.flight_number, f.departure_time, f.arrival_time, f.departure_city FROM flight f full join airline a on f.airline_id = a.airline_id WHERE arrival_city = ? AND airline_name = ? AND departure_city in (SELECT departure_city from (SELECT f1.departure_city FROM flight f1 where f1.arrival_city = ?) natural join (SELECT f2.arrival_city from flight f2 where f2.departure_city = ?) where arrival_city = departure_city)";
				updateStatement = connection.prepareStatement(query);
				updateStatement.setString(1,arrive);
				updateStatement.setString(2,airline);
				updateStatement.setString(3,arrive);
				updateStatement.setString(4,depart);
				updateStatement.executeUpdate();
				resultSet2 = statement.executeQuery(query);
				while(resultSet2.next()) { // This loop goes through all legs with stated arrival city and airport
					// If arrival city of leg one matches departure city of leg two, we have a valid connection!
					if(resultSet.getString(4).equals(resultSet2.getString(4))) {
						System.out.println("\nRoute with connection: " + depart + " -> " + resultSet.getString(4) + " -> " + arrive + ":");
						System.out.println(
							"First Leg:" +
							"\n Flight number: " + resultSet.getString(1) +
							"\n Departure Time: " + resultSet.getString(2) +
							"\n Departure City: " + depart +
							"\n Arrival Time: " + resultSet.getString(3) +
							"\n Arrival City: " + resultSet.getString(4));
						System.out.println(
							"Second Leg:" +
							"\n Flight number: " + resultSet2.getString(1) +
							"\n Departure Time: " + resultSet2.getString(2) +
							"\n Departure City: " + resultSet2.getString(4) +
							"\n Arrival Time: " + resultSet2.getString(3) +
							"\n Arrival City: " + arrive);
					}
				}
				System.out.println(""); // For formatting
			}
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Customer Command #8 - WORK IN PROGRESS
	public void cus8(String... inputs) {
		// Assign inputs
		String flightN1 = inputs[0];
		String flightN2 = inputs[1];
		String flightN3 = inputs[2];
		String flightN4 = inputs[3];
		String dateN1 = inputs[4];
		String dateN2 = inputs[5];
		String dateN3 = inputs[6];
		String dateN4 = inputs[7];
		// Convert dates
		java.sql.Date date1 = null;
		if(dateN1 != null) {
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/yyyy");
			try { date1 = new java.sql.Date(df.parse(dateN1).getTime());
			} catch(Exception e) {System.out.println("INVALID DATE");}
		}
		java.sql.Date date2 = null;
		if(dateN2 != null) {
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/yyyy");
			try { date2 = new java.sql.Date(df.parse(dateN2).getTime());
			} catch(Exception e) {System.out.println("INVALID DATE");}
		}
		java.sql.Date date3 = null;
		if(dateN3 != null) {
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/yyyy");
			try { date3 = new java.sql.Date(df.parse(dateN3).getTime());
			} catch(Exception e) {System.out.println("INVALID DATE");}
		}
		java.sql.Date date4 = null;
		if(dateN4 != null) {
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/yyyy");
			try { date4 = new java.sql.Date(df.parse(dateN4).getTime());
			} catch(Exception e) {System.out.println("INVALID DATE");}
		}
		/*
		try {
			// Make reservation, check if values are null to see if a leg is to be added
			System.out.println("FLIGHT ADDED");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
		*/
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
		try { // Update ticketed status
			query = "update reservation set ticketed = 'Y' where reservation_number = ?";
			PreparedStatement updateStatement = connection.prepareStatement(query);
			updateStatement.setString(1, num);
			updateStatement.executeUpdate();
			System.out.println("TICKET STATUS CHANGED TO PURCHASED");
		} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
	}

	// Main
	public static void main(String args[]) throws SQLException {
		Menu menu = new Menu();
		menu.connectDB(); // Connect to the Database
		menu.getAccess(); // Determine Admin or Customer access, then run interface
		connection.close(); // Close connection (needs added before system.exits?)
	}
}
