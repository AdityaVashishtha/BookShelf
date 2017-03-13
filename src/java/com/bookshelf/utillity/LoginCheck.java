/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookshelf.utillity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aditya
 */
public class LoginCheck {
    
    public static boolean checkLogin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");
        if(userId == null) {
            return false;
        }
        else 
            return true;
    }    
}
