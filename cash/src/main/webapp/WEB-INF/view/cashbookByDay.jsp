<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
		<h1>cashbookListByDay</h1>
	</div>
	<div style="text-align:center">
		<a href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}"class="btn btn-outline-info">
			이전
		</a>
		
		<span>${currentYear}년 ${currentMonth}월 ${currentDay}일</span>
		
		<a href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}"class="btn btn-outline-info">
			이후
		</a>
		
	</div>
	<div style="text-aling:left">
		<a href="${pageContext.request.contextPath}/admin/addCashbook/${target}/${currentYear}/${currentMonth}/${currentDay}"class="btn btn-success">수입/지출 추가</a>
	</div>	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>cashbookId</th>
				<th>cashbookKind</th>
				<th>categoryName</th>
				<th>cashbookPrice</th>
				<th>cashbookContent</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach var="c" items="${cashbookList}">
				<tr>
					<td>${c.cashbookId}</td>
					<td>${c.cashbookKind}</td>
					<td><a href="${pageContext.request.contextPath}/admin/cashbookOne/${c.cashbookId}">${c.categoryName}</a></td>
					<td>${c.cashbookPrice}</td>
					<td>${c.cashbookContent}</td>
					<td><a href="${pageContext.request.contextPath}/admin/updateCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}" class="btn btn-outline-success">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/admin/deleteCashbook?cashbookId=${c.cashbookId }&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}" class="btn btn-outline-danger">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>