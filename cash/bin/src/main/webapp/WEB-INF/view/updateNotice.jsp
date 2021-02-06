<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateNotice</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#addbtn').click(function(){
			let html = `
					<input type="file" class="noticefile" name="noticefileList" multiple="multiple">
					<br>
				`;
			$('#appendfile').append(html);
	})
	
	$('#delbtn').click(function(){
		$('#appendfile').children().last().remove();
	})
	$("#updateNotice").click(function(){
		let ck = true;
		$('.noticefile').each(function(index,item){
				if($(item).val()==''){
				ck = false;
			}
		})
		if(ck == true){
			$('#fileUpdateForm').submit();
		}else{
			alert('선택하지 않은 파일이 있습니다.');
		}
	})
})
</script>
</head>
<body>
<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>noticeList</h1>
	<div>
		<form id="fileUpdateForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/admin/updateNotice?noticeId=${updateNoticeForm.noticeId }">
			<table border="1">
				<tr>
					<th>notice_title</th>
					<td><input type="text" name ="noticeTitle" value="${updateNoticeForm.noticeTitle}"></td>
				</tr>
				<tr>
					<th>notice_content</th>
					<td><textarea cols="60" rows="10" name="noticeContent">${updateNoticeForm.noticeContent}</textarea></td>
				</tr>
			</table>
			<table border="1">
				<tr>
					<th>첨부 파일</th>
					<td>
						<c:forEach var="bf" items="${updateNoticeForm.noticefileList}">
							<div>
								<a href="${pageContext.request.contextPath}/upload/${bf.noticefileName}">${bf.noticefileName } </a>
								<a href="${pageContext.request.contextPath}/admin/deleteFileOne?noticefileId=${bf.noticefileId}&noticefileName=${bf.noticefileName}&noticeId=${updateNoticeForm.noticeId}"> [파일 삭제]</a>
							</div>
						</c:forEach>
					</td>
				</tr>
			</table>
			<table border="1">
				<tr>
					<th style="float:auto;">
						파일 첨부
						<br>
						<button type="button" id="addbtn" style="float:auto;">[+]</button>
						<button type="button" id="delbtn" style="float:auto;">[-]</button>
					</th>
					<td style="width:80%">
						<div id="appendfile"></div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<button type="button" id="updateNotice">수정하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>