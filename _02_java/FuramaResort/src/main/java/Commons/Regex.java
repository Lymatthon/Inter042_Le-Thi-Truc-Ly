package Commons;


import java.util.Scanner;
import java.util.regex.Pattern;

public class Regex {


        public static String checkIdValid(String chuoi){

        Pattern p = Pattern.compile("^(SVVL)|(SVHO)|(SVRO)-[0-9]{1,4}$");

        while (true){

                if(p.matcher(chuoi).find()){
                    return chuoi;
                } else {
                    System.err.println("Ma dich vu phai theo dinh dang: SVXX-YYYY");
                    System.err.println("Moi nhap lai: ");
                    Scanner sc = new Scanner(System.in);
                    String newStr = sc.nextLine();
                    chuoi = newStr;
                }


        }
    }
    public static String checkNameValid(String chuoi){
        Pattern p = Pattern.compile("^[A-Z]*[a-z]{1,}( [A-Z]*[a-z]{0,}){0,}");

        while (true){

            if(p.matcher(chuoi).find()){
                return chuoi;
            } else {
                System.err.println("Ten Dich Vu Phai Viet Hoa Chu Cai Dau!");
                System.err.println("Moi nhap lai: ");
                Scanner sc = new Scanner(System.in);
                String newStr = sc.nextLine();
                chuoi = newStr;
            }


        }
    }
    public static double checkSquareValid(String dientich){
        Pattern p = Pattern.compile("-?[0-9]+(.[0-9]+)?");
        while (true){

            if(p.matcher(dientich).find()){
                return Double.parseDouble(dientich);
            } else {
                System.err.println("Ban phai nhap vao mot so");
                System.err.println("Moi nhap lai: ");
                Scanner sc = new Scanner(System.in);
                String newStr = sc.nextLine();
                dientich = newStr;
            }


        }

       

    }

    }



