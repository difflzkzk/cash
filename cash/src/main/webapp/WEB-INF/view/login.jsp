<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<body>
<div class="container">
	<div class="jumbotron well" align="center">
		<div>
			<h3>가계부</h3>
			기간:20.11.03~20.11.18
			<br>
			언어:java,javaScript,HTML,SQL
			<br>
			도구:Github,STS,HeidiSQL
			<br>
			DB:MariaDB
			<br>
			개인 프로젝트인 가계부 입니다
			Spring FrameWork를 사용하여 처음으로 만든 프로젝트이며<br>
			주요 기능은 게시판 페이징 파일다운로드(Poi 라이브러리 사용)차트가 있습니다 
		</div>
	</div>
		<div class="container">
			<div class="text-center">
				<h2>공지사항</h2>
			</div>	
			<table class="table table-sm">
				<thead>
					<tr class="text-center">
						<th>notice_id</th>
						<th>notice_title</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${noticeList}">
						<tr class="text-center">
							<td>${n.noticeId}</td>
							<td>${n.noticeTitle}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container">
			<form action="${pageContext.request.contextPath}/login" method="post">
				<div align="center">
				<h3>로그인</h3>
					<table style="margin-top:10px">
						<tr>
							<td>ID</td>
							<td>
								 <input class="form-control" type="text" name="id" value="goodee">
							</td>
						</tr>
						<tr>
							<td>PW</td>
							<td>
								 <input class="form-control" type="password" name="pw" value="1234">
							</td>
						</tr>
						
						<tr>
							
							<td>
								<button class="btn btn-primary btn-block" type="submit">로그인</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>