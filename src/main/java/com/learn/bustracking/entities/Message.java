/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learn.bustracking.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

/**
 *
 * @author ROHIT
 */
@Entity
public class Message {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(length = 10,name="msg_Id")
    private int msgId;
    @Column(length = 3000,name="message_content")
    private String messageContent;
    @ManyToOne
    private Driver driver;
    @ManyToOne
    private User user;

    public Message() {
    }

    public Message(int msgId, String messageContent, Driver driver, User user) {
        this.msgId = msgId;
        this.messageContent = messageContent;
        this.driver = driver;
        this.user = user;
    }

    public Message(String messageContent, Driver driver, User user) {
        this.messageContent = messageContent;
        this.driver = driver;
        this.user = user;
    }

    public int getMsgId() {
        return msgId;
    }

    public void setMsgId(int msgId) {
        this.msgId = msgId;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public Driver getDriver() {
        return driver;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Message{" + "msgId=" + msgId + ", messageContent=" + messageContent + ", driver=" + driver + ", user=" + user + '}';
    }
    
    
    
}
