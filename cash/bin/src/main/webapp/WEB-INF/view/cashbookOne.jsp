<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCashbook</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>addCashbook</h1>
		<table border="1">
			<tr>
				<td>cashbook_date</td>
				<td>${cashOne.cashbookDate}</td>
			</tr>
			<tr>
				<td>cashbook_kind</td>
				<td>${cashOne.cashbookKind }</td>
			</tr>
			<tr>
				<td>category_name</td>
				<td>${cashOne.categoryName }</td>
			</tr>
			<tr>
				<td>cashbook_price</td>
				<td>${cashOne.cashbookPrice }</td>
			</tr>
			<tr>
				<td>cashbook_content</td>
				<td>${cashOne.cashbookContent }</td>
			</tr>
		</table>
</body>
</html>