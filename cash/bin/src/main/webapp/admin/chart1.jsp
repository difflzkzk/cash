<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2020년 월별 지출</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
$(document).ready(function(){
	$.ajax({
			url:"${pageContext.request.contextPath}/admin/chart1",
			type:"get",	
			success:function(data){
					console.log(data.january);
					console.log(data);
					//let list = data.january;
					//console.log(list);
					let html = `
							<tr>
								<td>\${data.january}</td> // \n 줄바꿈 , \\n : \n으로 출력 => 특별한 문자를 표현할 때 \를 사용한다
								<td>`+data.february+`</td>
								<td>\${data.march}</td>
								<td>\${data.april}</td>
								<td>\${data.may}</td>
								<td>\${data.june}</td>
								<td>\${data.july}</td>
								<td>\${data.august}</td>
								<td>\${data.september}</td>
								<td>\${data.october}</td>
								<td>\${data.november}</td>
								<td>\${data.december}</td>
							</tr>
					`;	
					$('#tableboby').html(html);
					
					var ctx = document.getElementById('barChart');//메서드는 주어진 문자열과 일치하는 id 속성을 가진 요소를 찾고, 이를 나타내는 Element 객체를 반환합니다
					var chart = new Chart(ctx , {
						type:'bar', // chart 종류
						data:{
							labels:['1','2','3','4','5','6','7','8','9','10','11','12'],
							datasets:[{
								label:'2020년 월별 지출',
								backgroundColor: [
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)',
					                'rgba(255, 159, 64, 0.2)',
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)',
					                'rgba(255, 159, 64, 0.2)'
					            ],
								borderColor: [
					                'rgba(255, 99, 132, 1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)',
					                'rgba(255, 159, 64, 1)',
					                'rgba(255, 99, 132, 1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)',
					                'rgba(255, 159, 64, 1)'
					            ],
					            // data속성의 배열값은 ajax호출 후 결과값으로 채워야 한다.
								data:[data.january, data.february, data.march, data.april,
									  data.may, data.june,data.july,data.august,
									  data.september, data.october, data.november, data.december],
								borderWidth: 1
							}]
						}
					})
				}
			})
		})		
</script>
</head>
<body>
	<div>
		<jsp:include page ="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<jsp:include page ="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
		<h1>2020년 월별 지출</h1>
		<!-- chart -->
		<div>
			<canvas id="barChart" width="5" height="1"></canvas>
		</div>
		<!-- table -->
		<div> 
			<table>
				<thead>
					<tr>
						<th>january</th>
						<th>february</th>
						<th>march</th>
						<th>april</th>
						<th>may</th>
						<th>june</th>
						<th>july</th>
						<th>august</th>
						<th>september</th>
						<th>october</th>
						<th>november</th>
						<th>december</th>
					</tr>
				</thead>
				<tbody id="tableboby">
					
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>