/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moby.user.management;

import Connection.HibernateUtil;
import DB.ProductReg;
import DB.UserReg;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author SathisHka
 */
public class view_accounts {

    public String searchAccount() {

        String tbl = "";

        tbl += "<tr style='background-color:#09C'>";
        tbl += "<td>Full Name</td><td>Countery</td>";
        tbl += "<td>E-Mail</td><td>Paaword</td>";
        tbl += "<td>Comfirm Password</td><td>Action</td>";

        tbl += "</tr>";

        Session ss = HibernateUtil.getSessionFactory().openSession();
        Query qr = ss.createQuery("from UserReg");

        List<UserReg> pr = qr.list();
        int sts = 0;

        for (UserReg p : pr) {
            sts++;
            tbl += "<tr >";
            tbl += "<td width='170' style='color:black'>" + p.getUsername() + "</td>";
            tbl += "<td width='70'style='color:black' >" + p.getCountry() + "</td>";
            tbl += "<td width='70'style='color:black' >" + p.getEmail() + "</td>";
            tbl += "<td width='70'style='color:black' >" + p.getPassword() + "</td>";
            tbl += "<td width='70'style='color:black' >" + p.getConPassword() + "</td>";
            tbl += "<td width='70'><input type='button' value='Deactivate ' onclick='removeUsers(" + sts + ")' /></td>";
            tbl += "<input type='hidden' value='" + p.getIdUser() + "'id='proid" + sts + "'/>";

        }

        return tbl;
    }
}
