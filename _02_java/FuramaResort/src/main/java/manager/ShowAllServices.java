package manager;

import Commons.ReaderFile;
import Controllers.MainMenu;
import Models.HouseService;
import Models.RoomService;
import Models.VillaService;

import java.util.List;
import java.util.Scanner;

public class ShowAllServices {
    public static void showAllSevices() {

        System.out.println("Please chose: ");
        System.out.println("1,Show all Villa");
        System.out.println("2,Show all House");
        System.out.println("3,Show all Room");
        System.out.println("4,Show all Name  Villa Not Duplicate");
        System.out.println("5,Show all Name  Villa Not Duplicate");
        System.out.println("6,Show all Name  Villa Not Duplicate");
        System.out.println("7,Back to Menu");
        System.out.println("8,Exit");

        int a = input().nextInt();
        switch (a){
            case 1:
                showAllVilla();
                break;
            case 2:
               showAllHouse();
                break;
            case 3:
                showAllRoom();
                break;
            case 4:
              MainMenu.displayMainMenu();
                break;
            case 5:
              System.exit(0);

                break;
            case 6:
               System.exit(0);

                break;
            case 7:
                MainMenu.displayMainMenu();

                break;
            case 8:
                System.exit(0);

                break;
        }
    }

    private static void showAllVilla() {
        List<VillaService> newList = ReaderFile.showAllVillaService();
        for( VillaService villa : newList){
            System.out.println(villa.showInfor());
        }
    }
    private static void showAllHouse() {
        List<HouseService> newList = ReaderFile.showAllHouseService();
        for( HouseService house : newList){
            System.out.println(house.showInfor());
        }
    }
    private static void showAllRoom() {
        List<RoomService> newList = ReaderFile.showAllRoomService();
        for( RoomService room : newList){
            System.out.println(room.showInfor());
        }
    }

    public  static Scanner input(){
        return new Scanner(System.in);
    }
}
