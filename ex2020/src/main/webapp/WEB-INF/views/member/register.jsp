<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<title>New Member</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
</head>

<body>

   <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">회원가입</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post" action="/member/register">
                        
  						  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="아이디" name="userid" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호" name="userpw" id="pw" type="password" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호확인" id="pwCheck" type="password" value="">
                                    <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
                                </div>
                                
                                <div class="form-group">
                                    <input class="form-control" placeholder="이름" name="userName" type="text" value="">
                                </div>
                                <!-- <div class="form-group">
                                    <input class="form-control" placeholder="주소" name="user_Addr" type="text" value="">
                                </div>
                                -->
                                <div class="form-group">
                                    <input class="form-control" placeholder="Email" name="user_Email" type="text" value="">
                                </div>
                                
                                <div class="form-group">   
									<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                    <input type="text" class="form-control" id="sample4_postcode" name="postcode" placeholder="우편번호">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="sample4_jibunAddress" name="jibunAddress" placeholder="지번주소">
								</div>
								<div class="form-group">
									<span id="guide" class="form-control" style="color:#999;display:none"></span>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="sample4_extraAddress" name="extraAddress" placeholder="참고항목">
                                </div>
                   
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <button type="submit" class="btn btn-lg btn-success btn-block">가입하기</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
  	
  	<!-- Daum Api-->
  	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	
  	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>
  	<script>
  	
  	$(".btn-success").on("click", function(e){
  		
  	  e.preventDefault();
  	  $("form").submit();
  	  
  	});
  	
  	</script>
  	
  	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
    $('#pwCheck').focusout(function () {
        var pwd1 = $("#pw").val();
        var pwd2 = $("#pwCheck").val();
        if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    });
    
</script>
  	
</body>

</html>