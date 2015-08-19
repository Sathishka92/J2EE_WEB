/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package moby.Ad_Search;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Sathishka
 */
public class Ad_DB {
     public static Connection getFC()throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/mobyerd","root","9230");
            return c;
    }
    
}
