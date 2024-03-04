/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learn.bustracking.dao;

import com.learn.bustracking.entities.Bus;
import com.learn.bustracking.entities.Driver;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ROHIT
 */
public class DriverDao {
     private SessionFactory factory;

    public DriverDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    public boolean saveDriver(Driver driver){
        boolean f = false;
        try{
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(driver);
        tx.commit();
        session.close();
        f=true;
        }catch(Exception e){
            e.printStackTrace();
            f=false;
        }
       
        return f;
    }
    
    public List<Driver> getDrivers()
    {
        Session s=this.factory.openSession();
        Query query = s.createQuery("from Driver");
        List<Driver>list =query.getResultList();
        s.close();
        return list;
    }
    
     public Driver getDriverById(int driverId)
    {
        Driver driver =null;
        try{
            Session session = this.factory.openSession();
            driver = session.get(Driver.class,driverId);
            session.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return driver;
    }
     
     public Driver getDriverByEmailAndPassword(String email,String password)
    {
        Driver driver=null;
        try{
            String query ="from Driver where driverEmail =: e and driverPassword=: p ";
            Session session =this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            driver=(Driver)q.getSingleResult();
            session.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return driver;
    }
    
}
