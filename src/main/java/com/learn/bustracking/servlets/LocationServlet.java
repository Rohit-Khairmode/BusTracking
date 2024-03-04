/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.bustracking.servlets;

import com.learn.bustracking.dao.DriverDao;
import com.learn.bustracking.dao.LocationDao;
import com.learn.bustracking.entities.Driver;
import com.learn.bustracking.entities.Location;
import com.learn.bustracking.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ROHIT
 */
public class LocationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try{
                //fetching data
                String latitude = request.getParameter("latitude");
                String longitude = request.getParameter("longitude");
                int timeStamp = Integer.parseInt(request.getParameter("timestamp"));
                int driverId = Integer.parseInt(request.getParameter("driverId"));

                //Get driver by driver id;
                DriverDao driverDao = new DriverDao(FactoryProvider.getFactory());
                Driver driver = driverDao.getDriverById(driverId);
                
                //creating location object to store data;
                Location location= new Location(latitude,longitude,timeStamp,driver);
            
                //Storing data into the database 
                Session hibernateSession =FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();

                hibernateSession.save(location); 
                tx.commit();
                hibernateSession.close();

//                response.getWriter().write("Data received successfully from driver With Id: " + driverId);

            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
    
     private void processDeleteRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
        // Retrieve parameters from the request
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            // Perform the delete operation using Hibernate or any other data access mechanism
            // ...
            LocationDao locationDao = new LocationDao(FactoryProvider.getFactory());
            locationDao.DeleteAllTempLocations(driverId);

            // Send a response
             Transaction transaction = null;
        Session session = null;
        try {
            session = FactoryProvider.getFactory().openSession();
            transaction = session.beginTransaction();

            String hql = "DELETE FROM Location WHERE time_Stamp != :time_stamp AND driver.driverId = :driverId";
            Query query = session.createQuery(hql);
            query.setParameter("time_stamp", 0);
            query.setParameter("driverId", driverId);

            query.executeUpdate();

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
        }catch(Exception e){
                e.printStackTrace();
                } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // New code to handle DELETE requests
        processDeleteRequest(request, response);
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
