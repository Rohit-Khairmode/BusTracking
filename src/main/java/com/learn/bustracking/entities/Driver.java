/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learn.bustracking.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author ROHIT
 */
@Entity
public class Driver {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(length = 10,name="driver_Id")
    private int driverId;
    @Column(length = 100,name="driver_name")
    private String driverName;
    @Column(length = 100,name="driver_email")
    private String driverEmail;
    @Column(length = 100,name="driver_password")
    private String driverPassword;
    @Column(length = 12,name="driver_phone")
    private String driverPhone;
    
    @OneToOne
    private Bus bus;
    @ManyToMany(fetch=FetchType.EAGER, mappedBy ="driver")
    private List<Location> location =new ArrayList<>();

    public Driver() {
    }

    public Driver(int driverId, String driverName, String driverEmail, String driverPassword, String driverPhone, Bus bus) {
        this.driverId = driverId;
        this.driverName = driverName;
        this.driverEmail = driverEmail;
        this.driverPassword = driverPassword;
        this.driverPhone = driverPhone;
        this.bus = bus;
    }

    public Driver(String driverName, String driverEmail, String driverPassword, String driverPhone, Bus bus) {
        this.driverName = driverName;
        this.driverEmail = driverEmail;
        this.driverPassword = driverPassword;
        this.driverPhone = driverPhone;
        this.bus = bus;
    }
    
    
    public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getDriverEmail() {
        return driverEmail;
    }

    public void setDriverEmail(String driverEmail) {
        this.driverEmail = driverEmail;
    }

    public String getDriverPassword() {
        return driverPassword;
    }

    public void setDriverPassword(String driverPassword) {
        this.driverPassword = driverPassword;
    }

    public String getDriverPhone() {
        return driverPhone;
    }

    public void setDriverPhone(String driverPhone) {
        this.driverPhone = driverPhone;
    }

    public Bus getBus() {
        return bus;
    }

    public void setBus(Bus bus) {
        this.bus = bus;
    }

    public List<Location> getLocation() {
        return location;
    }

    public void setLocation(List<Location> location) {
        this.location = location;
    }
    
    

    @Override
    public String toString() {
        return "Driver{" + "driverId=" + driverId + ", driverName=" + driverName + ", driverEmail=" + driverEmail + ", driverPassword=" + driverPassword + ", driverPhone=" + driverPhone + ", bus=" + bus + '}';
    }
    
    
    
    
}
