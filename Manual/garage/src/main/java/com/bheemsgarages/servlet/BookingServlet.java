package com.bheemsgarages.servlet;

import com.bheemsgarages.model.Car;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    
    private List<Car> cars;
    
    @Override
    public void init() throws ServletException {
        // Reinitialize car data (same as catalog)
        cars = new ArrayList<>();
        cars.add(new Car("1", "BMW 7 Series", "BMW", "Luxury Sedan", 1200, 4000, 
                        "images/bmw7.jpg", "Luxury sedan with premium features"));
        // Add other cars as in CarCatalogServlet...
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String carId = request.getParameter("carId");
        
        if (carId != null) {
            Car selectedCar = findCarById(carId);
            if (selectedCar != null) {
                request.setAttribute("car", selectedCar);
            }
        }
        
        request.getRequestDispatcher("/booking.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Handle booking form submission
        String carId = request.getParameter("carId");
        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String rentalType = request.getParameter("rentalType");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        // In a real application, you would save this to a database
        // For now, we'll just set a success message
        
        request.setAttribute("bookingSuccess", true);
        request.setAttribute("message", "Booking confirmed! We'll contact you soon at " + email);
        request.getRequestDispatcher("/booking.jsp").forward(request, response);
    }
    
    private Car findCarById(String carId) {
        for (Car car : cars) {
            if (car.getId().equals(carId)) {
                return car;
            }
        }
        return null;
    }
}
