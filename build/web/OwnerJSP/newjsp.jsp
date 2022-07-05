<%-- 
    Document   : newjsp
    Created on : 23 Feb, 2022, 10:25:11 AM
    Author     : Prince babariya
--%>

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
           String username= request.getParameter("username"); 

        %>
        
        <h1>        <%  out.print(username); %> </h1>
    </body>
</html>
