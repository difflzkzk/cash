<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>올해 매월 수입, 지출</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<jsp:include page ="${pageContext.request.contextPath}/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page ="${pageContext.request.contextPath}/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>올해 매월 수입, 지출</h1>
	<div>
		<canvas id="scatterChart"></canvas>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>1월</th>
					<th>2월</th>
					<th>3월</th>
					<th>4월</th>
					<th>5월</th>
					<th>6월</th>
					<th>7월</th>
					<th>8월</th>
					<th>9월</th>
					<th>10월</th>
					<th>11월</th>
					<th>12월</th>
				</tr>
			</thead>
			<tbody id="tableBody"></tbody>
		</table>
	</div>
</body>
</html>