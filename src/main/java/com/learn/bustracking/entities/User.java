/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learn.bustracking.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;
import javax.persistence.Id;

/**
 *
 * @author ROHIT
 */
@Entity
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(length = 10,name="user_Id")
    private int userId;
    @Column(length = 100,name="user_name")
    private String userName;
    @Column(length = 100,name="user_email")
    private String userEmail;
    @Column(length = 100,name="user_password")
    private String userPassword;
    @Column(length = 12,name="user_phone")
    private String userPhone;
    @Column(length=100,name="user_type")
    private String userType;
    @ManyToOne
    private Bus bus; 
    @OneToMany(mappedBy="user")
    private List<Message> msg = new ArrayList<>();

    public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userType) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userType = userType;
    }

    public User(String userName, String userEmail, String userPassword, String userPhone, String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userType = userType;
    }

    public User(String userName, String userEmail, String userPassword, String userPhone, String userType, Bus bus) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userType = userType;
        this.bus = bus;
    }
    
    
    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public Bus getBus() {
        return bus;
    }

    public void setBus(Bus bus) {
        this.bus = bus;
    }

    public List<Message> getMsg() {
        return msg;
    }

    public void setMsg(List<Message> msg) {
        this.msg = msg;
    }

    

    
    
    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userType=" + userType + '}';
    }
    
    
}
