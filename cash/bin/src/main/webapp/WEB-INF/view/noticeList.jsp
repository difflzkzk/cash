<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeList</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>noticeList</h1>
	<a href="${pageContext.request.contextPath}/admin/addNotice">공지 추가</a>
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
					<th>notice_date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeListByPage}">
					<tr>
						<td>${n.noticeId}</td>
						<td><a href="${pageContext.request.contextPath}/admin/noticeOne/${n.noticeId}/1">${n.noticeTitle}</a></td>
						<td>${n.noticeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- 첫 페이지일때 -->
	<c:if test="${currentPage == 1 && lastPage != 1}">
		<a href="">처음</a>
		<a href="">이전</a>
		<a href="${pageContext.request.contextPath}/admin/noticeList/${currentPage+1}">다음</a>
		<a href="${pageContext.request.contextPath}/admin/noticeList/${lastPage}">마지막</a>
	</c:if>
	<!-- 마지막 페이지 일 때 -->
	<c:if test="${currentPage == lastPage && lastPage != 1}">
		<a href="${pageContext.request.contextPath}/admin/noticeList/1">처음</a>
		<a href="${pageContext.request.contextPath}/admin/noticeList/${currentPage-1}">이전</a>
		<a href="">다음</a>
		<a href="">마지막</a>
	</c:if>
	<!-- 중간페이지 일 때 -->
	<c:if test="${currentPage > 1 && currentPage < lastPage}">
		<a href="${pageContext.request.contextPath}/admin/noticeList/1">처음</a>
		<a href="${pageContext.request.contextPath}/admin/noticeList/${currentPage-1}">이전</a>
		<a href="${pageContext.request.contextPath}/admin/noticeList/${currentPage+1}">다음</a>
		<a href="${pageContext.request.contextPath}/admin/noticeList/${lastPage}">마지막</a>
	</c:if>
	<!-- 리스트 목록이 첫 페이지 밖에 없을 때 -->
	<c:if test="${currentPage == 1 && lastPage==1 }">
		<a href="">처음</a>
		<a href="">이전</a>
		<a href="">다음</a>
		<a href="">마지막</a>
	</c:if>
</body>
</html>