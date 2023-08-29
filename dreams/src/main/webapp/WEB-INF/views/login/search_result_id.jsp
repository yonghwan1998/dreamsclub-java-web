<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- id 찾은 결과 값 보여줌 -->
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
                                <div class="login-register-form" id="searchIdpage">
                                    <form action="<c:url value="/login/search_id/search_result_id"/>" method="post">
											 <tr>
			                                   <td width="20"></td>
			                                   <c:choose>
				                                   <c:when test="${empty(searchId)}">
				                                   		<tr><td style=" align: center;">아이디를 찾을 수 없습니다.</td></tr>
				                                   </c:when>
				                                   <c:otherwise>
				                                   		<tr><td style=" align: center;">아이디는 [${searchId }]입니다.</td></tr>
				                                   </c:otherwise>   
			                                   </c:choose>      
			                                </tr>                                            
                                            <br>
                                            <button type="button" onclick="location.href='<c:url value="/login"/>'"><span>확인</span></button>
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








