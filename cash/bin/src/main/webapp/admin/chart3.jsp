<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매년 카테고리별 지출</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$(document).ready(function(){
			$.ajax({
					url:'${pageContext.request.contextPath}/admin/chart3',
					type:'get',
					success:function(data){
							let html=`
								<tr>//9월
									<td>\${data.beforeLastMonth}월</td>
									<td>\${data.beforeLastTrip}</td>
									<td>\${data.beforeLastLife}</td>
									<td>\${data.beforeLastFood}</td>
									<td>\${data.beforeLastMedical}</td>
									<td>\${data.beforeLastPhone}</td>
								</tr>
								<tr>//10월
									<td>\${data.lastMonth}월</td>
									<td>\${data.lastTrip}</td>
									<td>\${data.lastLife}</td>
									<td>\${data.lastFood}</td>
									<td>\${data.lastMedical}</td>
									<td>\${data.lastPhone}</td>
								</tr>
								<tr>//11월
									<td>\${data.currentMonth}월</td>
									<td>\${data.currentTrip}</td>
									<td>\${data.currentLife}</td>
									<td>\${data.currentFood}</td>
									<td>\${data.currentMedical}</td>
									<td>\${data.currentPhone}</td>
								</tr>
							`;
							$("#tableBody").html(html);
							var ctx = document.getElementById('radarChart');
							var chart = new Chart(ctx,{
									type:'radar',
									data:{
										labels:['관광','생활','식비','의료','통신'],
										datasets:[{
											label:data.beforeLastMonth+'월',
											backgroundColor:'rgba(255,180,180,0.2)',
											borderColor:'#FF6C6C',
											pointHoverBorderWidth: 30,
											pointRadius: 5,
											data:[
												data.beforeLastTrip,
												data.beforeLastLife,
												data.beforeLastFood,
												data.beforeLastMedical,
												data.beforeLastPhone
												]
											},{
											label:data.lastMonth+'월',
											backgroundColor:'rgba(180,255,255,0.2)',
											borderColor:'#368AFF',
											pointHoverBorderWidth: 30,
											pointRadius: 5,
											data:[
												data.lastTrip,
												data.lastLife,
												data.lastFood,
												data.lastMedical,
												data.lastPhone
												]
											},{
											label:data.currentMonth+'월',
											backgroundColor:'rgba(191,255,184,0.2)',
											borderColor:'#1DDB16',
											pointHoverBorderWidth: 30,
											pointRadius: 5,
											data:[
												data.currentTrip,
												data.currentLife,
												data.currentFood,
												data.currentMedical,
												data.currentPhone
												]
											}]
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
	<h1>3개월 간 카테고리별 지출</h1>
	<div>
		<canvas id="radarChart" width="3"></canvas>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>관광</th>
					<th>생활</th>
					<th>식비</th>
					<th>의료</th>
					<th>통신</th>
				</tr>
			</thead>
			<tbody id="tableBody">
				
			</tbody>
		</table>
	</div>
</body>
</html>