package com.bheemas.model;

import java.util.Date;
import java.util.List;

public class Order {
    private int orderId;
    private String customerName;
    private String customerPhone;
    private String customerAddress;
    private Date orderDate;
    private double totalAmount;
    private List<OrderItem> items;
    
    public Order() {}
    
    // Parameterized constructor
    public Order(String customerName, String customerPhone, String customerAddress, 
                double totalAmount, List<OrderItem> items) {
        this.customerName = customerName;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.totalAmount = totalAmount;
        this.items = items;
        this.orderDate = new Date();
    }
    
    // Getters and Setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }
    
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    
    public String getCustomerPhone() { return customerPhone; }
    public void setCustomerPhone(String customerPhone) { this.customerPhone = customerPhone; }
    
    public String getCustomerAddress() { return customerAddress; }
    public void setCustomerAddress(String customerAddress) { this.customerAddress = customerAddress; }
    
    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }
    
    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
    
    public List<OrderItem> getItems() { return items; }
    public void setItems(List<OrderItem> items) { this.items = items; }
}
