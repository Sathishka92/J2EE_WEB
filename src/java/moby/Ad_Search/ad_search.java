/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moby.Ad_Search;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sathishka
 */
@WebServlet(name = "ad_search", urlPatterns = {"/ad_search"})
public class ad_search extends HttpServlet {

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

            String brand = request.getParameter("brn");
            String color = request.getParameter("clr");
            String os = request.getParameter("os");
            String mem = request.getParameter("mem");
            
            System.out.println(brand);
            System.out.println(color);
            System.out.println(os);
            System.out.println(mem);

            String sql = "SELECT * FROM product_reg WHERE ";
            if (brand != null && !brand.isEmpty()) {

                sql += "Brand_idBrand=" + Integer.parseInt(brand);
               if(color!=null && !color.isEmpty() || os!= null && !os.isEmpty() || mem!=null && !mem.isEmpty()){
               sql+=" AND ";
               
               }
            }

            if (color != null && !color.isEmpty()) {

                sql += "Colour_idColour=" + Integer.parseInt(color);
                if( os!= null && !os.isEmpty() || mem!=null && !os.isEmpty() ){
               sql+=" AND ";
               
               }
            }
            if (os != null && !os.isEmpty()) {

                sql += "OS_idOS=" + Integer.parseInt(os);
                if(  mem!=null && !mem.isEmpty()){
               sql+=" AND ";
               
               }
            }
            
            if (mem != null && !mem.isEmpty()) {

                sql += "Memory_idMemory=" + Integer.parseInt(mem);
                
            }
        sql+=" ORDER BY productid DESC";
            System.out.println(sql);
        try {
            String t="";
              int x = 0;
                    Statement s = Ad_DB.getFC().createStatement();
            ResultSet r = s.executeQuery(sql);
            while (r.next()) {
                
                 if (x % 4 == 0) {
                    
                    
                    t+=" <div class=\"grid_1_of_4 images_1_of_4\">\n" +
"                                          <a href=\"Product Preview.jsp?pid="+r.getInt(1)+"\"><img src='"+r.getString(7)+"'/></a>\n" +
"                                           <h2>"+r.getString(3)+"</h2>\n" +
"                                          <div class=\"price-details\">\n" +
"                                         <div class=\"price-number\">\n" +  
                            "        <h4><span class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspItem Left "+r.getInt(6)+"</span></h4>\n" +
"                                                          <h4><span class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspRs "+r.getDouble(4)+"</span></h4>\n" +
                            "                               <h4><span class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp Quantity <input style='width:40px;' type='number' id='bqty"+x+"' value='1' min='1'  max='"+r.getInt(6)+"' </span></h4><br>\n" +
"                                              </div>\n" +
"                                                          <div class=\"add-cart\">								\n" +
"                                                                          <h4> <input type='submit' value='Add to Cart' class=\"pure-button pure-button-primary\" onclick='buyingProduct("+x+")'></h4>\n" +
"                                                               </div>\n" +
                                                        "             <input type='hidden' value='"+r.getInt(1)+"' id='pid"+x+"'/>                     " +
"                                                           <div class=\"clear\"></div>\n"+
"                                          </div>\n" +
                            
"                                      \n" +
"                                  </div>";

                } else {
                    
                    
                   t+=" <div class=\"grid_1_of_4 images_1_of_4\">\n" +
"                                          <a href=\"Product Preview.jsp?pid="+r.getInt(1)+"\"><img src='"+r.getString(7)+"'/></a>\n" +
"                                           <h2>"+r.getString(3)+"</h2>\n" +
"                                          <div class=\"price-details\">\n" +
"                                         <div class=\"price-number\">\n" +  
                            "        <h4><span class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspItem Left "+r.getInt(6)+"</span></h4>\n" +
"                                                          <h4><span class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspRs "+r.getDouble(4)+"</span></h4>\n" +
                            "                               <h4><span class=\"rupees\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp Quantity <input style='width:40px;' type='number' id='bqty"+x+"' value='1' min='1' max='"+r.getInt(6)+"' </span></h4><br>\n" +
"                                              </div>\n" +
"                                                          <div class=\"add-cart\">								\n" +
"                                                                          <h4> <input type='submit' value='Add to Cart' class=\"pure-button pure-button-primary\" onclick='buyingProduct("+x+")'></h4>\n" +
"                                                               </div>\n" +
                                                        "             <input type='hidden' value='"+r.getInt(1)+"' id='pid"+x+"'/>                     " +
"                                                           <div class=\"clear\"></div>\n"+
"                                          </div>\n" +
                            
"                                      \n" +
"                                  </div>";

                }
                x++;
                
                
                System.out.println(r.getInt(1));
            }
            out.write(t);
        } catch (Exception ex) {
            Logger.getLogger(ad_search.class.getName()).log(Level.SEVERE, null, ex);
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
