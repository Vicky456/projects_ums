
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"></jsp:include>
 <div ui-view="" class="app-body" id="view">

     
 <div class="p-a white lt box-shadow">
      
      <div class="p-a white lt box-shadow">
          <div class="col-sm-1">
                <a class="nav-link" href="add_fact.jsp" >
                    <i class="fa fa-fw fa-plus text-muted"></i>
                    <span>New</span>
                  </a>
            </div>
        <div class="row">
          <div class="col-sm-6">
            <h4 class="m-b-0 _300">View Faculty Portal</h4>
           <!-- <small class="text-muted">university management system</small>-->
          </div>

        </div>
      </div>
 <div class="padding">

   <div class="box">
    <div class="box-header">
      <h2>Faculty View</h2>
      
    </div>
    
    <div>
      <table class="table " ui-jp="footable" data-filter="#filter" data-page-size="5">
           <%
         
      try{  
           
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select s.*,d.name from staff s,dept d where d.dept_code=s.dept_code");  
                
                 %>
        <thead>
          <tr>
              
              <%
              ResultSetMetaData md = rs.getMetaData();
                for (int i=1; i<=md.getColumnCount(); i++)
                {
                    //out.println("<th>"+md.getColumnLabel(i)+"</th>");
                }
              %>
             
             
          </tr>
          <tr>
              
              <th>id</th>
<th>name</th>
<th>Department's</th>
<th>Email</th>
<th>Address</th>
<th>Gender</th>
<th>sal</th>

             
             
          </tr>
        </thead>
        <tbody>
            
            
             <%
                
                while(rs.next())
                {
                    %>
                     <tr >
                        
                        <td ><%= rs.getString(1)%></td>
                        <td ><%= rs.getString(2)%></td>
                        <td ><%= rs.getString(8)%></td>
                        <td ><%= rs.getString(4)%></td>
                        <td ><%= rs.getString(5)%></td>
                        <td ><%= rs.getString(6)%></td>
                        <td ><%= rs.getString(7)%></td>
                        
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

