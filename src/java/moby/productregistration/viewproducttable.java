/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moby.productregistration;

import Connection.HibernateUtil;
import DB.ProductReg;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author SathisHka
 */
public class viewproducttable {

    public String searchProduct() {
        String tbl = "";

        tbl += "<tr style='background-color:#09C'>";
        tbl += "<td>Available Mobile Brands</td><td>Quantity</td>";

        tbl += "</tr>";

        Session ss = HibernateUtil.getSessionFactory().openSession();
        Query qr = ss.createQuery("from ProductReg");

        List<ProductReg> pr = qr.list();
        int sts = 0;

        for (ProductReg p : pr) {
            sts++;
            tbl += "<tr >";
            tbl += "<td width='170' style='color:black'>" + p.getBrand() + "</td>";
            tbl += "<td width='70'style='color:black' >" + p.getQuantity() + "</td>";

        }
       
        return tbl;
    }

}
