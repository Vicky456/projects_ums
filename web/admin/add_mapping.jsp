

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
     
 <%
     String type=request.getParameter("type")!=null?request.getParameter("type"):"somthing";
     
     //out.print(type);
     if(type.equals("del")){
         
         try{  
                PreparedStatement preparedStatement;
                String id=request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                
                
                 
              String sql = "DELETE FROM staff WHERE id=?;";
                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, Integer.parseInt(id));
                if(preparedStatement.executeUpdate()!=-1){
                    
                    
                    response.sendRedirect("/projectums/admin/?mes=success");
                }
                
                
                con.close();  
        
       
       
       
       }catch(Exception e){System.out.println(e);}  
        
     }else if(type.equals("edit")){
          try{  
           
          String id=request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from staff_assign where id='"+id+"'");  
                
                 
                
                while(rs.next())
                {
 %>

     <div class="row">
    <div class="col-sm-8 offset-sm-2">
        <form ui-jp="parsley" novalidate="" action="/projectums/add_fact" method="post">
        <div class="box">
          <div class="box-header">
            <h2> Faculty Assign</h2>
          </div>
          <div class="box-body">
            <p class="text-muted">Please fill the information to continue</p>
            
            
            <div class="row m-b">
              
              <div class="col-sm-7">
                   <input type="hidden" name="id" value="<%= rs.getString(1)%>"/>
                   <input type="hidden" name="type" value="update"/>
                <label>Staff Name - staff id - Department</label>
               <select class="form-control" name="staff">
                    <option></option>
                    
                    <%  try{  
           
                 int selc=rs.getInt(2); 
                Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                Statement stmt1=con1.createStatement();  
                ResultSet rs1=stmt1.executeQuery("select s.id,s.name,d.name from staff s,dept d where s.dept_code=d.dept_code;");  
                
                 
                
                int i=1;
                while(rs1.next())
                {
                       if(i==selc){
                    %>
                    <option selected="" value="<%= rs1.getString(1)%>"><%= ""+rs1.getString(2)+" - "+rs1.getString(1)+" - "+rs1.getString(3)%></option>
                
                    <% }else{
                    %>
                     <option value="<%= rs1.getString(1)%>"><%= ""+rs1.getString(2)+" - "+rs1.getString(1)+" - "+rs1.getString(3)%></option>
                
                <%
                    }
                i++;
                
                 }con1.close();}catch(Exception e){out.println(e);}  %>
                </select>       
              </div> 
              
            </div>
            <div class="row m-b">
              
              <div class="col-sm-7">
                <label>course Name - course id - Department</label>
               <select class="form-control" name="course">
                    <option></option>
                    
                    <%  try{  
           
                int selc=rs.getInt(3);      
                Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                Statement stmt1=con1.createStatement();  
                ResultSet rs1=stmt1.executeQuery("select s.course_code,s.name,d.name from course s,dept d where s.dept_code=d.dept_code;");  
                
                 
                 int i=1;
                while(rs1.next())
                {
                       if(i==selc){
                    %>
                    <option selected="" value="<%= rs1.getString(1)%>"><%= ""+rs1.getString(2)+" - "+rs1.getString(1)+" - "+rs1.getString(3)%></option>
                
                    <% }else{
                    %>
                     <option value="<%= rs1.getString(1)%>"><%= ""+rs1.getString(2)+" - "+rs1.getString(1)+" - "+rs1.getString(3)%></option>
                
                <%
                    }
                i++;
                
                 }con1.close();}catch(Exception e){out.println(e);}  %>
                </select>       
              </div> 
              
            </div>
                
                <div class="row">
                    <div class="col-sm-5">
                <label>Batch</label>
                <select class="form-control" name="section" style="text-transform: uppercase">
                    <option></option>
                    <option selected="" value="<%= rs.getString(4)%>"><%= rs.getString(4)%></option>
                    <% String a="ABCD";
                        for(int i=0;i<a.length();i++){ %>
                        <option value="<%= a.charAt(i)%>"><%= a.charAt(i)%></option>
                    <% } %>
                </select>   
              </div>
                </div>
            
            
            <div class="checkbox">
                <br>
              <label class="ui-check">
                <input type="checkbox" name="check"  required data-parsley-multiple="check" data-parsley-id="15"><i></i> I agree to the <a href="#" class="text-info">Terms of Service</a>
              </label>
            </div>
          </div>
          <div class="dker p-a text-right">
            <button type="submit" class="btn info">Mapping update</button>
          </div>
        </div>
      </form>
    </div>
   
  </div>

 <%
      }
                
                    
                    
                
                
                con.close();  
        
       
       
       
       }catch(Exception e){out.println(e);}  
     }else{
 %>
 <div class="row">
    <div class="col-sm-8 offset-sm-2">
        <form ui-jp="parsley" novalidate="" action="/projectums/add_mapping" method="post">
        <div class="box">
          <div class="box-header">
            <h2> Faculty Assign</h2>
          </div>
          <div class="box-body">
            <p class="text-muted">Please fill the information to continue</p>
            
            
            <div class="row m-b">
              
              <div class="col-sm-7">
                   <input type="hidden" name="type" value="insert"/>
                <label>Staff Name - staff id - Department</label>
               <select class="form-control" name="staff">
                    <option></option>
                    
                    <%  try{  
           
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select s.id,s.name,d.name from staff s,dept d where s.dept_code=d.dept_code;");  
                
                 
                
                while(rs.next())
                { %>
                <option value="<%= rs.getString(1)%>"><%= ""+rs.getString(2)+" - "+rs.getString(1)+" - "+rs.getString(3)%></option>
                    <% }con.close();}catch(Exception e){out.println(e);}  %>
                </select>       
              </div> 
              
            </div>
            <div class="row m-b">
              
              <div class="col-sm-7">
                <label>course Name - course id - Department</label>
               <select class="form-control" name="course">
                    <option></option>
                    
                    <%  try{  
           
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select s.course_code,s.name,d.name from course s,dept d where s.dept_code=d.dept_code;");  
                
                 
                
                while(rs.next())
                { %>
                <option value="<%= rs.getString(1)%>"><%= ""+rs.getString(2)+" - "+rs.getString(1)+" - "+rs.getString(3)%></option>
                    
                <% }con.close();}catch(Exception e){out.println(e);}  %>
                </select>       
              </div> 
              
            </div>
                
                <div class="row">
                    <div class="col-sm-5">
                <label>Batch</label>
               <select class="form-control" name="section">
                    <option></option>
                    
                    <% String a="ABCD";
                        for(int i=0;i<a.length();i++){ %>
                        <option value="<%= a.charAt(i)%>"><%= a.charAt(i)%></option>
                    <% } %>
                </select>   
              </div>
                </div>
            
            
            <div class="checkbox">
                <br>
              <label class="ui-check">
                <input type="checkbox" name="check"  required data-parsley-multiple="check" data-parsley-id="15"><i></i> I agree to the <a href="#" class="text-info">Terms of Service</a>
              </label>
            </div>
          </div>
          <div class="dker p-a text-right">
            <button type="submit" class="btn info">Mapping</button>
          </div>
        </div>
      </form>
    </div>
   
  </div>
 <% }
     %>
 
 </div>

 </div>
<jsp:include page="fooder.jsp"></jsp:include>