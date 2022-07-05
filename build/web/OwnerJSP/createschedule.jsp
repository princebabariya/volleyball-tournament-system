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
  String mname= request.getParameter("mname"); 
  String t1name= request.getParameter("t1name"); 
  String t2name= request.getParameter("t2name"); 
  String mdate= request.getParameter("mdate"); 

  try {
                        Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
                        Statement statement = con.createStatement() ;

    int i=statement.executeUpdate("insert into mschedule (t1name,t2name,mdate,mname)"
            + "values('"+t1name+"','"+t2name+"','"+mdate+"','"+mname+"')");
                
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
