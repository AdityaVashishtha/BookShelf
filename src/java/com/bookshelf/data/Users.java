/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookshelf.data;

/**
 *
 * @author aditya
 */
public class Users {
    
    private String name;
    private String user_id;
    private String password;
    private String time;
    private String user_type;

    public Users(String name, String user_id, String password, String time, String user_type) {
        this.name = name;
        this.user_id = user_id;
        this.password = password;
        this.time = time;
        this.user_type = user_type;
    }

    public String getName() {
        return name;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getPassword() {
        return password;
    }

    public String getTime() {
        return time;
    }

    public String getUser_type() {
        return user_type;
    }
    
    
    
}
