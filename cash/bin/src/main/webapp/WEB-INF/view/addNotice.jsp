<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	$("#submitbtn").click(function(){
		let ck = true;
		$('.noticefile').each(function(index,item){
				if($(item).val()==''){
				ck = false;
			}
		})
		if(ck == true){
			$('#fileuploadForm').submit();
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
		<form id="fileuploadForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/admin/addNotice">
			<table border="1">
				<tr>
					<th>notice_title</th>
					<td><input type="text" name ="noticeTitle"></td>
				</tr>
				<tr>
					<th>notice_content</th>
					<td><textarea cols="60" rows="10" name="noticeContent"></textarea></td>
				</tr>
				<tr>
				<th style="float:auto;">
					board_file
					<br>
					<button type="button" id="addbtn" style="float:auto;">[+]</button>
					<button type="button" id="delbtn" style="float:auto;">[-]</button>
				</th>
				<td>
					<div id="appendfile"></div>
				</td>
			</tr>
			</table>
			<button type="button" id="submitbtn">공지 추가</button>
		</form>
	</div>
</body>
</html>