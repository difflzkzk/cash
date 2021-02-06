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
	<form method="post" action="${pageContext.request.contextPath}/admin/updateCashbook?cashbookId=${cashOne.cashbookId }&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">
		<table border="1">
			<tr>
				<td>cashbook_date</td>
				<td>
					<input type="text" name="cashbookDate" 
								value="${currentYear}-${currentMonth}-${currentDay}" 
								readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>cashbook_kind</td>
				<td>
					<c:if test='${cashOne.cashbookKind == "수입" }'>
						<input type="radio" name="cashbookKind" value="수입" checked="checked">수입
						<input type="radio" name="cashbookKind" value="지출">지출
					</c:if>
					<c:if test='${cashOne.cashbookKind == "지출" }'>
						<input type="radio" name="cashbookKind" value="수입">수입
						<input type="radio" name="cashbookKind" value="지출" checked="checked">지출
					</c:if>
				</td>
			</tr>
			<tr>
				<td>category_name</td>
				<td>
					<select name="categoryName">
						<c:forEach var="c" items="${categoryList}">
							<c:if test="${(c.categoryName).equals(cashOne.categoryName)}">
								<option value="${c.categoryName}" selected="selected">${c.categoryName}</option>
							</c:if>
							<c:if test="${!c.categoryName.equals(cashOne.categoryName)}">
								<option value="${c.categoryName}">${c.categoryName}</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>cashbook_price</td>
				<td>
					<input type="text" name="cashbookPrice" value="${cashOne.cashbookPrice }">
				</td>
			</tr>
			<tr>
				<td>cashbook_content</td>
				<td>
					<input type="text" name="cashbookContent" value="${cashOne.cashbookContent }">
				</td>
			</tr>
		</table>
		<button type="submit">수입/지출 수정</button>
	</form>
</body>
</html>