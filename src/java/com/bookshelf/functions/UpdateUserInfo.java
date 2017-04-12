/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookshelf.functions;

import com.bookshelf.utillity.SQLConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aditya
 */
@WebServlet(name = "UpdateUserInfo", urlPatterns = {"/UpdateUserInfo"})
public class UpdateUserInfo extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Updating user info</title>");            
            out.println("</head>");
            out.println("<body>");            
            String user = request.getParameter("uid");
            String name = request.getParameter("fname");
            String email = request.getParameter("email");
            String mob = request.getParameter("mobile");
            String dept_id = request.getParameter("dept");
            out.println("<h1>Updating user info :: "+user+"</h1>");
            int quota = Integer.parseInt(request.getParameter("quota"));
            try {
                String query = "UPDATE `user_profile` SET `name`=?,`email`=?,`mobile`=?,`dept_id`=?,`quota`=? WHERE user_id=?";
                Connection con = SQLConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(6, user);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, mob);
                ps.setString(4, dept_id);
                ps.setInt(5, quota);
                int x = ps.executeUpdate();
                if(x>0) {
                    out.println("<h1>Updated user info :: "+user+"</h1>");
                } else {
                    out.println("<h1>Could not update user info :: "+user+"</h1>");
                }
                out.println("<h1><a href='index.jsp'>Home</a></h1>");
            } catch (Exception e) {
                out.println("<h1>Could not update user info due to  :: "+e+"</h1>");
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
