<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Flone - Minimal eCommerce HTML Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/img/favicon.png">
</head>

<!-- 로그인 부분 시작 -->
<body>
<div class="login-register-area pt-100 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-0 col-md-20 ml-auto mr-auto">
                <div class="login-register-wrapper" style="width: 50%; margin: 50px auto;">
                    <div class="login-register-tab-list nav">
                        <!--강민경: 로고 이미지 기입-->
                        <li id = "loginimg">
                            <img src="${pageContext.request.contextPath }/img/logo/dreams_login_logo.png">
                        </li>
                    </div>
                    <div class="login-register-tab-list nav">
                         <li>
                             <a class="active" data-toggle="tab" href="#lg1">
                                 <h6> 아이디 찾기 </h6>
                            </a>
                         </li>
                    </div>
                    <div class="tab-content">
                        <div id="lg1" class="tab-pane active">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <form action="#" method="post">
                                        <input type="text" name="user-name" placeholder="이름을 입력해 주세요.">
                                        <input type="password" name="user-email" placeholder="이메일을 입력해 주세요.">
                                        <div class="button-box">
                                            
                                            
                                            <button type="submit" onclick="resultAlert"><span>확인</span></button>
                                            <!--자바 스크립트 (alert 창 띄우기 하기)-->
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- scrpit 부분 -->
<script type="text/javascript">
	funtcion resultAlert(){
		if(member.memberName.value=""){
		alert("이름을 입력해 주세요.")
		member.memberName.focus();
		return;
		}
	
		if(member.memberEmail.value=""){
		alert("이메일을 입력해 주세요.")
		member.memberEmail.focus();
		return;
		}
		member.submit();
	}
</script>
<!-- Modal -->

<!-- Modal end -->









<!-- All JS is here
============================================ -->

</body>

</html>