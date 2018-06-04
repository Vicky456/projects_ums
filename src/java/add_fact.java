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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author test
 */
@WebServlet(urlPatterns = {"/add_fact"})
public class add_fact extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        
        String col1=req.getParameter("name");
        String col2=req.getParameter("code_sub");
        int col3=Integer.parseInt(req.getParameter("dept"));
        
        String col4=req.getParameter("email");
        String col5=req.getParameter("phone");
        
        PreparedStatement preparedStatement;
         try{  
           
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ums","root","");  
                 
               
                String sql = "INSERT INTO ums.faculty_tb (id, name, code_id, dept_id, email, contact) VALUES (null, ?, ?, ?, ?, ?);";
                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1, col1);
                preparedStatement.setString(2, col2);
                preparedStatement.setInt(3, col3);
                preparedStatement.setString(4, col4);
                preparedStatement.setString(5, col5);
                if(preparedStatement.executeUpdate()!=-1){
                    
                    
                    resp.sendRedirect("/projectums/admin/?mes=success");
                }
                
                con.close();  
                
        
       
       
       
       }catch(Exception e){System.err.println(e);}  
    }

   
    
}
