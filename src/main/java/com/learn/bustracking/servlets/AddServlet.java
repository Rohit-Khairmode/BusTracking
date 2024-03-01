/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.bustracking.servlets;

import com.learn.bustracking.dao.BusDao;
import com.learn.bustracking.dao.DriverDao;
import com.learn.bustracking.entities.Bus;
import com.learn.bustracking.entities.Driver;
import com.learn.bustracking.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ROHIT
 */
@MultipartConfig //for stating that servlet also accepting multi form data
public class AddServlet extends HttpServlet {

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
             String op = request.getParameter("operation");
             if(op.trim().equals("addbus")){
                String busName = request.getParameter("busName");
                String busNumber = request.getParameter("busNumber");
                String busRoute = request.getParameter("busRoute");
                Part part = request.getPart("busPic");
                Bus bus = new Bus();
                bus.setBusName(busName);
                bus.setBusNumber(busNumber);
                bus.setBusRoute(busRoute);
                bus.setBusPic(part.getSubmittedFileName());
                
                 //save bus to database
                 BusDao busDao = new BusDao(FactoryProvider.getFactory());
                 int busId = busDao.saveBus(bus);
                 
                 //pic upload
//                 find out path of bus
                String path = request.getRealPath("img") + File.separator + "Buses" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
                
//                Uploading code
                try {
                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

//                   reading data
                    byte[] data = new byte[is.available()];
                    is.read(data);
                    //writing the data
                    fos.write(data);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                 
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Bus information added sucessfully :");
                response.sendRedirect("admin.jsp");
             }else if(op.trim().equals("adddriver")){
              //add driver
              String driverName = request.getParameter("driverName");
              String driverEmail =request.getParameter("driverEmail");
              String driverPassword =request.getParameter("driverPassword");
              String driverPhone =request.getParameter("driverPhone");
              int busId = Integer.parseInt(request.getParameter("busId"));
              
                 Driver d = new Driver();
                 d.setDriverName(driverName);
                 d.setDriverEmail(driverEmail);
                 d.setDriverPassword(driverPassword);
                 d.setDriverPhone(driverPhone);
                 
//               //get Bus by busId
                BusDao busDao = new BusDao(FactoryProvider.getFactory());
                Bus bus = busDao.getBusById(busId);
                d.setBus(bus);
                
                //save driver details
                DriverDao driverDao = new DriverDao(FactoryProvider.getFactory());
                driverDao.saveDriver(d);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Driver information added sucessfully");
                response.sendRedirect("admin.jsp");
             }
             
                
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
