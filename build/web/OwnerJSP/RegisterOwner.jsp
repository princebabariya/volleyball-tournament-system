<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="/Project/OwnerHTML/OwnerRegLog.html">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <%
  String name= request.getParameter("name"); 
  String middlename= request.getParameter("middlename"); 
  String surname= request.getParameter("surname"); 
  String username= request.getParameter("username"); 
  String password= request.getParameter("password"); 
  String mobileno= request.getParameter("mobileno"); 
  String email= request.getParameter("email"); 
  String address= request.getParameter("address"); 
  String sq1= request.getParameter("sq1"); 
  String sq2= request.getParameter("sq2");   
  
  try {
          
                        Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
                       Statement s=con.createStatement();
                       
               int i=s.executeUpdate("insert into regowners(name,middlename,surname,username,password,"
                       + "mobileno,email,address,sq1,sq2)values('"+name+"','"+middlename+"','"+surname+"','"+username+"',"
                               + "'"+password+"','"+mobileno+"','"+email+"','"+address+"','"+sq1+"','"+sq2+"')");
               
               %>
               <jsp:forward page="OwnerHome.jsp"/>

                               <%
                                   
      } 
  
  
                 
               
           catch (Exception e) {
          System.out.println(e);
          e.printStackTrace();
          
          
      }
  

                      


%>


        
    </body>
</html>
