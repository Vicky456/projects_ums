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
        String col2=req.getParameter("gender");
        int col3=Integer.parseInt(req.getParameter("dept"));
        
        String col4=req.getParameter("email");
        String col5=req.getParameter("address");
        String col6=req.getParameter("sal");
        
        PreparedStatement preparedStatement;
         try{  
           
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                String sql ;
                boolean ck=false;
               if(req.getParameter("type").equalsIgnoreCase("insert")){
                 sql= "INSERT INTO staff (id, name, dept_code, email, address, gender, sal) VALUES (null, ?, ?, ?, ?, ?, ?);";
               }else{
                   sql= "UPDATE staff SET name = ?,dept_code = ?,email = ?,address = ?,gender = ?,sal =? WHERE id=?;";
                   ck=true;
               }
               preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1, col1);
                preparedStatement.setInt(2, col3);
                preparedStatement.setString(3, col4);
                preparedStatement.setString(4, col5);
                preparedStatement.setString(5, col2);
                preparedStatement.setString(6, col6);
                if(ck)
                preparedStatement.setInt(7, Integer.parseInt(req.getParameter("id")));
                if(preparedStatement.executeUpdate()!=-1){
                    
                    
                    resp.sendRedirect("/projectums/admin/?mes=success");
                }
                
                con.close();  
                
        
       
       
       
       }catch(Exception e){System.err.println(e);}  
    }

   
    
}
