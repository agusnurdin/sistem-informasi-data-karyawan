/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Tools.PersistenceUtil;
import dao.UsersDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author Aphonk
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
                Users obj = new UsersDAOImpl(em).get(request.getParameter("id"), request.getParameter("password"));
                if (obj != null) {
                    obj.setCurrently_use(new Date());
                    obj.setIp_address(request.getRemoteAddr());
                    new UsersDAOImpl(em).update(obj);
                    HttpSession session = request.getSession(true);
                    session.setAttribute("status", "activated");
                    session.setAttribute("user", obj.getId());
                    response.sendRedirect("administrator/home.jsp");
                } else {
                    out.print("Wrong id or password");
                    RequestDispatcher reqDis = request.getRequestDispatcher("index.jsp");
                    reqDis.include(request, response);
                }
            } catch (Exception ex) {
                out.print(ex.getMessage());
                RequestDispatcher reqDis = request.getRequestDispatcher("index.jsp");
                reqDis.include(request, response);
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