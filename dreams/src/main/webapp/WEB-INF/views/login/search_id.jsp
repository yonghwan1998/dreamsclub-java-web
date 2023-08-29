<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function resultIdAlert(){
		if(searchId.memberName.value==""){
			alert("이름을 입력하십시요.");
			searchId.memberName.focus();
	         return;
	     } 
	     if (searchId.memberEmail.value == "" ) {
	        alert("이메일을 입력하십시요.");
	        searchId.memberEmail.focus();
	        return;
	     }   
	     searchId.action = '<c:url value="/login/search_id"/>';
	     searchId.submit();
	}
</script>

<!-- 아이디 찾기 페이지 -->
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
                                    <form method="post" name="searchId">
                                        <input type="text" name="memberName" placeholder="이름을 입력해 주세요.">
                                        <input type="email" name="memberEmail" placeholder="이메일을 입력해 주세요.">
                                        <div class="button-box">
                                            <button type="button" onclick="resultIdAlert();"><span>확인</span></button>
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










