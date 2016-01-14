package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class view_005fcomplaint_005fhome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(4);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/sidepane1.jsp");
    _jspx_dependants.add("/connection_db.jsp");
    _jspx_dependants.add("/cache_admin.jsp");
  }

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n");
      out.write("        <title>Complaints Home</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n");
      out.write("<title>Complaint management System</title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("<div id=\"container\">\n");
      out.write("\t\t<div id=\"header\">\n");
      out.write("        \t<h1>CMS<span class=\"off\"></span></h1>\n");
      out.write("            \n");
      out.write("        </div>   \n");
      out.write("        \n");
      out.write("        <div id=\"menu\">\n");
      out.write("        \t<ul>\n");
      out.write("                    ");

                        //if(s){
                            
                        //}
                        String sa=(String)session.getAttribute("admin_sess_attr");
                        String su=(String)session.getAttribute("user_id");
                        String scr=(String)session.getAttribute("CR_sess_attr");
        if(sa==null && su==null && scr==null){
                        
      out.write("\n");
      out.write("            \t<li class=\"menuitem\"><a href=\"majr_home.jsp\">Home</a></li>\n");
      out.write("                ");

        }
        else if (sa!=null){
            
      out.write("\n");
      out.write("                <li class=\"menuitem\"><a href=\"admin_home.jsp\">Admin Home</a></li>\n");
      out.write("                \n");
      out.write("                ");

            }
        else if (su!=null){
            
      out.write("\n");
      out.write("                <li class=\"menuitem\"><a href=\"features.jsp\">User Home</a></li>\n");
      out.write("                \n");
      out.write("                ");

            }
        else{
      out.write("\n");
      out.write("            <li class=\"menuitem\"><a href=\"CR_home.jsp\">CR Home</a></li>\n");
      out.write("            \n");
      out.write("      ");
  }
            
      out.write("\n");
      out.write("                <li class=\"menuitem\"><a href=\"#\">About</a></li>\n");
      out.write("                <li class=\"menuitem\"><a href=\"#\">Products</a></li>\n");
      out.write("                <li class=\"menuitem\"><a href=\"#\">Services</a></li>\n");
      out.write("                <li class=\"menuitem\"><a href=\"#\">Design</a></li>\n");
      out.write("              <li class=\"menuitem\"><a href=\"#\">Contact</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    \n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"leftmenu\">\n");
      out.write("\n");
      out.write("        <div id=\"leftmenu_top\"></div>\n");
      out.write("\n");
      out.write("\t\t\t\t<div id=\"leftmenu_main\">    \n");
      out.write("                \n");
      out.write("                <h3>Links</h3>\n");
      out.write("                        \n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"logout.jsp\">Log Out</a></li>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                </ul>\n");
      out.write("</div>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("              <div id=\"leftmenu_bottom\"></div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write('\n');
      out.write('\n');

    
    Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","nishtha");
                ResultSet rs=null,rs1=null;
                Statement st=con.createStatement();

    
      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    ");

        /*HttpSession se=request.getSession(false);
        if(se==null){
            response.sendRedirect("admin_login.jsp");
        }*/
        String s=(String)session.getAttribute("admin_sess_attr");
        
        //Cookie[] ck=request.getCookies();
        //out.println("<h3>"+ck.length);
        //if(ck.length==1){
          //  response.sendRedirect("majr_home.jsp");
        //}
        if(s==null ){
        
            response.sendRedirect("admin_login.jsp");
            
        }
        
        /*Cookie[] c=request.getCookies();
        if(c!=null){
            out.println("HELLO");
            for(int i=0;i<c.length;i++){
                String name=c[i].getName();
                String value=c[i].getValue();
                //if(i!=0)
                out.println("Wecome ----------- "+ value);
            }
        }
        if(c==null){
            out.println("your session has expired");
            response.sendRedirect("admin_login.jsp");
        }*/
        
      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("    \n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <br><br><br><br><br><br><br><br><br><br><br>\n");
      out.write("        <table>\n");
      out.write("            <tbody>\n");
      out.write("                <tr>\n");
      out.write("                    <h3><a href=\"view_all_complaint.jsp\">View All Complaints registered in the database</a></h3>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <h3><a href=\"view_student.jsp\">View All Student Complaints</a></h3>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <h3><a href=\"view_employee.jsp\">View All Employee Complaints</a></h3>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                <h3><a href=\"location_select.jsp\">View Complaints Location wise</a></h3>\n");
      out.write("                </tr>\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("            <input type=\"button\" value =\"Back\" name =\"Back\" onclick=\"history.back();\">\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
