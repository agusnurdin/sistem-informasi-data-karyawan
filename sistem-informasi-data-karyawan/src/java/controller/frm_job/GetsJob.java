/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.frm_job;

import dao.JobDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Job;

/**
 *
 * @author Norman
 */
@WebServlet(name = "GetsJob", urlPatterns = {"/GetsJob"})
public class GetsJob extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
                EntityManagerFactory emf =
                        Persistence.createEntityManagerFactory("sistem-informasi-data-karyawanPU");
                EntityManager em = emf.createEntityManager();
                String filter = request.getParameter("filter");
                if (filter == null) {
                    filter = "";
                }
                List<Job> list = new JobDAOImpl(em).gets(filter);
                out.print("[");
                for (int i = 0; i < list.size(); i++) {
                    out.print("{");
                    out.print("\"id\":\"" + list.get(i).getId() + "\",");
                    out.print("\"title\":\"" + list.get(i).getTitle() + "\",");
                    out.print("\"description\":\"" + list.get(i).getDescription() + "\"");
                    out.print("}");
                    if (i < list.size() - 1) {
                        out.print(",");
                    }
                }
                out.print("]");
            } catch (Exception ex) {
            }
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
