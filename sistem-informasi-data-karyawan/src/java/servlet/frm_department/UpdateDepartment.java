/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.frm_department;

import dao.DepartmentDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Department;
import model.Employee;
import model.Place;
import utils.PersistenceUtil;

/**
 *
 * @author Egar
 */
@WebServlet(name = "UpdateDepartment", urlPatterns = {"/UpdateDepartment"})
public class UpdateDepartment extends HttpServlet {

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
            try {
                EntityManager em = PersistenceUtil.getEntityManager();

                Department obj = new Department();

                obj.setId(request.getParameter("id"));
                obj.setName(request.getParameter("name"));
                obj.setDescription(request.getParameter("description"));
                em.getTransaction().begin();
                Employee obje = em.find(Employee.class, request.getParameter("manager"));
                em.getTransaction().commit();
                obj.setManager(obje);

                Place domicile = new Place();
                domicile.setStreet_address(request.getParameter("street_address"));
                domicile.setPostal_code(request.getParameter("postal_code"));
                domicile.setCity(request.getParameter("city"));
                domicile.setState_province(request.getParameter("state_province"));
                domicile.setCountry(request.getParameter("country"));
                obj.setLocation(domicile);



                new DepartmentDAOImpl(em).update(obj);

                out.print("{\"success\":true}");
            } catch (Exception ex) {
                out.print("{\"success\":false}");
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
