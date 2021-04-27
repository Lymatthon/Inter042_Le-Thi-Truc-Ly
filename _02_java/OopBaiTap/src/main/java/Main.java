public class Main {
    public static void main(String[] args) {
//       Employee newEmployee = new Employee(1,"Le","Thi", 200);
//          cau a
//        System.out.println(newEmployee.getFullName());
//        System.out.println(newEmployee.getId());
//        System.out.println(newEmployee.getSalary());
//          cau b
        Employee[] arrayEmployee = new Employee[10];
        arrayEmployee[0] = new Employee(2,"Hoang","Trung",350);
        arrayEmployee[1] = new Employee(4,"Tran","Tran",3002);
        arrayEmployee[2] = new Employee(3,"Vo","Le Van",30023);
        arrayEmployee[3] = new Employee(5,"Tran","My Quyen",3300);
        arrayEmployee[4] = new Employee(7,"Tran","Khai Vinh",3400);
        arrayEmployee[5] = new Employee(8,"Le","Hoang Thuc",3005);
        arrayEmployee[6] = new Employee(6,"Luu","Thi Thu",3007);
        arrayEmployee[7] = new Employee(9,"Vo","Hoang Yen",30056);
        arrayEmployee[8] = new Employee(10,"Nguyen","Thanh Chuong",30450);
        arrayEmployee[9] = new Employee(11,"Nguyen","Khac Viet",3050);

//        for (int i = 0; i < 10; i ++){
//
//            System.out.println(arrayEmployee[i].toString());
//        }
        sapXep(arrayEmployee);
        for (int i = 0; i < 10; i ++){
        System.out.println(arrayEmployee[i].toString());
       }

    }

        public static void sapXep(Employee[] array_new){
        Employee temp = new Employee();
        for (int i = 0; i < array_new.length; i ++){
            for(int j = i + 1; j < array_new.length; j ++){
                if(array_new[i].getId() > array_new[j].getId()){
                    temp = array_new[j];
                    array_new[j] = array_new[i];
                    array_new[i] = temp;
                }
            }

        }
        }

        }






