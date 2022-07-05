package org.apache.jsp.Captain;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class CaptainHome_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\n');
 ResultSet rsabcde = null; 
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <title>Captain Home</title>\n");
      out.write("    <meta charset=\"UTF-8\" />\n");
      out.write("    <link\n");
      out.write("    href=\"https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap\"\n");
      out.write("    rel=\"stylesheet\"\n");
      out.write("  />\n");
      out.write("    <link rel=\"stylesheet\" href=\"/Project/HTMLFiles/styles.css\" />\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body>\n");
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
                        
                        String query= "SELECT regplayers.name, regplayers.surname, regplayers.mobileno, regplayers.email, regplayers.age, regplayers.address, regplayers.teamname FROM regplayers INNER JOIN teamdetails ON regplayers.teamname = teamdetails.teamname where teamdetails.username=? ;";
    						PreparedStatement ps= con.prepareStatement(query);
    						
    						ps.setString(1,user);

    						ps.execute();
    						 rsabc= ps.getResultSet();
                                                 
                                                 String query1= "SELECT regplayers.name, regplayers.surname, regplayers.mobileno, regplayers.email, regplayers.age, regplayers.address, regplayers.teamname FROM regplayers INNER JOIN teamdetails ON regplayers.teamname = teamdetails.teamname where teamdetails.username=? ;";
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
     
      out.write("\n");
      out.write("    <header>\n");
      out.write("      <h1 class=\"mainHeading\">VOLLEYBALL TOURNAMENT SYSTEM</h1>\n");
      out.write("      <div class=\"headingNav\">\n");
      out.write("        <a class=\"navLink\" name=\"profile\" href=\"#\"><span id=\"profile\">Your Profile</span></a>\n");
      out.write("        <a class=\"navLink\" name=\"logout\" href=\"/PlayerHTML/PlayerRegLog.html\">Logout</a>\n");
      out.write("      </div>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("     <div class=\"container\">\n");
      out.write("      <div class=\"sidebar\" id=\"sidebar\"></div>\n");
      out.write("      <div id=\"mainBody\"></div>\n");
      out.write("      \n");
      out.write("    </div>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("      function sidebar() {\n");
      out.write("        console.log(\"sidebar\");\n");
      out.write("        document.getElementById(\"sidebar\").innerHTML = `\n");
      out.write("        <ul>\n");
      out.write("           <li><span id=\"team\">Create Team</span></li>\n");
      out.write("          <li><span id=\"updateteam\">Update Team</span></li>\n");
      out.write("          <li><span id=\"viewscore\">View Scoreboard</span></li>\n");
      out.write("          <li><span id=\"viewschedule\">View Match Schedule</span></li>\n");
      out.write("          <li><span id=\"listourna\">List Tournament</span></li>\n");
      out.write("          <li><span id=\"tplayers\">Team Players</span></li>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </ul>\n");
      out.write("        `;\n");
      out.write("      }\n");
      out.write("      sidebar();\n");
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
      out.write("      document.querySelector(\"#team\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("          \n");
      out.write("           <form class=\"tounamentForm\" action=\"/Project/Captain/createteam.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("          <h1>Create Team</h1>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Team Name </label>\n");
      out.write("            <input name=\"teamname\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("                                         \n");
      out.write("              <div class=\"inputBox\">\n");
      out.write("            <label>Enter Tournament Name </label>\n");
      out.write("        \n");
      out.write("            <input name=\"tournaname\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("                     \n");
      out.write("             <div class=\"inputBox\">\n");
      out.write("            <label>QR Code </label>\n");
      out.write("            <img src=\"/Project/Images/qr.png\" width=\"180\" height=\"160\n");
      out.write("               \n");
      out.write("               </div>\n");
      out.write("                      <div class=\"inputBox\">\n");
      out.write("            <label>Enter Payment Reference Number</label>\n");
      out.write("            <input name=\"payrefno\" type=\"text\" value=");
      out.print(user);
      out.write(" />\n");
      out.write("          </div>\n");
      out.write("         <input type=\"hidden\" name=\"username\" value=");
      out.print(user);
      out.write(" />\n");
      out.write("\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label></label>\n");
      out.write("            <input type=\"submit\">\n");
      out.write("          </div>\n");
      out.write("        </form>`;\n");
      out.write("\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("       //view scoreboard section\n");
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
      out.write("       //view team players section\n");
      out.write("      document.querySelector(\"#tplayers\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("           document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("          \n");
      out.write("           <div class=\"tounamentForm\">\n");
      out.write("          <table style=\"width:100%\">\n");
      out.write("            <tr>\n");
      out.write("              <th>Player Name</th>\n");
      out.write("              <th>Surname</th>\n");
      out.write("              <th>Mobile Number</th>\n");
      out.write("              <th>Email</th>      \n");
      out.write("              <th>Age</th>\n");
      out.write("              <th>Address</th>\n");
      out.write("              <th>Team Name</th>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("        \n");
      out.write("        ");
 while(rsabc.next()){ 
      out.write("\n");
      out.write("          <tr>\n");
      out.write("         <td>");
      out.print( rsabc.getString("name") );
      out.write(" </td> \n");
      out.write("         <td>");
      out.print( rsabc.getString("surname") );
      out.write(" </td>\n");
      out.write("         <td>");
      out.print( rsabc.getString("mobileno") );
      out.write(" </td>\n");
      out.write("         <td>");
      out.print( rsabc.getString("email") );
      out.write(" </td> \n");
      out.write("         <td>");
      out.print( rsabc.getString("age") );
      out.write(" </td> \n");
      out.write("         <td>");
      out.print( rsabc.getString("address") );
      out.write(" </td> \n");
      out.write("         <td>");
      out.print( rsabc.getString("teamname") );
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
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("\n");
      out.write("\n");
      out.write("//view team players section\n");
      out.write("      document.querySelector(\"#updateteam\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("           document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("                \n");
      out.write("\n");
      out.write("           <form class=\"tounamentForm\" action=\"/Project/Captain/updateteam.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("             <div class=\"inputBox\">\n");
      out.write("                            ");
 while(rsabcd.next()){ 
      out.write("\n");
      out.write("\n");
      out.write("            <label>Player Name:");
      out.print( rsabcd.getString("name") );
      out.write("  </label>\n");
      out.write("             <input type=\"hidden\" name=\"name\" value=");
      out.print( rsabcd.getString("name") );
      out.write(" />\n");
      out.write("         <input type=\"hidden\" name=\"username\" value=");
      out.print(user);
      out.write(" />\n");
      out.write("\n");
      out.write("            <input type=\"submit\"> <br>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("          </div>  \n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("`;\n");
      out.write("\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
      out.write("      \n");
      out.write("document.querySelector(\"#profile\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = '';\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("\n");
      out.write("           <form class=\"tounamentForm\" action=\"upplayerdata.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("            <h1>Update Personal Details</h1>\n");
      out.write("        \n");
      out.write("              ");
 while(rsabcde.next()){ 
      out.write("\n");
      out.write("\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Name: </label>\n");
      out.write("            <input name=\"name\" type=\"text\" value=");
      out.print( rsabcde.getString("name") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Middle Name: </label>\n");
      out.write("            <input name=\"middlename\" type=\"text\" value=");
      out.print( rsabcde.getString("middlename") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Surname: </label>\n");
      out.write("            <input name=\"surname\" type=\"text\" value=");
      out.print( rsabcde.getString("surname") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Password: </label>\n");
      out.write("            <input name=\"password\" type=\"text\" value=");
      out.print( rsabcde.getString("password") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Mobile No: </label>\n");
      out.write("            <input name=\"mobileno\" type=\"text\" value=");
      out.print( rsabcde.getString("mobileno") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Email: </label>\n");
      out.write("            <input name=\"email\" type=\"text\" value=");
      out.print( rsabcde.getString("email") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Age: </label>\n");
      out.write("            <input name=\"age\" type=\"text\" value=");
      out.print( rsabcde.getString("age") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Address: </label>\n");
      out.write("            <input name=\"address\" type=\"text\" value=");
      out.print( rsabcde.getString("address") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Security Question 1: </label>\n");
      out.write("            <input name=\"sq1\" type=\"text\" value=");
      out.print( rsabcde.getString("sq1") );
      out.write(" />\n");
      out.write("          </div>    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"inputBox\">\n");
      out.write("            <label>Security Question 2: </label>\n");
      out.write("            <input name=\"sq2\" type=\"text\" value=");
      out.print( rsabcde.getString("sq2") );
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
      out.write("\n");
      out.write("\n");
      out.write("// `;\n");
      out.write("//      }\n");
      out.write("//      listtourna();\n");
      out.write("    </script>\n");
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
