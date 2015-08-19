/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CartModel;

import Connection.HibernateUtil;
import DB.Cart;
import DB.CartProductReg;
import DB.ProductReg;
import DB.UserReg;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author SaThiShKa
 */
public class CreateTables {

    public String searchProduct() {
        String tbl = "";

        tbl += "<tr >";
        tbl += "<td> Brands</td><td>image</td>";
        tbl += "<td>unit price</td><td>quantity</td>";
        tbl += "<td>total</td><td>update</td><td>remove</td>";
        tbl += "</tr>";

        Session ss = HibernateUtil.getSessionFactory().openSession();

        Query qr = ss.createQuery("from ProductReg ORDER BY productid DESC");

        List<ProductReg> pr = qr.list();
        int sts = 0;

        for (ProductReg p : pr) {
            sts++;
            tbl += "<tr  >";
            tbl += "<td width='70'>" + p.getProductname() + "</td>";
            tbl += "<td width='70' ><img src='" + p.getProductimage() + "' width='60 height='60' ></td>";
            tbl += "<td width='70' id='unitp" + sts + "' >" + p.getPrice() + "</td>";
            tbl += "<td width='70'><input  id='change_qty" + sts + "'type='number' value='" + p.getQuantity() + "' min='1' max='100' onchange='updateTotal(" + sts + ")' /> </td>";

            tbl += "</br>";

            tbl += "<td width='70' id='tot" + sts + "'>" + p.getQuantity() * p.getPrice() + "</td>";
            tbl += "<td width='70'><input type='button' value='Update' class=\"pure-button pure-button-primary\" onclick='updateDetails(" + sts + ")' /></td>";
            tbl += "<td width='70'><input type='button' value='Remove ' class=\"pure-button pure-button-primary\" onclick='removeProducts(" + sts + ")' /></td>";
            tbl += "</tr>";
            tbl += "<input type='hidden' value='" + p.getProductid() + "'id='proid" + sts + "'/>";

        }

        return tbl;
    }

    public String view_buyingProducts(HttpSession hs) {
        String n = "";

        UserReg ur = (UserReg) hs.getAttribute("s1");

        Session ss1 = HibernateUtil.getSessionFactory().openSession();

//        Criteria cr1 = ss1.createCriteria(UserReg.class);
//        cr1.add(Restrictions.eq(us1.get));
//        UserReg us = (UserReg) cr1.uniqueResult();
        Session ss = HibernateUtil.getSessionFactory().openSession();
        Criteria cri = ss.createCriteria(Cart.class);
        cri.add(Restrictions.eq("userReg", ur));
        Cart crt = (Cart) cri.uniqueResult();

        Criteria cri2 = ss.createCriteria(CartProductReg.class);
        cri2.add(Restrictions.eq("cart", crt));
        cri2.add(Restrictions.eq("isPurchase", 0));

        List<CartProductReg> chp = cri2.list();

        n += "<tr class=\"uk-alert uk-alert-success\">";
        n += "<td>Product Image</td>";
        n += "<td>Product Name</td>";
        n += "<td>Buying Qty</td>";
        n += "<td>Unit Price</td>";
        n += "<td>Total Price</td>";
        n += "<td>Remove Product</td>";
        n += "</tr>";

        double net_tot = 0;

        for (CartProductReg c : chp) {

            ProductReg p = (ProductReg) ss.load(ProductReg.class, c.getProductReg().getProductid());
            n += "<tr class=\"uk-alert\"> ";
            n += "<td onclick='ProductPreview.jsp'><img src='" + p.getProductimage() + "' width='50' height='50' /></td>";
            n += "<td>" + p.getProductname() + "</td>";
            n += "<td>" + p.getQuantity() + "</td>";
            n += "<td>" + p.getPrice() + "</td>";
            n += "<td>" + c.getPrice() + "</td>";
            n += "<td><input type='button' value='Remove Product' class=\"pure-button pure-button-primary\" onclick='removeCart(" + p.getProductid() + "," + crt.getCartid() + ")'   /></td>";
            n += "</tr>";

            net_tot += c.getPrice();
        }

        n += "<tr class=\"uk-alert uk-alert-success\" >";
        
        n += "<td  width='70'>Sub Total</td>";
        n += "<td width='70'>Rs." + net_tot + "</td>";
        n += "<td width='70'><a href='Moby_Delivery_Chaeckout.jsp'><input type='button' value='Purchase' class=\"pure-button pure-button-primary\"     /></a></td>";

        return n;
    }

}
