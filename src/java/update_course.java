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
@WebServlet(urlPatterns = {"/update_course"})
public class update_course extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        
        String col1=req.getParameter("name");
        String col2=req.getParameter("code_sub");
        int col3=Integer.parseInt(req.getParameter("year"));
        int col4=Integer.parseInt(req.getParameter("batch"));
        String col5=req.getParameter("desc_");
        int col6=Integer.parseInt(req.getParameter("id"));
        
        PreparedStatement preparedStatement;
         try{  
           
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ums","root","");  
                 
               
                String sql = "UPDATE course_tb SET name = ?,code = ?,year = ?,batch = ?,desc_ = ? WHERE id = ?;";
                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1, col1);
                preparedStatement.setString(2, col2);
                preparedStatement.setInt(3, col3);
                preparedStatement.setInt(4, col4);
                preparedStatement.setString(5, col5);
                preparedStatement.setInt(6, col6);
                if(preparedStatement.executeUpdate()!=-1){
                    
                    
                    resp.sendRedirect("/projectums/admin/?mes=success");
                }
                
                con.close();  
                
        
       
       
       
       }catch(Exception e){System.err.println(e);}  
    }

   
}
