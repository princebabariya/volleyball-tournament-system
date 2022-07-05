<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
      <base href="/Player HTML/PlayerRegLog.html">
    
    <title>My JSP 'VerifyData.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
    <%
    
    String user= request.getParameter("username");
    String pass= request.getParameter("password");
    
//    int id=Integer.parseInt(Id);
    
    
    
    			Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
    						String query= "select * from regplayers where username=? and password=?";
    						PreparedStatement ps= con.prepareStatement(query);
    						
    						ps.setString(1,user);
    						ps.setString(2,pass);
    						ps.execute();
    						
    						ResultSet rs= ps.getResultSet();
    						
    						if (rs.next()== true)
    						{
    						%>
                                                <jsp:forward page="newjsp.jsp"/>
    						<%
    						}
    						else
    						{
    						 %>
                                                 <jsp:forward page="/Player HTML/Player Login Register.html"/>
    						 <%
    						 }
    						  %>
    						
		 
  </body>
</html>
