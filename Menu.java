import java.sql.*;
import java.util.*;
import java.io.*;
import java.text.ParseException;

public class Menu {
	private Statement statement;
	private ResultSet resultSet;
	private String inputString, file, query;
	private Scanner scan = new Scanner(System.in);

	public void connectDB() {


		System.out.println("CONNECTING TO DB");
		System.out.print("Username: ");
		String username = scan.nextLine();
		Console console = System.console();
		String password = new String(console.readPassword("Password: "));
		String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";
		try {
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
			Connection connection = DriverManager.getConnection(url, username, password);
		}
		catch(Exception Ex) {
			System.out.println("Error connecting to database.  Machine Error: " + Ex.toString());
			Ex.printStackTrace();
		}
	}

	public void getAccess() {

		System.out.println("Welcome to PittTours are you a: ");
		System.out.println("1: Administrator");
		System.out.println("2: Customer");
		System.out.println("3: Neither, Quit\n");

		System.out.print("Enter menu choice: ");
		inputString = scan.nextLine();
		int choice;
		try {
			choice = Integer.parseInt(inputString);
		} catch (NumberFormatException e) {
			choice = 0;
		}

		if(choice == 1)
			displayAdmInterface();
		else if(choice == 2)
			displayCusInterface();
		else if(choice == 3) {
			System.out.println("\nEXITING");
			System.exit(0);
		}
	}

	public void displayAdmInterface() {
		System.out.println("\nAVAILABLE ADMINISTRATOR COMMANDS:");
		System.out.println("1: Erase the Database");
		System.out.println("2: Load airline information");
		System.out.println("3: Load schedule information");
		System.out.println("4: Load pricing information");
		System.out.println("5: Load plane information");
		System.out.println("6: Generate passenger manifest of flight on day");
		System.out.println("7: Quit\n");

		System.out.print("Enter command number: ");
		inputString = scan.nextLine();
		int choice;
		try {
			choice = Integer.parseInt(inputString);
		} catch (NumberFormatException e) {
			choice = 0;
		}

		if(choice == 1) {
			System.out.print("Are you sure you want to delete the database? (Y/N): ");
			inputString = scan.nextLine();
			if(inputString.equals("Y")) {
				// DROP TABLES
				System.out.println("DATABASE ERASED");
			}
			else
				System.out.println("DATABASE ERASURE CANCELLED");
		}
		else if(choice == 2) {
			// LOAD FILE BY LINE, PARSE BY COMMA, INSERT INTO AIRLINES
		}
		else if(choice == 3) {
			// LOAD FILE BY LINE, PARSE BY COMMA, INSERT INTO FLIGHTS
		}
		else if(choice == 4) {
			System.out.println(
				"WOULD YOU LIKE TO:\n" +
				"L: Load pricing information\n" +
				"C: Change flight price\n");
			System.out.print("Enter Command: ");
			inputString = scan.nextLine();
			if(inputString.equals("L")) {
				// LOAD FILE BY LINE, PARSE BY COMMA, INSERT INTO PRICES
			}
			else if(inputString.equals("C")) {
				String dCity, aCity, hPrice, lPrice;
				System.out.println("YOU HAVE CHOSEN TO CHANGE A FLIGHT PRICE");
				System.out.print("What is the departure city of the flight you wish to change?: ");
				dCity = scan.nextLine();
				System.out.print("And the arrival city of this flight?: ");
				aCity = scan.nextLine();
				System.out.print("What is the new high price for this flight?: ");
				hPrice = scan.nextLine();
				System.out.print("And the low price?: ");
				lPrice = scan.nextLine();
				System.out.println(
					"\n You have entered the following information:" +
					"\nDeparture City: " + dCity +
					"\nArrival City: " + aCity +
					"\nHigh Price: " + hPrice +
					"\nLow Price: " + lPrice +
					"\nIs this this correct? (Y/N)\n");
				inputString = scan.nextLine();

				if(inputString.equals("Y")) {
					// UPDATE WITH PRICE THAT HAS THE ABOVE INFORMATION
					System.out.println("PRICE CHANGED");
				}
				else
					System.out.println("NOTHING CHANGED");
			}
			else
				System.out.println("INVALID CHOICE");

		}
		else if(choice == 5) {
			// LOAD FILE BY LINE, PARSE BY COMMA, INSERT INTO PLANES
		}
		else if(choice == 6) {
			String flightNum, flightDate;
			System.out.print("What is the flight number?: ");
			flightNum = scan.nextLine();
			System.out.print("What is the flight date? (FORMAT HERE): ");
			flightDate = scan.nextLine();
		}
		else if(choice == 7) {
			System.out.println("\nEXITING");
			System.exit(0);
		}
		else
			System.out.println("INVALID CHOICE");

		System.out.print("Press Enter to Continue... ");
		inputString = scan.nextLine();
		displayAdmInterface();
	}

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

		System.out.print("Enter command number: ");
		inputString = scan.nextLine();
		int choice;
		try {
			choice = Integer.parseInt(inputString);
		} catch (NumberFormatException e) {
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
			System.out.println("\nEXITING");
			System.exit(0);
		}
		else
			System.out.println("INVALID CHOICE");

		System.out.print("Press Enter to Continue... ");
		inputString = scan.nextLine();
		displayCusInterface();
	}

	public static void main(String args[]) {
		Menu menu = new Menu();
		menu.connectDB();
		menu.getAccess();
	}
}
