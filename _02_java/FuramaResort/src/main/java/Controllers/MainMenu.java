package Controllers;

import manager.AddNewServices;
import manager.ShowAllServices;

import java.util.Scanner;

public class MainMenu {
    public static void displayMainMenu(){
        System.out.println("Please chose: ");
        System.out.println("1,Add New Services");
        System.out.println("2,Show Services");
        System.out.println("3,Add New Customer");
        System.out.println("4,Show Information of Customer");
        System.out.println("5,Add New Booking");
        System.out.println("6,Show Information of Employee");
        System.out.println("7,Exit");
        int a = input().nextInt();
        switch (a){
            case 1:

                AddNewServices.addNewServices();
                break;
            case 2:
                ShowAllServices.showAllSevices();
                break;
            case 3:
//                MainController.addNewCustomer();
                break;
            case 4:
//                MainController.showInformationCustomers();
                break;
            case 5:
//                MainController.addNewBooking();
                break;
            case 6:
//                MainController.showInformationEmployee();
                break;

            case 7:
                System.exit(0);
                break;
        }
    }

    public  static Scanner input(){
        Scanner sc = new Scanner(System.in);
        return sc;
    }
}
