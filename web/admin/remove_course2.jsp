

<%@page import="java.sql.PreparedStatement"%>
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
                PreparedStatement preparedStatement;
                String id=request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ums","root","");  
                
                
                 
              String sql = "DELETE FROM course_tb WHERE id=?;";
                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, Integer.parseInt(id));
                if(preparedStatement.executeUpdate()!=-1){
                    
                    
                    response.sendRedirect("/projectums/admin/?mes=success");
                }
                
                
                con.close();  
        
       
       
       
       }catch(Exception e){System.out.println(e);}  
     %>
      </form>
    </div>
   
  </div>

 </div>

 </div>
<jsp:include page="fooder.jsp"></jsp:include>