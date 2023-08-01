package db.model;

import java.sql.Date;

public class Orders {
    private int orderNumber;
    private String id;
    private int totalPrice;
    private String cartOrOrder;
    private String address;
    private String zipcode;
    public Orders(int orderNumber, String id, int totalPrice, String cartOrOrder, String address, String zipcode) {
        super();
        this.orderNumber = orderNumber;
        this.id = id;
        this.totalPrice = totalPrice;
        this.cartOrOrder = cartOrOrder;
        this.address = address;
        this.zipcode = zipcode;
    }
    public Orders(String id, int totalPrice, String cartOrOrder, String address, String zipcode) {
        super();
        this.id = id;
        this.totalPrice = totalPrice;
        this.cartOrOrder = cartOrOrder;
        this.address = address;
        this.zipcode = zipcode;
    }
    public int getOrderNumber() {
        return orderNumber;
    }
    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public int getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
    public String getCartOrOrder() {
        return cartOrOrder;
    }
    public void setCartOrOrder(String cartOrOrder) {
        this.cartOrOrder = cartOrOrder;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getZipcode() {
        return zipcode;
    }
    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
    
}
