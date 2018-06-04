

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"></jsp:include>
 <div ui-view="" class="app-body" id="view">

      <div class="p-a white lt box-shadow">
        <div class="row">
          <div class="col-sm-6">
            <h4 class="m-b-0 _300">View Course Portal</h4>
           <!-- <small class="text-muted">university management system</small>-->
          </div>

        </div>
      </div>
 <div class="padding">

      <div class="row">
    
         
     <%
         
      try{  
           
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ums","root","");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from course_tb");  
                
                 
                
                while(rs.next())
                {
                    out.print("<div class='col-sm-3'><div class='box'>"+
                
                "<div class='box-body'>"+
                    "<samp style='float:  right;color: #ff00e7'>"+rs.getString(1)+"</samp>"+
                    "<h3>"+rs.getString(2)+"</h3>"+
                  
                    "<h5>"+rs.getString(3)+"</h5>"+
                    "<p>"+rs.getString(6)+"</p>"+
                "</div>"+
                
                "<div class='box-footer' style='float:  right;'>"+
                    "Year <a class='text-blue'>"+rs.getString(4)+"</a>"+
                    " Batch <a class='text-blue'>"+rs.getString(5)+"</a>"+
                "</div>"+
            "</div></div>");
                }
                
                    
                    
                
                
                con.close();  
        
       
       
       
       }catch(Exception e){out.println(e);}  
     %>
            
   
     </div>

 </div>

 </div>
<jsp:include page="fooder.jsp"></jsp:include>