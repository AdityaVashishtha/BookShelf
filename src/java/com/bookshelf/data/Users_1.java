/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookshelf.data;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aditya
 */
@Entity
@Table(name = "users")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Users_1.findAll", query = "SELECT u FROM Users_1 u")
    , @NamedQuery(name = "Users_1.findByUserId", query = "SELECT u FROM Users_1 u WHERE u.userId = :userId")
    , @NamedQuery(name = "Users_1.findByName", query = "SELECT u FROM Users_1 u WHERE u.name = :name")
    , @NamedQuery(name = "Users_1.findByPassword", query = "SELECT u FROM Users_1 u WHERE u.password = :password")
    , @NamedQuery(name = "Users_1.findByLastllogin", query = "SELECT u FROM Users_1 u WHERE u.lastllogin = :lastllogin")
    , @NamedQuery(name = "Users_1.findByUserType", query = "SELECT u FROM Users_1 u WHERE u.userType = :userType")})
public class Users_1 implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "user_id")
    private String userId;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @Column(name = "lastllogin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastllogin;
    @Basic(optional = false)
    @Column(name = "user_type")
    private String userType;

    public Users_1() {
    }

    public Users_1(String userId) {
        this.userId = userId;
    }

    public Users_1(String userId, String name, String password, Date lastllogin, String userType) {
        this.userId = userId;
        this.name = name;
        this.password = password;
        this.lastllogin = lastllogin;
        this.userType = userType;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getLastllogin() {
        return lastllogin;
    }

    public void setLastllogin(Date lastllogin) {
        this.lastllogin = lastllogin;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Users_1)) {
            return false;
        }
        Users_1 other = (Users_1) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.bookshelf.data.Users_1[ userId=" + userId + " ]";
    }
    
}
