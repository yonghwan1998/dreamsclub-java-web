<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function(){
		$("#searchPwBtn").click(function(){
			$.ajax({
				type : "POST",
				data : {
					name: $("#name").val(),
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
	
	
</script>



<!-- 비밀번호 찾기 페이지-->
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
                                 <h6> 비밀번호 찾기 </h6>
                              </a>
                         </li>
                    </div>
                    
                    <div class="tab-content">
                        <div id="lg1" class="tab-pane active">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <form action="/dreams/login/search_pw" method="post" name="searchPw">
                                        <input type="text" name="memberName" id="name" name="name" placeholder="이름을 입력해 주세요.">
                                        <input type="text" name="memberId" id="id" name="id" placeholder="아이디를 입력해 주세요.">
                                        <input type="email" name="memberEmail" id="email" name="email" placeholder="이메일를 입력해 주세요."/>
                                        <div class="button-box">
                                            <button type="submit" id="searchPwBtn"><span>찾기</span></button>
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
