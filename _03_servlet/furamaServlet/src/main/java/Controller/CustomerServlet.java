package Controller;


import Models.DAO.CustomerRepository;
import Models.Customer;
import Models.Services.CustomerServices;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//import java.sql.SQLException;
import java.util.List;

import static java.lang.Integer.*;

@WebServlet(name = "CustomerServlet", urlPatterns = {"","/customer"})
public class CustomerServlet extends HttpServlet {
    List<Customer> newList = CustomerRepository.findAll();
    CustomerServices customerServices = new CustomerServices();



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if(action == null){
            loadList(request,response);        }
        switch (action){
            case "create": {
                response.sendRedirect("/views/AddNewCustomer.jsp");
                break;
            }
            case "delete":{

                deleteCustomerServlet(request,response);
                break;
            }
            case "edit":{
                showEditFormCustomerServlet(request, response);

                break;
            }
            case "search":{
//

                break;
            }

            default: loadList(request,response);
            break;
        }

    }
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");
          switch (actionUser){
              case "create":
                  //khi nguoi dung bam nut submit se vao day
                    addNewCustomerServlet(request,response);
                    break;
              case "update":
                  //khi nguoi dung bam nut submit edit form se vao day
                  updateCustomerServlet(request, response);
                  break;
              default: loadList(request,response);
              break;
          }

      }
    private void loadList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("CustomerList", CustomerRepository.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/showCustomerInfor.jsp");
        requestDispatcher.forward(request, response);
    }
    private void addNewCustomerServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int idGenerate = (int) (Math.random() * 1000);
        int type_id = (int) parseInt(request.getParameter("customer_type_id"));
        String name = request.getParameter("customer_name");
        String birthday = request.getParameter("customer_birthday");
        int gender = (int) parseInt(request.getParameter("customer_gender"));
        String id_card = request.getParameter("customer_id_card");
        String phone = request.getParameter("customer_phone");
        String mail = request.getParameter("customer_email");
        String address = request.getParameter("customer_address");

        Customer newCustomer = new Customer(idGenerate,type_id,name,birthday,gender, id_card,phone,mail,address);
        CustomerRepository.saveNewCustomer(newCustomer);
        request.setAttribute("msg", "Register successfully!");
        this.loadList(request, response);

    }
    private void deleteCustomerServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id_delete;
        id_delete = (int) parseInt(request.getParameter("id"));
        request.setAttribute("msg","Delete successfully!");
        this.loadList(request, response);
    }
    private void showEditFormCustomerServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id_edit = (int) parseInt(request.getParameter("id"));
        Customer customer_edited = CustomerServices.getCustomerByID(id_edit);
        request.setAttribute("Customer", customer_edited);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/EditCustomerForm.jsp");
        requestDispatcher.forward(request, response);
    }
    private void updateCustomerServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = (int) parseInt(request.getParameter("customer_id"));
        int type_id = (int) parseInt(request.getParameter("customer_type_id"));
        String name = request.getParameter("customer_name");
        String birthday = request.getParameter("customer_birthday");
        int gender = (int) parseInt(request.getParameter("customer_gender"));
        String id_card = request.getParameter("customer_id_card");
        String phone = request.getParameter("customer_phone");
        String mail = request.getParameter("customer_email");
        String address = request.getParameter("customer_address");

        Customer newCustomer = new Customer(id,type_id,name,birthday,gender, id_card,phone,mail,address);
        CustomerServices.updateCustomer(newCustomer);
        request.setAttribute("msg", "Update successfully!");
        this.loadList(request, response);

    }


}
