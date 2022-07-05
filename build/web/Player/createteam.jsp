<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="TournaDisp.jsp">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
            <%
  String teamname= request.getParameter("teamname"); 
  String tournaname= request.getParameter("tournaname"); 
  String payrefno= request.getParameter("payrefno"); 
  
  try {
                        Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
                       Statement s=con.createStatement();
                       
               int i=s.executeUpdate("insert into teamdetails (teamname,tournaname,payrefno)values('"+teamname+"','"+tournaname+"','"+payrefno+"')");
               
               %>
               <jsp:forward page="TournaListDisplay.jsp"/>

                               <%
                                   
      }     
           catch (Exception e) {
          System.out.println(e);
          e.printStackTrace();
      }
%>
    </body>
</html>
