<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<nav class="navbar navbar-default navbar-fixed-top">
	    <div class="container">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="#">BitCamp</a>
	        </div>
	        <div class="navbar-collapse collapse navbar-responsive-collapse">
	            <ul class="nav navbar-nav">
	                <li class="active">
	                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">회원관리</a>
	                	<ul class="dropdown-menu">
	                        <li><a href="#">회원등록</a></li>
	                        <li><a href="#">회원목록</a></li>
	                    </ul>
	                </li>
	                <li>
	                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">미디어관리</a>
	                	<ul class="dropdown-menu">
	                        <li><a href="#">미디어등록</a></li>
	                        <li><a href="#">미디어목록</a></li>
	                    </ul>
	                </li>
	                <li><a href="#">대출관리</a></li>
	                <li><a href="#">공지사항</a></li>
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
					<c:if test="${userInfo!=null}">
		                <li><a href="${root}/member/logout">로그아웃</a></li>
		               		<li class="dropdown">
                 		 		  <a href="#" class="dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown">설정 <b class="caret"></b></a>
                  				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                       			 		<li><a href="${root}/member">개인정보</a></li>
                   	 				</ul>
                			</li>
	            	 </c:if>
            
	            	 <c:if test="${userInfo==null}">
	            	 	<li><a href="${root}/member/login.bit">로그인</a></li>
		                <li><a href="${root}/member/join.bit">회원가입 </a></li>
	            	 </c:if>
	            </ul>
	        </div>
	    </div>
	</nav>

