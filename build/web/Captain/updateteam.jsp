<%-- 
    Document   : updateteam
    Created on : 13 Mar, 2022, 2:30:09 PM
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
       String username= request.getParameter("username");

    String name= request.getParameter("name");
    String teamname= "asd";
     try {
                                Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
    						String query= "Update regplayers set teamname=? where name=?";
    						PreparedStatement ps= con.prepareStatement(query);
    						
                                                ps.setString(1,teamname);
    						ps.setString(2,name);
    						ps.executeUpdate();
    						
    						%>
                                                
                                                <jsp:forward page="CaptainHome.jsp"/>
                                                
    				<%
                                   
      } 
  
  
                 
               
           catch (Exception e) {
          System.out.println(e);
          e.printStackTrace();
          
          
      }
  

                      


%>		

    </body>
</html>
