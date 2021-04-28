package Models.DAO;

import Models.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository {
    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/furamaMVC";
            String user = "root";
            String password = "admin";
            return DriverManager.getConnection(url,user, password);

        } catch (ClassNotFoundException| SQLException e) {
            return null;
        }
    }

    public static List<Customer> findAll(){
        List<Customer> newList = new ArrayList<>();
        String sql = "Select * from customer";
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if(connection != null){
           try{
               statement = connection.prepareStatement(sql);
               resultSet = statement.executeQuery();
               while (resultSet.next()){
                   Customer customer = new Customer();
                   customer.setCustomer_id(resultSet.getInt("customer_id"));
                   customer.setCustomer_type_id(resultSet.getInt("customer_type_id"));
                   customer.setCustomer_name(resultSet.getString("customer_name"));
                   customer.setCustomer_birthday(resultSet.getString("customer_birthday"));
                   customer.setCustomer_gender(resultSet.getInt("customer_gender"));
                   customer.setCustomer_id_card(resultSet.getString("customer_id_card"));
                   customer.setCustomer_phone(resultSet.getString("customer_phone"));
                   customer.setCustomer_email(resultSet.getString("customer_email"));
                   customer.setCustomer_address(resultSet.getString("customer_address"));
                   newList.add(customer);

               }
               return newList;

           }catch (SQLException e){
                return null;
           } finally {
               try{
                   if(connection != null){
                       connection.close();
                   }
                   if(statement != null){
                       statement.close();
                   }
                   if(resultSet != null){
                       resultSet.close();
                   }
               } catch (SQLException e){
                   return null;
           }
           }
        }

        return null;
    }
    public static void saveNewCustomer(Customer newCustomer){
        String sql = "Insert into customer values (?,?,?,?,?,?,?,?,?)";
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if(connection != null){
            try{
                PreparedStatement stament = connection.prepareStatement(sql);
                stament.setInt(1,newCustomer.getCustomer_id());
                stament.setInt(2,newCustomer.getCustomer_type_id());
                stament.setString(3, newCustomer.getCustomer_name());
                stament.setString(4, newCustomer.getCustomer_birthday());
                stament.setInt(5, newCustomer.getCustomer_gender());
                stament.setString(6, newCustomer.getCustomer_id_card());
                stament.setString(7, newCustomer.getCustomer_phone());
                stament.setString(8, newCustomer.getCustomer_email());
                stament.setString(9, newCustomer.getCustomer_address());
                stament.execute();
            } catch (SQLException e){
                e.printStackTrace();
            } finally {
                try{
                    if(connection != null){
                        connection.close();
                    }
                    if(statement != null){
                        statement.close();
                    }
                    if(resultSet != null){
                        resultSet.close();
                    }
                } catch (SQLException e){
                    e.printStackTrace();
                }
            }

    }






}
