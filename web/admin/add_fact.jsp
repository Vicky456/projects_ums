

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
     String type=request.getParameter("type");
     
     //out.print(type);
     if(type.equals("del")){
         
         try{  
                PreparedStatement preparedStatement;
                String id=request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ums","root","");  
                
                
                 
              String sql = "DELETE FROM faculty_tb WHERE id=?;";
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
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ums","root","");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from faculty_tb where id='"+id+"'");  
                
                 
                
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
            <input type="hidden" value="<%= rs.getString(1)%>" name="id">
            <div class="form-group">
              <label>Name</label>
              <input type="text" class="form-control" required="" name="name" value="<%= rs.getString(2)%>">                        
            </div>
            
            <div class="row m-b">
              <div class="col-sm-6">
                <label>Faculty ID</label>
                <input type="hidden" name="code_sub"   value="<%= rs.getString(3)%>" />
                <input type="text" class="form-control" disabled="" required=""   value="<%= rs.getString(3)%>">   
              </div>
              <div class="col-sm-4">
                <label>Department</label>
                <select class="form-control" name="dept">
                    <option value="<%= rs.getString(4)%>"><%= rs.getString(4)%></option>
                    <option value="1">CSE</option>
                    <option value="2">IT</option>
                </select>      
              </div> 
              
            </div>
            <div class="form-group">
              <label>Email</label>
              <input type="email" class="form-control" required="" name="email" value="<%= rs.getString(5)%>">
            </div>
            <div class="form-group">
              <label>Contact</label>
              <input type="number" class="form-control" placeholder="+XX XXXXX XXXXX" required="" name="phone" value="<%= rs.getString(6)%>">
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
              <label>Name</label>
              <input type="text" class="form-control" required="" name="name" >                        
            </div>
            
            <div class="row m-b">
              <div class="col-sm-6">
                <label>Faculty ID</label>
                <input type="hidden" name="code_sub"   value="CSE004" />
                <input type="text" class="form-control" disabled="" required=""   value="CSE004">   
              </div>
              <div class="col-sm-4">
                <label>Department</label>
                <select class="form-control" name="dept">
                    <option></option>
                    <option value="1">CSE</option>
                    <option value="2">IT</option>
                </select>      
              </div> 
              
            </div>
            <div class="form-group">
              <label>Email</label>
              <input type="email" class="form-control" required="" name="email">
            </div>
            <div class="form-group">
              <label>Contact</label>
              <input type="number" class="form-control" placeholder="+XX XXXXX XXXXX" required="" name="phone">
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