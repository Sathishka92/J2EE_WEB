package DB;
// Generated Aug 19, 2015 2:29:07 PM by Hibernate Tools 3.6.0



/**
 * CartProductReg generated by hbm2java
 */
public class CartProductReg  implements java.io.Serializable {


     private Integer cprId;
     private ProductReg productReg;
     private Cart cart;
     private Double quantity;
     private Double price;
     private Integer isPurchase;

    public CartProductReg() {
    }

	
    public CartProductReg(ProductReg productReg, Cart cart) {
        this.productReg = productReg;
        this.cart = cart;
    }
    public CartProductReg(ProductReg productReg, Cart cart, Double quantity, Double price, Integer isPurchase) {
       this.productReg = productReg;
       this.cart = cart;
       this.quantity = quantity;
       this.price = price;
       this.isPurchase = isPurchase;
    }
   
    public Integer getCprId() {
        return this.cprId;
    }
    
    public void setCprId(Integer cprId) {
        this.cprId = cprId;
    }
    public ProductReg getProductReg() {
        return this.productReg;
    }
    
    public void setProductReg(ProductReg productReg) {
        this.productReg = productReg;
    }
    public Cart getCart() {
        return this.cart;
    }
    
    public void setCart(Cart cart) {
        this.cart = cart;
    }
    public Double getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }
    public Double getPrice() {
        return this.price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }
    public Integer getIsPurchase() {
        return this.isPurchase;
    }
    
    public void setIsPurchase(Integer isPurchase) {
        this.isPurchase = isPurchase;
    }




}


