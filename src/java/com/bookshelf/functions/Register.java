/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookshelf.functions;

import com.bookshelf.utillity.SQLConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;
import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author aditya
 */
public class Register extends HttpServlet {
    
    
    private boolean isMultipart;
    private String filePath;
    private int maxFileSize = 1000 * 1024;
    private int maxMemSize = 4 * 1024;
    private File file ;
    private String FILEPATH = filePath;

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
        
        isMultipart = ServletFileUpload.isMultipartContent(request);
        
        String fname = "";
        String uid = "";
        String address = "";
        String mobile = "";
        String email = "";
        String dept =  "";
        int quota = 0;
        String date= "";
        String user_type = "";    
        long fileSize = 0 ;
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if( !isMultipart ){
               out.println("<html>");
               out.println("<head>");
               out.println("<title>Servlet upload</title>");  
               out.println("</head>");
               out.println("<body>");
               out.println("<p>No file uploaded</p>"); 
               out.println("</body>");
               out.println("</html>");
               return;
            }
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(maxMemSize);
            factory.setRepository(new File("/tmp/"));
            
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax( maxFileSize );
            try {
                List fileItems = upload.parseRequest(request);
                Iterator i = fileItems.iterator();
                
                
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet upload</title>");  
                out.println("</head>");
                out.println("<body>");                   
                while(i.hasNext()) {
                    FileItem fi = (FileItem) i.next();
                    if ( !fi.isFormField()) {
                        // Get the uploaded file parameters
                        String fieldName = fi.getFieldName();
                        String fileName = fi.getName();
                        String contentType = fi.getContentType();
                        boolean isInMemory = fi.isInMemory();
                        long sizeInBytes = fi.getSize();
                        fileSize = sizeInBytes;
                        // Write the file
                        if( fileName.lastIndexOf("\\") >= 0 ){
                           FILEPATH = filePath + 
                           fileName.substring( fileName.lastIndexOf("\\"));
                           file = new File( filePath + 
                           fileName.substring( fileName.lastIndexOf("\\"))) ;
                        }else{
                            FILEPATH = filePath + 
                           fileName.substring(fileName.lastIndexOf("\\")+1);
                           file = new File( filePath + 
                           fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                        }
                        
                        String mimetype= new MimetypesFileTypeMap().getContentType(file);
                        String type = mimetype.split("/")[0];
                        if(type.equals("image")) {
                            fi.write( file ) ;
                            out.println("Given File named as ::"+FILEPATH);                    
                        }                            
                        else 
                            out.println("Given File is not Image, File type is ::"+type);                    
                                                                        
                        //out.println("Uploaded Filename: " + fileName + "<br>");                    
                    }
                    else {                                                 
                        switch(fi.getFieldName() ) {
                            case "fname": fname = fi.getString();
                                break;
                            case "uid": uid = fi.getString();
                                break;
                            case "address": address = fi.getString();
                                break;
                            case "mobile": mobile = fi.getString();
                                break;
                            case "email": email = fi.getString();
                                break;
                            case "dept": dept = fi.getString();
                                break;
                            case "quota": quota = Integer.parseInt(fi.getString());
                                break;
                            case "user_type": user_type = fi.getString();
                                break;
                            case "date": date = fi.getString();
                                break;
                        }
                    }
                    
                }                
                
                boolean isInserted = insertUser(fname, uid, address, email, date, mobile, dept, quota, user_type, FILEPATH, fileSize,response,request);
                if(isInserted) {
                    out.println("<br>User Registration Successfull ");
                    response.sendRedirect("bookshelf/index.jsp");
                } else {
                    out.println("Some Error Occured");
                }
                out.println("</body>");
                out.println("</html>");                
            } catch (Exception e) {
                out.println(e);
            }                                    
        }
    }

    @Override
    public void init() throws ServletException {
        long unixTime = System.currentTimeMillis();
        filePath = 
             getServletContext().getInitParameter("file-upload") + unixTime + "_" ; 
        //super.init(); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public static boolean insertUser(String fname,String uid,String address,String email,String date,String mobile,String dept,int quota,String user_type, String filePath,long fileSize ,HttpServletResponse response,HttpServletRequest request) {        
        try (PrintWriter out = response.getWriter())  {            
            Connection connection = SQLConnection.createConnection();
            String password = "31528198109743225ff9d0cf04d1fdd1";
            String query;
            
            String year = date.split("/")[2];
            String month = date.split("/")[1];
            String day = date.split("/")[0];
            
            date = year+"/"+month+"/"+day;
            
            query = "select * from users where user_id=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, uid);
            ResultSet rs = ps.executeQuery();
            if(!rs.next())
            {
                query = "INSERT INTO `users`(`user_id`, `name`, `password`,  `user_type`) VALUES (?, ? , ? , ? )";            
                ps = connection.prepareStatement(query);
                ps.setString(1, uid);
                ps.setString(2, fname);
                ps.setString(3, password);
                ps.setString(4, user_type);            
                if(ps.execute()) {
                        out.println("User not Inserted");
                        
                }                
                else {
                    out.println("User Inserted");   
                    
                    query = "INSERT INTO `image`(`img_path`, `img_alt`, `img_size`,  `img_type`) VALUES (?, ? , ? , ? )";            
                    ps = connection.prepareStatement(query);
                    ps.setString(1, filePath);
                    ps.setString(2, fname+" profile picture");
                    ps.setLong(3, fileSize);
                    ps.setString(4, "profile");            
                    if(ps.execute()) {
                        out.println("Image not Inserted");
                    } else {
                        out.println("Image Inserted");
                        query = "INSERT INTO `user_profile`(`user_id`, `name`, `email`, `mobile`, `admission_date`, `dept_id`, `quota`, `profile_img`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                        ps = connection.prepareStatement(query);
                        ps.setString(1, uid);
                        ps.setString(2, fname);
                        ps.setString(3, email);
                        ps.setString(4, mobile);
                        ps.setString(5, date);
                        ps.setString(6, dept);
                        ps.setInt(7, quota);
                        ps.setString(8, filePath);
                        if(ps.execute()) {
                            out.println("User Details not Inserted");
                        } else {
                            out.println("User Details Inserted");
                            out.println("<br>User Registration Successfull ");
                            response.sendRedirect("bookshelf/index.jsp");
                            return true;
                        }
                    }                                                            
                }                    
            } else {
                    out.println("UserID already exists!");
            }                        
            connection.close();
        } catch (Exception e) {            
                System.out.println("User not Inserted due to Exception :: "+e);            
        } 
        
        return false;
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
