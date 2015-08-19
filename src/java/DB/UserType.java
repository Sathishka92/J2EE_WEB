package DB;
// Generated Aug 19, 2015 2:29:07 PM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * UserType generated by hbm2java
 */
public class UserType  implements java.io.Serializable {


     private Integer iduserType;
     private String typeName;
     private Set userRegs = new HashSet(0);
     private Set privilageses = new HashSet(0);

    public UserType() {
    }

    public UserType(String typeName, Set userRegs, Set privilageses) {
       this.typeName = typeName;
       this.userRegs = userRegs;
       this.privilageses = privilageses;
    }
   
    public Integer getIduserType() {
        return this.iduserType;
    }
    
    public void setIduserType(Integer iduserType) {
        this.iduserType = iduserType;
    }
    public String getTypeName() {
        return this.typeName;
    }
    
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    public Set getUserRegs() {
        return this.userRegs;
    }
    
    public void setUserRegs(Set userRegs) {
        this.userRegs = userRegs;
    }
    public Set getPrivilageses() {
        return this.privilageses;
    }
    
    public void setPrivilageses(Set privilageses) {
        this.privilageses = privilageses;
    }




}

