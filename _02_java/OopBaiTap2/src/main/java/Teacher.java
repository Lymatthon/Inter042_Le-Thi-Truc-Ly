public class Teacher extends Person{
    private int salary;

    public Teacher() {
    }

    public Teacher(String name, int age, String address, int salary) {
        super(name, age, address);
        this.salary = salary;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    @Override
    public String display() {
        return super.display()
                + "\n" +
                "Salary: " + salary;
    }
}
