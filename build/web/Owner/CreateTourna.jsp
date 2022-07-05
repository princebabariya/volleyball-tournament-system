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
  String name= request.getParameter("name"); 
  String noofteams= request.getParameter("noofteams"); 
  String sdate= request.getParameter("sdate"); 
  String edate= request.getParameter("edate"); 
  
   int noofteam =Integer.parseInt(noofteams);
  
  try {
                        Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
                       Statement s=con.createStatement();
                       
               int i=s.executeUpdate("insert into tournaments(name,noofteams,sdate,edate)values('"+name+"','"+noofteam+"','"+sdate+"','"+edate+"')");
               
               %>
               <jsp:forward page="TournaDisp.jsp"/>

                               <%                            
      }               
           catch (Exception e) {
          System.out.println(e);
          e.printStackTrace();          
      }
  %>
 </body>
</html>
