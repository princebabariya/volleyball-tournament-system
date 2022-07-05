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
    <link rel="stylesheet" href="/Project/HTMLFiles/styles.css" />
    <style>  
table, th, td {  
    border: 1px solid black;  
    border-collapse: collapse;  
}  
th, td {  
    padding: 10px;  
}  
table#alter tr:nth-child(even) {  
    background-color: #eee;  
}  
table#alter tr:nth-child(odd) {  
    background-color: #fff;  
}  
table#alter th {  
    color: white;  
    background-color: gray;  
}  
</style>  
  </head>

  <body>
    <%
                                  String user= request.getParameter("username"); 

        try{


    
    			Class.forName("org.postgresql.Driver");
    			Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/Project","postgres","prince1234");
                        Statement statement = con.createStatement() ;
                        String sql= "select * from teamdetails";
                        rs = statement.executeQuery(sql);
                        
                        //view scoreboard query
                        Statement viewscor = con.createStatement() ;
                        String viewscore= "select * from statistics";
                        rsa = viewscor.executeQuery(viewscore);
                        
                        //view match schedule query
                        Statement viewschedul = con.createStatement() ;
                        String viewschedule= "select * from mschedule";
                        rsab = viewschedul.executeQuery(viewschedule);
                        
                        String query= "SELECT * from regplayers where username= ?";
    						PreparedStatement ps= con.prepareStatement(query);
    						
    						ps.setString(1,user);

    						ps.execute();
    						 rsabc= ps.getResultSet();
         }
             catch(SQLException e)
             {
                System.out.println("Error!!!!!!" + e);
             }
     %>
    <header>
      <h1 class="mainHeading">VOLLEYBALL TOURNAMENT SYSTEM</h1>
      <div class="headingNav">
        <a class="navLink" name="profile" href="#"><span id="profile">Your Profile</span></a>
        <a class="navLink" name="logout" href="/Project/PlayerHTML/PlayerRegLog.html">Logout</a>
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
           <li><span id="team">Select Team</span></li>
          <li><span id="viewscore">View Scoreboard</span></li>
          <li><span id="viewschedule">View Match Schedule</span></li>
          <li><span id="listteam">List Teams</span></li>

        </ul>
        `;
      }
      sidebar();
      document.querySelector("#listteam").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `

         <div class="todisplay">
        <div class="tournmentBlock">
          <% while(rs.next()){ %>
          <label>Team Name: <%= rs.getString("teamname") %> </label> 
             <label>Tournament Name: <%= rs.getString("tournaname") %>   </label> <br>
            <br>
                              <label> </label>

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
           <form class="tounamentForm" action="selectteam.jsp" method="post">

          <h1>Select Team</h1>
          <div class="inputBox">
            <label>Team Name </label>
            <input name="teamname" type="text" />
          </div>    
                 <input type="hidden" name="username" value=<%=user%> />

          <div class="inputBox">
            <label></label>
            <input type="submit">
          </div>
        </form>`;

        },
        false
      );
       //view scoreboard section
      document.querySelector("#viewscore").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
           document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
            
         <div class="tounamentForm">
                          <h1>Scoreboard</h1>

          <table style="width:100%">
            <tr>
              <th>Team 1 name</th>
              <th>Team 1 points</th>
              <th>Team 2 name</th>
              <th>Team 2 points</th>
              <th>Match Name</th>
              <th>Match Date</th>
            </tr>
        
        <% while(rsa.next()){ %>
          <tr>
         <td><%= rsa.getString("t1name") %> </td>
         <td><%= rsa.getString("t1points") %> </td> 
         <td><%= rsa.getString("t2name") %> </td>
         <td><%= rsa.getString("t2points") %> </td> 
         <td><%= rsa.getString("mname") %> </td> 
         <td><%= rsa.getString("mdate") %> </td> 
          </tr>   
           <% } %>

           </table>
           </div> `;
        },
        false
      );
      
       //view match schedule section
      document.querySelector("#viewschedule").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
           document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
          
           <div class="tounamentForm">
                          <h1>Match Schedule</h1>

          <table style="width:100%">
            <tr>
              <th>Match Name</th>
              <th>Team 1 name</th>
              <th>Team 2 name</th>
              <th>Match Date</th>
            </tr>
        
        <% while(rsab.next()){ %>
          <tr>
         <td><%= rsab.getString("mname") %> </td> 
         <td><%= rsab.getString("t1name") %> </td>
         <td><%= rsab.getString("t2name") %> </td>
         <td><%= rsab.getString("mdate") %> </td> 
          </tr>   
           <% } %>

           </table>
           </div> 
`;
    
        <%--<jsp:forward page="CreateTourna.jsp"/>--%>

        },
        false
      );
//   
document.querySelector("#profile").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `

           <form class="tounamentForm" action="upplayerdata.jsp" method="post">

            <h1>Update Personal Details</h1>
        
              <% while(rsabc.next()){ %>

          <div class="inputBox">
            <label>Name: </label>
            <input name="name" type="text" value=<%= rsabc.getString("name") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Middle Name: </label>
            <input name="middlename" type="text" value=<%= rsabc.getString("middlename") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Surname: </label>
            <input name="surname" type="text" value=<%= rsabc.getString("surname") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Password: </label>
            <input name="password" type="text" value=<%= rsabc.getString("password") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Mobile No: </label>
            <input name="mobileno" type="text" value=<%= rsabc.getString("mobileno") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Email: </label>
            <input name="email" type="text" value=<%= rsabc.getString("email") %> />
          </div>    
        
            <div class="inputBox">
            <label>Address: </label>
            <input name="address" type="text" value=<%= rsabc.getString("address") %> />
          </div>    
        
                 <input type="hidden" name="username" value=<%=user%> />

                                    <% } %>

          <div class="inputBox">
            <label></label>
            <input type="submit">
          </div>
        </form>
`;

        },
        false
      );
// `;
//      }
//      listtourna();
    </script>
  </body>
</html>
