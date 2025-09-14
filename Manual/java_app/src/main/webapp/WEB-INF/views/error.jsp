<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error - Bheema's Food Truck</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Bheema's Food Truck</h1>
            <p>Something went wrong</p>
        </header>
        
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/menu">Menu</a></li>
                <li><a href="${pageContext.request.contextPath}/order">Order Online</a></li>
            </ul>
        </nav>
        
        <main>
            <div class="error-page">
                <h2>Oops! Something went wrong.</h2>
                
                <c:if test="${not empty pageContext.errorData.throwable}">
                    <div class="error-details">
                        <p><strong>Error:</strong> ${pageContext.errorData.throwable.message}</p>
                    </div>
                </c:if>
                
                <c:if test="${not empty pageContext.errorData.statusCode}">
                    <div class="error-code">
                        <p>Error Code: ${pageContext.errorData.statusCode}</p>
                    </div>
                </c:if>
                
                <p>We apologize for the inconvenience. Please try again later or contact us if the problem persists.</p>
                
