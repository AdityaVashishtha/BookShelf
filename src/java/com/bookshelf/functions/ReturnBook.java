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
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aditya
 */
@WebServlet(name = "ReturnBook", urlPatterns = {"/ReturnBook"})
public class ReturnBook extends HttpServlet {

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
            String bookid = request.getParameter("bookid");
            String query = "select *, datediff(now(),due_date)*? as fine from issued_book where book_id=?";
            Connection connection = SQLConnection.createConnection();
            try {
                PreparedStatement ps = connection.prepareStatement(query);
                int x = 1;//SQLConnection.BOOKFINE;
                ps.setInt(1, x);
                ps.setString(2, bookid);
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                    String userid = rs.getString(2);
                    Timestamp issueDate = rs.getTimestamp(3);
                    Timestamp dueDate = rs.getTimestamp(4);
                    int fine = rs.getInt(5);
                    if(fine < 0) {
                        fine = 0;
                    } 
                    query = "INSERT INTO `receipt`(`book_id`, `user_id`, `submission_date`, `issue_date`, `due_date`, `fine`) VALUES (?,?,CURRENT_TIMESTAMP,?,?,?);";
                    ps = connection.prepareStatement(query);
                    ps.setString(1, bookid);
                    ps.setString(2, userid);
                    ps.setTimestamp(3, issueDate);
                    ps.setTimestamp(4, dueDate);  
                    ps.setInt(5, fine);
                    x = ps.executeUpdate();
                    if(x>0) {
                        query = "DELETE FROM `issued_book` WHERE book_id=?";
                        ps = connection.prepareStatement(query);
                        ps.setString(1, bookid);
                        x = ps.executeUpdate();
                        if(x>0) {
                            query = "update user_profile set issued_book = issued_book - 1 where user_id = ?";
                            ps = connection.prepareStatement(query);
                            ps.setString(1, userid);
                            x = ps.executeUpdate();
                            if(x>0) {
                                out.print("Book Returned");
                            } else {
                                out.print("Book Returned but not updated.");
                            }
                        } else {
                            out.print("Book receipt generated, Book record not deleted !!");
                        }
                    } else {
                        out.print("Some error occured");
                    }
                    
                } else {
                    out.print("Book not issued to anyone!");
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
