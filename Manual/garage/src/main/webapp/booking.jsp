<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Book a Car - Bheem's Garages</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Book Your Dream Car</h1>
            <nav>
                <ul>
                    <li><a href="home">Dashboard</a></li>
                    <li><a href="catalog">Car Catalog</a></li>
                    <li><a href="booking">Book a Car</a></li>
                </ul>
            </nav>
        </header>
        
        <main>
            <c:if test="${not empty bookingSuccess && bookingSuccess}">
                <div class="success-message">
                    <h3>${message}</h3>
                    <p>Thank you for choosing Bheem's Garages!</p>
                </div>
            </c:if>
            
            <div class="booking-form">
                <h2>Car Rental Booking</h2>
                
                <c:if test="${not empty car}">
                    <div class="selected-car">
                        <h3>Selected Car: ${car.brand} ${car.name}</h3>
                        <p>Type: ${car.type}</p>
                        <div class="pricing">
                            <p>Weekly Rate: $${car.weekPrice}</p>
                            <p>Monthly Rate: $${car.monthPrice}</p>
                        </div>
                    </div>
                </c:if>
                
                <form action="booking" method="post">
                    <c:if test="${not empty car}">
                        <input type="hidden" name="carId" value="${car.id}">
                    </c:if>
                    
                    <div class="form-group">
                        <label for="customerName">Full Name:</label>
                        <input type="text" id="customerName" name="customerName" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone Number:</label>
                        <input type="tel" id="phone" name="phone" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="rentalType">Rental Period:</label>
                        <select id="rentalType" name="rentalType" required>
                            <option value="">Select Period</option>
                            <option value="week">Weekly</option>
                            <option value="month">Monthly</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="startDate">Start Date:</label>
                        <input type="date" id="startDate" name="startDate" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="endDate">End Date:</label>
                        <input type="date" id="endDate" name="endDate" required>
                    </div>
                    
                    <button type="submit" class="submit-btn">Confirm Booking</button>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
