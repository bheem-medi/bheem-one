<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bheema's Food Truck - Order Confirmation</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Order Confirmation</h1>
            <p>Bheema's Food Truck - Thank You for Your Order!</p>
        </header>
        
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/menu">Menu</a></li>
                <li><a href="${pageContext.request.contextPath}/order">Order Online</a></li>
            </ul>
        </nav>
        
        <main>
            <div class="confirmation-message">
                <h2>Thank You for Your Order!</h2>
                <p>Your order has been successfully placed with order ID: <strong>${orderId}</strong></p>
                <p>Total Amount: <strong>₹${totalAmount}</strong></p>
                <p>We are preparing your food and it will be delivered to your address shortly.</p>
                
                <div class="next-steps">
                    <h3>What's Next?</h3>
                    <ul>
                        <li>You will receive a confirmation call within 10 minutes</li>
                        <li>Estimated delivery time: 30-45 minutes</li>
                        <li>Keep your phone handy for delivery updates</li>
                    </ul>
                </div>
                
                <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/menu" class="cta-button">Browse Menu Again</a>
                    <a href="${pageContext.request.contextPath}/" class="cta-button secondary">Return to Home</a>
                </div>
            </div>
        </main>
        
        <footer>
            <p>&copy; 2023 Bheema's Food Truck. All rights reserved.</p>
            <p>Contact: +1 (555) 123-4567 | email: info@bheemasfoodtruck.com</p>
        </footer>
    </div>
</body>
</html>
