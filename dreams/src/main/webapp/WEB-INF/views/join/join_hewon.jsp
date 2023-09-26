<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>


<meta charset="UTF-8">

<style type="text/css">

#registration-form {
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

fieldset {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
    margin-bottom: 10px;
    text-align: left;
     margin: 2rem auto;
     width: 45rem;
}

legend {
    font-weight: bold;
    font-size: 1.2em;
    text-align: center;
    font-size: 35px;
    margin-bottom: 3rem;
    margin-top: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    margin-left: 3rem;
}

input[type="text"],
input[type="password"] {
    width: 80%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    margin-left: 3rem;
}

input[type="submit"],
input[type="reset"] {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 3px;
    cursor: pointer;
    margin-right: 10px;
}


#join label {
   width: 150px;
   text-align: left;
   float: left;
   margin-right: 10px;
}

#join ul li {
   list-style-type: none;
   margin: 15px 0;
}

#fs {
   text-align: center;
}

.error {
   color: red;
   position: relative;
   left: 160px;
   display: none;
}
.errors{
   color: red;
   margin-left: 3rem;
}

#idCheck, #postSearch {
   font-size: 12px;
   font-weight: bold;
   cursor: pointer;
   margin-left: 10px;
   padding: 2px 10px;
   border: 1px solid black;
}

#idCheck:hover, #postSearch:hover {
   background: black;
   color: white;
}

.btn {
  position: relative;
  border: 0;
  padding: 15px 25px;
  display: inline-block;
  text-align: center;
  color: white;
  margin: 0 1rem 5rem 0;
}

.btn:active {
  top: 4px; 
}

