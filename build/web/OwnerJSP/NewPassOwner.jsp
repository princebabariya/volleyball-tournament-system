
<%@page import="java.sql.Statement"%>
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
    String pass= request.getParameter("newpass");
    
    Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
    						String query= "Update regowners set password=? where username=?";
    						PreparedStatement ps= con.prepareStatement(query);
    						
                                                ps.setString(1,pass);
    						ps.setString(2,user);
    						
    						ps.executeUpdate();
    						
    						ResultSet rs= ps.getResultSet();
    						%>
                                                
                                                <jsp:forward page="OwnerHome.jsp"/>
    						
</body>
</html>