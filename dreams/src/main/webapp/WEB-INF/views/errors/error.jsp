<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="index.html">Home</a>
                </li>
                <li class="active">404 Page </li>
            </ul>
        </div>
    </div>
</div>
<div class="error-area pt-40 pb-100">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-7 col-lg-8 text-center">
                <div class="error">
                    <h1 style="color: green;">404</h1>
                    <h2>OPPS! PAGE NOT BE FOUND</h2>
                    <p>Sorry but the page you are looking for does not exist, have been removed, name changed or is temporarity unavailable.</p>
                    <a href="<c:url value='/'/>" class="error-btn" style="background-color: green;">메인으로 돌아가기</a>
                </div>
            </div>
        </div>
    </div>
</div>
