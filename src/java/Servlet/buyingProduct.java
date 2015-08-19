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
 * @author SaThiShKa
 */
@WebServlet(name = "buyingProduct", urlPatterns = {"/buyingProduct"})
public class buyingProduct extends HttpServlet {

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
            
            HttpSession ses=request.getSession();
            
            int pid = Integer.parseInt(request.getParameter("pid"));
            int bqty = Integer.parseInt(request.getParameter("bqty"));
            out.write(pid + " " + bqty);
            Session ss1 = HibernateUtil.getSessionFactory().openSession();
            HttpSession hs = request.getSession();
           UserReg us1 = (UserReg) hs.getAttribute("s1");

            Criteria cr1 = ss1.createCriteria(UserReg.class);
            cr1.add(Restrictions.eq("idUser", us1.getIdUser()));
            UserReg us = (UserReg) cr1.uniqueResult();
            
            Session ss = HibernateUtil.getSessionFactory().openSession();
            ProductReg pro = (ProductReg) ss.load(ProductReg.class, pid);

            Criteria cri = ss.createCriteria(Cart.class);
            cri.add(Restrictions.eq("userReg", us));
            Cart cr = (Cart) cri.uniqueResult();
            Transaction tr = ss.beginTransaction();

            double tot = bqty * pro.getPrice();
            if (cr==null) {

                Cart crt = new Cart();
                crt.setDateTime(new Date());
                crt.setProductCount(bqty);
                crt.setTotalAmount(tot);
                crt.setUserReg(us);
                ss.save(crt);

                CartProductReg chp = new CartProductReg();

                chp.setCart(crt);
                chp.setIsPurchase(0);
                chp.setPrice(tot);
                chp.setProductReg(pro);
                chp.setQuantity(Double.parseDouble(bqty + ""));
                ss.save(chp);

            } else {
                cr.setDateTime(new Date());
                cr.setProductCount(cr.getProductCount());
                cr.setTotalAmount(cr.getTotalAmount());
                ss.update(cr);

                Criteria cri2 = ss.createCriteria(CartProductReg.class);
                cri2.add(Restrictions.eq("cart", cr));
                cri2.add(Restrictions.eq("productReg", pro));
                cri2.add(Restrictions.eq("isPurchase", 0));

                CartProductReg chp2 = (CartProductReg) cri2.uniqueResult();

                if (chp2 != null) {
                    chp2.setPrice(chp2.getPrice() + tot);
                    ss.update(chp2);

                } else {
                    CartProductReg chp = new CartProductReg();
                    chp.setCart(cr);
                    chp.setIsPurchase(0);
                    chp.setPrice(tot);
                    chp.setProductReg(pro);
                    chp.setQuantity(Double.parseDouble(bqty + ""));
                    ss.save(chp);
                }

            }
            tr.commit();
            
           out.write("ok");
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
