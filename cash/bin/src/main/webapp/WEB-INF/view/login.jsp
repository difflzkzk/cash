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
	<div class="login">
		<form action="${pageContext.request.contextPath}/login" method="post">
			<div>
				ID : <input type="text" name="id" value="goodee">
			</div>
			<div>
				PW : <input type="password" name="pw" value="1234">
			</div>
			<div>
				<button type="submit">로그인</button>
			</div>
		</form>
	</div>
	<div id="space"></div>
	<h3>공지</h3>
	<div>
		<table class="loginTable">
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
</body>
</html>