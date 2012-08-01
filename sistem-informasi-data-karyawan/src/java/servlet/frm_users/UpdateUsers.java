/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.frm_users;

import dao.UsersDAOImpl;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import utils.PersistenceUtil;

/**
 *
 * @author Luckma
 */
@WebServlet(name = "UpdateUsers", urlPatterns = {"/UpdateUsers"})
public class UpdateUsers extends HttpServlet {

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

                Users obj = em.find(Users.class, request.getSession(true).getAttribute("user"));
                obj.setUsername(request.getParameter("username"));
                obj.setPassword(request.getParameter("password"));
                Employee employee = obj.getEmployee();
                employee.setFirst_name(request.getParameter("first_name"));
                employee.setLast_name(request.getParameter("last_name"));
                employee.setGender(request.getParameter("gender"));
                Date dt = Date.valueOf(request.getParameter("birthday"));
                employee.setBirthday(dt);
                Place domicile = new Place();
                domicile.setStreet_address(request.getParameter("street_address"));
                domicile.setPostal_code(request.getParameter("postal_code"));
                domicile.setCity(request.getParameter("city"));
                domicile.setState_province(request.getParameter("state_province"));
                domicile.setCountry(request.getParameter("country"));
                employee.setDomicile(domicile);
                employee.setEmail(request.getParameter("email"));
                employee.setPhone_number(request.getParameter("phone_number"));
                em.getTransaction().begin();
                Job job = em.find(Job.class, request.getParameter("job"));
                em.getTransaction().commit();
                employee.setJob(job);
                em.getTransaction().begin();
                Department department = em.find(Department.class, request.getParameter("department"));
                em.getTransaction().commit();
                employee.setDepartment(department);
                try {
                    File file = new File(request.getParameter("url_photo"));
                    BufferedImage image = ImageIO.read(file);
                    ImageIO.write(image, "jpg", new File("web/file/image/" + obj.getId()));
                    employee.setUrl_photo("file/image/" + obj.getId());
                } catch (Exception ex) {
                    employee.setUrl_photo("file/image/default.jpg");
                }
                obj.setEmployee(employee);

                new UsersDAOImpl(em).update(obj);

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
