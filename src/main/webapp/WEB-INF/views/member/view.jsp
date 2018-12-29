<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>   
<%@ include file="/WEB-INF/views/nav.jsp"%>
<script>
	$(document).ready(function() {
		$("#delete").click(function() {
			$("#myModal").modal('show');
		
				$("#yBtn").click(function() {
					$.ajax({
						url : '${root}/member',
						type : 'DELETE',
						contentType : 'application/json;charset=UTF-8',
						dataType : 'json',
						success : function(data) {
							alert("data : " + data.result);
							location.href = data.result;
						}
					});
				});
				$("#nBtn").click(function() {
					return false;
				});
			
		});
	});
</script>
<style type="text/css">
.modal-header {
	padding: 0;
}

.modal-content {
	-webkit-border-radius: 15px 15px 15px 15px;
	-moz-border-radius: 15px 15px 15px 15px;
	border-radius: 15px 15px 15px 15px;
	max-width: 500px;
}

.error-header {
	height: 110px;
	padding: 15px 29px 25px;
	margin: 0 auto;
	background-color: #e74c3c;
	color: white;
	text-align: left;
	-webkit-border-radius: 15px 15px 0px 0px;
	-moz-border-radius: 15px 15px 0px 0px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.error-heading {
	margin-top: 20px;
	margin-bottom: 15px;
}

.error-footer {
	margin: 0 auto 20px;
	padding-left: 10px;
}

.error-body {
	margin: 0 15 0 15;
	background-color: #fff;
	-webkit-border-radius: 0px 0px 15px 15px;
	-moz-border-radius: 0px 0px 15px 15px;
	border-radius: 0px 0px 15px 15px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.error-btn {
	margin-top: 20px;
	text-align: center;
}
</style>

	<div class="modal fade" role="dialog" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="error-header">
						<h2 class="error-heading modal-title">회원 탈퇴</h2>
					</div>
				</div>
				<div class="modal-body error-body">
					<h4>정말 탈퇴하시겠습니까? </h4>
					<p></p>
					<div class="error-btn">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="yBtn">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" id="nBtn">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>


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
                <a href="#" class="btn btn-large btn-default" id="delete">탈퇴</a>
                <a href="${root}/member/list.bit" class="btn btn-large btn-default">목록</a>
            </div>

        </div>
      </div>
<%@ include file="/WEB-INF/views/footer.jsp"%>   