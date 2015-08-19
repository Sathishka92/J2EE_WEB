/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moby.login;

import Connection.HibernateUtil;
import DB.UserLogin;
import DB.UserReg;
import DB.UserType;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author SathisHka
 */
@WebServlet(name = "Signup", urlPatterns = {"/Signup"})
public class Signup extends HttpServlet {

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

            
            Session s=HibernateUtil.getSessionFactory().openSession();
            
            Transaction t = s.beginTransaction();

            String username = request.getParameter("username");
            String country = request.getParameter("country");
            String email = request.getParameter("email");
            String pw = request.getParameter("pw");
            String cpassword = request.getParameter("cpassword");
            String utype = request.getParameter("type");

            UserType ut = (UserType) s.load(UserType.class, Integer.parseInt(utype));

            UserReg u = new UserReg();

            u.setUsername(username);
            u.setEmail(email);
            u.setCountry(country);
            u.setPassword(pw);
            u.setConPassword(cpassword);
            u.setUserType(ut);
            u.setStatus(1);

            s.save(u);

//            UserLogin ul = new UserLogin();
//
//            ul.setUsername(username);
//            ul.setPassword(pw);
//            ul.setUserReg(u);
//
//            s.save(ul);
//
          t.commit();

            response.sendRedirect("Homepage.jsp");
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
