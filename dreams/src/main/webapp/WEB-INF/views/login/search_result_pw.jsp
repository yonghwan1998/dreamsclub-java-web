<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 비밀번호 찾기 -->
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
                                    <form action="<c:url value="/login/search_pw/search_result_pw"/>" method="post" name="searchPw">
                                        <div class="button-box">
                                        	<td width="20"></td>
                                        	<c:choose>
                                        		<c:when test = "${empty(searchPw)}">
                                        			<tr><td style=" align: center;"> 입력하신 회원정보가 존재하지 않습니다.</td></tr>
                                        		</c:when>
                                        		<c:otherwise>
                                        		<tr><td style=" align: center;">아이디는 [${searchPw }]입니다.</td></tr>
                                        		</c:otherwise>
                                        	</c:choose>
                                            <button type="submit" onclick="resultPwAlert"><span>확인</span></button>
                                            <tr>
			                                   <td width="20"></td>
			                                   <td style=" text-align: center;"><font color= "red">${message }</font></td>         
			                                </tr>
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
