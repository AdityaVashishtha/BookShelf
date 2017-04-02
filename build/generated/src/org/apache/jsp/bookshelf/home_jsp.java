package org.apache.jsp.bookshelf;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>BookShelf, search your books here !!</title>\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <link type=\"text/css\" href=\"./css/bootstrap.min.css\" rel=\"stylesheet\">    \n");
      out.write("        \n");
      out.write("    <link rel=\"shortcut icon\" type=\"image/png\" href=\"images/icon/open-book.png\" />\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"./css/style.css\">        \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<div class=\"main-menu\">\n");
      out.write("\t\t<div class=\"menu-logo\"></div>\n");
      out.write("\t\t<div class=\"main-search-div search-div\" id=\"id1\">\n");
      out.write("                    <input class=\"search-input\" id=\"main-search-input\" type=\"text\" name=\"search\" autocomplete=\"off\">\n");
      out.write("                    <input id=\"searchSubmit\" type=\"submit\" name=\"searchSubmit\" value=\"\">\n");
      out.write("                    <div class=\"search-suggestion\">\n");
      out.write("                        <ul>\n");
      out.write("                            \n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("\t\t</div>\n");
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
      out.write("\t\t<div class=\"result-div\">\t\t\t\t\t\t\n");
      out.write("\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"filter-div\">\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t<footer class=\"footer\">\n");
      out.write("\t\t<div class=\"footer-note\">\n");
      out.write("\t\t\tProject Created by Aditya Vashishtha, Abhishek Verma, and Vivek Brahmne\n");
      out.write("\t\t</div>\n");
      out.write("\t</footer>\n");
      out.write("        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->\n");
      out.write("        <script src=\"js/jquery-2.2.4.min.js\"></script>\n");
      out.write("        <!-- Include all compiled plugins (below), or include individual files as needed -->\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("\t<script type=\"text/javascript\" src=\"js/index.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/ajaxIndexPage.js\"></script>\n");
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
