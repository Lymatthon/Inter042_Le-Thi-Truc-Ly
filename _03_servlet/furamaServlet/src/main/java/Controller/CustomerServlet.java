package Controller;


import Models.DAO.CustomerRepository;
import Models.Customer;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"","/customer"})
public class CustomerServlet extends HttpServlet {
    List<Customer> newList = CustomerRepository.findAll();



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");
        if(actionUser == null){
            this.loadList(request,response);
        } else if("create".equals(actionUser)){
            response.sendRedirect("/views/AddNewCustomer.jsp");
        }
    }
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");

          if("create".equals(actionUser)){
            int idGenerate = (int) (Math.random() * 1000);
            int type_id = (int) Integer.parseInt(request.getParameter("customer_type_id"));
            String name = request.getParameter("customer_name");
            String birthday = request.getParameter("customer_birthday");
            int gender = (int) Integer.parseInt(request.getParameter("customer_gender"));
            String id_card = request.getParameter("customer_id_card");
            String phone = request.getParameter("customer_phone");
            String mail = request.getParameter("customer_email");
            String address = request.getParameter("customer_address");

            Customer newCustomer = new Customer(idGenerate,type_id,name,birthday,gender, id_card,phone,mail,address);
            newList.add(newCustomer);
            request.setAttribute("msg", "Register successfully!");
            this.loadList(request, response);
        } else if("update".equals(actionUser)){

        }
    }
    private void loadList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("CustomerList", CustomerRepository.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/showCustomerInfor.jsp");
        requestDispatcher.forward(request, response);
    }


}
