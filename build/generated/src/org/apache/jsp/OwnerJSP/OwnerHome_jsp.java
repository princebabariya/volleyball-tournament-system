package org.apache.jsp.OwnerJSP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class OwnerHome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("\n");
 ResultSet rs = null; 
      out.write('\n');
 ResultSet rsa = null; 
      out.write('\n');
 ResultSet rsab = null; 
      out.write('\n');
 ResultSet rsabc = null; 
      out.write('\n');
 ResultSet rsabcd = null; 
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <title>Tournament Owner Home</title>\n");
      out.write("    <meta charset=\"UTF-8\" />\n");
      out.write("    <link\n");
      out.write("          href=\"https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap\"\n");
      out.write("          rel=\"stylesheet\"\n");
      out.write("     />\n");
      out.write("  <link rel=\"stylesheet\" href=\"/Project/HTMLFiles/styles.css\" />\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body>\n");
      out.write("      \n");
      out.write("    ");
        
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
     
      out.write("\n");
      out.write("     \n");
      out.write("\n");
      out.write("    <header>\n");
      out.write("        <h1 class=\"mainHeading\">VOLLEYBALL TOURNAMENT SYSTEM</h1>\n");
      out.write("      <div class=\"headingNav\">\n");
      out.write("        <a class=\"navLink\" name=\"profile\" href=\"#\"><span id=\"profile\">Your Profile</span></a>\n");
      out.write("        <a class=\"navLink\" name=\"logout\" href=\"/Project/OwnerHTML/OwnerRegLog.html\">Logout</a>\n");
      out.write("      </div> \n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("     <div class=\"container\">\n");
      out.write("      <div class=\"sidebar\" id=\"sidebar\"></div>\n");
      out.write("      <div id=\"mainBody\"></div>\n");
      out.write("      \n");
      out.write("      </div>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        \n");
      out.write("      function sidebar() {\n");
      out.write("        console.log(\"sidebar\");\n");
      out.write("        document.getElementById(\"sidebar\").innerHTML = `\n");
      out.write("        <ul>\n");
      out.write("          <li><span id=\"tournment\">Create Tournament</span></li>\n");
      out.write("          <li><span id=\"uploadscore\">Upload Statistics</span></li>\n");
      out.write("          <li><span id=\"crematchsch\">Create Match Schedule</span></li>\n");
      out.write("          <li><span id=\"viewscore\">View Scoreboard</span></li>\n");
      out.write("          <li><span id=\"viewschedule\">View Match Schedule</span></li>\n");
      out.write("          <li><span id=\"listourna\">List Tournament</span></li>\n");
      out.write("          <li><span id=\"listeam\">List Team</span></li>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </ul>\n");
      out.write("        `;\n");
      out.write("      }\n");
      out.write("      \n");
      out.write("      sidebar();\n");
      out.write("      \n");
      out.write("       //list team section\n");
      out.write("      document.querySelector(\"#listeam\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("\n");
      out.write("         <div class=\"todisplay\">\n");
      out.write("        <div class=\"tournmentBlock\">\n");
      out.write("          ");
 while(rsabc.next()){ 
      out.write("\n");
      out.write("          <label><br>Team Name: ");
      out.print( rsabc.getString("teamname") );
      out.write(" </label> <br>\n");
      out.write("         \n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("        </div>\n");
      out.write("      </div>  `;\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("      //list tournament section\n");
      out.write("      document.querySelector(\"#listourna\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("\n");
      out.write("         <div class=\"todisplay\">\n");
      out.write("        <div class=\"tournmentBlock\">\n");
      out.write("          ");
 while(rs.next()){ 
      out.write("\n");
      out.write("          <label><br>Tournament Name: ");
      out.print( rs.getString("tournaname") );
      out.write(" </label> <br>\n");
      out.write("          <label> </label>\n");
      out.write("          <br>\n");
      out.write("             <p><br> Starting Date: ");
      out.print( rs.getString("sdate") );
      out.write(" <br> Ending Date: ");
      out.print( rs.getString("edate") );
      out.write(" \n");
      out.write("           </p> <br>\n");
      out.write("            <br>\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("        </div>\n");
      out.write("      </div>  `;\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("      \n");
      out.write("      //create tournament section\n");
      out.write("      document.querySelector(\"#tournment\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("           document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("          <form class=\"tounamentForm\" action=\"CreateTourna.jsp\" method=\"post\">\n");
      out.write("        \n");
      out.write("\n");
      out.write("          <h1>Create Tournament</h1>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Tournament Name </label>\n");
      out.write("            <input name=\"tournaname\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Number of Teams</label>\n");
      out.write("            <input name=\"noofteams\" type=\"text\"  />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Start Date</label>\n");
      out.write("            <input name=\"sdate\" type=\"date\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>End Date</label>\n");
      out.write("            <input name=\"edate\" type=\"date\" />\n");
      out.write("          </div>\n");
      out.write("         <input type=\"hidden\" name=\"username\" value=");
      out.print(user);
      out.write(" />\n");
      out.write("\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label></label>\n");
      out.write("            <input type=\"submit\">\n");
      out.write("          </div>\n");
      out.write("        </form>\n");
      out.write("                    \n");
      out.write("                    ");
      out.write(" \n");
      out.write("\n");
      out.write("`;\n");
      out.write("        \n");
      out.write("                    ");
      out.write("\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("                         \n");
      out.write("      //Upload Statistics section\n");
      out.write("      document.querySelector(\"#uploadscore\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("           document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("          <form class=\"tounamentForm\" action=\"uploadstatistics.jsp\" method=\"post\">\n");
      out.write("          <h1>Upload Statistics</h1>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Match Name </label>\n");
      out.write("            <input name=\"mname\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Team 1</label>\n");
      out.write("            <input name=\"t1name\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Team 1 Points</label>\n");
      out.write("            <input name=\"t1points\" type=\"number\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Team 2</label>\n");
      out.write("            <input name=\"t2name\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("      \n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Team 2 Points</label>\n");
      out.write("            <input name=\"t2points\" type=\"number\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Match Date</label>\n");
      out.write("            <input name=\"mdate\" type=\"date\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label></label>\n");
      out.write("            <input type=\"submit\">\n");
      out.write("          </div>\n");
      out.write("        </form>`;\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("      //create match schedule section\n");
      out.write("      document.querySelector(\"#crematchsch\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("           document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("          <form class=\"tounamentForm\" action=\"createschedule.jsp\" method=\"post\">\n");
      out.write("          <h1></h1>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Match Name </label>\n");
      out.write("            <input name=\"mname\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Team 1</label>\n");
      out.write("            <input name=\"t1name\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Team 2</label>\n");
      out.write("            <input name=\"t2name\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Match Date</label>\n");
      out.write("            <input name=\"mdate\" type=\"date\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label></label>\n");
      out.write("            <input type=\"submit\">\n");
      out.write("          </div>\n");
      out.write("        </form>`;\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("      //view scoreboard section\n");
      out.write("      document.querySelector(\"#viewscore\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("           document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("            \n");
      out.write("         <div class=\"tounamentForm\">\n");
      out.write("          <table style=\"width:100%\">\n");
      out.write("            <tr>\n");
      out.write("              <th>Team 1 name</th>\n");
      out.write("              <th>Team 1 points</th>\n");
      out.write("              <th>Team 2 name</th>\n");
      out.write("              <th>Team 2 points</th>\n");
      out.write("              <th>Match Name</th>\n");
      out.write("              <th>Match Date</th>\n");
      out.write("            </tr>\n");
      out.write("        \n");
      out.write("        ");
 while(rsa.next()){ 
      out.write("\n");
      out.write("          <tr>\n");
      out.write("         <td>");
      out.print( rsa.getString("t1name") );
      out.write(" </td>\n");
      out.write("         <td>");
      out.print( rsa.getString("t1points") );
      out.write(" </td> \n");
      out.write("         <td>");
      out.print( rsa.getString("t2name") );
      out.write(" </td>\n");
      out.write("         <td>");
      out.print( rsa.getString("t2points") );
      out.write(" </td> \n");
      out.write("         <td>");
      out.print( rsa.getString("mname") );
      out.write(" </td> \n");
      out.write("         <td>");
      out.print( rsa.getString("mdate") );
      out.write(" </td> \n");
      out.write("          </tr>   \n");
      out.write("           ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("           </table>\n");
      out.write("           </div> `;\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("       //view match schedule section\n");
      out.write("      document.querySelector(\"#viewschedule\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("           document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("          \n");
      out.write("           <div class=\"tounamentForm\">\n");
      out.write("          <table style=\"width:100%\">\n");
      out.write("            <tr>\n");
      out.write("              <th>Match Name</th>\n");
      out.write("              <th>Team 1 name</th>\n");
      out.write("              <th>Team 2 name</th>\n");
      out.write("              <th>Match Date</th>\n");
      out.write("            </tr>\n");
      out.write("        \n");
      out.write("        ");
 while(rsab.next()){ 
      out.write("\n");
      out.write("          <tr>\n");
      out.write("         <td>");
      out.print( rsab.getString("mname") );
      out.write(" </td> \n");
      out.write("         <td>");
      out.print( rsab.getString("t1name") );
      out.write(" </td>\n");
      out.write("         <td>");
      out.print( rsab.getString("t2name") );
      out.write(" </td>\n");
      out.write("         <td>");
      out.print( rsab.getString("mdate") );
      out.write(" </td> \n");
      out.write("          </tr>   \n");
      out.write("           ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("           </table>\n");
      out.write("           </div> \n");
      out.write("`;\n");
      out.write("    \n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("      document.querySelector(\"#profile\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("\n");
      out.write("           <form class=\"tounamentForm\" action=\"upownerdata.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("            <h1>Update Personal Details</h1>\n");
      out.write("        \n");
      out.write("              ");
 while(rsabcd.next()){ 
      out.write("\n");
      out.write("\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Name: </label>\n");
      out.write("            <input name=\"name\" type=\"text\" value=");
      out.print( rsabcd.getString("name") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Middle Name: </label>\n");
      out.write("            <input name=\"middlename\" type=\"text\" value=");
      out.print( rsabcd.getString("middlename") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Surname: </label>\n");
      out.write("            <input name=\"surname\" type=\"text\" value=");
      out.print( rsabcd.getString("surname") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Password: </label>\n");
      out.write("            <input name=\"password\" type=\"text\" value=");
      out.print( rsabcd.getString("password") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Mobile No: </label>\n");
      out.write("            <input name=\"mobileno\" type=\"text\" value=");
      out.print( rsabcd.getString("mobileno") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Email: </label>\n");
      out.write("            <input name=\"email\" type=\"text\" value=");
      out.print( rsabcd.getString("email") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("  \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Address: </label>\n");
      out.write("            <input name=\"address\" type=\"text\" value=");
      out.print( rsabcd.getString("address") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Security Question 1: </label>\n");
      out.write("            <input name=\"sq1\" type=\"text\" value=");
      out.print( rsabcd.getString("sq1") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Security Question 2: </label>\n");
      out.write("            <input name=\"sq2\" type=\"text\" value=");
      out.print( rsabcd.getString("sq2") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("                 <input type=\"hidden\" name=\"username\" value=");
      out.print(user);
      out.write(" />\n");
      out.write("\n");
      out.write("                                    ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label></label>\n");
      out.write("            <input type=\"submit\">\n");
      out.write("          </div>\n");
      out.write("        </form>\n");
      out.write("`;\n");
      out.write("\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("      \n");
      out.write("      //create tournament section\n");
      out.write("      document.querySelector(\"#payment\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("           document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("          <form class=\"tounamentForm\" method=\"post\">\n");
      out.write("        \n");
      out.write("\n");
      out.write("          <h1>Create Tournament</h1>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Tournament Name </label>\n");
      out.write("            <input name=\"tournaname\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Number of Teams</label>\n");
      out.write("            <input name=\"noofteams\" type=\"text\"  />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Start Date</label>\n");
      out.write("            <input name=\"sdate\" type=\"date\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>End Date</label>\n");
      out.write("            <input name=\"edate\" type=\"date\" />\n");
      out.write("          </div>\n");
      out.write("         <input type=\"hidden\" name=\"username\" value=");
      out.print(user);
      out.write(" />\n");
      out.write("\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label></label>\n");
      out.write("            <input type=\"submit\" <span id=\"profile\"> </span> />\n");
      out.write("                     <a class=\"navLink\" name=\"profile\" href=\"#\" <button type=\"button\" <span id=\"profile\">Your Profile</span></a>>Click Me!</button>\n");
      out.write("                    <a class=\"navLink\" name=\"profile\" href=\"#\">\n");
      out.write("          </div>\n");
      out.write("        </form>\n");
      out.write("                    \n");
      out.write("                    ");
      out.write(" \n");
      out.write("\n");
      out.write("`;\n");
      out.write("        \n");
      out.write("                    ");
      out.write("\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("  </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
