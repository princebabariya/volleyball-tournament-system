

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>

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
    
        if (user.equals("abc") && pass.equals("13"))
        {
        %>
                                                
        <jsp:forward page="loginsuccess.jsp"/>                                       
                                                
        <%
            }
        else
        {
    	 %>
       
         <jsp:forward page="loginfail.jsp"/>
                                                 
        <%      
            }
        %>
    </body>
</html>
