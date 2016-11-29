import java.sql.*;
import java.util.*;
import java.io.*;
import java.text.ParseException;

public class Menu {
	private static Connection connection;
	private Statement statement;
	private ResultSet resultSet;
	private Scanner scan = new Scanner(System.in);
	private String inputString, query;

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
		int choice;
		try {
			choice = Integer.parseInt(inputString);
		} catch(NumberFormatException e) {
			choice = 0;
		}

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
		int choice;
		try {
			choice = Integer.parseInt(inputString);
		} catch(NumberFormatException e) {
			choice = 0;
		}

		if(choice == 1) { // TESTED & WORKING
			System.out.print("Are you sure you want to delete the database? (Y/N): ");
			inputString = scan.nextLine();
			if(inputString.equals("Y") || inputString.equals("y")) {
				try {
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
			else
				System.out.println("DATABASE ERASURE CANCELLED");
		}
		else if(choice == 2) { // TESTED & WORKING
			try {
				System.out.print("Please enter file name with airline information: ");
				String filename = scan.nextLine();
				FileInputStream fstream = new FileInputStream(filename);
				DataInputStream in = new DataInputStream(fstream);
				BufferedReader br = new BufferedReader(new InputStreamReader(in));
				String strLine;
				try {
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
		else if(choice == 3) { // TESTED & WORKING
			try {
				System.out.print("Please enter file name with schedule information: ");
				String filename = scan.nextLine();
				FileInputStream fstream = new FileInputStream(filename);
				DataInputStream in = new DataInputStream(fstream);
				BufferedReader br = new BufferedReader(new InputStreamReader(in));
				String strLine;
				try {
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
		else if(choice == 4) { // TESTED & WORKING
			System.out.println(
				"WOULD YOU LIKE TO:\n" +
				"L: Load pricing information\n" +
				"C: Change flight price\n");
			System.out.print("Enter Command: ");
			inputString = scan.nextLine();
			if(inputString.equals("L") || inputString.equals("l")) {
				try {
					System.out.print("Please enter file name with pricing information: ");
					String filename = scan.nextLine();
					FileInputStream fstream = new FileInputStream(filename);
					DataInputStream in = new DataInputStream(fstream);
					BufferedReader br = new BufferedReader(new InputStreamReader(in));
					String strLine;
					try {
						while((strLine = br.readLine()) !=null) {
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
				try {
					hPrice = Integer.parseInt(inputString);
				} catch(NumberFormatException e) {
					invalidPrice = true;
				}
				System.out.print("And the low price?: ");
				inputString = scan.nextLine();
				try {
					lPrice = Integer.parseInt(inputString);
				} catch(NumberFormatException e) {
					invalidPrice = true;
				}
				if(!invalidPrice) { // Don't run if price isn't an integer
					System.out.println( // Display entered data for confirmation before execution
						"\n You have entered the following information:" +
						"\nDeparture City: " + dCity +
						"\nArrival City: " + aCity +
						"\nHigh Price: " + hPrice +
						"\nLow Price: " + lPrice +
						"\nIs this this correct? (Y/N)");
					inputString = scan.nextLine();

					if(inputString.equals("Y") || inputString.equals("y")) {
						try {
							query = "UPDATE price SET high_price = ? ,low_price = ? WHERE departure_city = ? AND arrival_city = ?";
							PreparedStatement updateStatement = connection.prepareStatement(query);
							updateStatement.setInt(1,hPrice);
							updateStatement.setInt(2,lPrice);
							updateStatement.setString(3,dCity);
							updateStatement.setString(4,aCity);
							updateStatement.executeUpdate();
							System.out.println("PRICE CHANGED");
						} catch(SQLException Ex) {System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());}
					}
					else
						System.out.println("NOTHING CHANGED");
				}
				else
					System.out.println("Price must be a number!");
			}
			else
				System.out.println("INVALID CHOICE");
		}
		else if(choice == 5) { // TESTED & WORKING
			try {
				System.out.print("Please enter file name with plane information: ");
				String filename = scan.nextLine();
				FileInputStream fstream = new FileInputStream(filename);
				DataInputStream in = new DataInputStream(fstream);
				BufferedReader br = new BufferedReader(new InputStreamReader(in));
				String strLine;
				try {
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
		else if(choice == 6) {
			String flightNum, flightDate;
			System.out.print("What is the flight number?: ");
			flightNum = scan.nextLine();
			System.out.print("What is the flight date? (FORMAT HERE): ");
			flightDate = scan.nextLine();
		}
		else if(choice == 7) {
			System.out.println("EXITING");
			System.exit(0);
		}
		else
			System.out.println("INVALID CHOICE");

		// Repeat menu after pause
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
		int choice;
		try {
			choice = Integer.parseInt(inputString);
		} catch(NumberFormatException e) {
			choice = 0;
		}

		if(choice == 1) {

		}
		else if(choice == 2) {

		}
		else if(choice == 3) {

		}
		else if(choice == 4) {

		}
		else if(choice == 5) {

		}
		else if(choice == 6) {

		}
		else if(choice == 7) {

		}
		else if(choice == 8) {

		}
		else if(choice == 9) {

		}
		else if(choice == 10) {

		}
		else if(choice == 11) {
			System.out.println("EXITING");
			System.exit(0);
		}
		else
			System.out.println("INVALID CHOICE");

		// Repeat menu after pause
		System.out.print("Press Enter to Continue... ");
		inputString = scan.nextLine();
		displayCusInterface();
	}

	public static void main(String args[]) throws SQLException {
		Menu menu = new Menu();
		menu.connectDB(); // Connect to the Database
		menu.getAccess(); // Determine Admin or Customer access, then run interface
		connection.close(); // Close connection (needs added before system.exits?)
	}
}
