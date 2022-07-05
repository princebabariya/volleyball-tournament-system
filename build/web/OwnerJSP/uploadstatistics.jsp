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
  String t1points= request.getParameter("t1points"); 
  String t2name= request.getParameter("t2name"); 
  String t2points= request.getParameter("t2points"); 
  String mdate= request.getParameter("mdate"); 

   int t1point =Integer.parseInt(t1points);
   int t2point =Integer.parseInt(t2points);

  try {
                        Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
                        Statement statement = con.createStatement() ;

    int i=statement.executeUpdate("insert into statistics (mname,t1name,t1points,t2name,"
    + "t2points,mdate)values('"+mname+"','"+t1name+"','"+t1point+"','"+t2name+"','"+t2point+"','"+mdate+"')");
                
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
