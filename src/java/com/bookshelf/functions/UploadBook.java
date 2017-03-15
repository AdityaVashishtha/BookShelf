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
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aditya
 */
@WebServlet(name = "UploadBook", urlPatterns = {"/UploadBook"})
public class UploadBook extends HttpServlet {

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
            String isbn = request.getParameter("isbn");
            String bookid = request.getParameter("bookid");
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String desc = request.getParameter("desc");
            String date = request.getParameter("date");
            int page = Integer.parseInt(request.getParameter("page"));
            String thumbnail = request.getParameter("thumbnail");
            
            Connection connection = SQLConnection.createConnection();
            try {
                String query = "Select * from book_info where isbn=?";
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, isbn);
                ResultSet rs = ps.executeQuery();
                if(!rs.next()) {
                    query = "INSERT INTO `book_info`(`isbn`, `title`, `author`, `publisher`, `description`, `pagecount`, `thumbnail`, `publishdate`, `rating`) VALUES (?,?,?,?,?,?,?,?,?)";
                    ps = connection.prepareStatement(query);
                    ps.setString(1, isbn);
                    ps.setString(2, title);
                    ps.setString(3, author);
                    ps.setString(4, publisher);
                    ps.setString(5, desc);
                    ps.setInt(6, page);
                    ps.setString(7,thumbnail);
                    ps.setString(8, date);
                    ps.setInt(9, 0);
                    int x = ps.executeUpdate();
                    if (x>0) {
                        out.print("isbn inserted <br>");
                    }
                } 
                query = "Select * from book where book_id=?";
                ps = connection.prepareStatement(query);
                ps.setString(1, bookid);
                rs = ps.executeQuery();
                if(!rs.next()) {
                    query = "INSERT INTO `book`(`book_id`, `isbn`, `added_on`) VALUES (?,?,CURRENT_DATE)";
                    ps = connection.prepareStatement(query);
                    ps.setString(1, bookid);
                    ps.setString(2, isbn);
                    int x = ps.executeUpdate();
                    if(x>0) {
                        out.print("book Inserted with bookid !! <br>");
                        response.sendRedirect("bookshelf/index.jsp");
                    }
                } else {
                    out.print("book id already existing !! not inserted !!");
                }
                
                
            } catch (Exception e) {
            }
            
            
            
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
