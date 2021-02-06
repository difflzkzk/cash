<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.sunday {color : #FF0000;}
</style>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
	<h1>cashbookList</h1>
	</div>
	<!-- 다이어리 -->
	<div>
	<div>이번 달 총 수입</div>
		 <input type="text" class="form-control" id="exampleInputAmount" placeholder="${sumIn}"> 
	</div>
	<div>
		이번달 지출 합계 
		<input type="text" class="form-control" id="exampleInputAmount" placeholder="${sumOut}">
	</div>
	<div style="text-align:center">
		<h3>
			<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/pre/${currentYear}/${currentMonth}" class="btn btn-outline-info">이전달</a>
			${currentYear}년 ${currentMonth} 월
			<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/next/${currentYear}/${currentMonth}" class="btn btn-outline-info">다음달</a>
		</h3>
	</div>
	<div>
		<table class="table table-hover" width="100%">
			<thead>
				<tr>
					<th class="sunday">일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
						<c:if test="${i-(firstDayOfWeek-1) < 1}">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) > 0}">
							<td>
								<div><!-- 날짜 -->
									<a href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
										${i-(firstDayOfWeek-1)}
									</a>
								</div>
								<!-- 지출/수입 목록이 있는 날짜를 cashList에서 검색 -->
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
										<c:if test="${c.cashbookKind == '수입'}">
											<div><p class="text-success">수입 : ${c.cashbookPrice}</p></div>
										</c:if>
										<c:if test="${c.cashbookKind == '지출'}">
											<div class="text-danger">지출 : ${c.cashbookPrice}</div>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
						</c:if>
						<c:if test="${i%7 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					
					<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
						<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>