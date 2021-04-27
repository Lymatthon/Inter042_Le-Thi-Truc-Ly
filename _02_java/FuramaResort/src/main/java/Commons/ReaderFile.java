package Commons;


import Models.HouseService;
import Models.RoomService;
import Models.Services;
import Models.VillaService;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;


public class ReaderFile {
public static List<VillaService> showAllVillaService(){
   List<VillaService> listVilla = new ArrayList<>();
    try
    {
        FileReader newFile = new FileReader("Villa.csv");
        BufferedReader newBW = new BufferedReader(newFile);
        String line = "";
        while(true){
            line = newBW.readLine();
            if(line == null){
                break;
            }
            String text[] = line.split(";");
            VillaService villa = new VillaService(text[0],text[1],Double.parseDouble(text[2]),Integer.parseInt(text[3]), Integer.parseInt(text[4]),text[5],text[6],text[7],Double.parseDouble(text[8]),Integer.parseInt(text[9]));
            listVilla.add(villa);


        }
    } catch(
    Exception e){

    }
    return listVilla;
}
    public static List<HouseService> showAllHouseService(){
        List<HouseService> listHouse = new ArrayList<>();
        try
        {
            FileReader newFile = new FileReader("House.csv");
            BufferedReader newBW = new BufferedReader(newFile);
            String line = "";
            while(true){
                line = newBW.readLine();
                if(line == null){
                    break;
                }
                String text[] = line.split(";");
                HouseService house = new HouseService(text[0],text[1],Double.parseDouble(text[2]),Integer.parseInt(text[3]), Integer.parseInt(text[4]),text[5],text[6],text[7],Integer.parseInt(text[9]));
                listHouse.add(house);


            }
        } catch(
                Exception e){

        }
        return listHouse;
    }
    public static List<RoomService> showAllRoomService(){
        List<RoomService> listRoom = new ArrayList<>();
        try
        {
            FileReader newFile = new FileReader("House.csv");
            BufferedReader newBW = new BufferedReader(newFile);
            String line = "";
            while(true){
                line = newBW.readLine();
                if(line == null){
                    break;
                }
                String text[] = line.split(";");
                RoomService room = new RoomService(text[0],text[1],Double.parseDouble(text[2]),Integer.parseInt(text[3]), Integer.parseInt(text[4]),text[5],text[6]);
                listRoom.add(room);
            }
        } catch(
                Exception e){

        }
        return listRoom;
    }

    }
