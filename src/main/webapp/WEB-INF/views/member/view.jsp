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
                        <td class="text-left">${id}</td>
                        <th class="text-center">회원명</th>
                        <td class="text-left">${name}</td>
                    </tr>
                    <tr>
                        <th class="text-center">생년월일</th>
                        <td class="text-left">${bdate}</td>
                        <th class="text-center">성별</th>
                        <td class="text-left">${gender}</td>
                    </tr>
                    <tr>
                        <th class="text-center">전화번호</th>
                        <td class="text-left">${pnum}</td>
                        <th class="text-center">주소</th>
                        <td class="text-left">${addr}</td>
                    </tr>
                    </tbody>
                </table>
            </div>


            
            <div class="pull-right">
                <a href="${root}/member/modify.bit" class="btn btn-success btn-default">수정</a>
                <a href="#" class="btn btn-large btn-default">탈퇴</a>
                <a href="./list.html" class="btn btn-large btn-default">목록</a>
            </div>

        </div>
      </div>
<%@ include file="/WEB-INF/views/footer.jsp"%>   