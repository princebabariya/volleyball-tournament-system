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
  String tournaname= request.getParameter("tournaname"); 
  String noofteams= request.getParameter("noofteams"); 
  String sdate= request.getParameter("sdate"); 
  String edate= request.getParameter("edate"); 
  String username= request.getParameter("username"); 

  
   int noofteam =Integer.parseInt(noofteams);
  
   

  try {
                        Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
                        Statement statement = con.createStatement() ;

               int i=statement.executeUpdate("insert into tournaments(tournaname,noofteams,sdate,edate,username)values('"+tournaname+"','"+noofteam+"','"+sdate+"','"+edate+"','"+username+"')");
               
                
               %>
               
               <jsp:forward page="OwnerHome.jsp"/>

                               <%                            
      }               
           catch (Exception e) {
          System.out.println(e);
          e.printStackTrace();          
      }
  %>
 </body>
</html>
