/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.EmployeeDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import json.JSONArray;
import model.Employee;

/**
 *
 * @author Luckma
 */
@WebServlet(name = "UpdateEmployee", urlPatterns = {"/UpdateEmployee"})
public class UpdateEmployee extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Employee obj = new Employee();
            try {
                obj.setId(request.getParameter("id"));
                obj.setFirst_name(request.getParameter("first_name"));
                obj.setLast_name(request.getParameter("last_name"));
                obj.setGender(request.getParameter("gender"));
                Date dt = Date.valueOf(request.getParameter("birthday"));
                obj.setBirthday(dt);
                //obj.setDomicile((Place) request.getAttribute("domicile"));
                obj.setEmail(request.getParameter("email"));
                obj.setPhone_number(request.getParameter("phone_number"));
                //obj.setJob((Job) request.getAttribute("job"));
                //obj.setDepartment((Department) request.getAttribute("department"));
                EntityManagerFactory emf =
                        Persistence.createEntityManagerFactory("sistem-informasi-data-karyawanPU");
                EntityManager em = emf.createEntityManager();
                new EmployeeDAOImpl(em).update(obj);
                JSONArray arr = new JSONArray();
                //lempar data succes true
                out.print(arr.toString());
            } catch (Exception ex) {
                JSONArray arr = new JSONArray();
                //lempar data succes false
                out.print(arr.toString());
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