.btn.purple, .btn-two.purple {background-color: #a749ff;}

.rounded {
  border-radius: 10px!important;
}

</style>
<!-- 강민경(수정): 2023/9/9, 밸리데이션을 사용한 메세지 적용 -->
<c:url value="/join/hewon" var="url"/>
<form:form id="join" action="${url }" method="post" modelAttribute="memberDTO">
   <%-- 아이디 중복 검사 결과를 저장하기 위한 입력태그 --%>
   <%-- => 0 : 아이디 중복 검사 미실행 또는 아이디 중복 - 아이디 사용 불가능 --%>
   <%-- => 1 : 아이디 중복 검사 실행 및 아이디 미중복 - 아이디 사용 가능 --%>
   <input type="hidden" id="idCheckResult" value="0"/>
   
      <fieldset>
         <legend>회원가입 정보</legend>
         <ul>
            <li>
               <label for="id">아이디</label>
               <form:input type="text" path="memberId"/>
                <form:errors path="memberId" cssClass="errors" element="div" delimiter=" "/>
<!--
                <div id="idMsg" class="error">아이디를 입력해 주세요.</div>
               <span id="idRegMsg" class="error">아이디는 4 ~12자의 영문 대소문자의 숫자로만 작성 가능합니다.</span>
               <span id="idDuplMsg" class="error">이미 사용중인 아이디입니다.</span>
-->
            </li>
            
            <li>
               <label for="passwd">비밀번호</label>
               <form:input type="password" path="memberPw" id="passwd"/>
               <form:errors path="memberPw" cssClass="errors" element="div" delimiter=" "/>
<!--
               <div id="passwdMsg" class="error">비밀번호를 입력해 주세요.</div>
               <div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div>
-->
            </li>
            
            <li>
               <label for="passwd">비밀번호 확인</label>
               <input type="password" id="replassword">
                <%-- name="memberPw2" 로 name 바꿧더니 회원가입토대로 로그인이됨 --%>
<!--
               <div id="repasswdMsg" class="error">비밀번호 확인을 입력해 주세요.</div>
               <div id="repasswdMatchMsg" class="error">비밀번호와 비밀번호 확인이 서로 맞지 않습니다.</div>
-->
            </li>
            <li>
               <label for="name">이름</label>
               <form:input type="text" name="memberName" path="memberName" id="name"/>
               <form:errors path="memberName" cssClass="errors" element="div" delimiter=" "/>
<!--
               <div id="nameMsg" class="error">이름을 입력해 주세요.</div>
-->
            </li>
               
            <li>
               <label for="email">이메일</label>
               <form:input type="text" name="memberEmail" id="email" path="memberEmail"/>
               <form:errors path="memberEmail" cssClass="errors" element="div" delimiter=" "/>
<!--
               <div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
               <div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
-->
            </li>
            
   
            <!-- 전화번호2222222 -->
            <li>
            <label for="memberPhone">전화번호</label>
            <form:input type="text" name="memberPhone" id="memberPhone" path="memberPhone"/>
            <form:errors path="memberPhone" cssClass="errors" element="div" delimiter=" "/>
 <!--           
            <div id="mobileMsg" class="error">전화번호를 입력해 입력해 주세요.</div>
            <div id="mobileRegMsg" class="error">전화번호는 -를 포함한 전화번호형식으로 숫자로만 입력해 주세요.</div> 
 -->            
            </li>
             
      
            <li>
               <label>우편번호</label><span id="postSearch" style="right: 6.5rem; position: relative;">우편번호 검색</span>
               <input type="text" name="memberPcode" id="zipcode" size="7" readonly="readonly"/>
<!--              <div id="zipcodeMsg" class="error">우편번호를 입력해 주세요.</div>
 -->    
 
            </li>
            <li>
               <label for="address1">주소</label>
               <form:input type="text" name="memberAddress1" id="address1" size="50" readonly="readonly" path="memberAddress1"/>
               <form:errors path="memberAddress1" cssClass="errors" element="div" delimiter=" "/>
<!--              
               <div id="address1Msg" class="error">주소를 입력해 주세요.</div>
-->               
            </li>
            <li>
               <label for="address2">상세주소</label>
               <form:input type="text" name="memberAddress2" id="address2" size="50" path="memberAddress2"/>
               <form:errors path="memberAddress2" cssClass="errors" element="div" delimiter=" "/>
 <!--               
               <div id="address2Msg" class="error">상세주소를 입력해 주세요.</div>              
-->
            </li>
         </ul>
      </fieldset>
   <div id="fs">
      <form:button type="submit" class="btn purple rounded">회원가입</form:button>
      <form:button type="reset" class="btn purple rounded">다시입력</form:button>
   </div>
</form:form>   


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 var idck = 0; 

<script type="text/javascript">

<!--
var idch=0;
// 조건문 ▼
$("#id").focus();

$("#join").submit(function() {
   var submitResult=true;

   
   $(".error").css("display","none");
   // 아이디 조건문
    var idReg=/^[a-zA-Z0-9]{4,12}$/;
   if($("#id").val()=="") {
      $("#idMsg").css("display","block");
      submitResult=false;
   } else if(!idReg.test($("#id").val())) {
      $("#idRegMsg").css("display","block");
      submitResult=false;
   } else if(idck==0) {
      $("#idDuplMsg").css("display","block");
      submitResult=false;
   } 
   //비밀번호 조건문
   var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
   if($("#passwd").val()=="") {
      $("#passwdMsg").css("display","block");
      submitResult=false;
   } else if(!passwdReg.test($("#passwd").val())) {
      $("#passwdRegMsg").css("display","block");
      submitResult=false;
   } 
   // 비밀번호 확인
   if($("#repasswd").val()=="") {
      $("#repasswdMsg").css("display","block");
      submitResult=false;
   } else if($("#passwd").val()!=$("#replassword").val()) {
      $("#repasswdMatchMsg").css("display","block");
      submitResult=false;
   }
   // 이름 조건문
   if($("#name").val()=="") {
      $("#nameMsg").css("display","block");
      submitResult=false;
   }
   
   // 이메일 조건문
   var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
   if($("#email").val()=="") {
      $("#emailMsg").css("display","block");
      submitResult=false;
   } else if(!emailReg.test($("#email").val())) {
      $("#emailRegMsg").css("display","block");
      submitResult=false;
   }
   
    // 핸드폰 조건문222
   var memberPhoneReg=/^\d{3}-\d{3,4}-\d{4}$/g;
   var result=memberPhoneReg.test($("#memberPhone").val());
   if($("#memberPhone").val()=="") {
      $("#mobileMsg").css("display","block");
      submitResult=false;
    } else if(!result) {
      $("#mobileRegMsg").css("display","block");
      submitResult=false; 
   } 

   // 주소
   if($("#zipcode").val()=="") {
      $("#zipcodeMsg").css("display","block");
      submitResult=false;
   }
   
   
   if($("#address1").val()=="") {
      $("#address1Msg").css("display","block");
      submitResult=false;
   }
   // 상세주소
   if($("#address2").val()=="") {
      $("#address2Msg").css("display","block");
      submitResult=false;
   }
   
  
   
   return submitResult;
});

--> 
// 아이디 중복체크 에이젝스 ▽
$("#id").change(function() {
   idck = 0;
    //userid 를 param.
    var memberid =  $("#id").val(); 
    
    $.ajax({
        type : 'get',
        url : "<c:url value="/join/member_id_check"/>",
        data : {"memberId":memberid},
        dataType : "text", // text 인가????
        success : function(result) {
            if (result=="ok") {
               idck = 1;
               // 사용가능한 아이디
            
            } else {
               idck = 0;
                // 이미 사용중인 아이디
            }
        },
        error : function(error) {
            alert("error : " + error.status);

        }
    });
});


// 주소검색
$("#postSearch").click(function() {
    new daum.Postcode({
        oncomplete: function(data) {
           $("#zipcode").val(data.zonecode);
           $("#address1").val(data.address);
        }
    }).open();
});
</script>