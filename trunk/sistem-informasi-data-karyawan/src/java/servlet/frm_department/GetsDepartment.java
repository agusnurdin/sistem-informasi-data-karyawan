/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.frm_department;

import dao.DepartmentDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Department;
import utils.PersistenceUtil;

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
                EntityManager em = PersistenceUtil.getEntityManager();

                List<Department> list;
                String filter = request.getParameter("filter");
                if (filter == null) {
                    filter = "";
                }
                list = new DepartmentDAOImpl(em).gets(filter);
                String spage = request.getParameter("page");
                String srows = request.getParameter("rows");
                boolean forTable = true;
                if (spage == null || srows == null) {
                    spage = "1";
                    srows = "" + list.size();
                    forTable = false;
                }
                int page = Integer.parseInt(spage);
                int rows = Integer.parseInt(srows);
                int limit;
                if ((page * rows) <= list.size()) {
                    limit = (page * rows);
                } else {
                    limit = list.size();
                }
                if (forTable) {
                    out.print("{\"total\":" + list.size() + ",\"rows\":");
                }
                out.print("[");
                for (int i = (page * rows) - rows; i < limit; i++) {
                    out.print("{");
                    out.print("\"id\":\"" + list.get(i).getId() + "\",");
                    out.print("\"name\":\"" + list.get(i).getName() + "\",");
                    out.print("\"description\":\"" + list.get(i).getDescription() + "\",");
                    if (list.get(i).getManager() != null) {
                        out.print("\"manager\":\"" + list.get(i).getManager().getId() + "\",");
                    }
                    out.print("\"street_address\":\"" + list.get(i).getLocation().getStreet_address() + "\",");
                    out.print("\"postal_code\":\"" + list.get(i).getLocation().getPostal_code() + "\",");
                    out.print("\"city\":\"" + list.get(i).getLocation().getCity() + "\",");
                    out.print("\"state_province\":\"" + list.get(i).getLocation().getState_province() + "\",");
                    out.print("\"country\":\"" + list.get(i).getLocation().getCountry() + "\"");
                    out.print("}");
                    if (i < limit - 1) {
                        out.print(",");
                    }
                }
                out.print("]");
                if (forTable) {
                    out.print("}");
                }
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
