import java.util.Comparator;
import java.util.Scanner;

public class Menu { 

  public static void main(string[] args){

    private Scanner scan = new Scanner(System.in);
    public void Menu(){
	System.out.println("Welcome to PittTours are you: ");
   
  while(true){
	System.out.println("1.) Administrators");
	System.out.println("2.) Customers");	
	System.out.println("3.) Quit");
	System.out.println("Please enter the number of a Menu choice: ");
	int choice = scan.nextInt();
	if(choice == 1){
	    choice = displayAdmInterface();
	}
	else if(choice == 2){
	    choice = displayCusInterface();
	}
	else if(choice==3){
		System.out.println("\nThank you. Program is done");
		break;
	}
   }
}

    private int displayAdmInterface() {
	System.out.println("1.) Erase the database");
	System.out.println("2.) Load airline information");
	System.out.println("3.) Load schedule information");
	System.out.println("4.) Load pricing information");
	System.out.println("5.) Load plane information");
	System.out.println("6.) Generate passenger manifest for specific flight on given day");
	System.out.println("7.) Quit");
	System.out.println("Please enter the number of a Menu choice: ");
	int choice = scan.nextInt();
	if(choice==1){
	   

	}
	else if(choice==2){
	

	}
	else if(choice==3){


	}
	else if(choice==4){


	}
	else if(choice==5){


	}
	else if(choice==6){


	}
	else if(choice==7){
		System.out.println("\nThank you. Program is done");
		break;
	}
    }

    private int displayCusInterface() {
	System.out.println("1.) Add customer");
	System.out.println("2.) Show customer info, given customer name");
	System.out.println("3.) Find price for flights between two cities");
	System.out.println("4.) Find all routes between two cities");
	System.out.println("5.) Find all routes between two cities of a given airline");
	System.out.println("6.) Find all routes with available seats between two cities on given day");
	System.out.println("7.) For a given airline, find all routes with available seats between two cities on given day");
	System.out.println("8.) Add reservation");
	System.out.println("9.) Show reservation info, given reservation number");
	System.out.println("10.) Buy ticket from existing reservation");
	System.out.println("11.) Quit");
	System.out.println("Please enter the number of a Menu choice: ");
	int choice = scan.nextInt();
	if(choice==1){
	   

	}
	else if(choice==2){
	

	}
	else if(choice==3){


	}
	else if(choice==4){


	}
	else if(choice==5){


	}
	else if(choice==6){


	}
	else if(choice==7){


	}
	else if(choice==8){


	}
	else if(choice==9){


	}
	else if(choice==10){


	}
	else if(choice==11){
		System.out.println("\nThank you. Program is done");
		break;
	}
	else{
	    System.out.println("Invalid Choice!");
	    choice = displayCusInterface();
	}
	return choice;
    }
}
