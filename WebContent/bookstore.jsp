<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online Bookstore</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #4CAF50;
        }
        .book-list {
            list-style-type: none;
            padding: 0;
        }
        .book-item {
            padding: 10px;
            margin-bottom: 10px;
            background: #f9f9f9;
            border: 1px solid #ddd;
        }
        .offer {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<%! 
    // Declaration: JavaBean class for Book
    public static class Book {
        private String title;
        private double price;

        public Book(String title, double price) {
            this.title = title;
            this.price = price;
        }

        public String getTitle() {
            return title;
        }

        public double getPrice() {
            return price;
        }
    }
%>

<%
    // Scriptlet: Setting data
    request.setAttribute("username", "Amisha");
    List<Book> books = new ArrayList<Book>();
    books.add(new Book("The Alchemist", 299.99));
    books.add(new Book("Clean Code", 499.50));
    books.add(new Book("Java: The Complete Reference", 899.00));
    request.setAttribute("books", books);
%>

<h1>Welcome to Online Bookstore, ${username}!</h1>

<p>Here's a list of books available for you:</p>

<ul class="book-list">
    <!-- JSTL Core Tags: Looping through the list of books -->
    <c:forEach items="${books}" var="book">
        <li class="book-item">
            <strong>Title:</strong> ${book.title} <br>
            <strong>Price:</strong> <fmt:formatNumber value="${book.price}" type="currency" currencySymbol="₹" />
        </li>
    </c:forEach>
</ul>

<!-- Conditional Display using JSTL -->
<c:choose>
    <c:when test="${fn:length(books) > 10}">
        <p class="offer">Special Offer: Buy 5 books and get 10% off!</p>
    </c:when>
    <c:otherwise>
        <p class="offer">Buy more than 5 books to avail exciting offers!</p>
    </c:otherwise>
</c:choose>

<p>Thank you for visiting our bookstore!</p>

</body>
</html>
