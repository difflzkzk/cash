<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCashbook</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#cashbookPrice').val()==''){ // 가격 입력 안했을 때
				alert("가격을 입력해주세요.");
				$('#cashbookPrice').focus();
			}else if($('input:radio[name=cashbookKind]').is(':checked') == false){ // 수입,지출 체크하지 않았을 때 
				alert("수입/지출 체크해주세요.");
			}else if($('#cashbookContent').val()==''){//내용을 입력 안했을 때
				alert("내용을 입력해주세요.");
				$('#cashbookContent').focus();
			}else{ // 위의 조건에 전부 만족했다면 type = submit로 변경
				$('#submitBtn').removeAttr("type");
				$('#submitBtn').attr("type","submit");
			}
		})
	})
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>addCashbook</h1>
	<form method="post" action="${pageContext.request.contextPath}/admin/addCashbook?target=${target}&currentYear=${currentYear}&
																		currentMonth=${currentMonth}&currentDay=${currentDay}">
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
					<input type="radio" name="cashbookKind" value="수입">수입
					<input type="radio" name="cashbookKind" value="지출">지출
				</td>
			</tr>
			<tr>
				<td>category_name</td>
				<td>
					<select id="categoryName" name="categoryName">
						<c:forEach var="c" items="${categoryList}">
							<option value="${c.categoryName}">${c.categoryName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>cashbook_price</td>
				<td> <!-- pattern => 입력값 정의 , 일치하지 않는다면 오류메세지 출력 -->
					<input type="text" pattern="[0-9]+" id="cashbookPrice" name="cashbookPrice">
				</td>
			</tr>
			<tr>
				<td>cashbook_content</td>
				<td>
					<input type="text" id="cashbookContent" name="cashbookContent">
				</td>
			</tr>
		</table>
		<button id="submitBtn" type="button">수입/지출 입력</button>
	</form>
</body>
</html>