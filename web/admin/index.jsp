

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<jsp:include page="header.jsp"></jsp:include>

<div class="alert">
     
</div>

<%
 Class.forName("com.mysql.jdbc.Driver");  
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","");      
try{
%>
 <div class="padding">

     <div class="row">
         <div class="col-md-4">
             <div class="center-block" style="text-align:  center;padding-top: 15px;">
                 <div class="box" style="padding-top: 10px;">
                     
                 
                 <h5>Student's in school</h5>
             
             
             <%
             Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select count(id) from student;");  
                
                 
                
                if(rs.next())
                {
                    out.print("<h1 style='margin-top: 5px;padding-bottom: 5px;'>"+rs.getString(1)+"</h1>");
                }
                    
             %>
             </div><div class="box" style="padding-top: 10px;">
             <h5>Staff's in school</h5>
             
             
             <%
              stmt=con.createStatement();  
                 rs=stmt.executeQuery("select count(id) from staff;");  
                
                 
                
                if(rs.next())
                {
                    out.print("<h1 style='margin-top: 5px;padding-bottom: 5px;'>"+rs.getString(1)+"</h1>");
                }
                    
             %>
             </div><div class="box" style="padding-top: 10px;">
             <h5>Department's in school</h5>
             
             
             <%
              stmt=con.createStatement();  
                 rs=stmt.executeQuery("select count(dept_code) from dept;");  
                
                 
                
                if(rs.next())
                {
                    out.print("<h1 style='margin-top: 5px;padding-bottom: 5px;'>"+rs.getString(1)+"</h1>");
                }
                    
             %>
             </div>
             </div>
         </div>
             
             <div class="col-md-8 box" >
                 <div class="box-header">
                     <h5>Departments</h5>
                     
                 </div>
                 <div class="box-body">
                     <table class="table m-b-none default" >
                            <thead>
                              <tr>
                                  <th >
                                      Departments Name
                                  </th>
                                  <th>
                                      Students count(male)
                                  </th>
                                  <th>
                                      Students count(female)
                                  </th>
                                  <th>
                                      Total
                                  </th>
                                  
                              </tr>
                            </thead>
                            
                            <tbody>
                                <%
                                    int cou=0,cou_d=0;
                                     stmt=con.createStatement();  
                                    rs=stmt.executeQuery("select d.name,count(case when s.gender='female' then 1 end) 'female',count(case when s.gender='male' then 1 end) 'male',count(id)  from student s join dept d on d.dept_code=s.dept_code group by s.dept_code;");  
                
                 
                
                                    while(rs.next())
                                    {
                                       %>
                                       
                                       <tr>
                                           <td><%= rs.getString(1)%></td>
                                           <td><%= rs.getString(2)%></td>
                                           <td><%= rs.getString(3)%></td>
                                           <td><%= rs.getString(4)%></td>
                                       </tr>
                                       
                                       <%
                                           cou+=Integer.parseInt(rs.getString(4));
                                           cou_d++;
                                    }
                                    
                                    %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>
                                         Students is <%= cou%>
                                    </th>
                                    <th>
                                         Departments is <%= cou_d%>
                                    </th>
                                </tr>
                            </tfoot>
                     </table>
                 </div>
                 
             </div>    
     </div>
                                    <div class="row">
                                        <div class="col-md-6 box">
                 <div class="box-header">
                     <h5>Total staff working . How many in each Departments . </h5>
                     
                 </div>
                 <div class="box-body">
                     <table class="table m-b-none default" >
                            <thead>
                              <tr>
                                  <th >
                                      Departments Name
                                  </th>
                                  <th>
                                      Staff count(male)
                                  </th>
                                  <th>
                                      Staff count(female)
                                  </th>
                                  <th>
                                      Total
                                  </th>
                                  
                              </tr>
                            </thead>
                            
                            <tbody>
                                <%
                                     cou=0;
                                     cou_d=0;
                                     stmt=con.createStatement();  
                                    rs=stmt.executeQuery("select d.name,count(case when s.gender='female' then 1 end) 'female',count(case when s.gender='male' then 1 end) 'male',count(s.id)  from staff s join dept d on d.dept_code=s.dept_code group by s.dept_code;");  
                
                 
                
                                    while(rs.next())
                                    {
                                       %>
                                       
                                       <tr>
                                           <td><%= rs.getString(1)%></td>
                                           <td><%= rs.getString(2)%></td>
                                           <td><%= rs.getString(3)%></td>
                                           <td><%= rs.getString(4)%></td>
                                       </tr>
                                       
                                       <%
                                           cou+=Integer.parseInt(rs.getString(4));
                                           cou_d++;
                                    }
                                    
                                    %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>
                                         Staffs is <%= cou%>
                                    </th>
                                    <th>
                                         Departments is <%= cou_d%>
                                    </th>
                                </tr>
                            </tfoot>
                     </table>
                 </div>
                 
             </div> 
                                    
                                    <div class="col-md-5 ">
                 
                 <div class="box">
                     <table class="table m-b-none default" >
                            <thead>
                              <tr>
                                  <th >
                                      Departments Name
                                  </th>
                                  <th>
                                      section
                                  </th>
                                  
                                  <th>
                                      Total
                                  </th>
                                  
                              </tr>
                            </thead>
                            
                            <tbody>
                                <%
                                    
                                     stmt=con.createStatement();  
                                    rs=stmt.executeQuery("select d.alname,s.section,count(s.id) from student s join dept d on s.dept_code=d.dept_code group by s.section,s.dept_code;");  
                
                 
                
                                    while(rs.next())
                                    {
                                       %>
                                       
                                       <tr>
                                           <td><%= rs.getString(1)%></td>
                                           <td><%= rs.getString(2)%></td>
                                           <td><%= rs.getString(3)%></td>
                                           
                                       </tr>
                                       
                                       <%
                                           
                                    }
                                    
                                    %>
                            </tbody>
                            
                     </table>
                 </div>
                 
             </div> 
                                    </div>
                            
                            
                            
                            
                            <div class="row">
                                <div class="col-md-5 ">
                                     <div class="box-header">
                     <h5>Subjects studied by a first year students  </h5>
                     
                 </div>
                 
                 <div class="box">
                     <table class="table m-b-none default" >
                            <thead>
                              <tr>
                                  <th >
                                      Departments Name
                                  </th>
                                  <th>
                                      subject
                                  </th>
                                  
                                
                                  
                              </tr>
                            </thead>
                            
                            <tbody>
                                <%
                                    
                                     stmt=con.createStatement();  
                                    rs=stmt.executeQuery("select d.alname,c.name from course c join dept d on c.dept_code=d.dept_code where c.sem=1 or c.sem=2;");  
                
                 
                
                                    while(rs.next())
                                    {
                                       %>
                                       
                                       <tr>
                                           <td><%= rs.getString(1)%></td>
                                           <td><%= rs.getString(2)%></td>
                                           
                                           
                                       </tr>
                                       
                                       <%
                                           
                                    }
                                    
                                    %>
                            </tbody>
                            
                     </table>
                 </div>
                 
             </div> 
                            
                            <div class="col-md-4 ">
                                     <div class="box-header">
                     <h5>Teachers handling more than 4 subjects  </h5>
                     
                 </div>
                 
                 <div class="box">
                     <table class="table m-b-none default" >
                            <thead>
                              <tr>
                                  <th >
                                      Staff Name
                                  </th>
                                  <th>
                                      subject
                                  </th>
                                  
                                
                                  
                              </tr>
                            </thead>
                            
                            <tbody>
                                <%
                                    
                                     stmt=con.createStatement();  
                                    rs=stmt.executeQuery("select s.name,c.name,count(c.name) as co from staff_assign ss,staff s,course c where ss.staff_id=s.id and c.course_code=ss.course_code group by s.name;");  
                
                 
                
                                    while(rs.next())
                                    {
                                        if(Integer.parseInt(rs.getString(3))>3){
                                       %>
                                       
                                       <tr>
                                           <td><%= rs.getString(1)%></td>
                                           <td><%= rs.getString(2)%></td>
                                           
                                           
                                       </tr>
                                       
                                       <%
                                           
                                    }
                                    }
                                    
                                    %>
                            </tbody>
                            
                     </table>
                 </div>
                 
             </div> 
                            </div>
                            
                            <div class="row">
                                <div class="col-md-12 ">
                                     <div class="box-header">
                                         <h5 style="text-align: center">Top students in each class and Departments topper  </h5>
                     
                 </div>
                 
                 <div class="box">
                     <table class="table m-b-none default" >
                            <thead>
                              <tr>
                                  <th >
                                      Rollno
                                  </th>
                                  <th>
                                      name
                                  </th> 
                                  <th>
                                      Department
                                  </th>
                                  <th>
                                      Course
                                  </th>
                                  <th>
                                      section
                                  </th>
                                  <th>
                                      Sem
                                  </th>
                                  <th>
                                      Batch
                                  </th>
                                  <th>
                                      Mark
                                  </th>
                                  <th>
                                      Creadit 
                                  </th>
                                      
                                  
                                
                                  
                              </tr>
                            </thead>
                            
                            <tbody>
                                <%
                                    
                                     stmt=con.createStatement();  
                                    rs=stmt.executeQuery("select s.id,s.name,c.name,d.name,s.section,c.sem,c.batch,max(r.mark),c.creadit from result r,student s,course c,dept d where s.id=r.rollno and c.course_code=r.course_code and d.dept_code=c.dept_code group by c.sem,s.section,d.dept_code,c.course_code;");  
                
                 
                
                                    while(rs.next())
                                    {
                                        
                                       %>
                                       
                                       <tr>
                                           <td><%= rs.getString(1)%></td>
                                           <td><%= rs.getString(2)%></td>
                                           <td><%= rs.getString(3)%></td>
                                           <td><%= rs.getString(4)%></td>
                                           <td><%= rs.getString(5)%></td>
                                           <td><%= rs.getString(6)%></td>
                                           <td><%= rs.getString(7)%></td>
                                           <td><%= rs.getString(8)%></td>
                                           <td><%= rs.getString(9)%></td>
                                           
                                           
                                       </tr>
                                       
                                       <%
                                           
                                    
                                    }
                                    
                                    %>
                            </tbody>
                            
                     </table>
                 </div>
                 
             </div>
                            </div>
                            
                             <div class="row">
                                <div class="col-md-5 ">
                                     <div class="box-header">
                                         <h5 style="text-align: center">Topper in each subject for a particular year  </h5>
                     
                 </div>
                 
                 <div class="box">
                     <table class="table m-b-none default" >
                            <thead>
                              <tr>
                                  <th>
                                      Course
                                  </th>
                                  
                                  <th>
                                      Department
                                  </th>
                                 
                                  <th>
                                      Sem
                                  </th>
                                  
                                  <th>
                                      Mark
                                  </th>

                                      
                                  
                                
                                  
                              </tr>
                            </thead>
                            
                            <tbody>
                                <%
                                    
                                     stmt=con.createStatement();  
                                    rs=stmt.executeQuery("select c.name,d.alname,c.sem,max(r.mark) from result r,student s,course c,dept d where s.id=r.rollno and c.course_code=r.course_code and d.dept_code=c.dept_code group by c.name;");  
                
                 
                
                                    while(rs.next())
                                    {
                                        
                                       %>
                                       
                                       <tr>
                                           <td><%= rs.getString(1)%></td>
                                           <td><%= rs.getString(2)%></td>
                                           <td><%= rs.getString(3)%></td>
                                           <td><%= rs.getString(4)%></td>
                                           
                                           
                                           
                                       </tr>
                                       
                                       <%
                                           
                                    
                                    }
                                    
                                    %>
                            </tbody>
                            
                     </table>
                 </div>
                 
             </div>
                            </div>

 </div>
<%
}catch(Exception e){
System.out.println(""+e);
}    
con.close();
%>
<jsp:include page="fooder.jsp"></jsp:include>