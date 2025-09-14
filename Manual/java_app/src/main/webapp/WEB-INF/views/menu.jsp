<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bheema's Food Truck - Menu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Bheema's Food Truck Menu</h1>
            <p>Authentic Indian Street Food</p>
        </header>
        
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/menu" class="active">Menu</a></li>
                <li><a href="${pageContext.request.contextPath}/order">Order Online</a></li>
            </ul>
        </nav>
        
        <main>
            <div class="category-filter">
                <h2>Filter by Category</h2>
                <div class="filter-buttons">
                    <a href="${pageContext.request.contextPath}/menu" class="filter-btn">All</a>
                    <a href="${pageContext.request.contextPath}/menu?category=veg" class="filter-btn">Vegetarian</a>
                    <a href="${pageContext.request.contextPath}/menu?category=nonveg" class="filter-btn">Non-Vegetarian</a>
                    <a href="${pageContext.request.contextPath}/menu?category=snax" class="filter-btn">Snacks</a>
                    <a href="${pageContext.request.contextPath}/menu?category=tiffins" class="filter-btn">Tiffins</a>
                </div>
            </div>
            
            <div class="menu-items">
                <c:choose>
                    <c:when test="${not empty menuItems}">
                        <c:forEach var="item" items="${menuItems}">
                            <div class="menu-item">
                                <div class="item-info">
                                    <h3>${item.name}</h3>
                                    <p class="item-category">${item.category}</p>
                                    <p class="item-description">${item.description}</p>
                                    <p class="item-price">₹${item.price}</p>
                                </div>
                                <div class="item-action">
                                    <a href="${pageContext.request.contextPath}/order?itemId=${item.id}" class="order-btn">Add to Order</a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="no-items">
                            <p>No menu items found for the selected category.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="order-cta">
                <a href="${pageContext.request.contextPath}/order" class="cta-button">Place Your Order</a>
            </div>
        </main>
        
        <footer>
            <p>&copy; 2023 Bheema's Food Truck. All rights reserved.</p>
            <p>Contact: +1 (555) 123-4567 | email: info@bheemasfoodtruck.com</p>
        </footer>
    </div>
</body>
</html>
