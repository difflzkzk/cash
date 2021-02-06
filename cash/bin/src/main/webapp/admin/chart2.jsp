<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2018-2020 월별 지출 차트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$(document).ready(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/chart2",
			type:"get",
			success:function(data){ //data [currentYear{},lastYear{},beforeLastYear{}]
				console.log(data.currentYear); // 2020
				console.log(data.lastYear); // 2019
				console.log(data.beforeLastYear); // 2018
				let html = `
					<tr>//2018
						<td>2018</td>
						<td>\${data.beforeLastYear.january}</td> // \n 줄바꿈 , \\n : \n으로 출력 => 특별한 문자를 표현할 때 \를 사용한다
						<td>`+data.beforeLastYear.february+`</td>
						<td>\${data.beforeLastYear.march}</td>
						<td>\${data.beforeLastYear.april}</td>
						<td>\${data.beforeLastYear.may}</td>
						<td>\${data.beforeLastYear.june}</td>
						<td>\${data.beforeLastYear.july}</td>
						<td>\${data.beforeLastYear.august}</td>
						<td>\${data.beforeLastYear.september}</td>
						<td>\${data.beforeLastYear.october}</td>
						<td>\${data.beforeLastYear.november}</td>
						<td>\${data.beforeLastYear.december}</td>
					</tr>
					<tr>//2019
						<td>2019</td>
						<td>\${data.lastYear.january}</td> 
						<td>`+data.lastYear.february+`</td>
						<td>\${data.lastYear.march}</td>
						<td>\${data.lastYear.april}</td>
						<td>\${data.lastYear.may}</td>
						<td>\${data.lastYear.june}</td>
						<td>\${data.lastYear.july}</td>
						<td>\${data.lastYear.august}</td>
						<td>\${data.lastYear.september}</td>
						<td>\${data.lastYear.october}</td>
						<td>\${data.lastYear.november}</td>
						<td>\${data.lastYear.december}</td>
					</tr>
					<tr>//2020
						<td>2020</td>
						<td>\${data.currentYear.january}</td>
						<td>`+data.currentYear.february+`</td>
						<td>\${data.currentYear.march}</td>
						<td>\${data.currentYear.april}</td>
						<td>\${data.currentYear.may}</td>
						<td>\${data.currentYear.june}</td>
						<td>\${data.currentYear.july}</td>
						<td>\${data.currentYear.august}</td>
						<td>\${data.currentYear.september}</td>
						<td>\${data.currentYear.october}</td>
						<td>\${data.currentYear.november}</td>
						<td>\${data.currentYear.december}</td>
					</tr>
				`;	
				$('#tableboby').html(html);
				var ctx = document.getElementById('lineChart');
				var chart = new Chart(ctx, {
						type:'line',
						data:{
							labels:['1','2','3','4','5','6','7','8','9','10','11','12'],
							datasets:[{
									label:'2018년 월별 지출',
									backgroundColor:'#FF0000',
									borderColor:'#FF7E7E',
									data:[
										data.beforeLastYear.january,
										data.beforeLastYear.february,
										data.beforeLastYear.march,
										data.beforeLastYear.april,
										data.beforeLastYear.may,
										data.beforeLastYear.june,
										data.beforeLastYear.july,
										data.beforeLastYear.august,
										data.beforeLastYear.september,
										data.beforeLastYear.october,
										data.beforeLastYear.november,
										data.beforeLastYear.december
									],fill:false // 라인 안쪽 색칠 유무
								},{
									label:'2019년 월별 지출',
									fill:false,
									backgroundColor:'#368AFF',
									borderColor:'#90E4FF',
									data:[
										data.lastYear.january,
										data.lastYear.february,
										data.lastYear.march,
										data.lastYear.april,
										data.lastYear.may,
										data.lastYear.june,
										data.lastYear.july,
										data.lastYear.august,
										data.lastYear.september,
										data.lastYear.october,
										data.lastYear.november,
										data.lastYear.december
									]
								},{
									label:'2020년 월별 지출',
									fill:false,
									backgroundColor:'#1DDB16',
									borderColor:'#53FF4C',
									data:[
										data.currentYear.january,
										data.currentYear.february,
										data.currentYear.march,
										data.currentYear.april,
										data.currentYear.may,
										data.currentYear.june,
										data.currentYear.july,
										data.currentYear.august,
										data.currentYear.september,
										data.currentYear.october,
										data.currentYear.november,
										data.currentYear.december
									]
								}
							]
						},
						option:{ // 가로 세로 값 이름 부여
							scales:{
								xAxes:[{
									scaleLabel:{
										display:true,
										labelString:'MONTH'
										}
									}],
								yAxes:[{
									display:true,
									scaleLabel:{
										display:true,
										labelString:'지출'
										}										
									}]
								}
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
	<h1>2018-2020 월별 지출 차트</h1>
	<div>
		<canvas id="lineChart" width="5" height="1"></canvas>
	</div>
	<div> 
			<table>
				<thead>
					<tr>
						<th></th>
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
</body>
</html>