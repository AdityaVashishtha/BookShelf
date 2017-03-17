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
@WebServlet(name = "IssueBook", urlPatterns = {"/IssueBook"})
public class IssueBook extends HttpServlet {

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
            String userid = request.getParameter("userid");
            int time  = Integer.parseInt(request.getParameter("time"));
            if(bookid.length() < 1 || userid.length() < 1 || time < 30) {
                out.println("Some Error Occured");
            } else {
                String query;
                Connection connection = SQLConnection.createConnection();
                try {
                    query = "select * from issued_book where book_id = ?";
                    PreparedStatement ps = connection.prepareStatement(query);
                    ps.setString(1, bookid);
                    ResultSet rs;
                    rs = ps.executeQuery();
                    if(rs.next()) {
                        out.print("This Book is already issued to someone");                        
                    } else {
                        query = "select quota, issued_book from user_profile "
                                + "where user_id = ?";
                        ps = connection.prepareStatement(query);
                        ps.setString(1, userid);
                        rs = ps.executeQuery();
                        if(rs.next()) {
                            int quota = rs.getInt(1);
                            int issued_book = rs.getInt(2);
                            if(quota > issued_book){
                                query = "SELECT isbn FROM book where book_id=?";
                                ps = connection.prepareStatement(query);
                                ps.setString(1, bookid);
                                rs = ps.executeQuery();
                                if(rs.next()) {
                                    String isbn = rs.getString(1);
                                    query = "select isbn from book natural join issued_book where isbn=? and user_id= ?";
                                    ps = connection.prepareStatement(query);
                                    ps.setString(1, isbn);
                                    ps.setString(2, userid);
                                    rs = ps.executeQuery();
                                    if(rs.next()) {
                                        out.print("User already has issued book with same ISBN");
                                    } else {
                                        query = "INSERT INTO `issued_book` "
                                                + "(`book_id`, `user_id`, `issue_date`, `due_date`) "
                                                + "VALUES (? , ? , now(), DATE_ADD(now(),INTERVAL ? DAY));";
                                        ps = connection.prepareStatement(query);
                                        ps.setString(1, bookid);
                                        ps.setString(2, userid);
                                        ps.setInt(3, time);
                                        int x = ps.executeUpdate();
                                        if(x >0) {
                                            query = "update user_profile set issued_book = issued_book + 1 where user_id = ?";
                                            ps = connection.prepareStatement(query);
                                            ps.setString(1, userid);
                                            x = ps.executeUpdate();
                                            if(x>0) {
                                                out.print("Book Issued");
                                            } else {
                                                out.print("Book Issued but not updated.");
                                            }                
                                        } else {
                                            out.print("Book not issued due to some error");
                                        }
                                    }
                                }
                            } else {
                                out.print("Books Limit reached ::"+quota+"/"+issued_book);
                            }
                        } else {
                            out.print("Some Error might have occured.");
                        }
                    }
                } catch (Exception e) {
                }
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
