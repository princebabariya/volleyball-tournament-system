<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<% ResultSet rs = null; %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tournament Owner Home</title>
    <meta charset="UTF-8" />
    <link
    href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap"
    rel="stylesheet"
  />
  <link rel="stylesheet" href="styles.css" />
  </head>

  <body>
    <%
        try{
    
    			Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
                        Statement statement = con.createStatement() ;
                        System.out.println("con");
                        String sql= "select * from tournaments";
                        rs = statement.executeQuery(sql);
         }
             catch(SQLException e)
             {
                System.out.println("Error!!!!!!" + e);
             }
     %>
    <header>
      <h1 class="mainHeading">VOLLEYBALL TOURNAMENT SYSTEM</h1>
      <div class="headingNav">
        <a class="navLink" name="profile" href="#">Your Profile</a>
        <a class="navLink" name="logout" href="OwnerRegLog.html">Logout</a>
      </div>
    </header>

     <div class="container">
      <div class="sidebar" id="sidebar"></div>
      <div id="mainBody"></div>
      <div class="todisplay">
        <div class="tournmentBlock">
         <% while(rs.next()){ %>
          <label><br>Tournament Name: <%= rs.getString("name") %> </label> <br>
          <label> </label>
          <br>
             <p><br> Starting Date: <%= rs.getString("sdate") %> <br> Ending Date: <%= rs.getString("edate") %> 
           </p> <br>
            <br>
                        <% } %>

        </div>
      </div>
    </div>
    <script type="text/javascript">
      function sidebar() {
        console.log("sidebar");
        document.getElementById("sidebar").innerHTML = `
        <ul>
          <li><span id="tournment">Create Tournament</span></li>
          <li><span id="news">Upload Statistics</span></li>
          <li><span id="about">Generate Match Schedule</span></li>
          <li><span id="contact">View Scoreboard</span></li>
          <li><span id="about">View Match Schedule</span></li>
          <li><span id="about">Check Payment Status</span></li>

        </ul>
        `;
      }
      sidebar();
      document.querySelector("#tournment").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = `
          <form class="tounamentForm" action="CreateTourna.jsp" method="post">
          <h1>Create Tournament</h1>
          <div class="inputBox">
            <label>Tournament Name </label>
            <input name="name" type="text" />
          </div>
          <div class="inputBox">
            <label>Number of Teams</label>
            <input name="noofteams" type="text" />
          </div>
          <div class="inputBox">
            <label>Start Date</label>
            <input name="sdate" type="date" />
          </div>
          <div class="inputBox">
            <label>End Date</label>
            <input name="edate" type="date" />
          </div>
          <div class="inputBox">
            <label></label>
            <input type="submit">
          </div>
        </form>`;
        },
        false
      );
    </script>
  </body>
</html>
