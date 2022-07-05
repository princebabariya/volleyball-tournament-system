<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<% ResultSet rs = null; %>
<% ResultSet rsa = null; %>
<% ResultSet rsab = null; %>
<% ResultSet rsabc = null; %>
<% ResultSet rsabcd = null; %>
<% ResultSet rsabcde = null; %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Captain Home</title>
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
                       //list tournament query
                        Statement listtourn = con.createStatement() ;
                        String listtourna= "select * from tournaments";
                        rs = listtourn.executeQuery(listtourna);
                        
                        //view scoreboard query
                        Statement viewscor = con.createStatement() ;
                        String viewscore= "select * from statistics";
                        rsa = viewscor.executeQuery(viewscore);
                        
                        //view match schedule query
                        Statement viewschedul = con.createStatement() ;
                        String viewschedule= "select * from mschedule";
                        rsab = viewschedul.executeQuery(viewschedule);
                        
                        String query= "SELECT regplayers.name, regplayers.surname, regplayers.mobileno, regplayers.email, regplayers.age, regplayers.address, regplayers.teamname FROM regplayers INNER JOIN teamdetails ON regplayers.teamname = teamdetails.teamname where teamdetails.username=? ;";
    						PreparedStatement ps= con.prepareStatement(query);
    						
    						ps.setString(1,user);

    						ps.execute();
    						 rsabc= ps.getResultSet();
                                                 
                                                 String query1= "SELECT regplayers.name, regplayers.surname, regplayers.mobileno, "
                                                         + "regplayers.email, regplayers.age, regplayers.address, regplayers.teamname "
                                                         + "FROM regplayers INNER JOIN teamdetails ON regplayers.teamname = "
                                                         + "teamdetails.teamname where teamdetails.username=? ;";
    						PreparedStatement ps1= con.prepareStatement(query1);
    						
    						ps1.setString(1,user);

    						ps1.execute();
                                                    rsabcd= ps1.getResultSet();
                                                    
                                                    
                                                    String query2= "SELECT * from regplayers where username= ?";
    						PreparedStatement ps2= con.prepareStatement(query2);
    						
    						ps2.setString(1,user);

    						ps2.execute();
    						 rsabcde= ps2.getResultSet();

                        
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
           <li><span id="team">Create Team</span></li>
          <li><span id="updateteam">Update Team</span></li>
          <li><span id="viewscore">View Scoreboard</span></li>
          <li><span id="viewschedule">View Match Schedule</span></li>
          <li><span id="listourna">List Tournament</span></li>
          <li><span id="tplayers">Team Players</span></li>


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
          <label><br>Tournament Name: <%= rs.getString("tournaname") %> </label> <br>
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
      
      //create team
      document.querySelector("#team").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
          
           <form class="tounamentForm" action="/Project/Captain/createteam.jsp" method="post">

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
            <img src="/Project/Images/qr.png" width="180" height="160
               
               </div>
                      <div class="inputBox">
            <label>Enter Payment Reference Number</label>
            <input name="payrefno" type="text"  />
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
    
        },
        false
      );
      
       //view update team section
      document.querySelector("#updateteam").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
           document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
             <form action="/Project/Captain/updateteam.jsp" method="post">
           <div class="tounamentForm">
          <table style="width:100%">
            <tr>
              <th>Player Name</th>
              <th>Remove <th>
            </tr>

        <% while(rsabcd.next()){ %>

          <tr>
         <td><%= rsabcd.getString("name") %> <%= rsabcd.getString("surname") %>  </td> 
        <input type="hidden" name="name" value=<%= rsabcd.getString("name") %> /> 
         <input type="hidden" name="username" value=<%=user%> /> 
  
        <td>    <input type="submit" value="Remove" > </td>
          </tr>  
                
</div> 
                           <% } %>
</table>
 </form>`;
    
        },
        false
      );

       //view team players section
      document.querySelector("#tplayers").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
           document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
          
           <div class="tounamentForm">
          <table style="width:100%">
            <tr>
        <th>Player Name</th>
              <th>Mobile Number</th>
              <th>Email</th> 
              <th>Age</th> 
              <th>Address</th> 
              <th>Team Name</th>

            </tr>

        <% while(rsabc.next()){ %>
          <tr>
         <td><%= rsabc.getString("name") %> <%= rsabc.getString("surname") %>  </td> 
         <td><%= rsabc.getString("mobileno") %> </td> 
         <td><%= rsabc.getString("email") %> </td> 
         <td><%= rsabc.getString("age") %> </td> 
         <td><%= rsabc.getString("address") %> </td> 
         <td><%= rsabc.getString("teamname") %> </td> 
          </tr>   
                 
           <% } %>

           </table>
           </div> 
              </form>

`;
    
        },
        false
      );

// Your profile
      
document.querySelector("#profile").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `

           <form class="tounamentForm" action="upplayerdata.jsp" method="post">

            <h1>Update Personal Details</h1>
        
              <% while(rsabcde.next()){ %>

          <div class="inputBox">
            <label>Name: </label>
            <input name="name" type="text" value=<%= rsabcde.getString("name") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Middle Name: </label>
            <input name="middlename" type="text" value=<%= rsabcde.getString("middlename") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Surname: </label>
            <input name="surname" type="text" value=<%= rsabcde.getString("surname") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Password: </label>
            <input name="password" type="text" value=<%= rsabcde.getString("password") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Mobile No: </label>
            <input name="mobileno" type="text" value=<%= rsabcde.getString("mobileno") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Email: </label>
            <input name="email" type="text" value=<%= rsabcde.getString("email") %> />
          </div>    
        
            <div class="inputBox">
            <label>Address: </label>
            <input name="address" type="text" value=<%= rsabcde.getString("address") %> />
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


    </script>
  </body>
</html>
