<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<% ResultSet rs = null; %>
<% ResultSet rsa = null; %>
<% ResultSet rsab = null; %>
<% ResultSet rsabc = null; %>
<% ResultSet rsabcd = null; %>

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
  <link rel="stylesheet" href="/Project/HTMLFiles/newcss.css" />
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
                        
                        String query= "SELECT teamdetails.teamname FROM teamdetails INNER JOIN tournaments ON tournaments.tournaname = teamdetails.tournaname where tournaments.username=? ;";
    						PreparedStatement ps= con.prepareStatement(query);
    						
    						ps.setString(1,user);

    						ps.execute();
    						 rsabc= ps.getResultSet();
                                                 
                                                 
                                                 String query1= "SELECT * from regowners where username= ?";
    						PreparedStatement ps1= con.prepareStatement(query1);
    						
    						ps1.setString(1,user);

    						ps1.execute();
    						 rsabcd= ps1.getResultSet();
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

        <a class="navLink" name="logout" href="/Project/OwnerHTML/OwnerRegLog.html">Logout</a>

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
          <li><span id="tournment">Create Tournament</span></li>
          <li><span id="uploadscore">Upload Statistics</span></li>
          <li><span id="crematchsch">Create Match Schedule</span></li>
          <li><span id="viewscore">View Scoreboard</span></li>
          <li><span id="viewschedule">View Match Schedule</span></li>
          <li><span id="payment">Check Payment Status</span></li>
          <li><span id="listourna">List Tournament</span></li>
          <li><span id="listeam">List Team</span></li>


        </ul>
        `;
      }
      
      sidebar();
      
       //list team section
      document.querySelector("#listeam").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `

         <div class="todisplay">
        <div class="tournmentBlock">
          <% while(rsabc.next()){ %>
          <label><br>Team Name: <%= rsabc.getString("teamname") %> </label> <br>
         
            <% } %>
        </div>
      </div>  `;
        },
        false
      );
      
      //list tournament section
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
      
      
      //create tournament section
      document.querySelector("#tournment").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
           document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
          <form class="tounamentForm" action="CreateTourna.jsp" method="post">
        

          <h1>Create Tournament</h1>
          <div class="inputBox">
            <label>Tournament Name </label>
            <input name="tournaname" type="text" />
          </div>
          <div class="inputBox">
            <label>Number of Teams</label>
            <input name="noofteams" type="text"  />
          </div>
          <div class="inputBox">
            <label>Start Date</label>
            <input name="sdate" type="date" />
          </div>
          <div class="inputBox">
            <label>End Date</label>
            <input name="edate" type="date" />
          </div>
         <input type="hidden" name="username" value=<%=user%> />

          <div class="inputBox">
            <label></label>
            <input type="submit">
          </div>
        </form>
                    
                    <%--<%@include file="CreateTourna.jsp" %>--%> 

`;
        
                    <%--<jsp:include page="CreateTourna.jsp"/>--%>
        },
        false
      );
      
                         
      //Upload Statistics section
      document.querySelector("#uploadscore").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
           document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
          <form class="tounamentForm" action="uploadstatistics.jsp" method="post">
          <h1>Upload Statistics</h1>
          <div class="inputBox">
            <label>Match Name </label>
            <input name="mname" type="text" />
          </div>
          <div class="inputBox">
            <label>Team 1</label>
            <input name="t1name" type="text" />
          </div>
          <div class="inputBox">
            <label>Team 1 Points</label>
            <input name="t1points" type="number" />
          </div>
          <div class="inputBox">
            <label>Team 2</label>
            <input name="t2name" type="text" />
          </div>
      
          <div class="inputBox">
            <label>Team 2 Points</label>
            <input name="t2points" type="number" />
          </div>
          <div class="inputBox">
            <label>Match Date</label>
            <input name="mdate" type="date" />
          </div>
          <div class="inputBox">
            <label></label>
            <input type="submit">
          </div>
        </form>`;
        },
        false
      );
      
      //create match schedule section
      document.querySelector("#crematchsch").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
           document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
          <form class="tounamentForm" action="createschedule.jsp" method="post">
          <h1></h1>
          <div class="inputBox">
            <label>Match Name </label>
            <input name="mname" type="text" />
          </div>
          <div class="inputBox">
            <label>Team 1</label>
            <input name="t1name" type="text" />
          </div>
          <div class="inputBox">
            <label>Team 2</label>
            <input name="t2name" type="text" />
          </div>
          <div class="inputBox">
            <label>Match Date</label>
            <input name="mdate" type="date" />
          </div>
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
      
      document.querySelector("#profile").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `

           <form class="tounamentForm" action="upownerdata.jsp" method="post">

            <h1>Update Personal Details</h1>
        
              <% while(rsabcd.next()){ %>

          <div class="inputBox">
            <label>Name: </label>
            <input name="name" type="text" value=<%= rsabcd.getString("name") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Middle Name: </label>
            <input name="middlename" type="text" value=<%= rsabcd.getString("middlename") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Surname: </label>
            <input name="surname" type="text" value=<%= rsabcd.getString("surname") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Password: </label>
            <input name="password" type="text" value=<%= rsabcd.getString("password") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Mobile No: </label>
            <input name="mobileno" type="text" value=<%= rsabcd.getString("mobileno") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Email: </label>
            <input name="email" type="text" value=<%= rsabcd.getString("email") %> />
          </div>    
  
        
            <div class="inputBox">
            <label>Address: </label>
            <input name="address" type="text" value=<%= rsabcd.getString("address") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Security Question 1: </label>
            <input name="sq1" type="text" value=<%= rsabcd.getString("sq1") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Security Question 2: </label>
            <input name="sq2" type="text" value=<%= rsabcd.getString("sq2") %> />
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
      
      
      //create tournament section
      document.querySelector("#payment").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
           document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `
          <form class="tounamentForm" method="post">
        

          <h1>Create Tournament</h1>
          <div class="inputBox">
            <label>Tournament Name </label>
            <input name="tournaname" type="text" />
          </div>
          <div class="inputBox">
            <label>Number of Teams</label>
            <input name="noofteams" type="text"  />
          </div>
          <div class="inputBox">
            <label>Start Date</label>
            <input name="sdate" type="date" />
          </div>
          <div class="inputBox">
            <label>End Date</label>
            <input name="edate" type="date" />
          </div>
         <input type="hidden" name="username" value=<%=user%> />

          <div class="inputBox">
            <label></label>

       <input type="submit" />

                    
          </div>
        </form>
                    

`;
        
        },
        false
      );
      
       document.querySelector("#prfile").addEventListener(
        "click",
        function (event) {
          event.preventDefault();
          document.getElementById("mainBody").innerHTML = '';
          document.getElementById("mainBody").innerHTML = `

           <form class="tounamentForm" action="upownerdata.jsp" method="post">

            <h1>Update Personal Details</h1>
        
              <% while(rsabcd.next()){ %>

          <div class="inputBox">
            <label>Name: </label>
            <input name="name" type="text" value=<%= rsabcd.getString("name") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Middle Name: </label>
            <input name="middlename" type="text" value=<%= rsabcd.getString("middlename") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Surname: </label>
            <input name="surname" type="text" value=<%= rsabcd.getString("surname") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Password: </label>
            <input name="password" type="text" value=<%= rsabcd.getString("password") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Mobile No: </label>
            <input name="mobileno" type="text" value=<%= rsabcd.getString("mobileno") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Email: </label>
            <input name="email" type="text" value=<%= rsabcd.getString("email") %> />
          </div>    
  
        
            <div class="inputBox">
            <label>Address: </label>
            <input name="address" type="text" value=<%= rsabcd.getString("address") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Security Question 1: </label>
            <input name="sq1" type="text" value=<%= rsabcd.getString("sq1") %> />
          </div>    
        
        
            <div class="inputBox">
            <label>Security Question 2: </label>
            <input name="sq2" type="text" value=<%= rsabcd.getString("sq2") %> />
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
