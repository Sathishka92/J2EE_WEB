package DB;
// Generated Aug 19, 2015 2:29:07 PM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Brand generated by hbm2java
 */
public class Brand  implements java.io.Serializable {


     private Integer idBrand;
     private String brand;
     private Set productRegs = new HashSet(0);

    public Brand() {
    }

    public Brand(String brand, Set productRegs) {
       this.brand = brand;
       this.productRegs = productRegs;
    }
   
    public Integer getIdBrand() {
        return this.idBrand;
    }
    
    public void setIdBrand(Integer idBrand) {
        this.idBrand = idBrand;
    }
    public String getBrand() {
        return this.brand;
    }
    
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public Set getProductRegs() {
        return this.productRegs;
    }
    
    public void setProductRegs(Set productRegs) {
        this.productRegs = productRegs;
    }




}


