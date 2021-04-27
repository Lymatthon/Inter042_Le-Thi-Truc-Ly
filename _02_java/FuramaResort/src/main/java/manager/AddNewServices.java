package manager;

import Commons.Regex;
import Commons.WriterFile;
import Controllers.MainMenu;
import Models.HouseService;
import Models.RoomService;
import Models.VillaService;

import java.util.Scanner;

public class AddNewServices {

    public static void addNewServices() {

        System.out.println("Please chose: ");
        System.out.println("1,Add New Villa");
        System.out.println("2,Add New House");
        System.out.println("3,Add New Room");
        System.out.println("4,Back to Menu");
        System.out.println("5,Exit");

        int a = input().nextInt();
        switch (a){
            case 1:
                addNewVilla();

                break;
            case 2:
                addNewHouse();
                break;
            case 3:
                addNewRoom();
                break;
            case 4:
                MainMenu.displayMainMenu();
                break;
            case 5:
                System.exit(0);

                break;
        }
    }
    public static void addNewVilla() {
        System.out.println("Please input id: ");
        String a = Regex.checkIdValid(input().nextLine());
        System.out.println("Ten Dich Vu: ");
        String b = Regex.checkNameValid(input().nextLine());
        System.out.println("Dien Tich: ");
        double c = input().nextDouble();
        System.out.println("Chi Phi Thue: ");
        int d = input().nextInt();
        System.out.println("So Luong Nguoi Toi Da: ");
        int e = input().nextInt();
        System.out.println("Kieu thue: ");
        String f = input().nextLine();
        System.out.println("Tieu chuan phong: ");
        String g = input().nextLine();
        System.out.println("Mo ta tien nghi khac: ");
        String h = input().nextLine();
        System.out.println("Dien Tich Ho Boi: ");
        double i = input().nextDouble();
        System.out.println("So Tang: ");
        int k = input().nextInt();
        VillaService newVilla = new VillaService(a, b, c, d, e, f, g, h, i, k);
        System.out.println("Da Nhap Du Lieu Thanh Cong!");
        WriterFile.addVillaToCSV(newVilla);
        }
    public static void addNewHouse() {

        System.out.println("Please input id: ");
        String a = Regex.checkIdValid(input().nextLine());
        System.out.println("Ten Dich Vu: ");
        String b = Regex.checkNameValid(input().nextLine());
        System.out.println("Dien Tich: ");
        double c = input().nextDouble();
        System.out.println("Chi Phi Thue: ");
        int d = input().nextInt();
        System.out.println("So Luong Nguoi Toi Da: ");
        int e = input().nextInt();
        System.out.println("Kieu thue: ");
        String f = input().nextLine();
        System.out.println("Tieu chuan phong: ");
        String g = input().nextLine();
        System.out.println("Mo ta tien nghi khac: ");
        String h = input().nextLine();
        System.out.println("So Tang: ");
        int k = input().nextInt();
        HouseService newhouseService = new HouseService(a,b,c,d,e,f,g,h,k);
        System.out.println("Da Nhap Du Lieu Thanh Cong!");
        WriterFile.addHouseToCSV(newhouseService);

    }
    public static void addNewRoom() {

        System.out.println("Please input id: ");
        String a = Regex.checkIdValid(input().nextLine());
//        v.setId(File.check(cs.nextLine(),"SVVL-"));
        System.out.println("Ten Dich Vu: ");
        String b = Regex.checkNameValid(input().nextLine());
        System.out.println("Dien Tich: ");
        double c = input().nextDouble();
        System.out.println("Chi Phi Thue: ");
        int d = input().nextInt();
        System.out.println("So Luong Nguoi Toi Da: ");
        int e = input().nextInt();
        System.out.println("Kieu thue: ");
        String f = input().nextLine();
        System.out.println("Dich vu mien phi di kem: ");
        String h = input().nextLine();
        System.out.println("Da Nhap Du Lieu Thanh Cong!");
        RoomService roomService = new RoomService(a,b,c,d,e,f,h);
        WriterFile.addRoomToCSV(roomService);

    }

    public  static Scanner input(){

        return new Scanner(System.in);
    }
}
