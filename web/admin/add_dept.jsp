

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
                ResultSet rs=stmt.executeQuery("select * from dept where dept_code='"+id+"'");  
                
                 
                
                while(rs.next())
                {
 %>

     <div class="row">
    <div class="col-sm-8 offset-sm-2">
        <form ui-jp="parsley" novalidate="" action="/projectums/add_fact" method="post">
        <div class="box">
          <div class="box-header">
            <h2> Department Assign</h2>
          </div>
          <div class="box-body">
            <p class="text-muted">Please fill the information to continue</p>
            
            
            
                   <input type="hidden" name="id" value="<%= rs.getString(1)%>"/>
                   <input type="hidden" name="type" value="update"/>
               <div class="row m-b">
              
              <div class="col-sm-7">
                <label>Department Name</label>
                <input type="text" class="form-control" name="dept" value="<%= rs.getString(2)%>">
                        
              </div> 
              
            </div>
            
            <div class="row m-b">
              
              <div class="col-sm-7">
                <label>Department alName</label>
                <input type="text" class="form-control" name="aldept" value="<%= rs.getString(3)%>">
                        
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
            <button type="submit" class="btn info"> update</button>
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
        <form ui-jp="parsley" novalidate="" action="/projectums/add_dept" method="post">
        <div class="box">
          <div class="box-header">
            <h2> Department Assign</h2>
          </div>
          <div class="box-body">
            <p class="text-muted">Please fill the information to continue</p>
            <input type="hidden" name="type" value="insert"/>
            
            
            <div class="row m-b">
              
              <div class="col-sm-7">
                <label>Department Name</label>
                <input type="text" class="form-control" name="dept">
                        
              </div> 
              
            </div>
            
            <div class="row m-b">
              
              <div class="col-sm-7">
                <label>Department alName</label>
                <input type="text" class="form-control" name="aldept">
                        
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
            <button type="submit" class="btn info">save</button>
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