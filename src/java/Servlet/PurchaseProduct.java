/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Connection.HibernateUtil;
import DB.Cart;
import DB.CartProductReg;
import DB.ProductReg;
import DB.UserReg;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
 * @author SaThiShKa
 */
@WebServlet(name = "PurchaseProduct", urlPatterns = {"/PurchaseProduct"})
public class PurchaseProduct extends HttpServlet {

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

            HttpSession hs = request.getSession();

            UserReg ur = (UserReg)hs.getAttribute("s1");
            
            Session ss = HibernateUtil.getSessionFactory().openSession();
//            Criteria cr11 = ss.createCriteria(UserReg.class);
//            cr11.add(Restrictions.eq("idUser", Integer.parseInt(hs.getAttribute("s1").toString())));
//            UserReg us = (UserReg) cr11.uniqueResult();

            Criteria cr1 = ss.createCriteria(Cart.class);
            cr1.add(Restrictions.eq("userReg", ur));
            Cart crt = (Cart) cr1.uniqueResult();

            Criteria cr2 = ss.createCriteria(CartProductReg.class);
            cr2.add(Restrictions.eq("cart", crt));
            cr2.add(Restrictions.eq("isPurchase", 0));

            List<CartProductReg> chp = cr2.list();

            for (CartProductReg c : chp) {
                Transaction tr = ss.beginTransaction();

                c.setIsPurchase(1);
                ss.update(c);

                ProductReg p = (ProductReg) ss.load(ProductReg.class, c.getProductReg().getProductid());
                p.setQuantity(p.getQuantity() - c.getQuantity().intValue());

                ss.update(p);

                tr.commit();

                Transaction tr2 = ss.beginTransaction();

                crt.setDateTime(null);
                crt.setProductCount(0);
                crt.setTotalAmount(0.0);
                ss.update(crt);

                tr2.commit();
                

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
