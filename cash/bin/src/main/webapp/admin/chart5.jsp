<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>올해 카테고리별 지출 빈도</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$(document).ready(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/chart5",
				type:'get',
				success:function(data){
						let html=`
							<tr>
								<td>\${data.food}번</td>
								<td>\${data.life}번</td>
								<td>\${data.trip}번</td>
								<td>\${data.medical}번</td>
								<td>\${data.phone}번</td>
							</tr>	
						`;
						$('#tableBody').html(html);

						var ctx=document.getElementById('polarChart');
						var chart = new Chart(ctx,{
								type:'polarArea',
								data:{
									datasets:[{
										data:[
											data.food,data.life,data.trip,data.medical,data.phone
											],
										backgroundColor:[
											'rgba(255,108,108,0.6)','rgba(255,255,90,0.6)','rgba(119,255,112,0.6)','rgba(108,192,255,0.6)','#000000'
											]
									}],
									labels:['식비','생활','여행','의료비','통신비']
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
	<h1>올해 카테고리별 지출 빈도</h1>
	<div>
		<canvas id="polarChart" width="3"></canvas>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>식비</th>
					<th>생활</th>
					<th>관광</th>
					<th>의료</th>
					<th>통신</th>
				</tr>
			</thead>
			<tbody id="tableBody"></tbody>
		</table>
	</div>
</body>
</html>