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
    <title>Player Home</title>
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
        <a class="navLink" name="logout" href="PlayerRegLog.html">Logout</a>
      </div>
    </header>

     <div class="container">
      <div class="sidebar" id="sidebar"></div>
      <div id="mainBody"></div>
      
    </div>
    <script type="text/javascript">
      function sidebar() {
        console.log("sidebar");
        document.getElementById("sidebar").innerHTML = `
        <ul>
           <li><span id="team">Create Team</span></li>
          <li><span id="updateteam">Update Team</span></li>
          <li><span id="preq">Players Request</span></li>
          <li><span id="viewscore">View Scoreboard</span></li>
          <li><span id="view matchtime">View Match Schedule</span></li>
          <li><span id="listourna">List Tournament</span></li>

        </ul>
        `;
      }
      sidebar();
      document.querySelector("#listourna").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `

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
      </div>  `;
        },
        false
      );
      document.querySelector("#team").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
           <form class="tounamentForm" action="createteam.jsp" method="post">
          <h1>Create Team</h1>
          <div class="inputBox">
            <label>Team Name </label>
            <input name="teamname" type="text" />
          </div>
                                         
              <div class="inputBox">
            <label>Enter Tournament Name </label>
            <input name="tournaname" type="text" />
          </div>
                     
             <div class="inputBox">
            <label>QR Code </label>
            <img src="qr.png" width="180" height="160
               
               </div>
                      <div class="inputBox">
            <label>Enter Payment Reference Number</label>
            <input name="payrefno" type="text" />
          </div>
          <div class="inputBox">
            <label></label>
            <input type="submit">
          </div>
        </form>`;

        },
        false
      );
      
//   

// `;
//      }
//      listtourna();
    </script>
  </body>
</html>
