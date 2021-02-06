<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>올해 매월 수입, 지출 액수 차이</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$(document).ready(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/chart6",
			type:'get',
			success:function(data){
				let html=`
					<tr>
						<td>\${data.difference.january} (\\)</td>
						<td>\${data.difference.february} (\\)</td>
						<td>\${data.difference.march} (\\)</td>
						<td>\${data.difference.april} (\\)</td>
						<td>\${data.difference.may} (\\)</td>
						<td>\${data.difference.june} (\\)</td>
						<td>\${data.difference.july} (\\)</td>
						<td>\${data.difference.august} (\\)</td>
						<td>\${data.difference.september} (\\)</td>
						<td>\${data.difference.october} (\\)</td>
						<td>\${data.difference.november} (\\)</td>
						<td>\${data.difference.december} (\\)</td>
					</tr>
					`;
				$('#tableBody').html(html);

				var ctx=document.getElementById('bubbleChart');
				var chart = new Chart(ctx,{
					type:'bubble',
					data:{
						datasets:[{
							scaleLabel:{
								labelString:'수입'
								},
								label:'1월',
								backgroundColor:'rgba(255, 99, 132, 0.2)',
								data:[{
										x:data.income.january,
										y:data.expense.january,
										r:data.difference.january/50000
									}]
							},{
								label:'2월',
								backgroundColor:'rgba(54, 162, 235, 0.2)',
								data:[{
										x:data.income.february,
										y:data.expense.february,
										r:data.difference.february/50000
									}]
							},
							{
								label:'3월',
								backgroundColor:'rgba(255, 206, 86, 0.2)',
								data:[{
										x:data.income.march,
										y:data.expense.march,
										r:data.difference.march/50000
									}]
							},
							{
								label:'4월',
								backgroundColor:'rgba(75, 192, 192, 0.2)',
								data:[{
										x:data.income.april,
										y:data.expense.april,
										r:data.difference.april/50000
									}]
							},
							{
								label:'5월',
								backgroundColor:'rgba(153, 102, 255, 0.2)',
								data:[{
										x:data.income.may,
										y:data.expense.may,
										r:data.difference.may/50000
									}]
							},
							{
								label:'6월',
								backgroundColor:'rgba(255, 159, 64, 0.2)',
								data:[{
										x:data.income.june,
										y:data.expense.june,
										r:data.difference.june/50000
									}]
							},
							{
								label:'7월',
								backgroundColor:'rgba(255, 255, 0, 0.2)',
								data:[{
										x:data.income.july,
										y:data.expense.july,
										r:data.difference.july/50000
									}]
							},
							{
								label:'8월',
								backgroundColor:'rgba(255, 0, 0, 0.2)',
								data:[{
										x:data.income.august,
										y:data.expense.august,
										r:data.difference.august/50000
									}]
							},
							{
								label:'9월',
								backgroundColor:'rgba(0, 255, 0, 0.2)',
								data:[{
										x:data.income.september,
										y:data.expense.september,
										r:data.difference.september/50000
									}]
							},
							{
								label:'10월',
								backgroundColor:'rgba(0, 255, 255, 0.2)',
								data:[{
										x:data.income.october,
										y:data.expense.october,
										r:data.difference.october/50000
									}]
							},
							{
								label:'11월',
								backgroundColor:'rgba(0, 0, 255, 0.2)',
								data:[{
										x:data.income.november,
										y:data.expense.november,
										r:data.difference.november/50000
									}]
							},
							{
								label:'12월',
								backgroundColor:'rgba(0, 0, 0, 0.2)',
								data:[{
										x:data.income.december,
										y:data.expense.december,
										r:data.difference.december/50000
									}]
							}]
						},
						options:{
							scales:{
								xAxes:[{
									scaleLabel:{
										display:true,
										labelString:'수입'
										}
									}],
								yAxes:[{
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
	<h1>올해 매월 수입, 지출 액수 차이</h1>
	<div>
		<canvas id="bubbleChart" width="3"></canvas>
	</div>
	<br>
	<div>
		<table>
			<thead>
				<tr>
					<th>1월</th>
					<th>2월</th>
					<th>3월</th>
					<th>4월</th>
					<th>5월</th>
					<th>6월</th>
					<th>7월</th>
					<th>8월</th>
					<th>9월</th>
					<th>10월</th>
					<th>11월</th>
					<th>12월</th>
				</tr>
			</thead>
			<tbody id="tableBody"></tbody>	
		</table>
	</div>
</body>
</html>