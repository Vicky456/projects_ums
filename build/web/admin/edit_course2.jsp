

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"></jsp:include>
 <div ui-view="" class="app-body" id="view">

      <div class="p-a white lt box-shadow">
        <div class="row">
          <div class="col-sm-6">
            <h4 class="m-b-0 _300">Register Course Portal</h4>
           <!-- <small class="text-muted">university management system</small>-->
          </div>

        </div>
      </div>
 <div class="padding">

     <div class="row">
    <div class="col-sm-8 offset-sm-2">
        <form ui-jp="parsley" novalidate="" action="/projectums/update_course" method="post">
            
                   <%
         
      try{  
           
          String id=request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from course where course_code='"+id+"'");  
                
                 
                
                while(rs.next())
                {
                    %>
        
                    <div class="box">
          <div class="box-header">
            <h2>Register course</h2>
          </div>
          <div class="box-body">
            <p class="text-muted">Please fill the information to continue</p>
            
            <div class="row m-b">
                <div class="col-sm-8">
                    <input type="hidden" value="<%= rs.getString(1)%>" name="id" />
                    <label>Name of course</label>
                    <input type="text" class="form-control" required="" value="<%= rs.getString(2)%>" name="name">                        
                </div>
                <div class="col-sm-4">
           
                    <label>Credits</label>
                    <input type="number" class="form-control" required="" value="<%= rs.getString(3)%>" name="credits">                        
                </div>
            </div>
            
            <div class="row m-b">
             
              <div class="col-sm-3">
                <label>sem</label>
                <select class="form-control" name="sem">
                    <option></option>
                    
                    <option selected="" value="<%= rs.getString(5)%>"><%= rs.getString(5)%></option>
                    <option value="1">I</option>
                    <option value="2">II</option>
                    <option value="3">III</option>
                    <option value="4">IV</option>
                    <option value="5">V</option>
                    <option value="6">VI</option>
                    <option value="7">VII</option>
                    <option value="8">VIII</option>
                </select>      
              </div> 
              <div class="col-sm-3">
                <label>Batch</label>
               <select class="form-control" name="batch">
                    <option></option>
                                        
                    <option selected="" value="<%= rs.getString(6)%>"><%= rs.getString(6)%></option>
                    <% for(int i=10;i<=20;i++){ %>
                    <option value="<%= i+"-"+(i+4)%>"><%= i+"-"+(i+4)%></option>
                    <% } %>
                </select>   
              </div>
                <div class="col-sm-6">
                <label>Department</label>
               <select class="form-control" name="dept">
                    <option></option>
                    
                    <%  try{  
           
                int selc=rs.getInt("dept_code");
                Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                Statement stmt1=con1.createStatement();  
                ResultSet rs1=stmt1.executeQuery("select * from dept;");  
                
                 
                int i=1;
                while(rs1.next())
                { 
                    if(i==selc){
                    %>
                    <option selected="" value="<%= rs1.getString(1)%>"><%= rs1.getString(2)%></option>
                    <% }else{
                    %>
                     <option value="<%= rs1.getString(1)%>"><%= rs1.getString(2)%></option>
                <%
                    }i++;}con1.close();}catch(Exception e){out.println(e);}  %>
                </select>   
              </div>
            </div>
            <div class="form-group">
              <label>Description</label>
              <textarea class="form-control" required="" name="desc_"><%= rs.getString(4)%></textarea>
            </div>
            <div class="row m-b">
                <div class="col-sm-8">
           
                    <label>amount course</label>
                    <input type="number" value="<%= rs.getString(8)%>" class="form-control" required="" name="amount">                        
                </div>
               
            </div>
            <div class="checkbox">
              <label class="ui-check">
                <input type="checkbox" name="check"  required="true" data-parsley-multiple="check" data-parsley-id="15"><i></i> I agree to the <a href="#" class="text-info">Terms of Service</a>
              </label>
            </div>
          </div>
          <div class="dker p-a text-right">
            <button type="submit" class="btn info">Update</button>
          </div>
        </div>
        
        <%
                }
                
                    
                    
                
                
                con.close();  
        
       
       
       
       }catch(Exception e){out.println(e);}  
     %>
      </form>
    </div>
   
  </div>

 </div>

 </div>
<jsp:include page="fooder.jsp"></jsp:include>