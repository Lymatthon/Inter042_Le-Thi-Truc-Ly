package Controller;
import java.time.LocalDate;
import java.util.Date;
import Models.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "")
public class CustomerServlet extends HttpServlet {
    List<Customer> newList = new ArrayList<>();
    @Override
    public void init() throws ServletException {
        Customer newCustomer = new Customer(1,1,"Duong", LocalDate.of(2000,01,01),"2000-01-01","1","11","111","1");
        newList.add(newCustomer);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("Customer", newList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/showCustomerInfor.jsp");
        requestDispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
