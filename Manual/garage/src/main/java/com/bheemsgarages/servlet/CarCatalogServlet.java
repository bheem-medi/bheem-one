package com.bheemsgarages.servlet;

import com.bheemsgarages.model.Car;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/catalog")
public class CarCatalogServlet extends HttpServlet {
    
    private List<Car> cars;
    
    @Override
    public void init() throws ServletException {
        // Initialize car data (in real app, this would come from database)
        cars = new ArrayList<>();
        
        // Premium Cars
        cars.add(new Car("1", "BMW 7 Series", "BMW", "Luxury Sedan", 1200, 4000, 
                        "images/bmw7.jpg", "Luxury sedan with premium features"));
        cars.add(new Car("2", "Volkswagen Golf", "Volkswagen", "Hatchback", 300, 1000, 
                        "images/vwgolf.jpg", "Compact and efficient hatchback"));
        cars.add(new Car("3", "Ferrari 488", "Ferrari", "Sports Car", 2500, 8000, 
                        "images/ferrari488.jpg", "High-performance sports car"));
        cars.add(new Car("4", "Bentley Continental", "Bentley", "Luxury Coupe", 1800, 6000, 
                        "images/bentley.jpg", "Ultimate luxury grand tourer"));
        cars.add(new Car("5", "Mini Cooper S", "Mini", "Compact", 400, 1300, 
                        "images/minicooper.jpg", "Iconic British compact car"));
        cars.add(new Car("6", "Jaguar F-Pace", "Jaguar", "SUV", 800, 2600, 
                        "images/jaguar.jpg", "Luxury sports SUV"));
        cars.add(new Car("7", "Range Rover Sport", "Land Rover", "SUV", 900, 3000, 
                        "images/rangerover.jpg", "Premium SUV with off-road capabilities"));
        cars.add(new Car("8", "Mercedes S-Class", "Mercedes", "Luxury Sedan", 1100, 3600, 
                        "images/mercedes.jpg", "Flagship luxury sedan"));
        cars.add(new Car("9", "Audi R8", "Audi", "Sports Car", 2000, 7000, 
                        "images/audir8.jpg", "High-performance sports car"));
        cars.add(new Car("10", "Porsche 911", "Porsche", "Sports Car", 2200, 7500, 
                        "images/porsche911.jpg", "Iconic sports car"));
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String brand = request.getParameter("brand");
        List<Car> filteredCars;
        
        if (brand != null && !brand.isEmpty()) {
            filteredCars = new ArrayList<>();
            for (Car car : cars) {
                if (car.getBrand().equalsIgnoreCase(brand)) {
                    filteredCars.add(car);
                }
            }
        } else {
            filteredCars = cars;
        }
        
        request.setAttribute("cars", filteredCars);
        request.getRequestDispatcher("/catalog.jsp").forward(request, response);
    }
}
