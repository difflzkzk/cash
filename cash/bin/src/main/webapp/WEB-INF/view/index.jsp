<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/accountStyle.css"/>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>가계부</h1>
	<!-- 공지 -->
	<div id="aloneText">공지사항 <a id="aloneLink" href="${pageContext.request.contextPath}/admin/noticeList/1">more</a></div>
	<div>
		<table class="noticeTable">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId}</td>
						<td>${n.noticeTitle}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 수입/지출 -->
	<div>
		<table class="inoutTable">
			<thead>
				<tr>
					<th>날짜</th>
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
</body>
</html>