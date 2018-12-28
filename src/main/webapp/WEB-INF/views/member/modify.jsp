<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<%@ include file="/WEB-INF/views/common/public.jsp"%> 
<%@ include file="/WEB-INF/views/nav.jsp"%>  
<script>
$(document).ready(function() {
	
	var gender = '${gender}';
	if(gender=='1'){
		 $('input[name="gender"][value="1"]').attr('checked','checked');
	} else if (gender=='2'){
		$('input [name=gender][value="2"]').attr('checked', 'checked');
	}
	
	$("#modifyBtn").on("click", function() {
		alert( $("input[name=gender]:checked").val());

		var parameter = JSON.stringify({'id' : $("#id").val(), 'name' :  $("#name").val(), 
			'bdate' :  $("#bdate").val(), 'gender' : $("input[name=gender]:checked").val(), 'pnum' :  $("#pnum").val(), 
			'addr' :  $("#addr").val()});
		alert(parameter);
		$.ajax({
				url : '${root}/member',
				type : 'PUT',	
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				data : parameter,
				success : function (data) {
					alert("data : " + data);
				}
			});
		});
	});	
</script>
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
                        <td class="text-left">
                        	<input type="text" class="form-control" name="id" id="id" placeholder="아이디" value="${id}" readonly>
                        </td>
                        <th class="text-center">회원명</th>
                        <td class="text-left">
                        	<input type="text" class="form-control" name="name" id="name" placeholder="회원명" value="${name}">
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">생년월일</th>
                        <td class="text-left">                        
                        	<input type="text" class="form-control" name="bdate" id="bdate" placeholder="생년월일" value="${bdate}">                       	
                        </td>
                        <th class="text-center">성별</th>
                        <td class="text-left">
                        	<div class="radio">
	                            <label>
	                                <input type="radio" name="gender" value="1">
	                                남자
	                            </label>
	                        </div>
	                        <div class="radio">
	                            <label>
	                                <input type="radio" name="gender" value="2">
	                                여자
	                            </label>
	                        </div>	                       	
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">전화번호</th>
                        <td class="text-left">
                        	<input type="text" class="form-control" name="pnum" id="pnum" placeholder="전화번호" value="${pnum}"> 	
                        </td>
                        <th class="text-center">주소</th>
                        <td class="text-left">
                        	<input type="text" class="form-control" name="addr" id="addr" placeholder="주소" value="${addr}">	
                       	</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="pull-right">
                <a href="#" id="modifyBtn" class="btn btn-success btn-default">저장</a>
                <a href="${root}/member/list.bit" class="btn btn-large btn-default">목록</a>
            </div>

        </div>
      </div>
<%@ include file="/WEB-INF/views/footer.jsp"%>  