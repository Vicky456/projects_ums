
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

   <div class="box">
    <div class="box-header">
      <h2>Course edit</h2>
      
    </div>
    
    <div>
      <table class="table   table-active col-sm-12" >
        <thead>
          <tr>
              <th data-toggle="true" class="footable-visible footable-first-column footable-sortable">
                  Course Name
              <span class="footable-sort-indicator"></span></th>
              <th class="footable-visible footable-sortable">
                  Course code
              <span class="footable-sort-indicator"></span></th>
              <th data-hide="phone,tablet" class="footable-visible footable-sortable">
                  Year
              <span class="footable-sort-indicator"></span></th>
              <th data-hide="phone,tablet" data-name="Date Of Birth" class="footable-visible footable-sortable">
                  batch
              <span class="footable-sort-indicator"></span></th>
             
          </tr>
        </thead>
        <tbody>
            
             <%
         
      try{  
           
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from course;");  
                
                 
                
                while(rs.next())
                {
                    %>
                     <tr >
                        
                        <td ><%= rs.getString(1)%></td>
                        <td ><%= rs.getString(2)%></td>
                        <td ><%= rs.getString(3)%></td>
                        <td ><%= rs.getString(6)%></td>
                        <td ><a class="label success" href="remove_course2.jsp?id=<%= rs.getString(1)%>" title="Active">Remove</a></td>
                        
                    </tr>
                    <%
                }
                
                    
                    
                
                
                con.close();  
        
       
       
       
       }catch(Exception e){out.println(e);}  
     %>
         
          
        </tbody>
        
      </table>
    </div>
  </div>

 </div>

 </div>
<jsp:include page="fooder.jsp"></jsp:include>