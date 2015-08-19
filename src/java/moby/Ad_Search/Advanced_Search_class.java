/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package moby.Ad_Search;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sathishka
 */
public class Advanced_Search_class {
    
    
     public List<DB.ProductReg> getSearch(int brand, int colour, int os, int memory) {
        Session ses = Connection.HibernateUtil.getSessionFactory().openSession();

        if (brand != 0) {

            String q = "From ProductReg prhs where prhs.brand in"
                    + "(Select pr.idbrand from brand pr where pr.brand='" + brand + "')";

            if (colour != 0) {

                q += "AND prhs.colour='" + colour + "'";

            }
            

            if (os != 0) {

                q += "AND prhs.os='" + os + "'";

            }

            if (memory != 0) {

                q += "AND prhs.memory='" + memory + "'";

            }
            
            Query qq = ses.createQuery(q);
            return qq.list();

        }else{
        
            Criteria cr = ses.createCriteria(DB.ProductReg.class);
            if(colour != 0){
            
                DB.Colour s = (DB.Colour) ses.load(DB.Colour.class, colour);
                cr.add(Restrictions.eq("colour", s));
            
            }
            
            if(os != 0){
            
                DB.Os c = (DB.Os) ses.load(DB.Os.class, os);
                cr.add(Restrictions.eq("os", c));
            
            }
            
            if(memory != 0){
            
                DB.Memory t = (DB.Memory) ses.load(DB.Memory.class, memory);
                cr.add(Restrictions.eq("memory", t));
            
            }
            
            return cr.list();
        
        }

        

    }
    
}
