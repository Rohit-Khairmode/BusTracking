/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learn.bustracking.dao;

import com.learn.bustracking.entities.Bus;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ROHIT
 */
public class BusDao {
    private SessionFactory factory;

    public BusDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    public int saveBus(Bus bus){
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int busId = (int) session.save(bus);
        tx.commit();

        session.close();
        return busId;
    }
    
    public List<Bus> getBuses()
    {
        Session s=this.factory.openSession();
        Query query = s.createQuery("from Bus");
        List<Bus>list =query.getResultList();
        return list;
    }
    
    public Bus getBusById(int busId)
    {
        Bus bus =null;
        try{
            Session session = this.factory.openSession();
            bus = session.get(Bus.class,busId);
            session.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return bus;
    }
}
