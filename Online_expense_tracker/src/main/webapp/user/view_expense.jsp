<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Tracker - All Expenses</title>
<%@include file="../component/all_css.jsp"%>
<style>
    .top-container {
        margin-top: 20px; /* Adjust this value as needed */
    }
</style>
</head>
<body>
    <c:if test="${empty loginUser }">
        <c:redirect url="../Login.jsp"></c:redirect>
    </c:if>
    <%@include file="../component/navbar.jsp"%>

    <div class="container top-container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header text-center">
                        <p class="fs-3">All Expenses</p>
                        <c:if test="${not empty msg }">
                            <p class="text-center fs-3">${msg}</p>
                            <c:remove var="msg" />
                        </c:if>
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Title</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                User user = (User) session.getAttribute("loginUser");
                                ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
                                List<Expense> list = dao.getAllExpenseByUser(user);
                                for (Expense ex : list) {
                                %>
                                <tr>
                                    <th scope="row"><%=ex.getTitle()%></th>
                                    <td><%=ex.getDescription()%></td>
                                    <td><%=ex.getDate()%></td>
                                    <td><%=ex.getTime()%></td>
                                    <td><%=ex.getPrice()%></td>
                                    <td>
                                        <a href="edit_expense.jsp?id=<%=ex.getId()%>" class="btn btn-sm btn-primary me-1">Edit</a>
                                        <a href="../deleteExpense?id=<%=ex.getId()%>" class="btn btn-sm btn-danger me-1">Delete</a>
                                    </td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
