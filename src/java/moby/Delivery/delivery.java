/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moby.Delivery;

import DB.CartProductReg;
import DB.Delivery;
import DB.UserReg;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * @author Sathishka
 */
@WebServlet(name = "delivery", urlPatterns = {"/delivery"})
public class delivery extends HttpServlet {

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

            String op = "<option value='0'>--Select Address--</option>";

            HttpSession ses = request.getSession();
            UserReg ur = (UserReg) ses.getAttribute("s1");

            DateFormat dft = new SimpleDateFormat("yyyy-MM-dd");

            //  String time=dtm.format(new Date());
            String address1 = request.getParameter("ad1");
            String address2 = request.getParameter("ad2");
            // String Date = dft.format(new Date());
            String City = request.getParameter("city");
            String Town = request.getParameter("town");

            if (address1 != null && address2 != null && City != null && Town != null) {
                System.out.println(address1);
                Session ss = Connection.HibernateUtil.getSessionFactory().openSession();
                Transaction tr = ss.beginTransaction();

                Delivery dr = new Delivery();
                dr.setUserReg(ur);
                dr.setAddress1(address1);
                dr.setAddress2(address2);
                dr.setDateTime(new Date());
                dr.setCity(City);
                dr.setTown(Town);

                ss.save(dr);
                tr.commit();

                Criteria cr2 = ss.createCriteria(Delivery.class);
                cr2.add(Restrictions.eq("userReg", ur));
               
                
                List<Delivery> dli = cr2.list();

                for (Delivery c : dli) {
                    
                    op+=" <option value="+c.getIddelivery()+">"+c.getAddress1()+"</option>";
                }
                    out.write(op);
                }else {

                out.write("Error");
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
