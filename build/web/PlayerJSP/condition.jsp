<%-- 
    Document   : newjsp
    Created on : 4 Mar, 2022, 10:24:51 AM
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
              String user= request.getParameter("username");
              String pass= request.getParameter("password"); 
              String iscaptain="Captain";
              

    			Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
    						String query= "select * from regplayers where username=? and password=? and iscaptain=?";
    						PreparedStatement ps= con.prepareStatement(query);
    						
    						ps.setString(1,user);
    						ps.setString(2,pass);
                                                ps.setString(3,iscaptain);

    						ps.execute();
    						
    						ResultSet rs= ps.getResultSet();
    						
    						if (rs.next()== true)
    						{
    						%>
                                                <jsp:forward page="/Captain/CaptainHome.jsp"/>
    						<%
    						}
    						else
    						{
    						 %>
                                                 <jsp:forward page="PlayerHome.jsp"/>
    						 <%
    						 }
    						  %>

        
        %>
        
    </body>
</html>
