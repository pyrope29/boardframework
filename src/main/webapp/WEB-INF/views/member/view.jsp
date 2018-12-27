<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>   
<%@ include file="/WEB-INF/views/nav.jsp"%>   


<!-- Container ======================================================================================= -->
<div class="container">
	<div class="row">
	
<!-- ★★★ Contents -->
        <div class="col-lg-12">
            <div class="page-header2">
                <h3>회원정보</h3>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="120">
                        <col width="*">
                        <col width="120">
                        <col width="*">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="text-center">ID</th>
                        <td class="text-left">gglim</td>
                        <th class="text-center">회원명</th>
                        <td class="text-left">임경균</td>
                    </tr>
                    <tr>
                        <th class="text-center">생년월일</th>
                        <td class="text-left">2014.02.19</td>
                        <th class="text-center">성별</th>
                        <td class="text-left">남</td>
                    </tr>
                    <tr>
                        <th class="text-center">전화번호</th>
                        <td class="text-left">010-0000-0000</td>
                        <th class="text-center">주소</th>
                        <td class="text-left">서울시 금천구 가산동</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            
            <div class="pull-right">
            	  <!--button class="btn btn-success">수정</button-->
                <a href="./modify.html" class="btn btn-success btn-default">수정</a>
                <a href="#" class="btn btn-large btn-default">삭제</a>
                <a href="./list.html" class="btn btn-large btn-default">목록</a>
            </div>

        </div>
      </div>
<%@ include file="/WEB-INF/views/footer.jsp"%>   