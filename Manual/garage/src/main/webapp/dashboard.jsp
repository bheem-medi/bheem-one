<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard - Bheem's Garages</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Bheem's Garages & Co. - Dashboard</h1>
            <nav>
                <ul>
                    <li><a href="home">Dashboard</a></li>
                    <li><a href="catalog">Car Catalog</a></li>
                    <li><a href="booking">Book a Car</a></li>
                </ul>
            </nav>
        </header>
        
        <main>
            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <h3>Premium Collection</h3>
                    <p>Explore our luxury car fleet</p>
                    <a href="catalog" class="btn">View Cars</a>
                </div>
                
                <div class="dashboard-card">
                    <h3>Quick Booking</h3>
                    <p>Book your dream car now</p>
                    <a href="booking" class="btn">Book Now</a>
                </div>
                
                <div class="dashboard-card">
                    <h3>Weekly Rentals</h3>
                    <p>Best deals for weekly rentals</p>
                    <a href="catalog?rentalType=week" class="btn">View Deals</a>
                </div>
                
                <div class="dashboard-card">
                    <h3>Monthly Rentals</h3>
                    <p>Long-term rental options</p>
                    <a href="catalog?rentalType=month" class="btn">View Options</a>
                </div>
            </div>
            
            <div class="featured-cars">
                <h2>Featured Luxury Cars</h2>
                <div class="car-grid">
                    <div class="car-card">
                        <div class="car-image-placeholder">BMW Image</div>
                        <h4>BMW 7 Series</h4>
                        <p>From $1200/week</p>
                    </div>
                    <div class="car-card">
                        <div class="car-image-placeholder">Ferrari Image</div>
                        <h4>Ferrari 488</h4>
                        <p>From $2500/week</p>
                    </div>
                    <div class="car-card">
                        <div class="car-image-placeholder">Bentley Image</div>
                        <h4>Bentley Continental</h4>
                        <p>From $1800/week</p>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
