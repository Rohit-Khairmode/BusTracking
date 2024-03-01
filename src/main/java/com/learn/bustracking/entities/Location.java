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

/**
 *
 * @author ROHIT
 */
@Entity
public class Location {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(length = 10,name="location_Id")
    private int locationId;
    @Column(length = 100,name="latitude")
    private String latitude;
    @Column(length = 100,name="longitude")
    private String longitude;
    @Column(length = 100,name="timestamp")
    private int timestamp;
    @ManyToMany
    private Driver driver;

    public Location() {
    }

    public Location(int locationId, String latitude, String longitude, int timestamp, Driver driver) {
        this.locationId = locationId;
        this.latitude = latitude;
        this.longitude = longitude;
        this.timestamp = timestamp;
        this.driver = driver;
    }

    public Location(String latitude, String longitude, int timestamp, Driver driver) {
        this.latitude = latitude;
        this.longitude = longitude;
        this.timestamp = timestamp;
        this.driver = driver;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public int getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(int timestamp) {
        this.timestamp = timestamp;
    }

    public Driver getDriver() {
        return driver;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }
    
    
     
}
