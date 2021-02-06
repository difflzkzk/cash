<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertMember</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#id').focus();
		let idSuccess = false; // id 중복 체크 => 조건에 충족했다면 true
		let pwSuccess = false; // pw 중복 체크 => 조건에 충족했다면 true
		$('#ckIdBtn').click(function(){//마우스가 벗아나면 생기는 이벤트
				$.ajax({
					url:'${pageContext.request.contextPath}/admin/idCheck',
					type:'post',
					data:{id:$('#id').val()},
					success:function(data){
						if(data=="yes" && $('#id').val()!=''){
							alert($(id).val()+'사용가능한 ID입니다.');
							idSuccess = true;
							$('#pw').focus();
						}else if($('#id').val()==''){
							alert('ID를 입력하세요.');
							$('#id').focus();
						}else{
							alert($(id).val()+'사용중인 ID입니다.');
							$('#id').val('');
							$('#id').focus();
						}
					}
				});
			})
		
		
		//회원 추가 버튼 클릭시 비번이 빈칸일 때
		$('#insertMember').click(function(){
				
				if(idSuccess != true){ // id 중복 확인 했는지
					alert('아이디 중복확인을 해주세요');
					$('#id').focus();
				}
				else if($('#pw').val() != $('#ckPw').val()){//비번 일치 여부 -> 불일치 시 ckPw empty / focus
					alert('패스워드가 일치하지 않습니다.');
					$('#ckPw').val('');
					$('#ckPw').focus();
				}else if($('#pw').val()==''){ // 비번이 공백인지
					alert('패스워드를 입력해주세요.');
					$('#pw').focus();
				
				}else if($('#ckPw').val()==''){// 비번확인 공백인지
					alert('패스워드를 입력해주세요.');
					$('#ckPw').focus();
				}
				else{ //패스워드 일치 햇을 때
					pwSuccess=true;
				}
				if(idSuccess == true && pwSuccess == true){ // id pw가 모두 조건에 충족했을 때
					$('#insertMember').removeAttr("type"); // type=button 제거
					$('#insertMember').attr("type","submit");// type=submit 수정
				}
			})
		})
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>사용자 추가</h1>
	
	<form method="post" action="${pageContext.request.contextPath}/admin/insertMember">
		<div>
			ID:<input type="text" id="id" name="id">
			<button type="button" id="ckIdBtn">중복확인</button>
		</div>
		<div>
			PW:<input type="password" id="pw" name="pw">
		</div>
		<div>
			PW확인:<input type="password" id="ckPw">
		</div>
		<div>
			<button type="button" id="insertMember">addMember</button>
		</div>
	</form>
</body>
</html>