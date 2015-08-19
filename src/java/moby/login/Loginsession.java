/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moby.login;

import Connection.HibernateUtil;
import DB.LoginSessions;
import DB.UserLogin;
import DB.UserReg;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author SathisHka
 */
@WebServlet(name = "Loginsession", urlPatterns = {"/Loginsession"})
public class Loginsession extends HttpServlet {

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
            Session sess = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = sess.beginTransaction();

            String un = request.getParameter("uname");
            String pw = request.getParameter("pass");

            Criteria crt = sess.createCriteria(UserReg.class);
            crt.add(Restrictions.eq("username", un));
            crt.add(Restrictions.eq("password", pw));

            UserReg ul = (UserReg) crt.uniqueResult();

            if (ul == null) {
                response.sendRedirect("index.jsp?msg=Invalid User");
            } else {
                
               //int ui = ul.getIduserLogin();
                if(ul.getStatus()==1){
                LoginSessions ls = new LoginSessions();

                ls.setIpAddress(request.getRemoteHost());
                ls.setInTime(new Date());
                ls.setOutTime(new Date());
                ls.setUserReg(ul);

                sess.save(ls);

                tx.commit();

                request.getSession().setAttribute("s1", ul);
                System.out.println(ls.getIdloginSessions() + "dvdsvdsvds");
                response.sendRedirect("Homepage.jsp");
                }
                else{
                response.sendRedirect("404Error.html");
                }
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
