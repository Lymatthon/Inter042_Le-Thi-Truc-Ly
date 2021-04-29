package Models.Services;

import Models.Customer;
import Models.DAO.CustomerRepository;

public class CustomerServices {
CustomerRepository newCustomerRepo = new CustomerRepository();


    public static void deleteCustomer(int id){
        CustomerRepository.deleteCustomer(id);
    }
    public static Customer getCustomerByID(int id){
        Customer customer_getByID = CustomerRepository.getCustomerByID(id);
        return customer_getByID;
    }
    public static void updateCustomer(Customer customer){
        CustomerRepository.updateNewCustomer(customer);
    }


}
