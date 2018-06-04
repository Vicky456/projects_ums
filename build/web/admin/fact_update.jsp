
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"></jsp:include>
 <div ui-view="" class="app-body" id="view">

      <div class="p-a white lt box-shadow">
        <div class="row">
            <div class="col-sm-1">
                <a class="nav-link" href="add_fact.jsp" >
                    <i class="fa fa-fw fa-plus text-muted"></i>
                    <span>New</span>
                  </a>
            </div>
          <div class="col-sm-6">
            <h4 class="m-b-0 _300">Faculty update Portal</h4>
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
      <table class="table m-b-none default footable-loaded footable" ui-jp="footable" data-filter="#filter" data-page-size="5">
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
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ums","root","");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from faculty_tb");  
                
                 
                
                while(rs.next())
                {
                    %>
                     <tr >
                        
                        <td ><%= rs.getString(2)%></td>
                        <td ><%= rs.getString(3)%></td>
                        <td ><%= rs.getString(4)%></td>
                        <td ><%= rs.getString(5)%></td>
                        
                        <td ><a class="label success" href="add_fact.jsp?type=edit&id=<%= rs.getString(1)%>" title="Active">Edit</a></td>
                        <td ><a class="label red" href="add_fact.jsp?type=del&id=<%= rs.getString(1)%>" title="Active">Remove</a></td>
                    </tr>
                    <%
                }
                
                    
                    
                
                
                con.close();  
        
       
       
       
       }catch(Exception e){System.out.println(e);}  
     %>
         
          
        </tbody>
        
      </table>
    </div>
  </div>

 </div>

 </div>
<jsp:include page="fooder.jsp"></jsp:include>