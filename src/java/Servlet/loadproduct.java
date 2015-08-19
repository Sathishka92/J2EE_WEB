/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Connection.HibernateUtil;
import DB.ProductReg;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author SaThiShKa
 */
@WebServlet(name = "loadproduct", urlPatterns = {"/loadproduct"})
public class loadproduct extends HttpServlet {

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

            Session ss = HibernateUtil.getSessionFactory().openSession();
            Query qr = ss.createQuery("from ProductReg");
            List<ProductReg> pro = qr.list();

            String t = "";
            int x = 0;

            for (ProductReg p : pro) {
                if (p.getStatus() == 1) {
                    if (x % 4 == 0) {

                        t += " <div style='background'  class=\"grid_1_of_4 images_1_of_4\">\n"
                                + "                                          <a href=\"Product Preview.jsp?pid=" + p.getProductid() + "\"><img src='" + p.getProductimage() + "'/></a>\n"
                                + "                                           <h2>" + p.getProductname() + "</h2>\n"
                                + "                                          <div class=\"price-details\">\n"
                                + "                                         <div class=\"price-number\">\n"
                                + "        <h4><span  class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspItem Left " + p.getQuantity() + "</span></h4>\n"
                                + "                                                          <h4><span class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspRs " + p.getPrice() + "</span></h4>\n"
                                + "                               <h4><span  class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp Qty <input style='width:60px;' type='number' id='bqty" + x + "' value='1' max='" + p.getQuantity() + "' </span></h4><br>\n"
                                + "                                              </div>\n"
                                + "                                                          <div class=\"add-cart\">								\n"
                                + "                                                                          <h4> <input  type='submit' value='Add to Cart' class=\"pure-button pure-button-primary\" onclick='buyingProduct(" + x + ")'></h4>\n"
                                + "                                                               </div>\n"
                                + "             <input type='hidden' value='" + p.getProductid() + "' id='pid" + x + "'/>                     "
                                + "                                                           <div class=\"clear\"></div>\n"
                                + "                                          </div>\n"
                                + "                                      \n"
                                + "                                  </div>";

                    } else {

                        t += " <div  class=\"grid_1_of_4 images_1_of_4\">\n"
                                + "                                          <a href=\"Product Preview.jsp?pid=" + p.getProductid() + "\"><img src='" + p.getProductimage() + "'/></a>\n"
                                + "                                           <h2>" + p.getProductname() + "</h2>\n"
                                + "                                          <div class=\"price-details\">\n"
                                + "                                         <div class=\"price-number\">\n"
                                + "        <h4><span class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspItem Left " + p.getQuantity() + "</span></h4>\n"
                                + "                                                          <h4><span class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspRs " + p.getPrice() + "</span></h4>\n"
                                + "                               <h4><span class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp Qty  <input style='width:60px;' type='number' id='bqty" + x + "' value='1' max='" + p.getQuantity() + "' </span></h4><br>\n"
                                + "                                              </div>\n"
                                + "                                                          <div class=\"add-cart\">								\n"
                                + "                                                                          <h4> <input type='submit' value='Add to Cart' class=\"pure-button pure-button-primary\" onclick='buyingProduct(" + x + ")'></h4>\n"
                                + "                                                               </div>\n"
                                + "             <input type='hidden' value='" + p.getProductid() + "' id='pid" + x + "'/>                     "
                                + "                                                           <div class=\"clear\"></div>\n"
                                + "                                          </div>\n"
                                + "                                      \n"
                                + "                                  </div>";

                    }
                    x++;
                }

            }
            out.write(t);

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
