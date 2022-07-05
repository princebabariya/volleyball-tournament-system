package org.apache.jsp.Owner;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class TournaDisp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    href=\"https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap\"\n");
      out.write("    rel=\"stylesheet\"\n");
      out.write("  />\n");
      out.write("  <link rel=\"stylesheet\" href=\"styles.css\" />\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body>\n");
      out.write("    ");

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
     
      out.write("\n");
      out.write("    <header>\n");
      out.write("      <h1 class=\"mainHeading\">VOLLEYBALL TOURNAMENT SYSTEM</h1>\n");
      out.write("      <div class=\"headingNav\">\n");
      out.write("        <a class=\"navLink\" name=\"profile\" href=\"#\">Your Profile</a>\n");
      out.write("        <a class=\"navLink\" name=\"logout\" href=\"OwnerRegLog.html\">Logout</a>\n");
      out.write("      </div>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("     <div class=\"container\">\n");
      out.write("      <div class=\"sidebar\" id=\"sidebar\"></div>\n");
      out.write("      <div id=\"mainBody\"></div>\n");
      out.write("      <div class=\"todisplay\">\n");
      out.write("        <div class=\"tournmentBlock\">\n");
      out.write("         ");
 while(rs.next()){ 
      out.write("\n");
      out.write("          <label><br>Tournament Name: ");
      out.print( rs.getString("name") );
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
      out.write("                        ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("      function sidebar() {\n");
      out.write("        console.log(\"sidebar\");\n");
      out.write("        document.getElementById(\"sidebar\").innerHTML = `\n");
      out.write("        <ul>\n");
      out.write("          <li><span id=\"tournment\">Create Tournament</span></li>\n");
      out.write("          <li><span id=\"news\">Upload Statistics</span></li>\n");
      out.write("          <li><span id=\"about\">Generate Match Schedule</span></li>\n");
      out.write("          <li><span id=\"contact\">View Scoreboard</span></li>\n");
      out.write("          <li><span id=\"about\">View Match Schedule</span></li>\n");
      out.write("          <li><span id=\"about\">Check Payment Status</span></li>\n");
      out.write("\n");
      out.write("        </ul>\n");
      out.write("        `;\n");
      out.write("      }\n");
      out.write("      sidebar();\n");
      out.write("      document.querySelector(\"#tournment\").addEventListener(\n");
      out.write("        \"click\",\n");
      out.write("        function (event) {\n");
      out.write("          event.preventDefault();\n");
      out.write("          document.getElementById(\"mainBody\").innerHTML = `\n");
      out.write("          <form class=\"tounamentForm\" action=\"CreateTourna.jsp\" method=\"post\">\n");
      out.write("          <h1>Create Tournament</h1>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Tournament Name </label>\n");
      out.write("            <input name=\"name\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Number of Teams</label>\n");
      out.write("            <input name=\"noofteams\" type=\"text\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>Start Date</label>\n");
      out.write("            <input name=\"sdate\" type=\"date\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label>End Date</label>\n");
      out.write("            <input name=\"edate\" type=\"date\" />\n");
      out.write("          </div>\n");
      out.write("          <div class=\"inputBox\">\n");
      out.write("            <label></label>\n");
      out.write("            <input type=\"submit\">\n");
      out.write("          </div>\n");
      out.write("        </form>`;\n");
      out.write("        },\n");
      out.write("        false\n");
      out.write("      );\n");
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
