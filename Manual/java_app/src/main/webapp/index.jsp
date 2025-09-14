<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bheema's Food Truck - Home</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Welcome to Bheema's Food Truck</h1>
            <p>Authentic Indian Street Food</p>
        </header>
        
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/menu">Menu</a></li>
                <li><a href="${pageContext.request.contextPath}/order">Order Online</a></li>
            </ul>
        </nav>
        
        <main>
            <div class="hero">
                <img src="${pageContext.request.contextPath}/images/food-truck.jpg" alt="Bheema's Food Truck" class="hero-image">
                <div class="hero-text">
                    <h2>Delicious Food on the Go!</h2>
                    <p>Experience the authentic flavors of Indian street food</p>
                    <a href="${pageContext.request.contextPath}/order" class="cta-button">Order Now</a>
                </div>
            </div>
            
            <div class="categories">
                <h2>Our Categories</h2>
                <div class="category-grid">
                    <div class="category-item">
                        <h3>Vegetarian</h3>
                        <p>Fresh and flavorful vegetarian dishes</p>
                    </div>
                    <div class="category-item">
                        <h3>Non-Vegetarian</h3>
                        <p>Hearty and spicy non-vegetarian specialties</p>
                    </div>
                    <div class="category-item">
                        <h3>Snacks</h3>
                        <p>Quick bites and tasty snacks</p>
                    </div>
                    <div class="category-item">
                        <h3>Tiffins</h3>
                        <p>Traditional South Indian breakfast items</p>
                    </div>
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
