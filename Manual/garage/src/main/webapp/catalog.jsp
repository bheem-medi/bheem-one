<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Car Catalog - Bheem's Garages</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Our Premium Car Collection</h1>
            <nav>
                <ul>
                    <li><a href="home">Dashboard</a></li>
                    <li><a href="catalog">Car Catalog</a></li>
                    <li><a href="booking">Book a Car</a></li>
                </ul>
            </nav>
        </header>
        
        <main>
            <div class="filter-section">
                <h3>Filter by Brand:</h3>
                <select onchange="filterByBrand(this.value)">
                    <option value="">All Brands</option>
                    <option value="BMW">BMW</option>
                    <option value="Ferrari">Ferrari</option>
                    <option value="Bentley">Bentley</option>
                    <option value="Mercedes">Mercedes</option>
                    <option value="Audi">Audi</option>
                    <option value="Porsche">Porsche</option>
                </select>
            </div>
            
            <div class="cars-grid">
                <c:forEach var="car" items="${cars}">
                    <div class="car-item">
                        <div class="car-image">
                            <!-- Replace with actual image path -->
                            <div class="image-placeholder">${car.brand} ${car.name}</div>
                        </div>
                        <div class="car-details">
                            <h3>${car.brand} ${car.name}</h3>
                            <p class="car-type">${car.type}</p>
                            <p class="car-description">${car.description}</p>
                            <div class="pricing">
                                <div class="price-week">
                                    <strong>Weekly:</strong> $${car.weekPrice}
                                </div>
                                <div class="price-month">
                                    <strong>Monthly:</strong> $${car.monthPrice}
                                </div>
                            </div>
                            <a href="booking?carId=${car.id}" class="book-btn">Book Now</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </div>
    
    <script>
        function filterByBrand(brand) {
            if (brand) {
                window.location.href = 'catalog?brand=' + brand;
            } else {
                window.location.href = 'catalog';
            }
        }
    </script>
</body>
</html>
