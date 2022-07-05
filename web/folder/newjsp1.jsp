<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<% ResultSet rs = null; %>
<% ResultSet rsa = null; %>
<% ResultSet rsab = null; %>
<% ResultSet rsabc = null; %>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Home</title>
    <meta charset="UTF-8" />
    <link
    href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="/Project/HtmlFiles/styles.css" />
  </head>

  <body> 
      <%
              String user= request.getParameter("username");

      try{
    			Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","1234");
                        
                        Statement viewt = con.createStatement();
                        String vtutor= "select * from regtutor";
                        rs =viewt.executeQuery(vtutor);

                        
                        Statement views = con.createStatement();
                        String vstudent= "select * from regstudent";
                        rsa =views.executeQuery(vstudent);

                        Statement viewfeed = con.createStatement();
                        String vfeedback= "select * from feedstudent";
                        rsab=viewfeed.executeQuery(vfeedback);
                        
                        Statement viewtut = con.createStatement() ;
                        String query = "select * from regtutor";
                        rsabc =viewtut.executeQuery(query);


                        
      }
        
             catch(SQLException e)
             {
                System.out.println("Error!!!!!!" + e);
             }
     %>

         <header>
      <h1 class="mainHeading">TUTOR FINDER SYSTEM</h1>
      <div class="headingNav">
        <a class="navLink" name="logout" href="#">Logout</a>
      </div>
    </header>

     <div class="container">
      <div class="sidebar" id="sidebar"></div>
      <div id="mainBody"></div>
      
    </div>
    <script type="text/javascript">
      function sidebar() {
        console.log("sidebar");
        document.getElementById("mainBody").innerHTML = '';
        document.getElementById("sidebar").innerHTML = `
        <ul>
           <li><span id="vtutor">View Tutor</span></li>
           <li><span id="vstudent">View Student</span></li>
           <li><span id="vfeedback">View Feedback</span></li>
           <li><span id="rtutor">Remove Tutor</span></li>
           <li><span id="removestudent">Remove Student</span></li>

      
        </ul>
        `;
      }
      sidebar();
      
      document.querySelector("#vtutor").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
   <div class="tounamentForm">
          <table style="width:100%">
            <tr>
              <th>Tutor Name</th>
              <th>Subject</th>
              <th>City</th>
            </tr>
        
        <% while(rs.next()){ %>
          <tr>
         <td><%= rs.getString("tutorname") %> </td>
         <td><%= rs.getString("subject") %> </td> 
         <td><%= rs.getString("city") %> </td>  
         </tr>   
           <% } %>

           </table>
           </div> `;
        },
        false
      );
   
    document.querySelector("#vstudent").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
   <div class="tounamentForm">
          <table style="width:100%">
            <tr>
              <th>Student Name</th>
              <th>City</th>
            </tr>
        
       <% while(rsa.next()){ %>
          <tr>
        <td><%= rsa.getString("name") %> </td>
        <td><%= rsa.getString("city") %> </td>  
         </tr>   
        <% } %>

           </table>
           </div> `;
        },
        false
      );
       document.querySelector("#vfeedback").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
   <div class="tounamentForm">
          <table style="width:100%">
            <tr>
              <th>Tutor name</th>
              <th>Feedback</th>
              <th>Username</th>
            </tr>
        
       <% while(rsab.next()){ %>
          <tr>
        <td><%= rsab.getString("tutorname") %> </td>
        <td><%= rsab.getString("feedback") %> </td> 
        <td><%= rsab.getString("username") %> </td>  
         </tr>   
        <% } %>

           </table>
           </div> `;
        },
        false
      );
      
       
       
     
    </script>
  </body>
</html>