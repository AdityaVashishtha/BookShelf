/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookshelf.functions;

import com.bookshelf.data.Users;
import com.bookshelf.utillity.SQLConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aditya
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Connection connection = SQLConnection.createConnection();
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");            
            out.println("</head>");
            out.println("<body>");          
            try {
                String uid = request.getParameter("userid");
                String password = request.getParameter("password");
                MessageDigest md5 = MessageDigest.getInstance("MD5");
                md5.update(StandardCharsets.UTF_8.encode(password));
                String hashedPass = String.format("%032x", new BigInteger(1, md5.digest())).toString();         
                
                String query = "select * from users where user_id = ? and password = ?";
                
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, uid);
                ps.setString(2, hashedPass);
                
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                 out.println("<h1>Servlet Login at " + rs.getString("name") + "</h1>");   
                    HttpSession session =  request.getSession();
                    session.setAttribute("user_id", uid);
                    Users user = new Users(rs.getString("name"), rs.getString("user_id"), rs.getString("password"),rs.getString(3), rs.getString("user_type"));
                    session.setAttribute("user", user);
                    response.sendRedirect("bookshelf/index.jsp");
                } else {
                    out.println("<script>alert('Invalid Username or password!!')</script>");
                    response.sendRedirect("bookshelf/login.jsp?error=invalid_user_password");
                }               
            } catch (Exception e) {
                out.println("<h1>This "+e+"</h1>");
                //response.sendRedirect("bookshelf/login.html");
            }                        
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
