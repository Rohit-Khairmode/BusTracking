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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author ROHIT
 */
@Entity
public class Bus {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(length = 10,name="bus_Id")
    private int busId;
    @Column(length = 100,name="bus_name")
    private String busName;
    @Column(length = 100,name="bus_number")
    private String busNumber;
    @Column(length = 3000,name="bus_route")
    private String busRoute;
    @Column(length=3000,name="bus_pic")
    private String busPic;
    @OneToMany(fetch=FetchType.EAGER, mappedBy ="bus")
    private List<User> users =new ArrayList<>();
    @OneToOne(mappedBy ="bus")
    private Driver driver;

    public Bus() {
    }
    
    

    public Bus(int busId, String busName, String busNumber, String busRoute, String busPic, List<User> users ) {
        this.busId = busId;
        this.busName = busName;
        this.busNumber = busNumber;
        this.busRoute = busRoute;
        this.busPic = busPic;
        this.users = users;
    }

    public Bus(String busName, String busNumber, String busRoute, String busPic, List<User> users ) {
        this.busName = busName;
        this.busNumber = busNumber;
        this.busRoute = busRoute;
        this.busPic = busPic;
        this.users = users;
    }

    public Bus(String busName, String busNumber, String busRoute, String busPic, Driver driver) {
        this.busName = busName;
        this.busNumber = busNumber;
        this.busRoute = busRoute;
        this.busPic = busPic;
        this.driver = driver;
    }

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public String getBusName() {
        return busName;
    }

    public void setBusName(String busName) {
        this.busName = busName;
    }

    public String getBusNumber() {
        return busNumber;
    }

    public void setBusNumber(String busNumber) {
        this.busNumber = busNumber;
    }

    public String getBusRoute() {
        return busRoute;
    }

    public void setBusRoute(String busRoute) {
        this.busRoute = busRoute;
    }

    public String getBusPic() {
        return busPic;
    }

    public void setBusPic(String busPic) {
        this.busPic = busPic;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public Driver getDriver() {
        return driver;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }
    
    
    
    @Override
    public String toString() {
        return "Bus{" + "busId=" + busId + ", busName=" + busName + ", busEmail=" + busNumber + ", userPhone=" + busRoute + ", busPic=" + busPic + ", users=" + users + '}';
    }
    
    
    
}
