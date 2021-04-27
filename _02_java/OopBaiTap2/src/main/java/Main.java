public class Main {
    public static void main(String[] args) {
        Student[] students = new Student[5];
        students[0] = new Student("Truong", 21 , "Binh Dinh", 5.7);
        students[1] = new Student("Khanh", 20 , "Khanh Hoa", 7.7);
        students[2] = new Student("Duong", 19 , "Binh Duong", 6.7);
        students[3] = new Student("Man", 23 , "Nam Dinh", 5.9);
        students[4] = new Student("Hana", 20 , "Ha Noi", 5.0);

        Teacher[] teachers = new Teacher[5];
        teachers[0] = new Teacher("Tran", 33, "Ha Noi", 2000);
        teachers[1] = new Teacher("Han", 34, "Da Nang", 2080);
        teachers[2] = new Teacher("Ngan", 36, "Khanh Hoa", 2090);
        teachers[3] = new Teacher("Phuong", 43, "Ha Noi", 2070);
        teachers[4] = new Teacher("Thanh", 53, "Ha Noi", 2001);
//        for(int i = 0; i < students.length - 1; i++){
//            System.out.println(students[i].display());
//        }
//
//        for(int j = 0; j < teachers.length - 1; j++){
//            System.out.println(teachers[j].display());
//        }
//        sapXep(teachers);
//        showTop3MaxSalary(teachers);
        showYoungestStudent(students);
    }
    public static void sapXep(Teacher[] teachers){
        Teacher maxTSalary = teachers[0];
        for (int a = 0; a < teachers.length - 1; a++){
            for (int b = a + 1; b < teachers.length; b ++)
            if(teachers[a].getSalary() < teachers[b].getSalary()){
                maxTSalary = teachers[b];
                teachers[b] = teachers[a];
                teachers[a] = maxTSalary;
                }
        }

    }
    public static void showTop3MaxSalary(Teacher[] teachers){
        for (int i = 0; i < 3; i ++){
            System.out.println(teachers[i].display());
        }
    }

    public static void showYoungestStudent(Student[] students){
        Student YoungestStudent = students[0];
        for (int a = 0; a < students.length - 1; a++){
            if(students[a].getAge() < YoungestStudent.getAge() ){
                YoungestStudent = students[a];

            }
        }
        System.out.println(YoungestStudent.display());

    }

}
