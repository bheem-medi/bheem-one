<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bheema's Food Truck - Order Online</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <script>
        function updateTotal() {
            let total = 0;
            const quantities = document.querySelectorAll('input[type="number"]');
            
            quantities.forEach(input => {
                if (input.value && input.value > 0) {
                    const price = parseFloat(input.dataset.price);
                    const quantity = parseInt(input.value);
                    total += price * quantity;
                }
            });
            
            document.getElementById('totalAmount').textContent = '₹' + total.toFixed(2);
        }
        
        function validateForm() {
            const name = document.forms["orderForm"]["customerName"].value;
            const phone = document.forms["orderForm"]["customerPhone"].value;
            const address = document.forms["orderForm"]["customerAddress"].value;
            
            if (name == "" || phone == "" || address == "") {
                alert("Please fill in all customer information fields");
                return false;
            }
            
            let hasItems = false;
            const quantities = document.querySelectorAll('input[type="number"]');
            quantities.forEach(input => {
                if (input.value && input.value > 0) {
                    hasItems = true;
                }
            });
            
            if (!hasItems) {
                alert("Please select at least one item to order");
                return false;
            }
            
            return true;
        }
    </script>
</head>
<body onload="updateTotal()">
    <div class="container">
        <header>
            <h1>Place Your Order</h1>
            <p>Bheema's Food Truck - Online Ordering</p>
        </header>
        
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/menu">Menu</a></li>
                <li><a href="${pageContext.request.contextPath}/order" class="active">Order Online</a></li>
            </ul>
        </nav>
        
        <main>
            <c:if test="${not empty errorMessage}">
                <div class="error-message">
                    <p>${errorMessage}</p>
                </div>
            </c:if>
            
            <form name="orderForm" action="${pageContext.request.contextPath}/order" method="post" onsubmit="return validateForm()">
                <div class="customer-info">
                    <h2>Customer Information</h2>
                    <div class="form-group">
                        <label for="customerName">Full Name:</label>
                        <input type="text" id="customerName" name="customerName" required>
                    </div>
                    <div class="form-group">
                        <label for="customerPhone">Phone Number:</label>
                        <input type="tel" id="customerPhone" name="customerPhone" required>
                    </div>
                    <div class="form-group">
                        <label for="customerAddress">Delivery Address:</label>
                        <textarea id="customerAddress" name="customerAddress" rows="3" required></textarea>
                    </div>
                </div>
                
                <div class="order-items">
                    <h2>Select Items</h2>
                    <div class="menu-items">
                        <c:forEach var="item" items="${menuItems}">
                            <div class="order-item">
                                <div class="item-info">
                                    <h3>${item.name} <span class="item-category">(${item.category})</span></h3>
                                    <p class="item-description">${item.description}</p>
                                    <p class="item-price">₹${item.price}</p>
                                </div>
                                <div class="item-quantity">
                                    <input type="hidden" name="itemId" value="${item.id}">
                                    <label for="quantity_${item.id}">Quantity:</label>
                                    <input type="number" id="quantity_${item.id}" name="quantity_${item.id}" 
                                           min="0" max="10" value="0" data-price="${item.price}" 
                                           onchange="updateTotal()">
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                
                <div class="order-summary">
                    <h2>Order Summary</h2>
                    <p class="total-amount">Total: <span id="totalAmount">₹0.00</span></p>
                    <button type="submit" class="submit-order">Place Order</button>
                </div>
            </form>
        </main>
        
        <footer>
            <p>&copy; 2023 Bheema's Food Truck. All rights reserved.</p>
            <p>Contact: +1 (555) 123-4567 | email: info@bheemasfoodtruck.com</p>
        </footer>
    </div>
</body>
</html>
