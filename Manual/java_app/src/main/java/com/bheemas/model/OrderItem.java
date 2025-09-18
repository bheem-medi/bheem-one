package com.bheemas.model;

public class OrderItem {
    private int menuItemId;
    private String itemName;
    private int quantity;
    private double price;
    
    public OrderItem() {}
    
    // Parameterized constructor
    public OrderItem(int menuItemId, String itemName, int quantity, double price) {
        this.menuItemId = menuItemId;
        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
    }
    
    // Getters and Setters
    public int getMenuItemId() { return menuItemId; }
    public void setMenuItemId(int menuItemId) { this.menuItemId = menuItemId; }
    
    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }
    
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
