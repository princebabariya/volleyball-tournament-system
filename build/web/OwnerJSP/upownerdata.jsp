<%-- 
    Document   : upplayerdata
    Created on : 7 Mar, 2022, 1:24:12 PM
    Author     : Prince babariya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
    
    String name= request.getParameter("name"); 
  String middlename= request.getParameter("middlename"); 
  String surname= request.getParameter("surname"); 
  String password= request.getParameter("password"); 
  String mobileno= request.getParameter("mobileno"); 
  String email= request.getParameter("email"); 
  String address= request.getParameter("address"); 
  String sq1= request.getParameter("sq1"); 
  String sq2= request.getParameter("sq2"); 
  String user= request.getParameter("username"); 

  
    Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
    						String query= "UPDATE regowners SET name=?, middlename=?, surname=?, password=?, email=?, address=?, sq1=?, sq2=?, mobileno=? WHERE username=? ";
    						PreparedStatement ps= con.prepareStatement(query);
    						
                                                ps.setString(1,name);
                                                ps.setString(2,middlename);
                                                ps.setString(3,surname);
                                                ps.setString(4,password);
                                                ps.setString(5,email);
                                                ps.setString(6,address);
                                                ps.setString(7,sq1);
                                                ps.setString(8,sq2);
                                                ps.setString(9,mobileno);
                                                ps.setString(10,user);

    						
    						ps.executeUpdate();
    						
    						ResultSet rs= ps.getResultSet();
    						%>
                                                
                                                <jsp:forward page="OwnerHome.jsp"/>
    				
        
        
    </body>
</html>
