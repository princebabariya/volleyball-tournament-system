<%-- 
    Document   : ResetPassTutor
    Created on : 18 Feb, 2022, 11:36:58 AM
    Author     : Tulsi
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
          <base href="/HtmlFiles/ResetPassForm.html">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            
        <%
              String username= request.getParameter("username"); 
              String sq1= request.getParameter("sq1"); 
              String sq2= request.getParameter("sq2"); 

                        Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
    						String query= "select * from regowners where username=? and sq1=? and sq2=?";
    						PreparedStatement ps= con.prepareStatement(query);
    						
    						ps.setString(1,username);
    						ps.setString(2,sq1);
                                                ps.setString(3,sq2);

    						ps.execute();
    						
    						ResultSet rs= ps.getResultSet();
                                                
                                                if (rs.next()== true)
    						{
                                
    						%>
                                                <jsp:forward page="/OwnerHTML/newpassowner.html"/>
    						<%
    						}
    						else
    						{
    						 %>
                                                 <jsp:forward page="/OwnerHTML/forgotOwner.html"/>
    						 <%
    						 }
    						  %>


    </body>
</html>
