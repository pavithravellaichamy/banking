/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PAVINANDY
 */
@WebServlet("/amountupdate")
public class amountupdate extends HttpServlet {
    public amountupdate(){
        super();
    }
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "banking";
    String userid = "root";
    String password = "password";
    Connection connection=null;
    Statement st0=null,st=null;
    PreparedStatement st1=null,st2=null,st3=null;
    ResultSet rs=null,rs1=null;
    
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           
            HttpSession sn = request.getSession(true);
            String account_num= request.getParameter("account_num");
            int amount= Integer.parseInt(request.getParameter("amount"));
            RequestDispatcher rd;

	try {
		
	    Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            st1 = connection.prepareStatement("insert into transaction (account_num,amount) values(?,?)");
            st1.setString(1,"account_num");
            st1.setInt(2,amount);
            st1.executeUpdate();
            st=connection.createStatement();
            String sql="select Balance from account_details";
            rs=st.executeQuery(sql);
            int balance=rs.getInt("Balance");
            st2=connection.prepareStatement("update transaction set current_balance=(balance-amount)");
            st2.executeUpdate();
            st0=connection.createStatement();
            String query="select current_balance from transaction";
            rs1=st0.executeQuery(sql);
            int current_balance=rs1.getInt("current_balance");
            st3=connection.prepareStatement("update account_details set Balance=current_balance)");
            rd=request.getRequestDispatcher("index.jsp");
            rd.forward(request,response);
            st1.close();
            connection.close();
        } catch(ClassNotFoundException | SQLException e2) {
           
        }
      
    }

}
