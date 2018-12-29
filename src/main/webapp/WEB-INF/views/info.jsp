<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(function(){
	$("#myModal").modal("show");
	
	$("#myModal").on('hidden.bs.modal', function(){
		location.href="${url}";
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
<div class="container">
	<div class="modal fade" role="dialog" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="info-header">
						<h2 class="info-heading modal-title">Error</h2>
					</div>
				</div>
				<div class="info-body error-body">
					<h4>${msg}</h4>
					<p></p>
					<div class="error-btn">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="confirmBtn">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

