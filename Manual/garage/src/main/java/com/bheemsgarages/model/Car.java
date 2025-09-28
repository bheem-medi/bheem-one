package com.bheemsgarages.model;

public class Car {
    private String id;
    private String name;
    private String brand;
    private String type;
    private double weekPrice;
    private double monthPrice;
    private String imageUrl;
    private String description;
    
    public Car(String id, String name, String brand, String type, 
               double weekPrice, double monthPrice, String imageUrl, String description) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.type = type;
        this.weekPrice = weekPrice;
        this.monthPrice = monthPrice;
        this.imageUrl = imageUrl;
        this.description = description;
    }
    
    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    
    public double getWeekPrice() { return weekPrice; }
    public void setWeekPrice(double weekPrice) { this.weekPrice = weekPrice; }
    
    public double getMonthPrice() { return monthPrice; }
    public void setMonthPrice(double monthPrice) { this.monthPrice = monthPrice; }
    
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
