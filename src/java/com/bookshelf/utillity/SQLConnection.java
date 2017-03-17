/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookshelf.utillity;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author aditya
 */
public class SQLConnection {
    
    public static final int BOOKFINE = 1;
    
    public static Connection createConnection() {
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/bookshelf?zeroDateTimeBehavior=convertToNull","root","");  
             return con;
        } catch (Exception e) {
            System.out.println(""+e);
        }
        return null;        
    }
}
