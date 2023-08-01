package db.model;

import java.sql.Timestamp;

public class Cart {
    private int cartNumber;
    private String productNM;
    private int productCnt;
    private int productPrice;
    private String id;

    public Cart(int cartNumber, String productNM, int productCnt, int productPrice, String id) {
        this.cartNumber = cartNumber;
        this.productNM = productNM;
        this.productCnt = productCnt;
        this.productPrice = productPrice;
        this.id = id;
    }

    public Integer getCartNumber() {
        return cartNumber;
    }

    public void setCartNumber(Integer cartNumber) {
        this.cartNumber = cartNumber;
    }

    public String getProductNM() {
        return productNM;
    }

    public void setProductNM(String productNM) {
        this.productNM = productNM;
    }

    public Integer getProductCnt() {
        return productCnt;
    }

    public void setProductCnt(Integer productCnt) {
        this.productCnt = productCnt;
    }

    public Integer getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
