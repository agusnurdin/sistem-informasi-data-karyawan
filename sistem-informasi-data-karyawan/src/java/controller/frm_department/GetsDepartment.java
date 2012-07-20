/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.frm_department;

import dao.DepartmentDAOImpl;
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
import model.Department;

/**
 *
 * @author Fajar_Ardhanta
 */
@WebServlet(name = "GetsDepartment", urlPatterns = {"/GetsDepartment"})
public class GetsDepartment extends HttpServlet {

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
                EntityManagerFactory emf =
                        Persistence.createEntityManagerFactory("sistem-informasi-data-karyawanPU");
                EntityManager em = emf.createEntityManager();
                List<Department> list;
                String filter = request.getParameter("filter");
                if (filter == null) {
                    filter = "";
                }
                list = new DepartmentDAOImpl(em).gets(filter);
                out.print("[");
                for (int i = 0; i < list.size(); i++) {
                    out.print("{");
                    out.print("\"id\":\"" + list.get(i).getId() + "\",");
                    out.print("\"name\":\"" + list.get(i).getName() + "\",");
                    out.print("\"description\":\"" + list.get(i).getDescription() + "\",");
                    out.print("\"manager\":\"" + list.get(i).getManager().getId() + "\",");
                    out.print("\"manager_name\":\"" + list.get(i).getManager().getFirst_name() + " " + list.get(i).getManager().getLast_name() + "\",");
                    out.print("\"street_address\":\"" + list.get(i).getLocation().getStreet_address() + "\",");
                    out.print("\"postal_code\":\"" + list.get(i).getLocation().getPostal_code() + "\",");
                    out.print("\"city\":\"" + list.get(i).getLocation().getCity() + "\",");
                    out.print("\"state_province\":\"" + list.get(i).getLocation().getState_province() + "\",");
                    out.print("\"country\":\"" + list.get(i).getLocation().getCountry() + "\"");
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
