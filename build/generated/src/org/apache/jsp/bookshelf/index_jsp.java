package org.apache.jsp.bookshelf;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.bookshelf.data.Users;
import com.bookshelf.utillity.LoginCheck;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
  Users user=null;
    if( !LoginCheck.checkLogin(request) ) {
            response.sendRedirect("login.html");
    } 
    else {
        user = (Users) session.getAttribute("user");        
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Profile, Your request, dues, books here !!</title>\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <link rel=\"shortcut icon\" type=\"image/png\" href=\"images/icon/open-book.png\" />\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"./css/style.css\">        \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<div class=\"main-menu\">\n");
      out.write("\t\t<div class=\"menu-logo\"></div>\n");
      out.write("\t\t<div class=\"search-div\" id=\"id1\">\n");
      out.write("\t\t\t<input class=\"search-input\" type=\"text\" name=\"search\">\n");
      out.write("\t\t\t<input type=\"submit\" name=\"searchSubmit\" value=\"\">\n");
      out.write("\t\t</div>\n");
      out.write("                \n");
      out.write("\t\t<div class=\"menu-button\">\n");
      out.write("\t\t\t\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"float-menu\">\n");
      out.write("\t\t\t<ul>\n");
      out.write("\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t<a href=\"\">\n");
      out.write("\t\t\t\t\t\t<img class=\"menu-image-button\" src=\"images/icon/notebook.png\" alt=\"menu-logo\" >\n");
      out.write("\t\t\t\t\t\t<span>Take Note</span>\n");
      out.write("\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t<a href=\"\">\n");
      out.write("\t\t\t\t\t\t<img class=\"menu-image-button\" src=\"images/icon/notebook(11).png\" alt=\"menu-logo\" >\n");
      out.write("\t\t\t\t\t\t<span>Search Book</span>\n");
      out.write("\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t<a href=\"\">\n");
      out.write("\t\t\t\t\t\t<img class=\"menu-image-button\" src=\"images/icon/bookmark.png\" alt=\"menu-logo\" >\n");
      out.write("\t\t\t\t\t\t<span>Search Book</span>\n");
      out.write("\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t<a href=\"\">\n");
      out.write("\t\t\t\t\t\t<img class=\"menu-image-button\" src=\"images/icon/pencil-case.png\" alt=\"menu-logo\" >\n");
      out.write("\t\t\t\t\t\t<span>Search Book</span>\n");
      out.write("\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t<a href=\"\">\n");
      out.write("\t\t\t\t\t\t<img class=\"menu-image-button\" src=\"images/icon/notebook(20).png\" alt=\"menu-logo\" >\n");
      out.write("\t\t\t\t\t\t<span>Search Book</span>\n");
      out.write("\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("                                <li>\n");
      out.write("\t\t\t\t\t<a href=\"../Logout\">\n");
      out.write("\t\t\t\t\t\t<img class=\"menu-image-button\" src=\"images/icon/logout.png\" alt=\"menu-logo\" >\n");
      out.write("\t\t\t\t\t\t<span>Logout</span>\n");
      out.write("\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\t\t\n");
      out.write("\t<div class=\"main-body\">\n");
      out.write("\t\t\n");
      out.write("\t\t<div class=\"profile-detail\">\n");
      out.write("                    <div class=\"welcome-note\">Welcome, admin</div>\n");
      out.write("\t\t\t<div class=\"personal-detail\">\n");
      out.write("\t\t\t\t<div class=\"userId\">14BB520141</div>\n");
      out.write("\t\t\t\t<div class=\"profile-image\">\n");
      out.write("\t\t\t\t\t<img src=\"images/icon/man.png\" alt=\"profile-image\" />\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"personal-profile\">\n");
      out.write("                                    <p class=\"name\">\n");
      out.write("                                        ");

                                            try {
                                                    out.println(user.getName());
                                                } catch (Exception e) {
                                                    out.println(e);
                                                }                                            
                                        
      out.write("\n");
      out.write("                                    </p>\n");
      out.write("\t\t\t\t\t<p class=\"stream\">0801CS141005</p>\n");
      out.write("\t\t\t\t\t<p class=\"stream\">BE (Computer Engineering)</p>\n");
      out.write("\t\t\t\t\t<p class=\"mobile\">41/B Block - M Sector C, New Place, New City, 10015</p>\n");
      out.write("\t\t\t\t\t<p class=\"email\">+91-4440-520140</p>\n");
      out.write("\t\t\t\t\t<p class=\"address\">JDNO@gmail.com</p>\t\t\t\t\t\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"current-issue\">\n");
      out.write("\t\t\t\t<div class=\"fine-detail\">\n");
      out.write("\t\t\t\t\t<p>Total Fine</p>\n");
      out.write("\t\t\t\t\t<p>4.00</p>\n");
      out.write("\t\t\t\t\t<p>Book Allow</p>\n");
      out.write("\t\t\t\t\t<p>2/3</p>\n");
      out.write("\t\t\t\t\t<p>Issued</p>\n");
      out.write("\t\t\t\t\t<p>3</p>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"issued-book\">\n");
      out.write("\t\t\t\t<div class=\"title\">Issued Book details:</div>\n");
      out.write("\t\t\t\t\t<div class=\"book-item\">\n");
      out.write("\t\t\t\t\t\t<img src=\"images/icon/agenda.png\" alt=\"Book Desc\" />\n");
      out.write("\t\t\t\t\t\t<p class=\"book-title\">Book 1</p>\n");
      out.write("\t\t\t\t\t\t<div>Issued On</div>\n");
      out.write("\t\t\t\t\t\t<div>17 Feb 2016 04:54 PM</div>\n");
      out.write("\t\t\t\t\t\t<div>Issued Till</div>\n");
      out.write("\t\t\t\t\t\t<div>16 Mar 2016 04:54 PM</div>\n");
      out.write("\t\t\t\t\t\t<div>Extended Days</div>\n");
      out.write("\t\t\t\t\t\t<div>7</div>\n");
      out.write("\t\t\t\t\t</div>\t\t\t\t\t\n");
      out.write("\t\t\t\t\t<div class=\"book-item\">\n");
      out.write("\t\t\t\t\t\t<img src=\"images/icon/agenda(1).png\" alt=\"Book Desc\" />\n");
      out.write("\t\t\t\t\t\t<p class=\"book-title\">Book 2</p>\n");
      out.write("\t\t\t\t\t\t<div>Issued On</div>\n");
      out.write("\t\t\t\t\t\t<div>17 Feb 2016 04:54 PM</div>\n");
      out.write("\t\t\t\t\t\t<div>Issued Till</div>\n");
      out.write("\t\t\t\t\t\t<div>16 Mar 2016 04:54 PM</div>\n");
      out.write("\t\t\t\t\t\t<div>Extended Days</div>\n");
      out.write("\t\t\t\t\t\t<div>7</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"side-detail\">\n");
      out.write("\t\t\t<div class=\"s-search\">\n");
      out.write("\t\t\t\t<div class=\"title\">Student/Book Search</div>\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"ssearch\" autocomplete=\"off\">\t\t\t\t\n");
      out.write("\t\t\t\t\t<input type=\"submit\" name=\"loupe\" value=\"Search\" >\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t</div>\n");
      out.write("\t<footer class=\"footer\">\n");
      out.write("\t\t<div class=\"footer-note\">\n");
      out.write("\t\t\tProject Created by Aditya Vashishtha, Abhishek Verma, and Vivek Brahmne\n");
      out.write("\t\t</div>\n");
      out.write("\t</footer>\n");
      out.write("\t<script type=\"text/javascript\" src=\"js/index.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
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
