package DB;
// Generated Aug 19, 2015 2:29:07 PM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Os generated by hbm2java
 */
public class Os  implements java.io.Serializable {


     private Integer idOs;
     private String os;
     private Set productRegs = new HashSet(0);

    public Os() {
    }

    public Os(String os, Set productRegs) {
       this.os = os;
       this.productRegs = productRegs;
    }
   
    public Integer getIdOs() {
        return this.idOs;
    }
    
    public void setIdOs(Integer idOs) {
        this.idOs = idOs;
    }
    public String getOs() {
        return this.os;
    }
    
    public void setOs(String os) {
        this.os = os;
    }
    public Set getProductRegs() {
        return this.productRegs;
    }
    
    public void setProductRegs(Set productRegs) {
        this.productRegs = productRegs;
    }




}

