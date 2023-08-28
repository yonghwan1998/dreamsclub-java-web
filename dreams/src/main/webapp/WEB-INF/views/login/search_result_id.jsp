<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
-

<!-- 로그인 부분 시작 -->
-
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
                                    <form action="<c:url value="/login/search_id/search_result_id"/>" method="post">
											 <tr>
			                                   <td width="20"></td>
			                                   <td style=" text-align: center;">${member.memberId }</td>         
			                                </tr>                                            
                                            
                                            <button type="submit" onclick="resultAlert"><span>확인</span></button>
                                            <!--자바 스크립트 (alert 창 띄우기 하기)-->
                                        
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








