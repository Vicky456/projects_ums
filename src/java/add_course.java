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
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author test
 */
@WebServlet(urlPatterns = {"/add_course"})
public class add_course extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        
        String col1=req.getParameter("name");
        String col1_1=req.getParameter("credits");
        int col2=Integer.parseInt(req.getParameter("dept"));
        int col3=Integer.parseInt(req.getParameter("sem"));
        String col4=req.getParameter("batch");
        String col5=req.getParameter("desc_");
        int col6=Integer.parseInt(req.getParameter("amount"));
        
        PreparedStatement preparedStatement;
         try{  
           
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                 
               
                String sql = "INSERT INTO course (course_code, name, creadit, desc_, sem, batch, dept_code, amount) VALUES (null,?,?,?,?,?,?,?);";
                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1, col1);
                preparedStatement.setString(2, col1_1);
                preparedStatement.setString(3, col5);
                preparedStatement.setInt(4, col3);
                preparedStatement.setString(5, col4);
                preparedStatement.setInt(6, col2);
                preparedStatement.setInt(7, col6);
                if(preparedStatement.executeUpdate()!=-1){
                    
                    
                    resp.sendRedirect("/projectums/admin/?mes=success");
                }
                
                con.close();  
                
        
       
       
       
       }catch(Exception e){System.err.println(e);}  
    }

    
 
}
