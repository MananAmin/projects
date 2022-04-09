<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Liquidate Fixed Deposit</title>
    <style>
        h3{
            font-family: Calibri;
            font-size: 30pt;
            font-style: normal;
            font-weight: bold;
            color:#6b5b95;
            text-align: center;
            text-decoration: underline
        }
        h2{
            font-family: Calibri;
            color:#6b5b95;
            text-align: center;
        }
        h4{
            font-family: Calibri;
            color:#6b5b95;
            text-align: center;
        }
        body {font-family: Arial, Helvetica, sans-serif;}
        * {box-sizing: border-box;}
        .hide {
            display: none;
        }
        .incrLimit{
            margin-left: auto;
            margin-right: auto;
        }
        .closeFD{
            margin-left: auto;
            margin-right: auto;
        }
        .successMsg{
            border: 1px solid;
            margin: 10px 0px;
            padding: 15px 10px 15px 50px;
            background-repeat: no-repeat;
            background-position: 10px center;
            color: #08d601;
            background-color: #d3ffba;
        }
        .errorMsg{
            border: 1px solid;
            margin: 10px 0px;
            padding: 15px 10px 15px 50px;
            background-repeat: no-repeat;
            background-position: 10px center;
            color: #D63301;
            background-color: #FFCCBA;
            background-image: url('https://i.imgur.com/GnyDvKN.png');
        }
        .container{text-align: center;}
    </style>
</head>

<body>

<h3>Nova Bank</h3>
<%
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("username")==null)
    {
        response.sendRedirect("/user");
    }
%>

<div class="container">Welcome, ${sessionScope.username }
    <a href="user">Home</a>
    <a href="${pageContext.request.contextPath }/logout">Logout</a>
</div>

<h2>Liquidate Deposit</h2>

<div class="${Request==null ? "hide" : "successMsg"}">
    Selected deposit has been liquidated.
</div>
<div class="${errorMsg==null ? "hide" : "errorMsg"}">
    ${errorMsg}
</div>

<form method="post" action="${pageContext.request.contextPath }/closeFD" >
    <table class="closeFD">
        <tr>
            <td>Customer Name - </td>
            <td><output name="username">${sessionScope.username }</output></td>
        </tr>
        <tr>
            <td>Account Number - </td>
            <td><output name="account">${AccountNumber}</output></td>
        </tr>
        <tr>
            <td>Balance - </td>
            <td><output name="balance">${Balance}</output></td>
        </tr>
    </table>

<h4>All Deposits</h4>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="closeFD">
    <c:forEach items="${depositList}" var="deposit">
        <tr>
            <td><c:out value="${deposit.getDepositId()}" /></td>
            <td><c:out value="${deposit.getCustomerId()}" /></td>
            <td><c:out value="${deposit.getAmount()}" /></td>
            <td><c:out value="${deposit.getDepositType()}" /></td>
            <td><c:out value="${deposit.getTenure()}" /></td>
            <td><c:out value="${deposit.getInterest()}" /></td>
            <td><c:out value="${deposit.getOpenDate()}" /></td>
            <td><c:out value="${deposit.getMaturityDate()}" /></td>
            <td><button type="submit" name="selected" value="${deposit.getDepositId()}">Liquidate</button></td>
        </tr>
    </c:forEach>
</table>
</form>

</body>
</html>