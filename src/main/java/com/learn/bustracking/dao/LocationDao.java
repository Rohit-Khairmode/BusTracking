/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learn.bustracking.dao;

import com.learn.bustracking.entities.Bus;
import com.learn.bustracking.entities.Driver;
import com.learn.bustracking.entities.Location;
import com.learn.bustracking.helper.FactoryProvider;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ROHIT
 */
public class LocationDao {
   private SessionFactory factory;

    public LocationDao(SessionFactory factory) {
        this.factory = factory;
    } 
    public List<Location> getLocationsByBusId(int BusId){
        BusDao busDao = new BusDao(FactoryProvider.getFactory());
        Bus curBus = busDao.getBusById(BusId);
        Driver curDriver = curBus.getDriver();
        
        Session s=this.factory.openSession();
        
        String hql = "FROM Location ce WHERE ce.driver.driverId = :value";
        Query query = s.createQuery(hql);
        query.setParameter("value", curDriver.getDriverId());

        List<Location> result = query.getResultList();
        s.close();
        return result;
    }
    public int DeleteAllTempLocations(int driverId){
        Transaction transaction = null;
        Session session = null;
        int deletedCount=0;
        try {
            session = FactoryProvider.getFactory().openSession();
            transaction = session.beginTransaction();

            String hql = "DELETE FROM Location WHERE time_Stamp != :time_stamp AND driver.driverId = :driverId";
            Query query = session.createQuery(hql);
            query.setParameter("time_stamp", 0);
            query.setParameter("driverId", driverId);

            deletedCount = query.executeUpdate();

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace(); // Handle the exception appropriately
        } finally {
            // Close the session
            session.close();
        }
        return deletedCount;
    }
}
