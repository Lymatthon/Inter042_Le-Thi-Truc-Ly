package Commons;

import Models.HouseService;
import Models.RoomService;
import Models.VillaService;

import java.io.BufferedWriter;

import java.io.FileWriter;

public class WriterFile {
    public static void addVillaToCSV(VillaService newService) {
        try {
            FileWriter newFile = new FileWriter("Villa.csv", true);
            BufferedWriter newBW = new BufferedWriter(newFile);
            newBW.append(newService.showInfor());
            newBW.newLine();
            newBW.close();
            newFile.close();
        } catch (Exception e) {

        }
    }
    public static void addHouseToCSV(HouseService newService) {
        try {
            FileWriter newFile = new FileWriter("House.csv", true);
            BufferedWriter newBW = new BufferedWriter(newFile);
            newBW.append(newService.showInfor());
            newBW.newLine();
            newBW.close();
            newFile.close();
        } catch (Exception e) {

        }
    }
    public static void addRoomToCSV(RoomService newService) {
        try {
            FileWriter newFile = new FileWriter("Room.csv", true);
            BufferedWriter newBW = new BufferedWriter(newFile);
            newBW.append(newService.showInfor());
            newBW.newLine();
            newBW.close();
            newFile.close();
        } catch (Exception e) {

        }
    }

}
