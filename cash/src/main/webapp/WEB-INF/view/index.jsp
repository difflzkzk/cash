<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	
<div class="container">
<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
		<h1>index</h1>
	</div>
	<!-- 공지 -->
	<div class="text-center">공지사항 <a href="${pageContext.request.contextPath}/admin/noticeList/1" class= "btn btn-outline-info btn-sm">더보기</a></div>
	<div class="container">
		<table class="table table-sm">
			<thead>
				<tr class="text-center">
					<th>notice_id</th>
					<th>notice_title</th>
					<th>notice_date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr class="text-center">
						<td>${n.noticeId}</td>
						<td>${n.noticeTitle}</td>
						<td>${n.noticeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 월별 총 수입/지출 -->
	<div class="text-center">
		<h4>월별 총 수입 지출</h4>
	</div>
	<div class="text-center">
		<table class="container table ">
			<thead>
				<tr>
					<th>년/월</th>
					<th id="in">수입</th>
					<th id="out">지출</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="io" items="${inOutList}">
					<tr>
						<td>${io["날짜"]}</td> <!-- io.get("날짜") -->
						<td id="in">${io["수입"]}</td>
						<td id="out">${io["지출"]}</td>
						<td>${io["합계"]}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>