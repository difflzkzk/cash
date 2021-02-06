<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>18년~올해 총 지출</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$(document).ready(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/chart4",
			type:'get',
			success:function(data){
				let html=`
					<tr>//2020년 지출
						<td>\${data.currentYear}년</td>
						<td>\${data.currentYearExpense}</td>
					</tr>
					<tr>//2019년 지출
						<td>\${data.lastYear}년</td>
						<td>\${data.lastYearExpense}</td>
					</tr>
					<tr>//2018년 지출
						<td>\${data.beforeLastYear}년</td>
						<td>\${data.beforeLastExpense}</td>
					</tr>
					`;
				$("#tableBody").html(html);
				var ctx=document.getElementById("pieChart");
				var chart = new Chart(ctx,{
						type:'pie',
						data:{
							datasets:[{
								data:[
									data.currentYearExpense,
									data.lastYearExpense,
									data.beforeLastExpense
									],
								backgroundColor:[
									'rgba(255,180,180,0.2)',
									'rgba(180,255,255,0.2)',
									'rgba(191,255,184,0.2)'
									],
								borderColor:[
									'#FF6C6C',
									'#368AFF',
									'#1DDB16'
									]
								}],
								labels:[
									data.currentYear+'년',
									data.lastYear+'년',
									data.beforeLastYear+'년'
									]
							}
					})
				}
			})
		})
</script>
</head>
<body>
	<jsp:include page ="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page ="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>18년~올해 총 지출</h1>
	<div>
		<canvas id="pieChart" width='3'></canvas>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>총 지출</th>
				</tr>
			</thead>
			<tbody id="tableBody"></tbody>
		</table>
	</div>
</body>
</html>