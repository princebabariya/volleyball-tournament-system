<%-- 
    Document   : selectteam
    Created on : 26 Feb, 2022, 3:15:08 PM
    Author     : Prince babariya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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
  String teamname= request.getParameter("teamname"); 
        String user= request.getParameter("username");

  try {
                       Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
                       String query= "Update regplayers set teamname=? where username=?";
                       
    						PreparedStatement ps= con.prepareStatement(query);
                                                ps.setString(1,teamname);
    						ps.setString(2,user);						
    						ps.executeUpdate();		
    						ResultSet rs= ps.getResultSet();
               
               %>
               <jsp:forward page="PlayerHome.jsp"/>

                               <%
                                   
      } 
  
  
                 
               
           catch (Exception e) {
          System.out.println(e);
          e.printStackTrace();
          
          
      }
  

                      


%>
    </body>
</html>
