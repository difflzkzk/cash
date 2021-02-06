<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCashbook</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
		<h1>CashbookOne</h1>
	</div>
		<table class="table">
			<tr class="sm">
				<td>cashbook_id</td>
				<td>${cashOne.cashbookId}번</td>
			</tr>
			<tr>
				<td>cashbook_date</td>
				<td>${cashOne.cashbookDate}</td>
			</tr>
			<tr>
				<td>cashbook_kind</td>
				<td>${cashOne.cashbookKind}</td>
			</tr>
			<tr>
				<td>category_name</td>
				<td>${cashOne.categoryName}</td>
			</tr>
			<tr>
				<td>cashbook_price</td>
				<td>${cashOne.cashbookPrice}</td>
			</tr>
			<tr>
				<td>cashbook_content</td>
				<td>${cashOne.cashbookContent}</td>
			</tr>
		</table>
</div>
</body>
</html>