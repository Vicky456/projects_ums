

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
                ResultSet rs=stmt.executeQuery("select * from staff where id='"+id+"'");  
                
                 
                
                while(rs.next())
                {
 %>

     <div class="row">
    <div class="col-sm-8 offset-sm-2">
        <form ui-jp="parsley" novalidate="" action="/projectums/add_fact" method="post">
        <div class="box">
          <div class="box-header">
            <h2>Register Faculty</h2>
          </div>
          <div class="box-body">
            <p class="text-muted">Please fill the information to continue</p>
            
            <div class="form-group">
                <input type="hidden" name="type" value="update"/>
                <input type="hidden" name="id" value="<%= rs.getString(1)%>"/>
              <label>Name</label>
              <input type="text" class="form-control" required="" name="name" value="<%= rs.getString(2)%>">                        
            </div>
            
            <div class="row m-b">
              
              <div class="col-sm-7">
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
                    }
                i++;
                }con1.close();}catch(Exception e){out.println(e);}  %>
                </select>       
              </div> 
              
            </div>
            <div class="form-group">
              <label>Gender</label>
              <div class="radio"><label><input type="radio" value="male" <%= rs.getString(6).equalsIgnoreCase("male")?"checked=''":""%>   name="gender"> Male</label>   <label>  <input type="radio" value="female" <%= rs.getString(6).equalsIgnoreCase("female")?"checked=''":""%>  name="gender"> Female</label></div>
              
              
            </div>
            <div class="form-group">
              <label>Email</label>
              <input type="email" class="form-control" required="" name="email" value="<%= rs.getString(4)%>">
            </div>
            
            <div class="form-group">
              <label>Address</label>
              <textarea class="form-control" required name="address"><%= rs.getString(5)%></textarea>
            </div>
            <div class="row m-b">
            <div class="form-group col-sm-4">
              <label>Sal</label>
              <input type="number" class="form-control" required="" name="sal" value="<%= rs.getString(7)%>">
            </div>
            </div>
            
            <div class="checkbox">
              <label class="ui-check">
                <input type="checkbox" name="check" checked="" required="true" data-parsley-multiple="check" data-parsley-id="15"><i></i> I agree to the <a href="#" class="text-info">Terms of Service</a>
              </label>
            </div>
          </div>
          <div class="dker p-a text-right">
            <button type="submit" class="btn info">update</button>
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
        <form ui-jp="parsley" novalidate="" action="/projectums/add_fact" method="post">
        <div class="box">
          <div class="box-header">
            <h2>Register Faculty</h2>
          </div>
          <div class="box-body">
            <p class="text-muted">Please fill the information to continue</p>
            
            <div class="form-group">
                <input type="hidden" name="type" value="insert"/>
              <label>Name</label>
              <input type="text" class="form-control" required="" name="name" >                        
            </div>
            
            <div class="row m-b">
              
              <div class="col-sm-7">
                <label>Department</label>
               <select class="form-control" name="dept">
                    <option></option>
                    
                    <%  try{  
           
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from dept;");  
                
                 
                
                while(rs.next())
                { %>
                <option value="<%= rs.getString(1)%>"><%= rs.getString(2)%></option>
                    <% }con.close();}catch(Exception e){out.println(e);}  %>
                </select>       
              </div> 
              
            </div>
            <div class="form-group">
              <label>Gender</label>
              <div class="radio"><label><input type="radio" value="male" checked="checked" name="gender"> Male</label>   <label>  <input type="radio" value="female" checked="checked" name="gender"> Female</label></div>
              
              
            </div>
            <div class="form-group">
              <label>Email</label>
              <input type="email" class="form-control" required="" name="email">
            </div>
            
            <div class="form-group">
              <label>Address</label>
              <textarea class="form-control" required name="address"></textarea>
            </div>
            <div class="row m-b">
            <div class="form-group col-sm-4">
              <label>Sal</label>
              <input type="number" class="form-control" required="" name="sal">
            </div>
            </div>
            
            <div class="checkbox">
              <label class="ui-check">
                <input type="checkbox" name="check" checked="" required="true" data-parsley-multiple="check" data-parsley-id="15"><i></i> I agree to the <a href="#" class="text-info">Terms of Service</a>
              </label>
            </div>
          </div>
          <div class="dker p-a text-right">
            <button type="submit" class="btn info">Save</button>
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