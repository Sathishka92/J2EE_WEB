/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moby.productregistration;

import DB.ProductReg;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author SaThisHka
 */
@WebServlet(name = "Product_Registration", urlPatterns = {"/Product_Registration"})
public class Product_Registration extends HttpServlet {

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

            String brand = "";
            String pname = "";
            String price = "";
            String clrr = "";
            String quty = "";
            String sim = "";
            String announced = "";
            String dsize = "";
            String fcamera = "";
            String scamera = "";
            String video = "";
            String mem = "";
            String myos = "";
            String pimage = "";

            Session ss = Connection.HibernateUtil.getSessionFactory().openSession();
            Transaction tr = ss.beginTransaction();

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            List<FileItem> items = upload.parseRequest(request);
            for (Object element : items) {
                FileItem fileItem = (FileItem) element;
                if (fileItem.isFormField()) {
                    if (fileItem.getFieldName().equals("brand")) {
                        brand = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("pname")) {
                        pname = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("price")) {
                        price = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("clrr")) {
                        clrr = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("quty")) {
                        quty = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("sim")) {
                        sim = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("announced")) {
                        announced = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("dsize")) {
                        dsize = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("fcamera")) {
                        fcamera = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("scamera")) {
                        scamera = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("video")) {
                        video = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("mem")) {
                        mem = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("myos")) {
                        myos = fileItem.getString();

                    }

                } else {

                    pimage = "mobyimages/" + fileItem.getName() + System.currentTimeMillis();
                    File savedFile = new File(request.getServletContext().getRealPath("/") + pimage);
                    fileItem.write(savedFile);

                    ProductReg preg = new ProductReg();

                    int brandid = Integer.parseInt(brand);
                    DB.Brand brid = (DB.Brand) ss.load(DB.Brand.class, brandid);

                    preg.setBrand(brid);

                    int Colorid = Integer.parseInt(clrr);
                    DB.Colour clrid = (DB.Colour) ss.load(DB.Colour.class, Colorid);
                    preg.setColour(clrid);

                    int ossid = Integer.parseInt(myos);
                    DB.Os osid = (DB.Os) ss.load(DB.Os.class, ossid);
                    preg.setOs(osid);

                    int memoid = Integer.parseInt(mem);
                    DB.Memory mid = (DB.Memory) ss.load(DB.Memory.class, memoid);
                    preg.setMemory(mid);

                    preg.setProductname(pname);
                    preg.setPrice(Double.parseDouble(price));
                    // preg.setColor(color);
                    preg.setQuantity(Integer.parseInt(quty));

                    preg.setSim(sim);
                    preg.setAnnounced(announced);
                    preg.setDispalysize(dsize);
                    preg.setFrontcamera(fcamera);
                    preg.setSeconderycamera(scamera);
                    preg.setVideo(video);
                    preg.setStatus(1);
                   // preg.setMemory(memory);
                    // preg.setOs(os);
                    preg.setProductimage(pimage);

                    ss.save(preg);

                }

            }
            tr.commit();
            response.sendRedirect("Homepage.jsp");

        } catch (FileUploadException ex) {
            Logger.getLogger(Product_Registration.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Product_Registration.class.getName()).log(Level.SEVERE, null, ex);
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
